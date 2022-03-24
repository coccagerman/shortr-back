/* Load environment variables on dev environment */
if (process.env.NODE_ENV !== 'production') require('dotenv').config()

/* Import and initialize express */
const express = require('express')
const app = express()
const server = require('http').Server(app)

/* Import modules */
const cors = require('cors')
const compression = require('compression')
const { nanoid } = require('nanoid')

/* Global middlewares */
app.use(cors())
app.use(compression())
app.use(express.json({limit: '5mb'}))
app.use(express.urlencoded({extended: false}))

/* Types */
import { Request, Response } from 'express'

/* Db */
import pool from './db/db'

/* Requests */
/* URL shortening */
app.post('/', async (req: Request, res: Response) => {
  try {
    const { origurl } = req.body
    const urlid = nanoid().substring(0, 7)
    const shorturl = process.env.BASEURL + urlid

    pool.query('INSERT INTO urls(origurl, shorturl, urlid) VALUES($1, $2, $3)', [origurl, shorturl, urlid]).then(
      res.header("Access-Control-Allow-Origin", "*").send(shorturl)
    )

  } catch (err) {
    res.status(500).json(err)
  }
})

/* URL redirection */
app.get('/:urlid', async (req: Request, res: Response) => {
  try {
    const origUrl = await pool.query('SELECT origurl FROM urls WHERE urlid = $1', [req.params.urlid])
    res.header("Access-Control-Allow-Origin", "*").send(origUrl.rows[0].origurl)
  } catch (err) {
    res.status(500).json(err)
  }
})

/* Initialize server */
server.listen(process.env.PORT || 3030, () => console.log('Server is listening.') )
server.on('error', (error: Error) => console.error(error) )
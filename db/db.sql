CREATE DATABASE shortr;

CREATE TABLE urls(
    id SERIAL PRIMARY KEY,
    origUrl VARCHAR (200),
    shortUrl VARCHAR (100),
    urlId VARCHAR (100)
);

INSERT INTO urls(origUrl, shortUrl, urlId) VALUES('https://dba.stackexchange.com/', 'http://localhost:3000/dba123', 'dba123');

SELECT origurl FROM urls WHERE urlid = 'stack123';

/* INSERT INTO users(name, password, email) VALUES
    ('joe', 'joeFakePassword1!', 'joeEmail@gmailcom'),
    ('frank', 'frankFakePassword1!', 'frankEmail@gmailcom');

    SELECT * FROM users ORDER BY id DESC;

    SELECT * FROM users INNER JOIN cocktails ON users.id = cocktails.publisherId;

CREATE TABLE cocktails(
    id SERIAL PRIMARY KEY,
    publisherId INT,
    name VARCHAR (100),
    description TEXT
);

INSERT INTO cocktails(publisherId, name, description) VALUES
    ('1', 'Old fashioned', 'A vintage cocktail with a sweet and bitter flavour.'),
    ('2', 'Martini', 'An ellegant contemporary cocktail with a slightly acidic flavour.');

CREATE TABLE ingredients(
    id SERIAL PRIMARY KEY,
    cocktailId INT,
    ingredient TEXT
);

INSERT INTO ingredients(cocktailId, ingredient) VALUES
    ('1', 'Whisky'),
    ('1', 'Vermouth'),
    ('1', 'Bitter'),
    ('1', 'Orange'),
    ('2', 'Vermouth'),
    ('2', 'Gin'),
    ('2', 'Olives');

CREATE TABLE recipeSteps(
    id SERIAL PRIMARY KEY,
    cocktailId INT,
    recipeStep TEXT
);

INSERT INTO recipeSteps(cocktailId, recipeStep) VALUES
    ('1', 'Pour some whisky.'),
    ('1', 'Then add double the ammount of vermouth.'),
    ('1', 'A couple slahes of bitter.'),
    ('1', 'And just a spring of orange to finish.'),
    ('2', 'Pour some light vermouth.'),
    ('2', 'Then half the ammount of a London dry Gin.'),
    ('2', 'And decorate with one or three olives on a stick.');

CREATE TABLE likesAndFavorites(
    userId INT,
    cocktailId INT,
    type VARCHAR (10)
);

INSERT INTO likesAndFavorites (userId, cocktailId, type) VALUES
    (1, 2, 'like'),
    (2, 1, 'fave'); */
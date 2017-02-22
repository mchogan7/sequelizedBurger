CREATE DATABASE serverApp_db;

USE serverApp_db;

-- users table will store the login data and main credentials.
CREATE TABLE users (
    user_id INT(32) NOT NULL, -- Will be the main reference across tables. Randomly Assigned/Unique
    user_email VARCHAR(128) NOT NULL,
    user_name VARCHAR(16) NOT NULL,
    user_pw VARCHAR(255) NOT NULL,
    user_level VARCHAR(255) NOT NULL, -- Will be useful if we need certain users to only have access to something.
    restaurant_name VARCHAR(32), -- used to associate
    isReal BOOLEAN NOT NULL, -- For easily seperating real/fake data.
    PRIMARY KEY (user_id)
);

-- restaurants table will act as a class so we can
-- make changes/get data from all servers per restaurant
CREATE TABLE restaurants (
    restaurant_id INT(32) NOT NULL,  -- Will be randomly assigned/unique.
    restaurant_name VARCHAR(32) NOT NULL, -- Will be the main reference across tables.
    defaultMenu JSON, -- This allows us to drop in menus for everyone at a particular resturaunt.
    isReal BOOLEAN NOT NULL, -- For easily seperating real/fake data.
    PRIMARY KEY (restaurant_name)
);

CREATE TABLE userJob (
    restaurant_id INT(32) NOT NULL, -- Must match from restaurants table.
    user_id INT(32) NOT NULL, -- Must match from user table.
    startDate DATE NOT NULL,
    endDate DATE,
    wage DECIMAL(10,2) NOT NULL, -- used to associate
    isReal BOOLEAN NOT NULL, -- For easily seperating real/fake data.
    userJobMenu JSON, -- If a user wants to edit the default resturant menu, it can be stored here.
    comments MEDIUMBLOB,
    PRIMARY KEY (user_id)
);

CREATE TABLE shift (
    restaurant_id INT(32) NOT NULL, -- Used to show where shift happened. Must match from restaurants table.
    user_id INT(32) NOT NULL, -- Must match from user table.
    shiftDate DATE, -- will use calendar picker.
    timeIn TIMESTAMP NOT NULL, -- will use to calculate shift length
    timeOut TIMESTAMP NOT NULL,
    shiftType VARCHAR(32), -- Filled in via dropdown menu, eventually auto suggested.
    largestTip DECIMAL(10,2),
    smallestTip DECIMAL(10,2),
    stiffed INT(10),
    bwl DECIMAL(10,2),
    sales DECIMAL(10,2),
    tipout DECIMAL(10,2),
    tipPercent DECIMAL(10,2),
    ppa DECIMAL(10,2),
	comments MEDIUMBLOB,
    breakthroughs MEDIUMBLOB,
    isReal BOOLEAN NOT NULL, -- For easily seperating real/fake data.
    PRIMARY KEY (user_id)
);
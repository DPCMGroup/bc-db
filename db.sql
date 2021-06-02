SET time_zone = "+00:00";
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS rooms;
DROP TABLE IF EXISTS workStations;
DROP TABLE IF EXISTS workStationsFailures;
DROP TABLE IF EXISTS roomsFailures;
DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS attendances;
DROP TABLE IF EXISTS sanitizations;
DROP TABLE IF EXISTS reports;

CREATE TABLE users
(
	id    		INTEGER UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
	username    VARCHAR(20) NOT NULL,
    password    VARCHAR(200) NOT NULL, -- high limit because it's the hashed password
    name    	VARCHAR(20) NOT NULL,
    surname    	VARCHAR(20) NOT NULL,
    mail    	VARCHAR(127) NOT NULL,
    type    	TINYINT UNSIGNED NOT NULL, -- 0 admin, 1 employee, 2 cleaner
    archived    TINYINT(1) NOT NULL,
    UNIQUE (username),
    CHECK (type >= 0 AND type <=2)
) WITH SYSTEM VERSIONING;

CREATE TABLE rooms 
(
    id   	 	INTEGER UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    roomName    VARCHAR(20) NOT NULL,
    xRoom    	SMALLINT UNSIGNED NOT NULL, -- x: dimension1 grid
    yRoom    	SMALLINT UNSIGNED NOT NULL, -- y: dimension2 grid
    archived    TINYINT(1) NOT NULL,
	unavailable TINYINT(1) NOT NULL, -- 0 available 1 broken 
    UNIQUE (roomName)
) WITH SYSTEM VERSIONING;

CREATE TABLE workStations
(
    id    				INTEGER UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    tag    				VARCHAR(20) NOT NULL,
    workStationName    	VARCHAR(20) NOT NULL,
    xWorkStation   		SMALLINT UNSIGNED NOT NULL, -- x-coordinate
	yWorkStation   		SMALLINT UNSIGNED NOT NULL, -- y-coordinate
	idRoom    			INTEGER UNSIGNED NOT NULL,
	state    			TINYINT UNSIGNED NOT NULL, -- 0 available 1 taken 2 booked 3 broken 
	sanitized    		TINYINT(1) NOT NULL, -- 0 not sanitized 1 sanitized
	archived    		TINYINT(1) NOT NULL,
	FOREIGN KEY (idRoom) REFERENCES rooms (id) ON DELETE CASCADE,
	UNIQUE (xWorkStation, yWorkStation,idRoom),
	UNIQUE (workStationName),
	UNIQUE (tag),
	CHECK (state >=0 AND state <=3)
) WITH SYSTEM VERSIONING;

-- a taken workstation is always not sanitized

CREATE TABLE workStationsFailures
(
    id    			INTEGER UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    idWorkStation   INTEGER UNSIGNED NOT NULL,
	startTime		DATETIME NOT NULL,
	endTime			DATETIME,
	archived    TINYINT(1) NOT NULL,
	FOREIGN KEY (idWorkStation) REFERENCES workStations (id) ON DELETE CASCADE
) WITH SYSTEM VERSIONING;

CREATE TABLE roomsFailures
(
    id    			INTEGER UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    idRoom   		INTEGER UNSIGNED NOT NULL,
	startTime		DATETIME NOT NULL,
	endTime			DATETIME,
	archived    TINYINT(1) NOT NULL,
	FOREIGN KEY (idRoom) REFERENCES rooms (id) ON DELETE CASCADE
) WITH SYSTEM VERSIONING;

CREATE TABLE bookings
(
	id    			INTEGER UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
	idWorkStation   INTEGER UNSIGNED NOT NULL,
	idUser    		INTEGER UNSIGNED NOT NULL,
	startTime		DATETIME NOT NULL,
	endTime			DATETIME NOT NULL,
	archived    TINYINT(1) NOT NULL,
	FOREIGN KEY (idWorkStation) REFERENCES workStations (id) ON DELETE CASCADE,
	FOREIGN KEY (idUser) REFERENCES users (id) ON DELETE CASCADE,
	CHECK (endTime >= startTime)
) WITH SYSTEM VERSIONING;

CREATE TABLE attendances
(
    id    			INTEGER UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
	idBooking    	INTEGER UNSIGNED NOT NULL,
	startTime		DATETIME NOT NULL,
	endTime			DATETIME,
	FOREIGN KEY (idBooking) REFERENCES bookings (id) ON DELETE CASCADE,
	UNIQUE (idBooking),
	CHECK (endTime >= startTime)
) WITH SYSTEM VERSIONING;

CREATE TABLE sanitizations
(
    id    						INTEGER UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    idWorkStation  				INTEGER UNSIGNED NOT NULL,
	idUser    					INTEGER UNSIGNED NOT NULL,
	sanitizationTime			DATETIME NOT NULL,
	FOREIGN KEY (idWorkStation) REFERENCES workStations (id) ON DELETE CASCADE,
	FOREIGN KEY (idUser) 		REFERENCES users (id) ON DELETE CASCADE
) WITH SYSTEM VERSIONING;

CREATE TABLE reports
(
	id    			INTEGER UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
	reportTime		DATETIME NOT NULL,
	blockchainHash  VARCHAR(255) NOT NULL,
	fileHash    	VARCHAR(255) NOT NULL,
	UNIQUE (reportTime)
) WITH SYSTEM VERSIONING;

SET FOREIGN_KEY_CHECKS = 1;



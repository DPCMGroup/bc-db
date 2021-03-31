SET time_zone = "+00:00";

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS rooms;
DROP TABLE IF EXISTS workStations;
DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS attendances;
DROP TABLE IF EXISTS sanitizations;

CREATE TABLE users
(
	id    		INTEGER UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
	username    VARCHAR(20) NOT NULL,
    password    VARCHAR(200) NOT NULL, -- high limit because it's the hashed password
    type    	TINYINT UNSIGNED NOT NULL, -- 0 admin, 1 employee, 2 cleaner
    archived    TINYINT(1) NOT NULL,
    UNIQUE (username),
    CHECK (type >= 0 AND type <=2)
) WITH SYSTEM VERSIONING;

CREATE TABLE rooms 
(
    id   	 	SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    roomName    VARCHAR(20) NOT NULL,
    xRoom    	SMALLINT UNSIGNED NOT NULL, -- x: dimension1 grid
    yRoom    	SMALLINT UNSIGNED NOT NULL, -- y: dimension2 grid
    archived    TINYINT(1) NOT NULL,
    UNIQUE (roomName)
) WITH SYSTEM VERSIONING;

CREATE TABLE workStations
(
    id    				INTEGER UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    WorkStationName    	VARCHAR(20) NOT NULL,
    xWorkStation   		SMALLINT UNSIGNED NOT NULL, -- x-coordinate
	yWorkStation   		SMALLINT UNSIGNED NOT NULL, -- y-coordinate
	idRoom    			SMALLINT UNSIGNED NOT NULL,
	state    			TINYINT(1) UNSIGNED NOT NULL,
	archived    		TINYINT(1) NOT NULL,
	FOREIGN KEY (idRoom) REFERENCES rooms (id) ON DELETE CASCADE,
	UNIQUE (xWorkStation, yWorkStation),
	UNIQUE (WorkStationName),
	CHECK (state >=0 AND state <=6)
) WITH SYSTEM VERSIONING;

/* 
TYPE
0 available and sanitized
1 available and not sanitized
2 taken
3 booked and sanitized
4 booked and not sanitized
5 broken and sanitized
6 broken and not sanitized
*/

CREATE TABLE bookings
(
	id    			INTEGER UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
	idWorkStation   INTEGER UNSIGNED NOT NULL,
	idUser    		INTEGER UNSIGNED NOT NULL,
	startTime		DATETIME NOT NULL,
	endTime			DATETIME NOT NULL,
	FOREIGN KEY (idWorkStation) REFERENCES workStations (id) ON DELETE CASCADE,
	FOREIGN KEY (idUser) REFERENCES users (id) ON DELETE CASCADE,
	CHECK (endTime >= startTime)
) WITH SYSTEM VERSIONING;

CREATE TABLE attendances
(
    id    			INTEGER UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    idWorkStation   INTEGER UNSIGNED NOT NULL,
	idUser    		INTEGER UNSIGNED NOT NULL,
	idBooking    	INTEGER UNSIGNED NOT NULL,
	startTime		DATETIME NOT NULL,
	endTime			DATETIME NOT NULL,
	FOREIGN KEY (idWorkStation) REFERENCES workStations (id) ON DELETE CASCADE,
	FOREIGN KEY (idUser) REFERENCES users (id) ON DELETE CASCADE,
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



/*popolamento*/

INSERT INTO users (username, password, type, archived) VALUES 
('admin','admin',0,0),
('dipendente','dipendente',1,0),
('addetto','addetto',2,0);

INSERT INTO rooms (roomName,xRoom,yRoom,archived) VALUES
('lab1',10,10,0),
('lab2',20,20,0),
('lab3',15,15,0);

INSERT INTO workStations(WorkStationName, xWorkStation, yWorkStation, idRoom, state, archived) VALUES 
('lab1-1x1',1,1,1,0),
('lab1-2x2',2,2,1,0),
('lab1-3x3',3,3,1,0),
('lab1-4x4',4,4,1,0),
('lab1-5x5',5,5,1,0);




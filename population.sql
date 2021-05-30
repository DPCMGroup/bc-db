SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO users (username, password, name, surname, mail, type, archived) VALUES 
('mrossi','000','mario','rossi','mario.rossi@gmail.com',0,0),
('averdi','000','alessio','verdi','alessio.verdi@yahoo.it',1,0),
('gbianchi','000','gianni','bianchi','gianni.bianchi@pulizie.it',2,0),
('mneri','000','marika','neri','marika.neri@virgilio.it',1,0),
('mviola','000','matteo','viola','matteo.viola@virgilio.it',1,0);

INSERT INTO rooms (roomName,xRoom,yRoom,archived,unavailable) VALUES
('lab1',10,10,0,0),
('lab2',20,20,0,0),
('lab3',15,15,0,0);

INSERT INTO workStations(tag, workStationName, xWorkStation, yWorkStation, idRoom, state, sanitized, archived) VALUES
('00 c0 00 01 8d 91 04','lab1-1x1',1,1,1,0,0,0),
('00 67 00 a9 95 b0 04','lab1-1x2',1,2,1,1,0,0),
('00 8a 00 2c d1 a1 04','lab1-1x3',1,3,1,2,0,0),
('00 1f 00 22 78 20 04','lab1-1x4',1,4,1,3,0,0),
('00 37 00 03 95 70 04','lab1-1x5',1,5,1,0,1,0),
('00 d2 00 05 1c 91 04','lab1-1x6',1,6,1,2,1,0),
('81 6c f2 ba 7f 35 04','lab1-2x1',2,1,1,0,0,0),
('80 6c f2 ba 59 39 04','lab1-2x2',2,2,1,1,0,0),
('80 57 1f 82 15 40 04','lab1-3x1',3,1,1,0,0,0);

INSERT INTO bookings(idWorkStation, idUser, startTime, endTime, archived) VALUES 
(2,4,'2021-04-01 10:00:00','2021-04-01 18:00:00',0),
(1,4,'2021-06-01 10:00:00','2021-06-01 13:00:00',0),
(1,4,'2021-07-01 10:00:00','2021-07-01 13:00:00',0),
(1,4,'2021-08-01 10:00:00','2021-08-01 13:00:00',0),
(3,2,'2021-06-01 10:00:00','2021-06-01 13:00:00',0),
(3,2,'2021-07-01 10:00:00','2021-07-01 13:00:00',0),
(3,2,'2021-08-01 10:00:00','2021-08-01 13:00:00',0);

INSERT INTO attendances (idBooking, startTime, endTime) VALUES 
(1,'2021-04-01 10:01:00','2021-04-01 12:59:00'),
(2,'2021-04-01 10:05:00','2021-04-01 17:45:00');

INSERT INTO sanitizations (idWorkStation, idUser,sanitizationTime) VALUES 
(2,1,'2021-04-01 13:00:00');

SET FOREIGN_KEY_CHECKS = 1;


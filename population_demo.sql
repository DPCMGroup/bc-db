SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO users (username, password, name, surname, mail, type, archived) VALUES 
('mrossi','admin2077','mario','rossi','mario.rossi@gmail.com',0,0),
('averdi','employee2077','alessio','verdi','alessio.verdi@yahoo.it',1,0),
('gbianchi','cleaner2077','gianni','bianchi','gianni.bianchi@pulizie.it',2,0),
('mneri','employee2077','marika','neri','marika.neri@virgilio.it',1,0),
('mviola','employee2077','matteo','viola','matteo.viola@virgilio.it',1,0);

INSERT INTO rooms (roomName,xRoom,yRoom,archived) VALUES
('Laboratorio',10,10,0),
('Aula A',20,20,0),
('Aula B',15,15,0),
('Aula C',15,15,0),
('Aula D',15,15,0);

INSERT INTO workStations(tag, workStationName, xWorkStation, yWorkStation, idRoom, state, sanitized, archived) VALUES

/*Laboratorio*/
('00 c0 00 01 8d 91 04','A1',1,1,1,0,0,0),
('00 67 00 a9 95 b0 04','A2',1,2,1,0,0,0),
('00 8a 00 2c d1 a1 04','A3',1,3,1,0,0,0),
('00 1f 00 22 78 20 04','A4',1,4,1,0,0,0),
('00 37 00 03 95 70 04','A5',1,5,1,0,0,0),
('00 d2 00 05 1c 91 04','A6',1,6,1,0,0,0),

('81 6c f2 ba 7f 35 04','B1',2,1,1,0,0,0),
('80 6c f2 ba 59 39 04','B2',2,2,1,0,0,0),

('80 57 1f 82 15 40 04','C1',3,1,1,0,0,0)

/*Aula A*/
('00 c0 00 01 8d 91 f3','A1',1,1,1,0,0,0),
('00 c0 00 01 8d 91 f4','A2',1,1,1,0,0,0),
('00 c0 00 01 8d 91 f5','A3',1,1,1,0,0,0),
('00 c0 00 01 8d 91 f6','A4',1,1,1,0,0,0),
('00 c0 00 01 8d 91 f7','A5',1,1,1,0,0,0),

/*Aula B*/
('00 c0 00 01 8d 91 g3','A1',1,1,1,0,0,0),
('00 c0 00 01 8d 91 g4','A2',1,1,1,0,0,0),
('00 c0 00 01 8d 91 g5','A3',1,1,1,0,0,0),
('00 c0 00 01 8d 91 g6','A4',1,1,1,0,0,0),
('00 c0 00 01 8d 91 g7','A5',1,1,1,0,0,0)

/*Aula C*/
('00 c0 00 01 8d 91 h3','A1',1,1,1,0,0,0),
('00 c0 00 01 8d 91 h4','A2',1,1,1,0,0,0),
('00 c0 00 01 8d 91 h5','A3',1,1,1,0,0,0),
('00 c0 00 01 8d 91 h6','A4',1,1,1,0,0,0),
('00 c0 00 01 8d 91 h7','A5',1,1,1,0,0,0),

/*Aula D*/
('00 c0 00 01 8d 91 w3','A1',1,1,1,0,0,0),
('00 c0 00 01 8d 91 w4','A2',1,1,1,0,0,0),
('00 c0 00 01 8d 91 w5','A3',1,1,1,0,0,0),
('00 c0 00 01 8d 91 w6','A4',1,1,1,0,0,0),
('00 c0 00 01 8d 91 w7','A5',1,1,1,0,0,0);

INSERT INTO bookings(idWorkStation, idUser, startTime, endTime, archived) VALUES 
(1,2,'2021-09-01 10:00:00','2021-09-01 13:00:00',0),
(1,2,'2021-09-02 10:00:00','2021-09-02 13:00:00',0),
(1,2,'2021-09-03 10:00:00','2021-09-03 13:00:00',0),
(1,2,'2021-09-04 10:00:00','2021-09-04 13:00:00',0),
(1,2,'2021-09-05 10:00:00','2021-09-05 13:00:00',0),

(2,4,'2021-09-01 10:00:00','2021-09-01 13:00:00',0),
(2,4,'2021-09-02 10:00:00','2021-09-02 13:00:00',0),
(2,4,'2021-09-03 10:00:00','2021-09-03 13:00:00',0),
(2,4,'2021-09-04 10:00:00','2021-09-04 13:00:00',0),
(2,4,'2021-09-05 10:00:00','2021-09-05 13:00:00',0),

(3,5,'2021-09-01 10:00:00','2021-09-01 13:00:00',0),
(3,5,'2021-09-02 10:00:00','2021-09-02 13:00:00',0),
(3,5,'2021-09-03 10:00:00','2021-09-03 13:00:00',0),
(3,5,'2021-09-04 10:00:00','2021-09-04 13:00:00',0),
(3,5,'2021-09-05 10:00:00','2021-09-05 13:00:00',0);

SET FOREIGN_KEY_CHECKS = 1;


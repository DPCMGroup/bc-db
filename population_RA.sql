SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO users (id,username, password, name, surname, mail, type, archived) VALUES 
(1,'mrossi','admin2077','mario','rossi','mario.rossi@gmail.com',0,0),
(2,'averdi','employee2077','alessio','verdi','alessio.verdi@yahoo.it',1,0),
(3,'gbianchi','cleaner2077','gianni','bianchi','gianni.bianchi@pulizie.it',2,0),
(4,'mneri','employee2077','marika','neri','marika.neri@virgilio.it',1,0),
(5,'mviola','employee2077','matteo','viola','matteo.viola@virgilio.it',1,0),
(6,'abruni','employee2077','antonio','bruni','antonio.bruni@virgilio.it',1,0),
(7,'bbruni','employee2077','bruno','bruni','bruno.bruni@virgilio.it',1,0),
(8,'cbruni','employee2077','carlo','bruni','carlo.bruni@virgilio.it',1,0);

INSERT INTO rooms (id,roomName,xRoom,yRoom,archived, unavailable) VALUES
(1,'Laboratorio',10,10,0,0),
(2,'Aula A',20,20,0,0),
(3,'Aula B',15,15,0,0),
(4,'Aula C',15,15,0,0),
(5,'Aula D',15,15,0,0);

INSERT INTO workStations(id, tag, workStationName, xWorkStation, yWorkStation, idRoom, state, sanitized, archived) VALUES

/*Laboratorio*/
(1,'00 c0 00 01 8d 91 04','L-A1',1,1,1,0,0,0),
(2,'00 67 00 a9 95 b0 04','L-A2',1,2,1,0,0,0),
(3,'00 8a 00 2c d1 a1 04','L-A3',1,3,1,0,0,0),
(4,'00 1f 00 22 78 20 04','L-A4',1,4,1,0,0,0),
(5,'00 37 00 03 95 70 04','L-A5',1,5,1,0,0,0),
(6,'00 d2 00 05 1c 91 04','L-A6',1,6,1,0,0,0),

(7,'81 6c f2 ba 7f 35 04','L-B1',2,1,1,0,0,0),  /*libera tutto il giorno*/
(8,'80 6c f2 ba 59 39 04','L-B2',2,2,1,0,0,0),  /*libera con prenotazione di averdi tardi*/
(9,'80 6c f2 ba cc ef 04','L-B3',2,3,1,0,0,0),  /*prenotata da mneri*/
(10,'80 6c f2 ba d4 6d 04','L-B4',2,4,1,0,0,0), /*occupata da averdi*/
(11,'80 6c f2 ba 38 c7 04','L-B5',2,5,1,0,0,0), /*guasta*/

(12,'80 57 1f 82 15 40 04','L-C1',3,1,1,0,0,0),

/*Aula A*/
(13,'00 c0 00 01 8d 91 f3','A-A1',1,1,2,0,0,0),
(14,'00 c0 00 01 8d 91 f4','A-A2',1,2,2,0,0,0),
(15,'00 c0 00 01 8d 91 f5','A-A3',1,3,2,0,0,0),
(16,'00 c0 00 01 8d 91 f6','A-A4',1,4,2,0,0,0),
(17,'00 c0 00 01 8d 91 f7','A-A5',1,5,2,0,0,0),

/*Aula B*/
(18,'00 c0 00 01 8d 91 g3','B-A1',1,1,3,0,0,0),
(19,'00 c0 00 01 8d 91 g4','B-A2',1,2,3,0,0,0),
(20,'00 c0 00 01 8d 91 g5','B-A3',1,3,3,0,0,0),
(21,'00 c0 00 01 8d 91 g6','B-A4',1,4,3,0,0,0),
(22,'00 c0 00 01 8d 91 g7','B-A5',1,5,3,0,0,0),

/*Aula C*/
(23,'00 c0 00 01 8d 91 h3','C-A1',1,1,4,0,0,0),
(24,'00 c0 00 01 8d 91 h4','C-A2',1,2,4,0,0,0),
(25,'00 c0 00 01 8d 91 h5','C-A3',1,3,4,0,0,0),
(26,'00 c0 00 01 8d 91 h6','C-A4',1,4,4,3,0,0),
(27,'00 c0 00 01 8d 91 h7','C-A5',1,5,4,3,0,0),

/*Aula D*/
(28,'00 c0 00 01 8d 91 w3','D-A1',1,1,5,0,0,0), /*libera non igienizzata*/
(29,'00 c0 00 01 8d 91 w4','D-A2',1,2,5,0,1,0), /*libera igienizzata*/
(30,'00 c0 00 01 8d 91 w5','D-A3',1,3,5,0,0,0), /*prenotata non igienizzata*/
(31,'00 c0 00 01 8d 91 w6','D-A4',1,4,5,0,1,0), /*prenotata igienizzata*/
(32,'00 c0 00 01 8d 91 w7','D-A5',1,5,5,0,0,0), /*occupata non igienizzata*/
(33,'00 c0 00 01 8d 91 w8','D-A6',1,6,5,0,1,0), /*guasta non igienizzata*/
(34,'00 c0 00 01 8d 91 w9','D-A7',1,7,5,0,0,0), /*guasta igienizzata*/

/*Laboratorio*/

(35,'80 6c f2 ba 52 ea 04','L-B6',2,6,1,0,0,0),
(36,'80 6c f2 ba 9f 32 04','L-B7',2,7,1,0,0,0),
(37,'81 6c f2 ba 2b 07 04','L-B8',2,8,1,0,0,0);

INSERT INTO bookings(id, idWorkStation, idUser, startTime, endTime, archived) VALUES 
(1,1,2,'2021-06-01 10:30:00','2021-06-01 19:00:00',0),
(2,1,2,'2021-09-01 10:00:00','2021-09-01 13:00:00',0),
(3,1,2,'2021-09-02 10:00:00','2021-09-02 13:00:00',0),
(4,1,2,'2021-09-03 10:00:00','2021-09-03 13:00:00',0),
(5,1,2,'2021-09-04 10:00:00','2021-09-04 13:00:00',0),
(6,1,2,'2021-09-05 10:00:00','2021-09-05 13:00:00',0),

(7,2,4,'2021-09-01 10:00:00','2021-09-01 13:00:00',0),
(8,2,4,'2021-09-02 10:00:00','2021-09-02 13:00:00',0),
(9,2,4,'2021-09-03 10:00:00','2021-09-03 13:00:00',0),
(10,2,4,'2021-09-04 10:00:00','2021-09-04 13:00:00',0),
(11,2,4,'2021-09-05 10:00:00','2021-09-05 13:00:00',0),

(12,3,5,'2021-09-01 10:00:00','2021-09-01 13:00:00',0),
(13,3,5,'2021-09-02 10:00:00','2021-09-02 13:00:00',0),
(14,3,5,'2021-09-03 10:00:00','2021-09-03 13:00:00',0),
(15,3,5,'2021-09-04 10:00:00','2021-09-04 13:00:00',0),
(16,3,5,'2021-09-05 10:00:00','2021-09-05 13:00:00',0);

INSERT INTO workStationsFailures (id, idWorkStation, startTime, endTime, archived) VALUES
(1,33,'2021-06-01 10:00:00','2029-09-01 13:00:00',0),
(2,34,'2021-06-01 10:00:00','2029-09-01 13:00:00',0),
(3,11,'2021-06-01 10:00:00','2029-09-01 13:00:00',0);

INSERT INTO sanitizations(idWorkStation,idUser,sanitizationTime) VALUES
(29,2,'2021-03-03 16:59:00'),
(31,3,'2021-03-03 17:52:00'),
(33,2,'2021-04-03 16:59:00')
;

SET FOREIGN_KEY_CHECKS = 1;

/* sostituire ?data-oggi? con MM-DD*/
SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO bookings(id, idWorkStation, idUser, startTime, endTime, archived) VALUES 
(17,30,6,'2021-?data-oggi? 07:00:00','2021-?data-oggi? 23:00:00',0),
(18,31,7,'2021-?data-oggi? 07:00:00','2021-?data-oggi? 23:00:00',0),
(19,32,8,'2021-?data-oggi? 07:00:00','2021-?data-oggi? 23:00:00',0),

(20,8,2,'2021-?data-oggi? 20:00:00','2021-?data-oggi? 23:00:00',0),
(21,9,4,'2021-?data-oggi? 07:00:00','2021-?data-oggi? 23:00:00',0),
(22,10,2,'2021-?data-oggi? 07:00:00','2021-?data-oggi? 23:00:00',0);

INSERT INTO attendances(id, idBooking, startTime, endTime) VALUES
(1, 19,'2021-?data-oggi? 07:30:00','2021-?data-oggi? 23:00:00'),
(2, 22,'2021-?data-oggi? 07:30:00','2021-?data-oggi? 23:00:00');

SET FOREIGN_KEY_CHECKS = 1;
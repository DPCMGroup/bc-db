SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO users (username, password, type, archived) VALUES 
('admin','admin',0,0),
('dipendente1','dipendente',1,0),
('addetto','addetto',2,0),
('dipendente2','dipendente',1,0);

INSERT INTO rooms (roomName,xRoom,yRoom,archived) VALUES
('lab1',10,10,0),
('lab2',20,20,0),
('lab3',15,15,0);

INSERT INTO workStations(workStationName, xWorkStation, yWorkStation, idRoom, state, archived) VALUES 
('lab1-1x1',1,1,1,0,0),
('lab1-2x2',2,2,1,0,0),
('lab1-3x3',3,3,1,0,0),
('lab1-4x4',4,4,1,0,0),
('lab1-5x5',5,5,1,0,0);

SET FOREIGN_KEY_CHECKS = 1;


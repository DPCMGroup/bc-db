/*PRENOTAZIONI*/

/* elenco delle postazioni (escluse le guaste e le archiviate) in una determinata stanza (STANZA)*/
SELECT W.workStationName
FROM workStations W, rooms R
WHERE W.archived = 0 AND
	W.idRoom = R.id AND
	R.id = /*STANZA(ID)*/ AND
	NOT (W.state=5 OR W.state=6) 
;

/* elenco delle postazioni libere (né prenotate né guaste né archiviate) in un determinato periodo (INIZIO - FINE) in una determinata stanza (STANZA)*/
SELECT W.workStationName
FROM workStations W, rooms R
WHERE W.archived = 0 AND
	W.idRoom = R.id AND
	R.id = /*STANZA(ID)*/ AND
	NOT (W.state=5 OR W.state=6) 
	AND W.id NOT IN (
		SELECT B.idWorkStation
		FROM bookings B
		WHERE NOT (B.endTime <= /*INIZIO('YYYY-MM-DD hh:mm:ss'*/ OR B.startTime >= /*FINE('YYYY-MM-DD hh:mm:ss'*/)
	)
;

/* elenco delle postazioni prenotate (né libere né guaste né archiviate) in un determinato periodo (INIZIO - FINE)
 in una determinata stanza (STANZA) con prenotante, orario inizio e orario fine*/
SELECT W.workStationName, U.username, B1.startTime, B1.endTime
FROM workStations W, rooms R, users U, bookings B1
WHERE W.archived = 0 AND
	W.idRoom = R.id AND
	R.id = /*STANZA(ID)*/ AND
	B1.idUser = U.id AND
    B1.idWorkStation = W.id AND
	NOT (W.state=5 OR W.state=6) 
	AND W.id IN (
		SELECT B2.idWorkStation
		FROM bookings B2
		WHERE NOT (B2.endTime <= /*INIZIO('YYYY-MM-DD hh:mm:ss'*/ OR B2.startTime >= /*FINE('YYYY-MM-DD hh:mm:ss'*/)
	)
;

/*elenco delle prenotazioni effettuate da un determinato utente(UTENTE) da oggi al futuro*/
SELECT R.roomName, W.workStationName, B.startTime, B.endTime
FROM workStations W, rooms R, users U, bookings B 
WHERE B.idWorkStation = W.id AND
B.idUser = U.id AND
W.idRoom = R.id AND
U.id = /*UTENTE(ID)*/
;


/*VERIFICARE VERSIONING*/

/*versioning stanze*/
SELECT *, ROW_START, ROW_END FROM rooms FOR SYSTEM_TIME ALL;

/*versioning postazioni*/
SELECT *, ROW_START, ROW_END FROM workStations FOR SYSTEM_TIME ALL;

/*versioning utenti*/
SELECT *, ROW_START, ROW_END FROM users FOR SYSTEM_TIME ALL;


/*REPORT*/

/*elenco postazioni occupate da uno specifico utente (UTENTE) con l’indicazione delle ore trascorse in ogni postazione*/
SELECT B.idWorkStation, A.startTime, A.endTime, TIME(A.endTime-A.startTime) AS hours
FROM attendances A, bookings B
WHERE A.idBooking=B.id AND B.idUser = /*UTENTE (ID)*/ 
ORDER BY A.startTime;

/*elenco utenti che hanno occupato una specifica postazione (POSTAZIONE) SPECIFICANDO IL PERIODO (INIZIO - FINE) */
SELECT U.username, A.startTime, A.endTime
FROM attendances A, bookings B, users U
WHERE A.idBooking = B.id AND 
	U.id = B.idUser AND
	NOT (B.endTime <= /*INIZIO('YYYY-MM-DD hh:mm:ss'*/ OR B.startTime >= /*FINE('YYYY-MM-DD hh:mm:ss'*/) AND
	B.idWorkStation = /*POSTAZIONE (ID) */ ;

/*elenco occupazioni di una postazione (POSTAZIONE) SPECIFICANDO IL PERIODO (INIZIO - FINE) da parte di uno specifico UTENTE */
SELECT U.username, A.startTime, A.endTime
FROM attendances A, bookings B, users U
WHERE A.idBooking = B.id AND 
	U.id = B.idUser AND
	NOT (B.endTime <= /*INIZIO('YYYY-MM-DD hh:mm:ss'*/ OR B.startTime >= /*FINE('YYYY-MM-DD hh:mm:ss'*/) AND
	B.idWorkStation = /*POSTAZIONE (ID) */ 
	AND U.id = /*UTENTE (ID)/*;

/*elenco delle igienizzazioni avvenute in un determinato PERIODO (INIZIO - FINE)*/
SELECT *
FROM sanitizations S, users U
WHERE S.idUser = U.id AND
	NOT (S.sanitizationTime <= /*INIZIO('YYYY-MM-DD hh:mm:ss'*/ OR S.sanitizationTime >= /*FINE('YYYY-MM-DD hh:mm:ss'*/)
ORDER BY S.sanitizationTime;

/*elenco delle occupazioni avvenute in un determinato PERIODO (INIZIO - FINE)*/
SELECT U.username, B.idworkStation, A.startTime, A.endTime
FROM attendances A, users U, bookings B
WHERE B.idUser = U.id AND
	B.id = A.idBooking AND
	NOT (A.endTime <= /*INIZIO('YYYY-MM-DD hh:mm:ss'*/ OR A.startTime >= /*FINE('YYYY-MM-DD hh:mm:ss'*/)
ORDER BY A.startTime;








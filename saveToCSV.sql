SELECT * FROM agencies
INTO OUTFILE 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads'
FIELDS ENCLOSED BY '"'
TERMINATED BY ';'
ESCAPED BY '"'
LINES TERMINATED BY '\r\n';
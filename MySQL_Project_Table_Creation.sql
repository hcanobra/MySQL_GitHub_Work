CREATE TABLE VZW_DB.SP_PROJECT_PRIORITY_LIST (
    Priority_id INT AUTO_INCREMENT,
    Site TEXT,
    FUZE_Project_ID TEXT,
    FUZE_Project_Status TEXT,
    Lat DOUBLE,
    Lon DOUBLE,
    Date_trn TIMESTAMP default current_timestamp(),
    PRIMARY KEY (Priority_id)
) ENGINE=INNODB;

CREATE TABLE VZW_DB.SP_PROJECT_NOTES (
    Notes_CODE TEXT,
    Priority_id INT,
    Notes TEXT,
	Date_trn timestamp default current_timestamp(),
    INDEX Priority_id (Priority_id),
    FOREIGN KEY (Priority_id)
        REFERENCES SP_PROJECT_PRIORITY_LIST(Priority_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=INNODB;
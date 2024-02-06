ALTER TABLE reports
-- DROP FOREIGN KEY fk_reports_agencies1
-- DROP COLUMN agencies_uid
-- ADD medics_uid INT
ADD CONSTRAINT medics_uid
FOREIGN KEY (medics_uid) REFERENCES medics(medic_uid)
-- SHOW GRANTS for root
SHOW GRANTS for observable_read_only
-- CREATE USER 'observable_read_only'@'%' IDENTIFIED BY 'redacted_pw(ask Brad)'
-- GRANT SELECT, SHOW DATABASES ON *.* TO 'observable_read_only'@'%' WITH GRANT OPTION;
-- REVOKE RELOAD ON *.* FROM 'observable_read_only'@'%';
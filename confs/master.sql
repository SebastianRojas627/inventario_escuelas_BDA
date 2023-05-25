-- Switch to the newly created database

CREATE USER "replication"@"%" IDENTIFIED BY "password";
GRANT REPLICATION SLAVE ON *.* TO "replication"@"%";
FLUSH PRIVILEGES;

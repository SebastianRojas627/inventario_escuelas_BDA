CHANGE MASTER TO MASTER_HOST='masterdb',MASTER_USER='replication', MASTER_PASSWORD='password',MASTER_LOG_FILE='1.000003', MASTER_LOG_POS=157;
START SLAVE;
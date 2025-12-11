# Migration from MySQL to PostgreSQL  

The above migration.txt contains the procedures to migrate database schemas from a mysql database to postgres using SQL dump as the most popular tool pgloader doesn't run natively on windows.
Refer ordermgmt.sql for the order management database containing tables customers, orders and shippers extracted using SQL dump.  
Also refer ordermgmt_pg.sql for the migrated version in postgres.

1) create a directory 
	CMD> mkrdir c:\schema_export

2) create directory object in database by using SYS
	sqlplus /as SYS
	SQL> create directory schema_export as c:\schema_export;

3) give grants to directory object
	SQL> grant read, write on directory schema_export to onlinestoredb;
	SQL> grant datapump_exp_full_database to onlinestoredb;

4) Export the schema
	C:\> expdp onlinestoredb/onlinestoredb@ORCL DIRECTORY=schema_export DUMPFILE=exp_schema_onlinestoredb.dmp LOGFILE=exp_schema_onlinestoredb.log SCHEMAS=exp_schema_onlinestoredb
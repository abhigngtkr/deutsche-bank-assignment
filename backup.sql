backup.sql

create table backup_CONTACTS			as select * from CONTACTS			   ;
create table backup_COUNTRIES           as select * from COUNTRIES             ;
create table backup_CUSTOMERS           as select * from CUSTOMERS             ;
create table backup_EMPLOYEES           as select * from EMPLOYEES             ;
create table backup_INVENTORIES         as select * from INVENTORIES           ;
create table backup_LOCATIONS           as select * from LOCATIONS             ;
create table backup_ORDERS              as select * from ORDERS                ;
create table backup_ORDERITEMS          as select * from ORDERITEMS            ;
create table backup_PRODUCTCATEGORIES   as select * from PRODUCTCATEGORIES     ;
create table backup_PRODUCTS            as select * from PRODUCTS              ;
create table backup_REGIONS             as select * from REGIONS               ;
create table backup_WAREHOUSES          as select * from WAREHOUSES            ;
create table backup_DEPARTMENT          as select * from DEPARTMENT            ;
 
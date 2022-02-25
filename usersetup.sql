-- 2) create new user admin with full access
create user admin_user identfied by admin;
grant create session to admin_user;

-- create a role with all privileges
create role all_access;
-- granting all privileges to that role
grant all privileges to all_access;
-- granting that role to admin_user
grant all_access to admin_user;

-- 3) create new application user with DML access:
create user application_user identified by application_user;
grant create session to application_user;

-- create role which has only DML operations access 
create role dml_op;

grant update, insert, delete on CONTACTS			to dml_op;	
grant update, insert, delete on COUNTRIES	        to dml_op;
grant update, insert, delete on CUSTOMERS           to dml_op;
grant update, insert, delete on EMPLOYEES           to dml_op;
grant update, insert, delete on INVENTORIES         to dml_op;
grant update, insert, delete on LOCATIONS           to dml_op;
grant update, insert, delete on ORDERS              to dml_op;
grant update, insert, delete on ORDERITEMS          to dml_op;
grant update, insert, delete on PRODUCTCATEGORIES   to dml_op;
grant update, insert, delete on PRODUCTS            to dml_op;
grant update, insert, delete on REGIONS             to dml_op;
grant update, insert, delete on WAREHOUSES          to dml_op;
grant update, insert, delete on DEPARTMENT          to dml_op;

-- grant that role to application_user 
grant dml_op to application_user;





create table region (
						regionid number
					, 	regionname varchar2(50)
					, 	constraint p_regionid primary key (regionid)
					);

create table audit_region as select * from region where 1=2;
alter table audit_region add (audit_id number, audit_date date default sysdate, d_u_i varchar2(1));
alter table audit_region add constraint p_region_audit_id primary key(audit_id));

					
create table countries (countryid 	number
					, 	countryname varchar2(100)
					, 	region 		number
					, 	city 		varchar2(2000)
					, 	state 		varchar2(2000)
					,	constraint  p_countryid primary key (countryid)
					,	constraint 	f_region foreign key (region) references region(regionid));

create table audit_countries as select * from countries where 1=2;
alter table audit_countries add (audit_id number, audit_date date default sysdate, d_u_i varchar2(1));
alter table audit_countries add constraint p_countries_audit_id primary key(audit_id));


create table locations (locationid 	number
					, 	address		varchar2(2000)
					, 	postal_code	number
					,	countryid 	number
					,	constraint p_locationid primary key (locationid)
					,	constraint f_countryid foreign key (countryid) references countries(countryid));

create table audit_locations as select * from locations where 1=2;
alter table audit_locations add (audit_id number, audit_date date default sysdate, d_u_i varchar2(1));
alter table audit_locations add constraint p_locations_audit_id primary key(audit_id));


create table warehouse (warehouseid		number
					,	warehousename	varchar2(1000)
					, 	location		number
					,	constraint p_warehouseid primary key (warehouseid)
					,	constraint f_location foreign key (location) references locations(locationid));

create table audit_warehouse as select * from warehouse where 1=2;
alter table audit_warehouse add (audit_id number, audit_date date default sysdate, d_u_i varchar2(1));
alter table audit_warehouse add constraint p_employees_audit_id primary key(audit_id));


create table employees (employeeid 		number
					,	contactid		number
					,	hiredate		date 
					,	dob				date
					,	salary			number
					,	manager			number 
					,	designation		varchar2(200)
					,	department		number
					,	constraint p_empid primary key (employeeid)
					,	constraint f_mgr foreign key (manager) references employees(employeeid)
					,	constraint f_dept foreign key (department) references department(deptid)
					,	constraint f_emp_contactid	foreign key (contactid)	references contacts(contactid)
					);

create table audit_employees as select * from employees where 1=2;
alter table audit_employees add (audit_id number, audit_date date default sysdate, d_u_i varchar2(1));
alter table audit_employees add constraint p_employees_audit_id primary key(audit_id));


create table productcategories (categoryid		number
							,	categoryname 	varchar2(150)
							,	constraint p_categoryid primary key (categoryid));
							
create table audit_productcategories as select * from productcategories where 1=2;
alter table audit_productcategories add (audit_id number, audit_date date default sysdate, d_u_i varchar2(1));
alter table audit_productcategories add constraint p_prdcategories_audit_id primary key(audit_id));


create table products (	productid		number
					, 	productname		varchar2(1000)
					, 	description		varchar2(4000)
					, 	standardcost	number(9,2)
					, 	listprice		number(9,2)
					, 	category		number
					,	constraint p_productid primary key(productid)
					,	constraint f_category foreign key (category) references productcategories(categoryid));

create table audit_products as select * from products where 1=2;
alter table audit_products add (audit_id number, audit_date date default sysdate, d_u_i varchar2(1));
alter table audit_products add constraint p_prd_audit_id primary key(audit_id));


create table inventories(productid				number
						,unitprice              number(9,2)
						,warehouseid            number
						,constraint p_invprd primary key (productid) 
						,constraint warehouseid primary key (warehouseid)
						);

create table audit_inventories as select * from inventories where 1=2;
alter table audit_inventories add (audit_id number, audit_date date default sysdate, d_u_i varchar2(1));
alter table audit_inventories add constraint p_inv_audit_id primary key(audit_id));

					
create table customers (customerid		number
					,	contactid		number		
					,	constraint p_customerid primary key (customerid)
					,	constraint f_contactsid	foreign key (contactid) references contacts(contactid));

create table audit_customers as select * from customers where 1=2;
alter table audit_customers add (audit_id number, audit_date date default sysdate, d_u_i varchar2(1));
alter table audit_customers add constraint p_customer_audit_id primary key(audit_id));

create table contacts (	contactid		number
					,	firstname		varchar2(200)
					, 	lastname		varchar2(200)
					, 	email			varchar2(100)
					, 	phone			varchar2(200)
					, 	website			varchar2(100)
					, 	Facebook		varchar2(100)
					, 	Twitter			varchar2(100)
					, 	WhatsApp		number
					, 	address			number
					,	constraint p_contactid	primary key (contactid)
					,	constraint f_address foreign key (address) references locations(locationid));
	
	
create table audit_contacts as select * from contacts where 1=2;
alter table audit_contacts add (audit_order_id number, audit_date date default sysdate, d_u_i varchar2(1));
alter table audit_contacts add constraint p_contacts_audit_id primary key(audit_order_id));


create table orders ( orderid		number
					, customerid	number
					, status		varchar2(20)
					, salesmanid	number
					, orderdate		date
					, constraint p_orderid primary key (orderid)
					, constraint f_o_customerid foreign key (customerid) references customers(customerid)
					, constraint salesmanid primary key (salesmanid));

create table audit_orders as select * from orders where 1=2;
alter table audit_orders add (audit_order_id number, audit_date date default sysdate, d_u_i varchar2(1));
alter table audit_orders add constraint p_audit_order_id primary key(audit_order_id));


create table orderitems(orderid					number
					,	itemid                  number
					, 	productid               number
					,	quantity                number(9,2)
					,	warehouse				number
					,	constraint od_orderid foreign key (orderid) references orders(orderid)
					,	constraint p_itemid primary key (itemid)
					,	constraint od_productid foreign key (productid) references products(productid)
					,	constraint f_orderitems_warehouse foreign key (warehouse) references warehouse(warehouseid))
					);

create table audit_orderitems as select * from orderitems where 1=2;
alter table audit_orderitems add (audit_id number, audit_date date default sysdate, d_u_i varchar2(1));
alter table audit_orderitems add constraint p_orderitems_audit_id primary key(audit_id));

					

create table department(deptid 				number
					, 	departmentname 		varchar2(200)
					, 	location			varchar2(200)
					,	constraint p_deptid primary key (deptid)
					,	constraint location references locations(locationid)
						);
							
create table department as select * from department where 1=2;
alter table department add (audit_id number, audit_date date default sysdate, d_u_i varchar2(1));
alter table department add constraint p_dept_audit_id primary key(audit_id));

create sequence CONTACTS_seq			minvalue 1 start with 1 increment by 1 nocache nocycle; 		
create sequence COUNTRIES_seq	        minvalue 1 start with 1 increment by 1 nocache nocycle; 
create sequence CUSTOMERS_seq           minvalue 1 start with 1 increment by 1 nocache nocycle; 
create sequence EMPLOYEES_seq           minvalue 1 start with 1 increment by 1 nocache nocycle; 
create sequence INVENTORIES_seq         minvalue 1 start with 1 increment by 1 nocache nocycle; 
create sequence LOCATIONS_seq           minvalue 1 start with 1 increment by 1 nocache nocycle; 
create sequence ORDERS_seq              minvalue 1 start with 1 increment by 1 nocache nocycle; 
create sequence ORDERITEMS_seq          minvalue 1 start with 1 increment by 1 nocache nocycle; 
create sequence PRODUCTCATEGORIES_seq   minvalue 1 start with 1 increment by 1 nocache nocycle; 
create sequence PRODUCTS_seq            minvalue 1 start with 1 increment by 1 nocache nocycle; 
create sequence REGIONS_seq             minvalue 1 start with 1 increment by 1 nocache nocycle; 
create sequence WAREHOUSES_seq          minvalue 1 start with 1 increment by 1 nocache nocycle; 
create sequence DEPARTMENT_seq          minvalue 1 start with 1 increment by 1 nocache nocycle; 

create sequence audit_CONTACTS_seq			minvalue 1 start with 1 increment by 1 nocache nocycle; 		
create sequence audit_COUNTRIES_seq	        minvalue 1 start with 1 increment by 1 nocache nocycle; 
create sequence audit_CUSTOMERS_seq           minvalue 1 start with 1 increment by 1 nocache nocycle; 
create sequence audit_EMPLOYEES_seq           minvalue 1 start with 1 increment by 1 nocache nocycle; 
create sequence audit_INVENTORIES_seq         minvalue 1 start with 1 increment by 1 nocache nocycle; 
create sequence audit_LOCATIONS_seq           minvalue 1 start with 1 increment by 1 nocache nocycle; 
create sequence audit_ORDERS_seq              minvalue 1 start with 1 increment by 1 nocache nocycle; 
create sequence audit_ORDERITEMS_seq          minvalue 1 start with 1 increment by 1 nocache nocycle; 
create sequence audit_PRODUCTCATEGORIES_seq   minvalue 1 start with 1 increment by 1 nocache nocycle; 
create sequence audit_PRODUCTS_seq            minvalue 1 start with 1 increment by 1 nocache nocycle; 
create sequence audit_REGIONS_seq             minvalue 1 start with 1 increment by 1 nocache nocycle; 
create sequence audit_WAREHOUSES_seq          minvalue 1 start with 1 increment by 1 nocache nocycle; 
create sequence audit_DEPARTMENT_seq          minvalue 1 start with 1 increment by 1 nocache nocycle; 

 create or replace trigger t_region
 before insert or update or delete 
 on regions
 for each row
 declare
 
	v_regions_seq		number := 0;
	v_audit_region_seq	number := 0;
	
 begin
	if inserting 
	then
	
		select regions_seq.nextval into v_regions_seq from dual;
		select audit_regions_seq.nextval into v_audit_region_seq from dual;
		
		:new.regionid := v_seq;
		
		insert into audit_contacts
			(audit_id, audit_date, d_u_i
			,regionid 
			,regionname)
		values(
			audit_regions_seq.nextval
			,sysdate
			,'I'
			,:new.region_id
			,:new.regionname
			)
	elsif updating
	then
		insert into audit_contacts
			(audit_id, audit_date, d_u_i
			,regionid 
			,regionname)
		values(
			audit_regions_seq.nextval
			,sysdate
			,'U'
			,:new.region_id
			,:new.regionname
			)
	elsif deleting
	then
		insert into audit_contacts
			(audit_id, audit_date, d_u_i
			,regionid 
			,regionname)
		values(
			audit_regions_seq.nextval
			,sysdate
			,'D'
			,:old.region_id
			,:old.regionname
			)
	end if;
		
 end;
 /



 create or replace trigger t_countries
 before insert or update or delete 
 on countries
 for each row
 declare
 
	v_countries_seq		number := 0;
	v_audit_countries_seq	number := 0;
	
 begin
	if inserting 
	then
	
		select countries_seq.nextval into v_countries_seq from dual;
		select audit_countries_seq.nextval into v_audit_countries_seq from dual;
		
		:new.regionid := v_seq;
		
		insert into audit_countries
			(audit_id, audit_date, d_u_i
			,countryid 	
			,countryname
			,region 	
			,city 		
			,state 		)
		values(
			audit_regions_seq.nextval
			,sysdate
			,'I'
			,:new:countryid 	
			,:new:countryname
			,:new:region 	
			,:new:city 		
			,:new:state 		
			)
	elsif updating
	then
		insert into audit_countries
			(audit_id, audit_date, d_u_i
			,countryid 	
			,countryname
			,region 	
			,city 		
			,state 		)
		values(
			audit_regions_seq.nextval
			,sysdate
			,'U'
			,:new:countryid 	
			,:new:countryname
			,:new:region 	
			,:new:city 		
			,:new:state 		
			)
	elsif deleting
	then
		insert into audit_countries
			(audit_id, audit_date, d_u_i
			,countryid 	
			,countryname
			,region 	
			,city 		
			,state 		)
		values(
			audit_regions_seq.nextval
			,sysdate
			,'D'
			,:old:countryid 	
			,:old:countryname
			,:old:region 	
			,:old:city 		
			,:old:state 		
			)
	end if;
		
 end;
 /	


 create or replace trigger t_locations
 before insert or update or delete 
 on locations
 for each row
 declare
 
	v_locations_seq		number := 0;
	v_audit_locations_seq	number := 0;
	
 begin
	if inserting 
	then
	
		select locations_seq.nextval into v_locations_seq from dual;
		select audit_locations_seq.nextval into v_audit_locations_seq from dual;
		
		:new.locationid := v_locations_seq;
		
		insert into audit_locations
			(audit_id, audit_date, d_u_i
			,locationid 
			,address	
			,postal_code
			,countryid 	)
		values(
			audit_regions_seq.nextval
			,sysdate
			,'I'
			,:new.locationid 
			,:new.address	
			,:new.postal_code
			,:new.countryid 	 		
			)
	elsif updating
	then
		insert into audit_locations
			(audit_id, audit_date, d_u_i
			,locationid 
			,address	
			,postal_code
			,countryid 	)
		values(
			audit_regions_seq.nextval
			,sysdate
			,'U'
			,:new.locationid 
			,:new.address	
			,:new.postal_code
			,:new.countryid 	 		
			)
	elsif deleting
	then
		insert into audit_locations
			(audit_id, audit_date, d_u_i
			,locationid 
			,address	
			,postal_code
			,countryid 	)
		values(
			audit_regions_seq.nextval
			,sysdate
			,'I'
			,:old.locationid 
			,:old.address	
			,:old.postal_code
			,:old.countryid 	 		
			)
	end if;
		
 end;
 /	
 

 create or replace trigger t_productcategories
 before insert or update or delete 
 on productcategories
 for each row
 declare
 
	v_seq		number := 0;
	v_audit_seq	number := 0;
	
 begin
	if inserting 
	then
	
		select productcategories_seq.nextval into v_seq from dual;
		select audit_productcategories_seq.nextval into v_audit_seq from dual;
		
		:new.categoryid := v_seq;
		
		insert into audit_productcategories
			(audit_id, audit_date, d_u_i
			,categoryid		
			,categoryname 	
			)
		values(
			audit_warehouse_seq.nextval
			,sysdate
			,'I'
			,:new.categoryid		
			,:new.categoryname 	 	 		
			)
	elsif updating
	then
		insert into audit_productcategories
			(audit_id, audit_date, d_u_i
			,categoryid		
			,categoryname 	
			)
		values(
			audit_warehouse_seq.nextval
			,sysdate
			,'I'
			,:new.categoryid		
			,:new.categoryname 	 	 		
			)
	elsif deleting
	then
		insert into audit_productcategories
			(audit_id, audit_date, d_u_i
			,categoryid		
			,categoryname 	
			)
		values(
			audit_warehouse_seq.nextval
			,sysdate
			,'I'
			,:new.categoryid		
			,:new.categoryname 	 	 		
			)
	end if;
		
 end;
 /	
 
 create or replace trigger t_products
 before insert or update or delete 
 on products
 for each row
 declare
 
	v_seq		number := 0;
	v_audit_seq	number := 0;
	
 begin
	if inserting 
	then
	
		select products_seq.nextval into v_seq from dual;
		select audit_products_seq.nextval into v_audit_seq from dual;
		
		:new.productid := v_seq;
		
		insert into audit_products
			(audit_id, audit_date, d_u_i
			,productid		
			,productname	
			,description	
			,standardcost	
			,listprice		
			,category		
			)
		values(
			v_audit_seq.nextval
			,sysdate
			,'I'
			,:new.productid		
			,:new.productname	
			,:new.description	
			,:new.standardcost	
			,:new.listprice		
			,:new.category
			)
	elsif updating
	then
		insert into audit_products
			(audit_id, audit_date, d_u_i
			,productid		
			,productname	
			,description	
			,standardcost	
			,listprice		
			,category		
			)
		values(
			v_audit_seq.nextval
			,sysdate
			,'U'
			,:new.productid		
			,:new.productname	
			,:new.description	
			,:new.standardcost	
			,:new.listprice		
			,:new.category
			)
	elsif deleting
	then
		insert into audit_products
			(audit_id, audit_date, d_u_i
			,productid		
			,productname	
			,description	
			,standardcost	
			,listprice		
			,category		
			)
		values(
			v_audit_seq.nextval
			,sysdate
			,'D'
			,:old.productid		
			,:old.productname	
			,:old.description	
			,:old.standardcost	
			,:old.listprice		
			,:old.category
			)
	end if;
		
 end;
 /	 
 

 create or replace trigger t_inventories
 before insert or update or delete 
 on inventories
 for each row
 declare
 
	v_seq		number := 0;
	v_audit_seq	number := 0;
	
 begin
	if inserting 
	then
	
		select inventories_seq.nextval into v_seq from dual;
		select audit_inventories_seq.nextval into v_audit_seq from dual;
		
		:new.productid := v_seq;
		
		insert into audit_inventories
			(audit_id, audit_date, d_u_i
			,productid	
			,unitprice  
			,warehouseid
			)
		values(
			audit_warehouse_seq.nextval
			,sysdate
			,'I'
			,:new.productid	
			,:new.unitprice  
			,:new.warehouseid	 		
			)
	elsif updating
	then
		insert into audit_inventories
			(audit_id, audit_date, d_u_i
			,productid	
			,unitprice  
			,warehouseid
			)
		values(
			audit_warehouse_seq.nextval
			,sysdate
			,'U'
			,:new.productid	
			,:new.unitprice  
			,:new.warehouseid	 		
			)
	elsif deleting
	then
		insert into audit_inventories
			(audit_id, audit_date, d_u_i
			,productid	
			,unitprice  
			,warehouseid
			)
		values(
			audit_warehouse_seq.nextval
			,sysdate
			,'D'
			,:old.productid	
			,:old.unitprice  
			,:old.warehouseid	 		
			)
	end if;
		
 end;
 /	  
 
  create or replace trigger t_customers
 before insert or update or delete 
 on customers
 for each row
 declare
 
	v_seq		number := 0;
	v_audit_seq	number := 0;
	
 begin
	if inserting 
	then
	
		select customers_seq.nextval into v_seq from dual;
		select audit_customers_seq.nextval into v_audit_seq from dual;
		
		:new.customerid := v_seq;
		
		insert into audit_customers
			(audit_id, audit_date, d_u_i
			,customerid
			,contactid 
			)
		values(
			audit_warehouse_seq.nextval
			,sysdate
			,'I'
			,:new.customerid
			,:new.contactid  		
			)
	elsif updating
	then
		insert into audit_customers
			(audit_id, audit_date, d_u_i
			,customerid
			,contactid 
			)
		values(
			audit_warehouse_seq.nextval
			,sysdate
			,'U'
			,:new.customerid
			,:new.contactid  		
			)
	elsif deleting
	then
		insert into audit_customers
			(audit_id, audit_date, d_u_i
			,customerid
			,contactid 
			)
		values(
			audit_warehouse_seq.nextval
			,sysdate
			,'D'
			,:old.customerid
			,:old.contactid  		
			)
	end if;
		
 end;
 /	  
 
  create or replace trigger t_contacts
 before insert or update or delete 
 on contacts
 for each row
 declare
 
	v_seq		number := 0;
	v_audit_seq	number := 0;
	
 begin
	if inserting 
	then
	
		select contacts_seq.nextval into v_seq from dual;
		select audit_contacts_seq.nextval into v_audit_seq from dual;
		
		:new.contactid := v_seq;
		
		insert into audit_contacts
			(audit_id, audit_date, d_u_i
			,   contactid		
			,	firstname	
			, 	lastname	
			, 	email		
			, 	phone		
			, 	website		
			, 	Facebook	
			, 	Twitter		
			, 	WhatsApp	
			, 	address		
			)
		values(
			audit_warehouse_seq.nextval
			,sysdate
			,'I'
			,   :new.contactid		
			,	:new.firstname	
			, 	:new.lastname	
			, 	:new.email		
			, 	:new.phone		
			, 	:new.website		
			, 	:new.Facebook	
			, 	:new.Twitter		
			, 	:new.WhatsApp	
			, 	:new.address		
			)
	elsif updating
	then
		insert into audit_contacts
			(audit_id, audit_date, d_u_i
			,   contactid		
			,	firstname	
			, 	lastname	
			, 	email		
			, 	phone		
			, 	website		
			, 	Facebook	
			, 	Twitter		
			, 	WhatsApp	
			, 	address		
			)
		values(
			audit_warehouse_seq.nextval
			,sysdate
			,'U'
			,   :new.contactid		
			,	:new.firstname	
			, 	:new.lastname	
			, 	:new.email		
			, 	:new.phone		
			, 	:new.website		
			, 	:new.Facebook	
			, 	:new.Twitter		
			, 	:new.WhatsApp	
			, 	:new.address		
			)
	elsif deleting
	then
		insert into audit_contacts
			(audit_id, audit_date, d_u_i
			,   contactid		
			,	firstname	
			, 	lastname	
			, 	email		
			, 	phone		
			, 	website		
			, 	Facebook	
			, 	Twitter		
			, 	WhatsApp	
			, 	address		
			)
		values(
			audit_warehouse_seq.nextval
			,sysdate
			,'D'
			,   :old.contactid		
			,	:old.firstname	
			, 	:old.lastname	
			, 	:old.email		
			, 	:old.phone		
			, 	:old.website		
			, 	:old.Facebook	
			, 	:old.Twitter		
			, 	:old.WhatsApp	
			, 	:old.address		
			)
	end if;
		
 end;
 /	   
 
  create or replace trigger t_orders
 before insert or update or delete 
 on orders
 for each row
 declare
 
	v_seq		number := 0;
	v_audit_seq	number := 0;
	
 begin
	if inserting 
	then
	
		select orders_seq.nextval into v_seq from dual;
		select audit_orders_seq.nextval into v_orders_seq from dual;
		
		:new.orderid := v_seq;
		
		insert into audit_orders
			(audit_id, audit_date, d_u_i
			, orderid		
			, customerid
			, status	
			, salesmanid
			, orderdate	
			)
		values(
			audit_seq.nextval
			,sysdate
			,'I'
			, :new.orderid		
			, :new.customerid
			, :new.status	
			, :new.salesmanid
			, :new.orderdate			
			)
	elsif updating
	then
		insert into audit_orders
			(audit_id, audit_date, d_u_i
			, orderid		
			, customerid
			, status	
			, salesmanid
			, orderdate	
			)
		values(
			audit_seq.nextval
			,sysdate
			,'U'
			, :new.orderid		
			, :new.customerid
			, :new.status	
			, :new.salesmanid
			, :new.orderdate			
			)
	elsif deleting
	then
		insert into audit_orders
			(audit_id, audit_date, d_u_i
			, orderid		
			, customerid
			, status	
			, salesmanid
			, orderdate	
			)
		values(
			audit_seq.nextval
			,sysdate
			,'D'
			, :old.orderid		
			, :old.customerid
			, :old.status	
			, :old.salesmanid
			, :old.orderdate			
			)
	end if;
		
 end;
 /	    
 
  create or replace trigger t_orderitems
 before insert or update or delete 
 on orderitems
 for each row
 declare
 
	v_seq		number := 0;
	v_audit_seq	number := 0;
	
 begin
	if inserting 
	then
	
		select orderitems_seq.nextval into v_seq from dual;
		select audit_orderitems_seq.nextval into v_orders_seq from dual;
		
		:new.orderid := v_seq;
		
		insert into audit_orderitems
			(audit_id, audit_date, d_u_i
			,orderid	
			,itemid     
			,productid  
			,quantity )  
		values(
			audit_seq.nextval
			,sysdate
			,'I'
			,:new.orderid	
			,:new.itemid     
			,:new.productid  
			,:new.quantity		
			)
	elsif updating
	then
		insert into audit_orderitems
			(audit_id, audit_date, d_u_i
			,orderid	
			,itemid     
			,productid  
			,quantity )  
		values(
			audit_seq.nextval
			,sysdate
			,'U'
			,:new.orderid	
			,:new.itemid     
			,:new.productid  
			,:new.quantity		
			)
	elsif deleting
	then
		insert into audit_orderitems
			(audit_id, audit_date, d_u_i
			,orderid	
			,itemid     
			,productid  
			,quantity )  
		values(
			audit_seq.nextval
			,sysdate
			,'D'
			,:old.orderid	
			,:old.itemid     
			,:old.productid  
			,:old.quantity		
			)
	end if;
		
 end;
 /	   
 
  create or replace trigger t_department
 before insert or update or delete 
 on department
 for each row
 declare
 
	v_seq		number := 0;
	v_audit_seq	number := 0;
	
 begin
	if inserting 
	then
	
		select department_seq.nextval into v_seq from dual;
		select audit_department_seq.nextval into v_audit_seq from dual;
		
		:new.deptid := v_seq;
		
		insert into audit_department
			(audit_id, audit_date, d_u_i
			,deptid 		
			,departmentname 
			,location)		
		values(
			audit_seq.nextval
			,sysdate
			,'I'
			,:new.deptid 		
			,:new.departmentname 
			,:new.location	
			)
	elsif updating
	then
		insert into audit_department
			(audit_id, audit_date, d_u_i
			,deptid 		
			,departmentname 
			,location)		
		values(
			audit_seq.nextval
			,sysdate
			,'U'
			,:new.deptid 		
			,:new.departmentname 
			,:new.location	
			)
	elsif deleting
	then
		insert into audit_department
			(audit_id, audit_date, d_u_i
			,deptid 		
			,departmentname 
			,location)		
		values(
			audit_seq.nextval
			,sysdate
			,'D'
			,:old.deptid 		
			,:old.departmentname 
			,:old.location	
			)
	end if;
		
 end;
 /	 


  create or replace trigger t_employees
 before insert or update or delete 
 on employees
 for each row
 declare
 
	v_seq		number := 0;
	v_audit_seq	number := 0;
	
 begin
	if inserting 
	then
	
		select employees_seq.nextval into v_seq from dual;
		select audit_employees_seq.nextval into v_audit_seq from dual;
		
		:new.employeeid := v_seq;
		
		insert into audit_employees
			(audit_id, audit_date, d_u_i
			,employeeid 	
			,contactid		
			,hiredate		
			,dob			
			,salary			
			,manager		
			,designation	
			,department		
		values(
			audit_seq.nextval
			,sysdate
			,'I'
			,new:employeeid 	
			,new:contactid		
			,new:hiredate		
			,new:dob			
			,new:salary			
			,new:manager		
			,new:designation	
			,new:department	
			)
	elsif updating
	then
		insert into audit_employees
			(audit_id, audit_date, d_u_i
			,employeeid 	
			,contactid		
			,hiredate		
			,dob			
			,salary			
			,manager		
			,designation	
			,department		
		values(
			audit_seq.nextval
			,sysdate
			,'U'
			,new:employeeid 	
			,new:contactid		
			,new:hiredate		
			,new:dob			
			,new:salary			
			,new:manager		
			,new:designation	
			,new:department	
			)
	elsif deleting
	then
		insert into audit_employees
			(audit_id, audit_date, d_u_i
			,employeeid 	
			,contactid		
			,hiredate		
			,dob			
			,salary			
			,manager		
			,designation	
			,department		
		values(
			audit_seq.nextval
			,sysdate
			,'D'
			,old:employeeid 	
			,old:contactid		
			,old:hiredate		
			,old:dob			
			,old:salary			
			,old:manager		
			,old:designation	
			,old:department	
			)
	end if;
		
 end;
 /	

 
 -----------------------
 
 -- read:
 -- 11.	Create PL/SQL anonymous blocks, procedures, functions and triggers to perform create ,read, update and delete operations for above entities in ddl.sql

-- INSERTION EXAMPLE:
SET SERVEROUTPUT ON;					
begin
	
	insert into countries(countryname,region,city,state)
	select 'INDIA', 'ASIA','PUNE','MAHARASHTRA' from dual;

	insert into locations (address, postal_code, countryid)
	select 'BAVDHAN STREET',411021, (select countryid from countries where countryname = 'INDIA') from dual;
	
	insert into contacts (firstname		
					, 	lastname		
					, 	email			
					, 	phone			
					, 	website			
					, 	Facebook		
					, 	Twitter			
					, 	WhatsApp		
					, 	address			
					)
	select 'ABHISHEK','GANGATIRKAR','ABHI.GNGTKR@GMAIL.COM','9970618281','www.ora.co.in','facebook','twitter','whatsapp',
		(select locationid 
		 from 	locations 
		 where 	postal_code	= 411021 
		 and 	countryid in (select countryid 
							  from 	 countries 
							  where  countryname = 'INDIA' 
							  and    city = 'PUNE'
							  )
		)
	from dual;
	
	INSERT INTO DEPARTMENT (DEPARTMENTNAME, LOCATION)
	SELECT 'GBM', (select locationid 
					 from 	locations 
					 where 	postal_code	= 411021 
					 and 	countryid in (select countryid 
										  from 	 countries 
										  where  countryname = 'INDIA' 
										  and    city = 'PUNE'
										  ))
					)
	FROM DUAL;
	
	insert into employees (
						contactid		
					,	hiredate		
					,	dob				
					,	salary			
					,	manager			 
					,	designation		
					,	department		)
	SELECT 
		(select  contactid
		from	contacts 
		where  	firstname = 'ABHISHEK' 
		and 	lastname = 'GANGATIRKAR'), 
		TO_DATE('21-FEB-22'), TO_DATE('30-JUL-86'), 10000, NULL, 'AVP', 	
		(SELECT DEPTID
		FROM	DEPARTMENT
		WHERE 	departmentname = 'GBM'
		AND		location IN (select locationid 
							 from 	locations 
							 where 	postal_code	= 411021 
							 and 	countryid in (select countryid 
												  from 	 countries 
												  where  countryname = 'INDIA' 
												  and    city = 'PUNE'
												  ))
							)
		) FROM DUAL;
end;
/


-- UPDATE EXAMPLE:
SET SERVEROUTPUT ON;					
begin
	
	 UPDATE employees SET SALARY = SALARY * 100 
	 WHERE  CONTACTID = (select  contactid
						from	contacts 
						where  	firstname = 'ABHISHEK' 
						and 	lastname = 'GANGATIRKAR');
	
	dbms_output.put_line('number of recs deleted = '||sql%rowcount);
end;
/



-- DELETION EXAMPLE:
SET SERVEROUTPUT ON;					
begin
	
	DELETE FROM  employees (
					WHERE CONTACTID = ( select  contactid
										from	contacts 
										where  	firstname = 'ABHISHEK' 
										and 	lastname = 'GANGATIRKAR');
	
	dbms_output.put_line('number of recs deleted = '||sql%rowcount);
end;
/

-- FUNCTION TO READ EXAMPLE:
CREATE OR REPLACE FUNCTION F_GET_EMPID
(IN_FIRST_NAME IN VARCHAR2, IN_LAST_NAME IN VARCHAR2)
RETURN EMPLOYEES.EMPID%TYPE
	V_F 	CONTACTS.firstname%type;
	V_L 	CONTACTS.lastname%type;
BEGIN
	
	V_F := IN_FIRST_NAME;
	V_L := IN_LAST_NAME;
	V_EMPID := EMPLOYEES.employeeid%TYPE;

	SELECT 
	FROM	EMPLOYEES
		INTO V_EMPID
	WHERE 	CONTACTID = ( 	select  contactid
							from	contacts 
							where  	firstname = V_F
							and 	lastname = V_L);
	
	return v_emp;
					
END;
/


-- 13.	Create views to create reports for products most  sold in different countries in last 7days in 

CREATE OR REPLACE VIEW v_7_days_sold_report
as 
	select	*
	from	(
			select 	count(oi.quantity) count_of_quantity_sold, c.countryname
			FROM	orderitems oi
				,	orders o 
				,	warehouse w
				,	locations l
				,	countries c
			WHERE	o.status = 'SOLD'
			AND		o.orderdate between sysdate-7 and sysdate
			AND		oi.orderid = o.orderid
			AND		oi.warehouse = w.warehouseid
			AND		w.location = l.locationid
			AND		l.country = c.countryid
			group by c.countryname
			)
	order by count_of_quantity_sold desc;
	
	
	
CREATE OR REPLACE VIEW v_7_days_placed_report
as 
	select	*
	from	(
			select 	count(oi.quantity) count_of_quantity_placed, cont.first_name, cont.last_name, c.countryname
			FROM	orderitems oi
				,	orders o 
				,	warehouse w
				,	locations l
				,	countries c
				,	customers cust
				,	contacts cont
			WHERE	o.status = 'PLACED'
			AND		o.orderdate between sysdate-7 and sysdate
			AND		oi.orderid = o.orderid
			AND		oi.warehouse = w.warehouseid
			AND		w.location = l.locationid
			AND		l.country = c.countryid
			AND		CUST.CUSTOMER_ID = O.CUSTOMER_ID
			group by cont.first_name, cont.last_name, c.countryname
			)
	order by count_of_quantity_placed desc;
 
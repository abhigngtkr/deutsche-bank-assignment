-- tables creations part
 create table region (
						regionid number
					, 	regionname varchar2(50)
					, 	constraint p_regionid primary key (regionid)
					);
					
create table countries (countryid number
					, 	countryname varchar2(100)
					, 	region varchar2(50)
					,	constraint p_countryid primary key (countryid));


create table locations (locationid 	number
					, 	address		varchar2(2000)
					, 	postal code	number
					, 	city 		varchar2(2000)
					, 	state 		varchar2(2000)
					,	country     varchar2(100)
					,	constraint p_locationid primary key (locationid));

create table warehouse (warehouseid		number
					,	warehousename	varchar2(1000)
					, 	location		varchar2(100));

create table employees (employeeid 		number
					,	firstname 		varchar2(200)
					,	lastname		varchar2(200)
					,	email 			varchar2(200)
					,	phone			number
					,	hiredate		date 
					,	dob				date
					,	salary			number
					,	manager			number 
					,	designation		varchar2(200)
					,	department		varchar2(200)
					,	constraint p_empid primary key (employeeid)
					,	constraint f_mgr foreign key (manager) references employees(employeeid)
					);

create table productcategories (categoryid		number
							,	categoryname 	varchar2(150)
							,	constraint p_categoryid primary key (categoryid));
							

create table products (	productid		number
					, 	productname		varchar2(1000)
					, 	description		varchar2(4000)
					, 	standardcost	number(9,2)
					, 	listprice		number(9,2)
					, 	category		varchar2(2000)
					,	constraint p_productid primary key(productid)
					);
					
create table customers (customerid		number
					,	name			varchar2(2000)
					, 	address			varchar2(4000)
					, 	website			varchar2(100)
					, 	Facebook		varchar2(100)
					, 	Twitter			varchar2(100)
					, 	WhatsApp		number
					,	constraint p_customerid primary key (customerid));

create table contacts (	contactid		number
					,	firstname		varchar2(200)
					, 	lastname		varchar2(200)
					, 	email			varchar2(100)
					, 	phone			number
					, 	customerid		number
					,	constraint p_contactid	primary key (contactid)
					,	constraint f_customerid foreign key references customers(customerid));

create table orders ( orderid		number
					, customerid	number
					, status		varchar2(20)
					, salesmanid	number
					, orderdate		date
					, constraint p_orderid primary key (orderid)
					, constraint f_o_customerid foreign key customerid references customers(customerid)
					, constraint salesmanid primary key (salesmanid));


create table orderitems(orderid					number
					,	itemid                  number
					, 	productid               number
					,	quantity                number(9,2)
					, 	unitprice               number(9,2)
					, 	inventories_productid   number
					, 	warehouseid             number
					, 	quantity				number
					,	constraint od_orderid foreign key (orderid) references orders(orderid)
					,	constraint p_itemid primary key (itemid)
					,	constraint od_productid foreign key (productid) references products(productid)
					,	constraint p_warehouseid primary key (warehouseid)
					,	constraint p_invent_prdid primary key (inventories_productid)
					);
					
					
create table department(deptid 				number
					, 	departmentname 		varchar2(200)
					, 	location			varchar2(200)
						);
							

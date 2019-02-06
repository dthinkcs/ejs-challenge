
create table customer(cust_no number(5) primary key,cname VARCHAR2(10),city VARCHAR22(10));
create table ordr(order_no number(5) primary key,odate date,cust_no number(5) references
customer(cust_no),ord_amt number(6));
create table item(item_no number(4) primary key,unit_pr number(5))
create table order_item(order_no number(5) references ordr(order_no),item_no number(3)
references item(item_no),qty number(4));
 create table warehouse(warehouse_no number(5) primary key,city VARCHAR2(10));
  create table shipment(order_no number(5) references ordr(order_no),warehouse_no number(5)
references warehouse(warehouse_no),ship_date date);


create table customer(cust_no int primary key,cname VARCHAR(10),city VARCHAR(10));
create table ordr(order_no INT(5) primary key,odate date,cust_no INT(5) references
customer(cust_no),ord_amt INT(6));
create table item(item_no INT(4) primary key,unit_pr INT(5))
create table order_item(order_no INT(5) references ordr(order_no),item_no INT(3)
references item(item_no),qty INT(4));
 create table warehouse(warehouse_no INT(5) primary key,city VARCHAR(10));
  create table shipment(order_no INT(5) references ordr(order_no),warehouse_no INT(5)
references warehouse(warehouse_no),ship_date date);

create table customer(cust_no int primary key,cname VARCHAR(10),city VARCHAR(10));
create table ordr(order_no INT primary key,odate date,cust_no INT ,ord_amt INT);
create table item(item_no INT primary key,unit_pr INT);
create table order_item(order_no INT ,item_no INT ,qty INT);
 create table warehouse(warehouse_no INT primary key,city VARCHAR(10));
  create table shipment(order_no INT ,warehouse_no INT ,ship_date date);



 insert into customer values(1001,'anil','orissa');

 insert into customer values(1002,'ankit','bangalore');

 insert into customer values(1003,'abhinav','muzaffar');

 insert into customer values(1004,'amit','kolkata');

 insert into customer values(1005,'manish','lucknow');


 insert into ordr values(501,'11-feb-2010',1002,5500);

 insert into ordr values(502,'20-oct-2009',1001,9700);

 insert into ordr values(505,'13-aug-2008',1005,5600);

 insert into ordr values(568,'29-jun-2010',1004,4766);

 insert into ordr values(609,'31-aug-2010',1003,9831);


 insert into item values(111,255);

 insert into item values(121,199);

 insert into item values(131,177);

 insert into item values(141,211);

 insert into item values(151,311);


 insert into order_item values(501,111,200);

 insert into order_item values(502,121,100);

 insert into order_item values(505,131,150);

 insert into order_item values(568,121,300);

 insert into order_item values(568,111,500);


 insert into warehouse values(1500,'bangalore');

 insert into warehouse values(1550,'orissa');

 insert into warehouse values(1600,'paradeep');

 insert into warehouse values(1650,'vishak');

 insert into warehouse values(1700,'bangalore');


 insert into shipment values(501,1500,'23-sep-2010');

 insert into shipment values(502,1600,'30-oct-2009');

 insert into shipment values(568,1500,'28-feb-2010');

 insert into shipment values(609,1550,'19-aug-2010');

 insert into shipment values(502,1500,'23-jul-2010');


   select c.cname, count(order_no), avg(ord_amt) from customer c, ordr o where
   c.cust_no=o.cust_no group by c.cust_no;
   select s.order_no,w.city from shipment s,warehouse w where w.warehouse_no=s.warehouse_no
  and city like 'bangalore';

  update order
  set order = case
                  when column_a = 1 then 'Y'
                  else null
                 end,
  set column_c = case
                  when column_a = 2 then 'Y'
                  else null
                 end,
  set column_d = case
                  when column_a = 3 then 'Y'
                  else null
                 end
where
 conditions

 select order_no, count(item_no), qty from order_item group by order_no order by count(item_no) DESC LIMIT 1;
 select odate, count(order_no), qty from order_item group by odate order by count(order_no) DESC LIMIT 1;

 SELECT C.CNAME, SUM(O.ORD_AMT)
 FROM ORDR O, CUSTOMER C
 WHERE O.cust_no = C.cust_no
 GROUP BY C.cust_no
 ORDER BY SUM(O.ORD_AMT) desc;

CREATE TABLE person (
  driver_id VARCHAR2(30),
  name VARCHAR2(50),
  address VARCHAR2(100),
  PRIMARY KEY (driver_id)
);

CREATE TABLE car (
  reg_no VARCHAR2(20),
  model VARCHAR2(30),
  year INT,
  PRIMARY KEY (reg_no)
);

CREATE TABLE owns (
  driver_id VARCHAR2 (30),
  reg_no VARCHAR2 (20),
  PRIMARY KEY (driver_id, reg_no),
  FOREIGN KEY (driver_id) REFERENCES person(driver_id),
  FOREIGN KEY (reg_no) REFERENCES car(reg_no)
);

CREATE TABLE accident (
  report_no INT,
  accd_date DATE,
  location VARCHAR2(50),
  PRIMARY KEY (report_no)
);
CREATE TABLE participated (
  report_no INT,
  driver_id VARCHAR2(30),
  reg_no VARCHAR2(20),
  damage_amt INT,
  PRIMARY KEY (report_no),
  FOREIGN KEY (report_no) REFERENCES accident(report_no),
  FOREIGN KEY (driver_id) REFERENCES person(driver_id),
  FOREIGN KEY (reg_no) REFERENCES car(reg_no)
);

INSERT INTO person (
  driver_id,
  name,
  address
)
VALUES (
  'a101',
  'Rishabh Raj Jaiswal',
  '41 Simla Road, Vinayak Enclave, Kolkata, West Bengal'
);

INSERT INTO person (
  driver_id,
  name,
  address
)
VALUES (
  'a102',
  'Shah Rukh Khan',
  'Mannat, Lands End, Bandstand, Bandra'
);
INSERT INTO person (
  driver_id,
  name,
  address
)
VALUES (
  'a103',
  'Salman Salim Khan',
  '3, Galaxy Apartments, BJ Road Band Stand, Bandra West'
);
INSERT INTO person (
  driver_id,
  name,
  address
)
VALUES (
  'a104',
  'Aamir Hussain Khan',
  'No.2 , Hill View Apartments, Opposite Mehboob Studios, Hill Road, Bandra West , Mumbai'
);
INSERT INTO person (
  driver_id,
  name,
  address
)
VALUES (
  'a105',
  'Rajiv Hari Om Bhatia',
  'Wing Benzer, Benzer Appartments, Lokhandwala Complex, Andheri West, Mumbai, Maharashtra'
);


insert into car values('ka03hh7014','sxi-dlx',2019);
insert into car values('ka02eh5590','i20',2020);
insert into car values('ka03k1234','fiat',1990);
insert into car values('mh12p6969','ferrari',2018);
insert into car values('rj02m0755','gypsy',2019);

insert into accident values(501,TO_DATE('05-feb-2018', 'dd-mm-yy'),'ring road');
insert into accident values(502, TO_DATE('21-mar-2019', 'dd-mm-yy'),'peenya');
insert into accident values(503,TO_DATE('10-aug-2018', 'dd-mm-yy'),'tumkur');
insert into accident values(12,TO_DATE('29-sep-2019', 'dd-mm-yy'),'mysore');
insert into accident values(20,TO_DATE('01-jun-2010', 'dd-mm-yy'),'hebbal');

insert into owns values('a101','ka03hh7014');
insert into owns values('a102','mh12p6969');
insert into owns values('a103','rj02m0755');
insert into owns values('a101','ka03k1234');
insert into owns values('a102','ka02eh5590');

insert into participated(driver_id, reg_no, report_no, damage_amt) values('a101','ka03k1234',12,7000);
insert into participated(driver_id, reg_no, report_no, damage_amt) values('a102','mh12p6969',501,12000);
insert into participated(driver_id, reg_no, report_no, damage_amt) values('a103','rj02m0755',20,8500);
insert into participated(driver_id, reg_no, report_no, damage_amt) values('a104','ka02eh5590',503,4000);
insert into participated(driver_id, reg_no, report_no, damage_amt) values('a101','ka03hh7014',502,20000);


UPDATE participated set damage_amt=2500 where (reg_no='ka03k1234' AND report_no=12);
select distinct EXTRACT(year from TO_DATE('17-FEB-2013', 'DD-MON-YYYY')) from car;
DELETE FROM accident WHERE
alter table person add aadhar_no INT;



select count(pr.driver_id) from car c,person pr,accident a,participated p where(c.reg_no=p.reg_no
and pr.driver_id=p.driver_id and a.report_no=p.report_no and year like 2018);
select count(pr.driver_id) from car c,person pr,accident a,participated p where(c.reg_no=p.reg_no
and pr.driver_id=p.driver_id and a.report_no=p.report_no and extract(year from (a.accd_date)) = 2018);
select count(distinct pr.driver_id) from car c,person pr,accident a,participated p where(c.reg_no=p.reg_no
and pr.driver_id=p.driver_id and a.report_no=p.report_no and extract(year from (a.accd_date)) = 2018);


SELECT pr.name as OWNER_NAME, count(p.report_no) as 'NUM OF ACCIDENTS', sum(p.damage_amt) as total_damage
FROM participated p, person pr
WHERE p.driver_id = pr.driver_id
GROUP BY pr.name
ORDER BY total_damage desc;

SELECT pr.name as OWNER_NAME, count(p.report_no) as 'NUM OF ACCIDENTS', sum(p.damage_amt) as 'total damage'
FROM participated p, person pr
WHERE p.driver_id = pr.driver_id
GROUP BY pr.driver_id /* IMP group by id==primary key */
ORDER BY 'total damage' desc;
/*ORACLE CORRECTION*/
SELECT pr.name as OWNER_NAME, count(p.report_no) as NUM_OF_ACCIDENTS, sum(p.damage_amt) as total_damage
FROM participated p, person pr
WHERE p.driver_id = pr.driver_id
GROUP BY pr.name
ORDER BY total_damage desc;

SELECT pr.name as OWNER_NAME/*, count(p.report_no) as NUM_OF_ACCIDENTS, sum(p.damage_amt) as total_damage*/
FROM participated p, person pr
WHERE p.driver_id = pr.driver_id
GROUP BY pr.name HAVING count(p.report_no) > 2

SELECT p.name AS OWNER_NAME
FROM person p
WHERE p.driver_id NOT IN (
    SELECT driver_id
    FROM participated
 );

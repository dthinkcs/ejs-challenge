CREATE TABLE cats (
  cat_id int not null auto_increment,
  name varchar(100),
  age int,
  primary key (cat_id)
);

INSERT INTO cats(name, age)
values ('Charlie', 17);

INSERT INTO cats(name, age)
values('Connie', 10);

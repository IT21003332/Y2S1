create table employee(
	eid integer primary key,
	ename varchar(50) not null,
	age integer,
	salary real
	)

alter table employee  add constraint sal_check check (salary>0);

create table department(
	did varchar(20),
	budget real,
	mgerId int references employee,
	primary key(did))
	 
drop table department

create table department(
	did varchar(20),
	budget real,
	mgerId int,

	constraint pk1 primary key(did),
	constraint fk1 foreign key(mgerId) references employee)

create table works (
	eid int,
	pid varchar(20),
	pct_time int,
	
	constraint pk1_works primary key(eid, pid),
	constraint fk1_works foreign key(eid) references employee,
	constraint fk2_works foreign key(pid) references department)

	insert into employee values(1000,'Ruwan',33, 40000); 

	select *
	from employee

	delete employee where eid = 1000;

	insert into employee(eid, ename, age, salary) values(1000, 'Ruwan', 33, 40000);
	
	alter table employee
	add hiredate date
	
	update employee set hiredate = '2020-01-01' where eid = 1000
	delete employee where salary = 40000

	alter table employee drop column hiredate

	select * from employee

	--10) 
	SELECT ename, salary from employee

	--11) 

	insert into employee values(1001, 'Devindu', 25, 80000, '2020-02-25')
	insert into employee 
		values(1002, 'pinky',25,60000,'2020-05-05')

	insert into employee values(1003,'Supiun', 26, 90000, '2021-03-05')

	insert into employee values(1002

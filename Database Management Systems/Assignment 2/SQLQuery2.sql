--IT21003332
--Assignment 

--Devindu Samarasinghe 

--Table creation 
create table Lecturer(
empNo int not null primary key,
Ename varchar(50),
department varchar(50))

create table project(
projectNo varchar(10) not null primary key,
projectTitle varchar(50),
duration int,
researchArea varchar(50),
leader int, 
groupNo varchar(10) unique)

create table student(
studentNo int not null primary key,
studentName varchar(50),
address varchar(100),
phone int,
specialization varchar(20),
yr int,
GPA real)

create table studentGroup(
groupNo varchar(10) not null,
studentNo int not null
constraint studentG_pk primary key(groupNo,StudentNo))

create table supervise(
projectNo varchar(10) not null,
empNo int not null 

constraint supervise_pk primary key(projectNo,empNo))


--foreign key implementation 

alter table studentGroup 
add 
constraint groupNo_fk foreign key(groupNo) references project(groupNo),
constraint studentNo_fk foreign key(studentNo) references student(studentNo)

alter table project
add constraint leader_fk foreign key(leader) references student(StudentNo)

alter table supervise
add 
constraint projNo_fk foreign key(projectNo) references project(projectNo),
constraint empNo_fk foreign key(empNo) references lecturer(empNo)


--Insertions 

insert into lecturer values(1001,'Devindu Samarasinge','IT')


insert into student values(2001,'Pinky','cmb',0767676,'IT',3,3.4)
insert into student values(2002,'Rebecca','cmb',0767676,'IT',3,3.4)
insert into student values(2003, 'Davex','cmb',0777232,'SE',3,3.5)
insert into student values(2004, 'Kaulya','kuru',027372,'CSE',3,3.6)

insert into student values(2005, 'Dilruk','kuru',027372,'CSE',3,3.6)
insert into student values(2006, 'Deshan','kuru',027372,'IT',3,3.6)
insert into student values(2007, 'Sheni','kuru',027372,'SE',3,3.6)
insert into student values(2008, 'Piyama','kuru',027372,'ISE',3,3.9)

insert into project values('P002','Project 2',3,'SE Theory',2005,'3002')
insert into project values('P001','Project 1',3,'IoT',2001,'3001')

insert into studentGroup values('3001',2001)
insert into studentGroup values('3001',2002)
insert into studentGroup values('3001',2003)
insert into studentGroup values('3001',2004)

insert into studentGroup values('3002',2005)
insert into studentGroup values('3002',2006)
insert into studentGroup values('3002',2007)
insert into studentGroup values('3002',2008)

drop table studentGroup

select * from lecturer
select * from project
select * from student
select *from studentGroup
select* from supervise

-- Find the total number of students in each group 

select sg.groupNo, count(s.studentName)
from student s, studentGroup sg
where s.studentNo = sg.studentNo
group by sg.groupNo
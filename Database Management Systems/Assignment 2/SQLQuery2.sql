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
insert into lecturer values(1002, 'Piyumath Siriwardane','SE')


insert into student values(2001,'Pinky','cmb',0767676,'IT',3,3.4)
insert into student values(2002,'Rebecca','cmb',0767676,'IT',3,3.4)
insert into student values(2003, 'Davex','cmb',0777232,'SE',3,3.5)
insert into student values(2004, 'Kaulya','kuru',027372,'CSE',3,3.6)

insert into student values(2005, 'Dilruk','kuru',027372,'CSE',3,3.6)
insert into student values(2006, 'Deshan','kuru',027372,'IT',3,3.6)
insert into student values(2007, 'Sheni','kuru',027372,'SE',3,3.6)
insert into student values(2008, 'Piyama','kuru',027372,'ISE',3,3.9)
insert into student values(2009, 'Ashan','cmb',0787878,'ISE',3,3.78)

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

insert into supervise values('P001',1001)
insert into supervise values('P002',1002)

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

-- find the average of the GOA of the groups 

	

-- find the students who are under the leaders of each project 


--find the student name and student ID of students who are not assigned with a group 



select s.studentName, s.studentNo
from student s
where s.studentNo not in (select sg.studentNo
							from studentGroup sg
							where s.studentNo = sg.studentNo)

-- find the total numnber of students in each group 


select sg.groupNo, count(s.studentNo)
from student s left outer join studentgroup sg on s.studentNo = sg.studentNo
group by sg.groupNo


--create a procedure that would return the Leader name and ID when given the parameter of projectNo

create procedure leaderDetails(@projectNo varchar(10), @leadName varchar(30) output,@leadId int output)
as 
begin

	select @leadName = s.studentName, @leadId = s.studentNo
			from student s, project p 
			where s.studentNo = p.leader and p.projectNo = @projectNo
end 

declare @leaderName varchar(30), @leaderId int
exec leaderDetails 'P001',@leaderName output, @leaderId output

print concat('Leader Name : ',@leaderName)
print concat('Leader ID: ',@leaderId)



--create a trigger when updating or inserting project Details. will update another foreign key table 

create trigger addLogEntry		--what we are trying to do is, when the account table is updated, the foreign key constraints are captured and it automatically updates the accountLog
on account --WE USE FOR - WHICH WILL UPDATE THE BASE TABLE TOO
for insert, update
as 
begin

declare @accountNo int
declare @balance real 

select @accountNo = accountNo, @balance = balance from inserted
insert into accountlog(accountNo,balance,date) values(@accountNo,@balance,getdate())
end					



create trigger studentGroupCheck
on studentGroup
for insert,update
as
begin 

declare @studentNo int 
declare @groupcount int

select @studentNo = studentNo from inserted
select @groupcount = count(GroupNo) from studentGroup where studentNo = @studentNo

if @groupcount > 1
	begin 
		print 'Student can only be in one single group'
		rollback transaction 
	end 
end 

insert into studentGroup values('3001',2008)

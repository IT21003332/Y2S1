--VIEW IS A VIRTUAL TABLE DERIVED FROM OTHER TABLES 

-- Physically there are no rows, just rows made by info gathered from other tables 

--Syntax 

create view <viewname> AS 
Select <column_name(s)>
from <table>
where<condition>


select * from dept
select * from emp
select * from works 

create view dept_info
AS
select e.ename, d.did,d.budget
from dept d, emp e
where d.managerId = e.eid

select * from dept_info
where budget > 15000

--When you update any virtual table created by view function, it can update the physical table data too 

update dept_info set budget = 95000 where did = 'Academic'

select * from dept_info

select * from dept		-- you would be able to see that the value has changed the physical diagram as well 

--exercise 1) create a view called empInfo which contains eid, name, salary and total percentage of time 

create view empInfo(EID,Name,Salary,Work_PCT)    --this way we can give names to the columns as well 
as 
select e.eid,e.ename, e.salary, SUM(w.pct_time) as 'total %'		--when there are static rows with aggregate rows, group them by all the static rows 
from emp e, works w
where w.eid = e.eid
group by e.eid,e.ename,e.salary										--like here lol 


select e.eid,e.ename, e.salary, w.pct_time
from emp e, works w
where w.eid = e.eid

select * from empInfo

drop view empInfo


--<< Advantages of Views >>--

--Security = can give restricted views to users depending on their authority 
-- query simplicity  = gives the ease of access of drawing data information from different tables in a simpler manner 


--<< Disadvantages of Views >>--

--Performance = This make take considerable time if the view is defined by a complex, multi table query since view tables are made on runtime 

--Update restrictions = mainly about aggregated functions and columns where an update is made with a where clause of a different table column morphed by the view

-----------------UPDATE INFO-----------------

--When updating rows, aggregate rows(rows achieved from taking aggregate information) cannot be updated 


--<<<<<DECLARING VARIABLES>>>>>>

Declare @name varchar(20) = 'Hello';	--This is how you create a variable and declare values 

--or 

Declare @name2 varchar(20);

set @name2 = 'hello2';	--This is the accepted method 


--eg

declare @eid int 
set @eid = 1000
select * from emp where eid = @eid	--for some bumfucking reason all of them should be highlighted together to print
---------------------------------------
declare @eid2 int
set @eid2 = 1000
declare @sal real
select @sal = salary from emp where eid = @eid2
print @sal

 --------------------------------------- IF  ---------------------------------------

 declare @eid int
 set @eid = 1000
 declare @sal real
 select @sal= salary from emp where eid=@eid
 if(@sal > 50000)
 begin
	print 'Inside the If Condition'
	print 'salary is greated than 50000'
end
else
	print 'Salary is less than 50000'

 --------------------------------------- WHILE  ---------------------------------------

create table misc(
enterid int primary key not null,
enteremp varchar(20))

declare @count int 
set @count = 1

while @count <= 10
begin 
	insert into misc values(@count, concat('Employee ',@count))
	set @count = @count + 1;
end

select * from misc 

drop table misc


----------FUNCTIONS AND PROCEDURES------------

-- IN parameters passes information from outside to the function/procedure in function type 

-- OUT parameters passses information to outside from the procedure to the calling code



--eg Createa a function that returns the number of employees in a given department 
select * from dept

create function getEmpCount(@did varchar(15)) returns int
as
begin

	declare @count int
	select @count = count(*)
	from works w
	where w.did = @did


	return @count 
end

declare @result int 
exec @result = getEmpCount'Admin'	--value assigned to a variable because its not possible to straight away print the function return 

print @result 

--Exercise 2 ) Create a function to return the total percentage of time a person works given the employee id 

select * from works 

create function totalTimePerc(@eid int) returns int 
as 
begin
	
	declare @time int 
	select @time = sum(pct_time)
	from works 
	where eid = @eid 
	group by eid

	return @time
end

declare @times int
exec @times = totalTimePerc 1000
print Concat('Total time: ',@times) 

drop function totalTimePerc


------------------------------<<PROCEDURES>>------------------------------

--can just be in the server without outputting a value 

select * from emp

create procedure increaseSalary(@pct float, @eid int)
as 
begin 
	update emp 
	set salary = salary + (salary * (@pct/100))
	where eid = @eid
end

exec increaseSalary 10,1000
select * from emp


-- Exec 2) producedures: Create a procedure that outputs statistics of salary(min,max) for a given department 

create procedure getStats(@did varchar(12),@maxm real output, @minm real output) -- In procedures, return is a parameter that has output next to the argument
as 
begin

	select @minm = min(e.salary), @maxm = max(e.salary)	--taken from the parameters 
	from emp e, works w
	where e.eid = w.eid and @did = w.did

end 

drop procedure getStats

--calling the procedure with two output parameters 

declare @max int, @min int
exec getStats 'ITSD',@min output, @max output	--here the output parameters have been assigend the recently declared variables and later on printed 
print concat('Min: ',@max)
print concat('Max: ',@min)


--Exercise 3 ) Create a procedure that outputs the name of the manager and his salary in a given department 
select * from emp
select * from dept
create procedure getInfo(@did varchar(15), @name varchar(30) output,@sal real output)
as 
begin
	select @name = e.ename, @sal = e.salary
	from emp e, dept d
	where e.eid = d.managerId and d.did = @did
end 

declare @ename varchar(30), @salary real
exec getInfo 'Admin',@ename output, @salary output

print concat('Name of the Manager: ',@ename,' Salary of the Manager: ',@salary)
	

------------------------------------------------------<< TRIGGERS >>------------------------------------------------------
	
-- Triggers are automatically executed, but it has to pass a condition ( IN response to a DDL statement or a DML statement )

-- FOR|AFTER ) Which has a body only will function after the specified triggering SQL statements have executed successfully 

-- AFTER triggers cannot be defined on views 


--eg)

create trigger test
on emp
for insert, update, delete	--trigger SQL statements 
as 
begin 
..
..
..		--trigger body
..
end 

insert into emp values 
delete emp 
update emp			-- After these triggers are done executing, trigger body will start functioning because of for| After condition (After and For is the same)


--INSTEAD OF triggering statement condition 

--Whatever you have written in trigger, it does anything instead of that 


--TRIVIA ABOUT INSTEAD OF 

-- Whenever you create an INSTEAD OF trigger, casually what happens after calling an insert is, it will first update the inserted dynamic table, amd then do the trigger to the 
-- original table, but when you apply INSTEAD OF. it only updates 'Inserted' table and does not update the original table and goes for the trigger right after 

 
 --Example 1 (Triggers)

 create table account(

 accountNo int not null,
 custId int,
 branch varchar(20),
 balance real not null
 constraint account_pk primary key(accountNo, balance))


insert into account values(1000,32,'malabe',400000)
insert into account values(1001,20,'matale',95000)
insert into account values(1002,32,'gampaha',250000)
insert into account values(1003,10,'Kandy',75000)
 
 create table accountlog(

 accountNo int not null,
 balance real not null,
 date date

 constraint log_pk primary key(accountNo, balance),
 constraint accountNo_fk foreign key(accountNo,balance) references account(accountNo,balance))	--BITCH THIS IS GROUND BREAKING.
			-- COMPOSITE PRIMARY KEYS ARE MAPPED WITH COMPOSITE FOREIGN KEYS 

-- TRIGGERS FOR EXAMPLE 1

insert into account values(1004,10,'kandy',250000)
update account set balance = 350000 where accountno = 1000



--create a trigger to track all inserts/updates done to the balance field of an Account table at a bank in the accountaudit table

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

--Upper trigger will dynamically update the AccountLog table 


select * from accountlog

--When an update is called, it will insert new details to the accountLog since this import is done from inserted dynamic table 



drop trigger addLogEntry1

--Instead of Trigger situation 

-- TRIGGERS FOR EXAMPLE 1

insert into account values(1005,11,'malabe',250000)
update account set balance = 370000 where accountno = 1000


create trigger addLogEntry1
on account
for insert, update
as 
begin
declare @accountNo int 
declare @balance real

select @accountNo = accountNo, @balance = balance from inserted 
insert into accountlog(accountNo,balance, date) values(@accountNo,@balance,getdate())
end 



select * from account
select * from accountlog

--Example 2)  create a trigger to ensure that an employee doesn't work in more than 2 departments 

select * from dept 
select * from emp
select * from works 

create trigger empDeptCount
on works 
for insert,update 
as 
begin
declare @eid int 
select @eid = eid from inserted -- returns employee id from inserted
declare @total int 
select @total=  count(did) from works where eid = @eid	--This returns the number of departments the relevant employee works for 
if @total > 2
	begin
	print 'Cannot work in more than 2 departments'
	rollback transaction -- undo the query pass 
	end
end

insert into works values(1000,'Finance',20)	-- This returns the print error under the more than 2 condition 

--Lecturer Q ) create a trigger to ensure that an employee does not work more than 100% pct_time
drop trigger empWorkTime

create trigger empworkTime
on works 
for insert, update
as 
begin 

declare @eid int;
declare @pctTotal int;

select @eid = eid from inserted;
select @pctTotal = sum(pct_Time) from works where eid = @eid
if @pctTotal > 100
	begin
	print 'Employee cannot work more than 100%'
	rollback transaction 
	end
end

select * from works

update works set pct_time =60 where eid = 1000 and did='Admin'

insert into works values(1001,'Finance',5)


-- Exercise 4) Assuming that the bank's maximum withdrawal limit per day is 40,000. Write a trigger to ensure that no customer withdraws more than the given limit 

drop table Transactions 
create table Transactions(
tid int not null primary key,
accountNo int,
type varchar(20),
amount real,
datee date)

insert into transactions values(1000,70102007,'Debit', 45000,getDate())

drop trigger maxWith
create trigger maxWith
on transactions 
for insert, update
as 
begin
declare @maxwth real
declare @date date
declare @accountNo int

select @accountNo = accountNo from inserted 
select @date = datee from inserted
select @maxwth = sum(amount) from transactions where datee = @date and type in ('Credit','credit') and accountNo = @accountNo

if @maxwth > 40000.0
begin 
	print 'Customer cannot withdraw more than 40,000 a day'
	rollback transaction
end
end

insert into transactions values(1001,70102007,'credit',50000,getDate()) 


--Exercise 5) Create a trigger to ensure that no employee has a salary greater than his/her own manager

select * from emp 
select * from dept 

create trigger empCheckMgr
on emp 
for insert, update
as 
begin

declare @eid real
declare @managerId real

select @eid = eid from inserted
select @managerId = managerId from dept
select @dept 

declare @salary real 
select @salary = emp.salary from emp, dept where emp.eid = dept.managerId and dept.managerId = @managerId

declare @eidSal real 
select @eidSal = salary from emp where eid = @eid

if @eidSal > @salary
	begin
		print 'Subordinates cannot earn more than Manager'
		rollback transaction
	end
end 




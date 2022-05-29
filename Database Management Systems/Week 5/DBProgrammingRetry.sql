--Creating a simple view structure 

select * from emp 
select * from dept 
select * from works 

-- create a view of the names of the managers 

create view managerInfo
as 
select d.managerid, e.ename, d.budget
from emp e, dept d
where e.eid = d.managerid

select * from managerInfo

drop view managerInfo

--update dept_info set budget = 95000 where did = 'Academic'

update managerInfo set budget = 960000 where managerid = 1002 --These changes will affect the real table too

--exercise 1) create a view called empInfo which contains eid, name, salary and total percentage of time 

create view empInfo 
as 
select e.eid, e.ename, e.salary, SUM(pct_time) as 'Total%'
from emp e,works w
where e.eid = w.eid 
group by e.eid, e.ename, e.salary

select * from empInfo

--Showing how while works :D 


--create table misc(
--enterid int primary key not null,
--enteremp varchar(20))

--declare @count int 
--set @count = 1

--while @count <= 10
--begin 
--	insert into misc values(@count, concat('Employee ',@count))
--	set @count = @count + 1;
--end

create table misc (
enterid int primary key not null,
enteremp varchar(20))

declare @count int  = 1;

while @count <=10
begin
	insert into misc values(@count, concat('Employee ',@count))
	set @count = @count +1;
end

select * from misc 

--eg Createa a function that returns the number of employees in a given department 

select * from emp
select * from works 
select * from dept

create function getEmpCount(@dept varchar(50)) returns int 
as 
begin

	declare @empCount int

	select @empCount = count(eid) from works where did = @dept

	return @empCount
end

declare @result int 
exec @result = getEmpCount 'Admin'

print concat('Total Employee Count = ',@result)

--Exercise 2 ) Create a function to return the total percentage of time a person works given the employee id 

create function totalPctTime(@eid int) returns real
as 
begin
	
	declare @totalPct real
	select @totalPct = sum(pct_time) from works where eid = @eid
	return @totalPct
end

declare @return real 
exec @return = totalPctTime 1000 

print concat('Total Percentage of Time worked: ',@return)


--PROCEDURES--

----can just be in the server without outputting a value 

--select * from emp

--create procedure increaseSalary(@pct float, @eid int)
--as 
--begin 
--	update emp 
--	set salary = salary + (salary * (@pct/100))
--	where eid = @eid
--end

--exec increaseSalary 10,1000
--select * from emp

--create a procedure to increase the salary of a specific employee by a specific percentage 

create procedure increaseSalary(@pct float, @eid int)
as 
begin 
	update emp 
	set salary = salary + (salary * (@pct/100)) where eid = @eid 

end 

exec increaseSalary 10,1000

select * from emp


-- Exec 2) producedures: Create a procedure that outputs statistics of salary(min,max) for a given department 

--create procedure getStats(@did varchar(12),@maxm real output, @minm real output) -- In procedures, return is a parameter that has output next to the argument
--as 
--begin

--	select @minm = min(e.salary), @maxm = max(e.salary)	--taken from the parameters 
--	from emp e, works w
--	where e.eid = w.eid and @did = w.did

--end 

--declare @max int, @min int
--exec getStats 'ITSD',@min output, @max output	--here the output parameters have been assigend the recently declared variables and later on printed 
--print concat('Min: ',@max)
--print concat('Max: ',@min)


select * from emp 
select * from works 
select * from dept 

create procedure getStats(@did varchar(12), @max real output, @min real output)
as 
begin 

	select @min = min(e.salary),@max = max(e.salary) 
	from emp e, works w 
	where e.eid = w.eid and w.did = @did

end


drop procedure getStats
declare @maxSalary real
declare @minSalary real

exec getStats 'Admin', @maxSalary output, @minSalary output

print concat('Max Salary = ',@maxSalary)
print concat('Min Salary = ',@minSalary)

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
 constraint accountNo_fk foreign key(accountNo,balance) references account(accountNo,balance))

 -- TRIGGERS FOR EXAMPLE 1

insert into account values(1010,14,'kandy',250000)
update account set balance = 350000 where accountno = 1000



----create a trigger to track all inserts/updates done to the balance field of an Account table at a bank in the accountaudit table

--create trigger addLogEntry		--what we are trying to do is, when the account table is updated, the foreign key constraints are captured and it automatically updates the accountLog
--on account --WE USE FOR - WHICH WILL UPDATE THE BASE TABLE TOO
--for insert, update
--as 
--begin

--declare @accountNo int
--declare @balance real 

--select @accountNo = accountNo, @balance = balance from inserted
--insert into accountlog(accountNo,balance,date) values(@accountNo,@balance,getdate())
--end					

----Upper trigger will dynamically update the AccountLog table 


select * from account
select * from accountLog

drop trigger addLogEntry2
drop trigger addLogEntry

create trigger addLogEntry
on account 
for insert, update 
as 
begin

declare @accountNo int
declare @balance real

select @accountNo = accountNo from inserted 
select @balance = balance from inserted

insert into accountlog values (@accountNo,@balance,getDate())
end 

--Example 2)  create a trigger to ensure that an employee doesn't work in more than 2 departments 

select * from emp
select * from dept 
select * from works 

create trigger empDeptCheck
on works 
for insert, update 
as 
begin

	declare @eid int	--We do this to pass this method to the conditional 
	select @eid = eid from inserted 
	declare @deptCount int 
	select @deptCount = count(w.did) from works w where w.eid = @eid

	if(@deptCount > 2)
	begin
		print 'One employee cannot work in more than 2 departments'
		rollback transaction
	end 
end 


insert into works values(1000,'Finance',20)	-- This will show an exception thrown 

--Lecturer Q ) create a trigger to ensure that an employee does not work more than 100% pct_time

create trigger workTime
on works 
for insert, update 
as 
begin
	
	declare @eid int 
	declare @totalTime int 

	select @eid = eid from inserted 
	select @totalTime = sum(pct_time) from works where eid = @eid

	if(@totalTime > 2)
	begin
		
		print 'Employee cannot work more than 100% of work time allotted'
		rollback transaction 
	end 
end 

update works set pct_time =60 where eid = 1000 and did='Admin'

-- Exercise 4) Assuming that the bank's maximum withdrawal limit per day is 40,000. Write a trigger to ensure that no customer withdraws more than the given limit 

create table Transactions(
tid int not null primary key,
accountNo int,
type varchar(20),
amount real,
datee date)


select * from account
select * from accountLog
select * from Transactions

insert into transactions values(1001,70102007,'credit', 49000,getDate())	--This will return an error 

create trigger maxWith
on transactions 
for insert, update 
as 
begin 
	declare @accountNo int
	declare @Withdraw real
	declare @type varchar(50)

	select @accountNo = accountNo from inserted 
	select @type = 'credit'
	select @Withdraw = sum(amount) from transactions where accountNo = @accountNo and type = @type

	if(@withdraw  > 40000)
	begin
		print 'Customer cannot withdraw more than 40,000 per day'
		rollback transaction
	end 
end 

drop trigger maxWith

--Exercise 5) Create a trigger to ensure that no employee has a salary greater than his/her own manager



select * from inserted

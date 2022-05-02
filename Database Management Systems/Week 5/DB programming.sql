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

-----------------UPDATE INFO-----------------

--When updating rows, aggregate rows(rows achieved from taking aggregate information) cannot be updated 
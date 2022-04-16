select * from dept
select * from emp 
select *  from works 

--12) 

select ename, salary 
from emp 
where salary > 50000
order by salary asc

--13) 

select ename 
from emp where ename like 'S%'

--14)

select * from dept

select d.did, e.ename
from dept d inner join emp e on d.managerid = e.eid 

--15) 
select  distinct e.ename, managerId
from emp e inner join dept d on d.managerId = e.eid
where salary > 75000

--16) 

select emp.eid, works.did
from emp inner join works on emp.eid = works.eid
where did is null

--17)


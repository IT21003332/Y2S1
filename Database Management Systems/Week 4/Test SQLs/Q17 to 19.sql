-- IN OPERATOR 

 select * from dept 
 select * from emp
 select * from works

 --Using IN Operator 

 select e.ename
 from emp e
 where e.eid in ( select eid
				from works
				where pct_time > 30)


--EXIST 
 
 --16 Display the names of employees who are not assigned to any department yet

select eid
from emp where eid NOT IN (select eid from works)

select e.ename from emp e where not exists(select * from works w where w.eid = e.eid)

select * from emp e left outer join works w on e.eid = w.eid where did is NULL   

--17 Display the names and the ages of each employee who works in either ITSD or Academic departments 

select emp.ename, emp.age
from emp, dept, works where emp.eid = works.eid AND works.did = dept.did AND dept.did in ('Academic','ITSD')

select distinct emp.ename, emp.age
from emp left outer join works on emp.eid = works.eid 
where works.did in ('Academic','ITSD')

--19 FOr all departments, display the name of the department and the names of the employees working in it

select  w.did, e.ename
from works w left outer join emp e on e.eid = w.eid 

select w.did, e.ename
from works w inner join emp e on e.eid = w.eid

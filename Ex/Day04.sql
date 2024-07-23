-- << 7/23 >> 
# JOIN 2

/* inner join 중 equi 
   테이블갯수 -1 , where절이 발생함 
*/

-- table 3개 join (데이터의 의미로 파악 후 연결해야함)
select	 e.first_name
		,d.department_name
        ,e.department_id
        ,d.department_id
from employees e, departments d , locations l
where e.employee_id = d.department_id
-- and d.department_id = l.location_id;
and d.location_id = l.location_id;

select	first_name as '이름'
from employees e inner join departments d
on e.department_id = d.department_id;

select	e.first_name
		,e.department_id
        ,d.department_name
from employees e inner join departments d
on e.department_id = d.department_id;


#  << left outer join >>
select	*
from employees e
left outer join departments d
on e.department_id = d.department_id;


#  << right outer join >>
select	*
from employees e
right outer join departments d
on e.department_id = d.department_id;


# 직원이 없는 부서번호도 출력 (department기준으로 join)
select	 e.first_name
		,e.department_id
        ,d.department_id
from employees e
right outer join departments d
on e.department_id = d.department_id;

# right join => left join으로 바꾸기 >> table위치 바꿔주면됨~~ 어떤 table이 기준이 되냐가 핵심

# (left outer join + right outer join) - 중복값  [union]
-- 두 커리의 culumn 갯수가 같아야함.

(
select	 e.employee_id
		,e.first_name
		,e.salary
        ,d.department_id
        ,e.department_id
		
from employees e
left outer join departments d
on e.department_id = d.department_id
)
union -- <두 커리문 이어주기>
(
select	 e.employee_id
		,e.first_name
		,e.salary
        ,d.department_id
        ,e.department_id
from employees e
right outer join departments d
on e.department_id = d.department_id
);

/*
join 연습문제~~
*/
-- eq
select	 e.employee_id as '직원아이디'
		,e.first_name as '이름'
        ,e.salary as '월급'
        ,e.department_id as '부서아이디'
        ,d.department_name as '부서명'
        ,l.location_id as '도시아이디'
        ,l.city as '도시명'
from employees e inner join departments d inner join locations l
where e.department_id = d.department_id
and d.location_id = l.location_id;

-- inner join

select	 e.employee_id as '직원아이디'
		,e.first_name as '이름'
        ,e.salary as '월급'
        ,e.department_id as '부서아이디'
        ,d.department_name as '부서명'
        ,l.location_id as '도시아이디'
        ,l.city as '도시명'
from employees e inner join departments d inner join locations l
on e.department_id = d.department_id
and d.location_id = l.location_id;


-- eq
select	 e.employee_id as '직원아이디'
		,e.first_name as '이름'
        ,e.salary as '월급'
        ,e.department_id as '부서아이디'
        ,d.department_name as '부서명'
        ,l.location_id as '도시아이디'
        ,l.city as '도시명'
        ,c.country_id as '나라아이디'
        ,c.country_name as '나라명'
from employees e inner join departments d inner join locations l inner join countries c
where e.department_id = d.department_id
and d.location_id = l.location_id
and l.country_id = c.country_id
order by e.employee_id asc;


-- inner
select	e.employee_id as '직원아이디'
		,e.first_name as '이름'
        ,e.salary as '월급'
        ,e.department_id as '부서아이디'
        ,d.department_name as '부서명'
        ,l.location_id as '도시아이디'
        ,l.city as '도시명'
        ,c.country_id as '나라아이디'
        ,c.country_name as '나라명'
from employees e inner join departments d inner join locations l inner join countries c
on e.department_id = d.department_id
and d.location_id = l.location_id
and l.country_id = c.country_id;

select	*
from employees e, employees m ;
/*
직원 아이디 이름 이메일 매니저아이디 매니저이름 매니저이메일 매니저전화번호
*/
select	e.employee_id as '직원아이디'
		,e.first_name as '이름'
        ,e.email as '이메일'
        ,m.first_name as '매니저이름'
        ,m.email as '매니저이메일'
        ,m.phone_number as '매니저전화번호'
from employees e , employees m
where e.manager_id = m.employee_id;


-- inner join  outer join
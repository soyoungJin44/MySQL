-- <<7/22 월>  그룹함수

select * from employees;

select	first_name as '이름'
		,salary as '월급'
from employees;

select	first_name
		,avg(salary)
from employees;

select	avg(salary)
from employees;

-- count : 1개의 culumn에 몇개의 row가 있는지 // null값 제외됨 
select	count(*)
from employees;

select	count(commission_pct)
from employees;

select	count(first_name)
from employees;

select	count(manager_id)
from employees;

select	count(salary)
from employees
where salary > 16000;

# <sum>  전체직원합계
select	count(first_name) * sum(salary)
from employees;

-- 합계로 값1개 , hire_date 는 각자의 값 가지고있음. 오류
select	sum(salary), hire_date
from employees;

select	sum(employee_id)
from employees;

select	employee_id
from employees;

# avg() : 평균값 구하깅 // null값으로 또는 0으로 변환(ifnull)
select	count(*) as '전체 직원수'
		,sum(salary) as '월급의 합계'
        ,avg(salary) as '월급의 평균값'
        ,avg(ifnull(salary,0))
from employees;
-- salary에는 null값이 없어서 ifnull 써서 0으로 변환시켜줘도 출력값자체에는 변동 없는거임.

# max / min : 최대값, 최소값
select	count(*)
from employees;

select	max(salary) as '월급'
from employees;

select	min(hire_date) 
from employees;

-- << group by 절 >> 
-- 부서별 합계
select * 
from employees;

-- 그룹별 월급의 합계
select	sum(salary) as '월급 합계'
		,department_id	as '부서아이디'
        ,avg(salary) as '월급의 평균'
from employees
group by department_id
order by department_id asc;

select	department_id as '부서번호'
		,sum(salary) as '월급의 합'
		,avg(salary) as '월급의 평균'
from employees
group by department_id , job_id
order by department_id asc;

-- where절은 시스템 돌아가는 구조상 불가능. << having절 >> 사용
-- having 절에는 그룹함수 또는 group by절에 참여한 culumn만 사용가능하다. 

-- [ 부서월급의 합계가 20000 이상인 부서의 부서번호,인원수,월급합계 출력 ]
select	department_id as '부서번호'
		,count(*) as '인원수'
        ,sum(salary) as '월급의 합계'
from employees
-- where sum(salary) >= 20000
group by department_id
having sum(salary) >= 20000
and department_id between 30 and 100
and count(*) > 10
order by department_id asc;

# << if else 문 >> 
-- commission 값이 null이면 0 아니면 1    //ifnull 이랑 구분. 
select	first_name as '이름'
		,salary as '월급'
        ,ifnull(commission_pct,0) as '수당2' -- : 수당 / 0으로 표현
		,if(commission_pct is null,0,1) as '수당' -- : 0 / 1 으로 표현
        ,if(commission_pct is null,0,commission_pct)
from employees
order by commission_pct asc;

/*<< 	case when 조건 then 출력1 >>>
			when 조건 출력2
            else 출력3
*/
-- 직원 아이디, 월급, 업무아이디, 실제월급 출력
select 	job_id as '직원 아이디'
		,salary as '월급'
		,department_id as '업무아이디'
		,case when job_id = 'AC_ACCOUNT' then (salary+salary*0.1)
			  when job_id = 'SA_REP' then (salary + salary*0.2)
			  when job_id = 'ST_CLERK' then (salary + salary*0.3)
			  else salary end as '실제월급'
from employees;

select * from employees;

# ** case문 문제 풀이 **
select	first_name as '직원이름'
		,department_id as '부서번호'
		,case when department_id between 10 and 50 then 'A-TEAM'
			  when department_id between 60 and 100 then 'B-TEAM'
              when department_id between 110 and 150 then 'C-TEAM'
              else '팀없음' end as '팀'
from employees
order by 팀 asc;

----------- << join >> 

# 이름 / 월급 / 부서명

select count(*) from employees;    -- 107
select count(*) from departments;  -- 27

# >> 모든 row 들끼리 연결됨 (107 * 27)
select	first_name as '이름'
		,salary	as '월급'
        ,department_name as '부서명'
from employees, departments;

-- 갯수 확인하기. 하나당 하나씩 연결 우리가 원하던 모습의 데이터
select	count(*)
from employees, departments
 where employees.department_id = departments.department_id;
 
 
 select	first_name as 'employees 테이블'
        ,location_id as 'departments 테이블'
        ,employees.department_id as 'employees 테이블에 있는 department_id'
        ,departments.department_id as 'departments 테이블에 있는 department_id'
 from employees as 'e', departments as 'd'
 where e.department_id = departments.department_id
 and salary >2000;
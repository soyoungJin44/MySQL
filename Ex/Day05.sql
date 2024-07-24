# << 7/24 >> subQuery

-- 'Den' 보다 월급이 많은 사람의 이름과 월급은?

select	first_name '이름'
		,salary '월급'
from employees
where first_name = 'den';

select	*
from employees
where salary > 11000;

-- ()로 묶어주기
-- 두개의 질문을 한개로 합쳐주기

select	*
from employees
where  salary >= (select  salary '월급'
				  from employees
				  where first_name = 'den');
                          
# 월급을 가장 적게 받는 사람의 이름, 월급, 사원번호는?

select	 first_name '이름'
		,salary '월급'
        ,employee_id '사원번호'
from employees
where salary = (select min(salary)
				from employees);
                
#평균 월급보다 적게 받는 사람의 이름, 월급을 출력하세요?

select	 first_name '이름'
		,salary '월급'
from employees
where salary <= (select avg(salary)
				from employees)
order by salary asc;

-- 평균월급 체크용
select	avg(salary)
from employees;

# 부서번호가 110인 직원의 월급과 같은 월급을 받는 모든 직원의 사번, 이름, 월급을 출력하세요
-- 부서번호가 110사람의 월급이 2개, 2다 따로 구해줘야 하는경우이기때문에 in()으로 묶어서 ㄱ

-- 부서번호가 110인 사람의 월급만 알고싶기때문에
select	salary	'월급'
from employees
where department_id = 110;
-- 12008.00 , 8300.00

-- 내가 알고자하는값
select	first_name '이름'
		,salary '월급'
from employees
where salary in('12008.00','8300.00');

-- 결과.
select	first_name '이름'
		,salary '월급'
from employees
where salary in (select	salary	'월급'
			     from employees
				 where department_id = 110)
order by salary asc;

# 각 부서별로 최고급여를 받는 사원의 이름과 월급을 출력하세요

-- 부서 확인용
select	department_id '부서아이디'
from employees;

select	max(salary)
from employees
group by department_id;

-- 결과
select	department_id '부서번호'
		,first_name '이름'
		,salary '월급'
from employees
where (department_id,salary) in (select	department_id,max(salary)
						 from employees
						 group by department_id)
order by department_id asc;

# 부서번호가 110인 사람중 월급중 가장작은 월급보다 월급이 많은 모든직원의 이름,급여   << or연산 사용 >>

-- 부서번호 110인사람 월급 : 12008.00 , 8300.00
select	*
from employees
where department_id = 110;

select	first_name '이름'
		,salary '급여'
from employees
where salary >any (select salary
				   from employees
				   where department_id = 110);

select	first_name '이름'
		,salary '급여'
from employees
where salary >all (select salary
				   from employees
				   where department_id = 110);

# 각 부서별로 최고월급을 받는 사원의 부서번호, 직원번호, 이름, 월급 출력

select	*
from employees;

-- 최고월급  : 24000.00
select	max(salary)
from employees
group by department_id;

select	department_id '부서번호'
		,employee_id '직원번호'
        ,first_name '이름'
        ,salary '월급'
from employees
where (department_id,salary) in (select	department_id,max(salary)
								 from employees
								 group by department_id)
order by department_id asc;
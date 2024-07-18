-- :한줄 주석
/*
여러줄 주석  < select문 (조회기능) >
*/
-- select ~ from 절  : from 위에 table 에서
-- 테이블 전체 조회하기

select * from employees;	-- 전체보기: * 
select * from job_history;  
select * from departments;

select first_name from employees;

select first_name,phone_number,hire_date,salary from employees;
-- 모든 직원들의 이름, 성, 월급, 전화번호, 이메일, 입사일 출력  // colunm은 한줄에 1개씩으로 정리 // 짠 순서대로 출력
select 	first_name
		,last_name
		,salary
        ,phone_number
        ,email
        ,hire_date
from employees;

-- *culunm명에 별명 사용하기 : as 별명
select 	first_name as 이름
		,last_name as 성
from employees;

select 	first_name as 이름 -- as생략 가능
		,phone_number as '전화 ~ 번호'
        ,hire_date 입사일
        ,salary as '월 급'
from employees; 

/*
직원아이디, 이름, 월급을 출력하세요.
단 직원아이디는 empNO, 이름은 "f-name", 월급은 "월 급" 으로 컬럼명을 출력하세요
select employee_id as empNO, first_name 'f-name', salary '월 급'
from employees;
*/
select 	employee_id as empNo
		,first_name as '"f=name"'
        ,salary as '"월 급"'
from employees;

select	first_name as 이름
		,phone_number as 전화번호
        ,hire_date as 입사일
        ,salary as 월급
from employees;

select 	employee_id as '사 번'
		,first_name as 이름
        ,last_name as 성
        ,salary as 월급   
        ,phone_number as 전화번호
        ,email as 이메일
        ,hire_date as 입사일
from employees;

-- 사칙연산자
select	salary as 월급
		,(salary-100) as "월급 - 식대"
		,salary*12 as '연봉'
        ,salary*12+5000 as '연봉+보너스'
        ,salary/30 as '일급'
        ,employee_id%3 as '나머지값'
from employees;

-- 문자열에 사칙연산이 들어가면 값이 전부 0으로 출력됨.
select 	job_id*12
from employees;

-- culumn 2개를 한줄로 표현되게출력 << concatenation
select 	first_name ,last_name
		,concat(first_name, last_name)
        ,concat(first_name, last_name) as 'Name'
        ,concat(first_name, ' ', last_name) as '공백이름'
        ,concat(first_name, ' ', last_name, '입사일은',hire_date, '입니다') as 이름2 
from employees;

select 	concat(first_name, '-', last_name) as '성명'
		,salary as '월급'
        ,(salary*12) as '연봉'
        ,(salary*12+5000) as '보너스'
        ,phone_number as '번화번호'
from employees;

select 	first_name
		,salary
        ,'(주)개발자' as company
        ,3
        ,now() as '시간'
from employees;

-- now() 한개만 출력하고싶어도 [select~from 테이블] 자체가 문법이기때문에 테이블부분에 오라클:dual // **!!우리 쓰는건 생략가능
select now() as '실행일자';


select	first_name as '이름'
        ,department_id as '부서ID'
        ,salary as '월급'
from employees
where department_id = 10;

select 	first_name as '이름'
		,salary as '월급'
from employees
where salary >= 15000;

select	first_name as '이름'
		,hire_date as '입사일'
from employees
where hire_date >= '2007-01-01';

select	first_name as '이름'
		,salary as '월급'
from employees
where first_name = binary'Lex';

select	first_name as '이름'
		,salary as '월급'
from employees
where salary >= 14000
and salary <= 17000; 

select	first_name as '이름'
		,salary as '월급'
from employees
where salary between 14000 and 17000;

-- 입사일이 04/01/01 ~ 05/12/31 사이에 있는 사람,월급,입사시기 
select	first_name as '이름'
		,salary as '월급'
        ,hire_date as '입사일'
from employees
where hire_date between '2004/01/01' and '2005/12/31';

-- where in절 빌드업
select	first_name as '이름'
		,salary as '월급'
from employees
where 	salary = 2100 or
		salary = 3100 or
        salary = 1400 or
        salary = 5100;

select	first_name as '이름'
		,salary as '월급'
from employees
where salary in(2100,3100,4100,5100);

select	first_name as '이름'
		,last_name as '성'
        ,salary as '월급'
from employees
where first_name in('neena', 'lex', 'john');

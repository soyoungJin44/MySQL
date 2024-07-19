-- < 7/19 금>
/*
복습
1. 기본구조 : select from 문 : select절 from문  //  가로줄 row(행)  세로줄 culumn(열)  
2. select now() from dual;
3. as : 별명
4. concat : culumn 이어주기(합치기)
5. where문 : in(or), betweem and  >> 조건이 여러개일때
6. binary : 대소문자 구분
7. 비교연산자
*/

select	first_name
		,salary
from employees
where first_name ='lex';

select	first_name
		,salary
from employees 
where first_name like 'l%';

select	first_name
		,salary
from employees
where first_name like ('%L%'); -- L이포함한 모든글자

-- <이름에 am을 포함한 모든사람>
select 	first_name as '이름'
		,salary as '월급'
from employees
where first_name like ('%am%');

-- <이름의 두번째가 a인사람>
select	first_name as '이름'
		,salary as '월급'
from employees
where first_name like ('_a%');

-- <이름에 4번째가 a인사람>
select	first_name as '이름'
		,salary as '월급'
from employees
where first_name like ('___a%');

-- <4글자의 이름을 가진 사람중에서 3번째가 a인사람
select	first_name as '이름'
		,salary as '월급'
from employees
where first_name like ('__a_');

select	first_name as '이름'
		,salary as '월급'
from employees
where salary between 13000 and 15000;

-- null값은 0이 아니기때문에 +수식도 적용되지않는다.
select	first_name as '이름'
		,salary as '월급'
        ,salary * commission_pct +200 as '수당'
from employees
where salary between 13000 and 15000;

select	first_name as '이름'
		,salary as '월급'
        ,commission_pct as '수당비율'
        ,salary * commission_pct as '수당'
from employees 
where commission_pct is not null;

-- 커미션 있는 사람들
select	first_name as '이름'
		,salary as ',월급'
        ,commission_pct as '커미션 비율'
from employees
where commission_pct is not null;

-- 담당 매니저가 없고, 커미션비율이 있는 사람들만 출력
select	first_name as '이름'
		,commission_pct as '커미션비율'
        ,manager_id as '매니저ID'
from employees
where	 manager_id is null
		and commission_pct is null;
       
-- 부서가 없는 직원들 월급,이름
select	first_name as '이름'
		,salary as '월급'
        ,department_id as '부서'
from employees
where department_id is null;


-- 정렬 : order by절 // 내림차순: desc  오름차순: asc  //정렬조건이 복수일때에는 , 로 ㄱ
select	first_name as '이름'
		,salary as '월급'
from employees
order by salary desc;

select	first_name as '이름'
		,salary as '월급'
from employees
order by salary asc;

select	first_name as '이름'
		,salary as '월급'
from employees
where salary >= 9000
order by salary desc;

select	first_name as '이름'
		,salary as '월급'
        ,department_id as '부서번호'
from employees
order by department_id desc;

select	first_name as '이름'
		,salary as '월급'
from employees
where salary >=10000
order by salary desc;

select	first_name as '이름'
		,department_id as '부서번호'
        ,salary as '월급'
from employees
order by department_id asc
		,salary desc;
        
select	first_name as '이름'
		,salary as '월급'
		,hire_date as '입사일'
from employees
order by first_name asc;

select	first_name as '이름'
		,salary as '월급'
        ,hire_date as '입사일'
from employees
order by hire_date asc;

-- <순서> 1. where절 조건확인  2. 임시결과생성 후 select절  3. order by절 
select	first_name f
		,salary s
from employees
order by f desc;

/*
******단일행 함수*****
*/
-- 단일행 함수 > 숫자함수

-- ronud() : 반올림      //(a,b) :: a의 소수점 b까지 반올림해서 출력해줭
select	round(123.123 , 1)
		,round(127.126 , -1)
        ,round(123.456,2)
from dual;

-- 소수점 기준 올림
select	ceil(123.44)
;
-- 소수점 기준 내림
select floor(1354.658)
;

select	truncate(136.65 , 2)
from dual;

-- 제곱근
select	sqrt(100)
from dual;

-- 숫자가 양수면 1, 음수 -1 , 0=0
select	sign(-1)
from dual;

-- 절대값으로 표현
select	abs(--546)
from dual;

-- 괄호안의 값들 중 가장큰값
select	greatest(32,54,32,3534,34,35) as '양수'
		,greatest(1.2,2.3,6.7) as '실수'
from dual;

select concat('안녕','하세요');
select concat('안녕','-','하세요');
select concat(first_name , ' ', last_name) as '합'
from employees;

-- 문자열 사이에 구분하ㅣㄱ
select concat_ws('*','abc','123','가나다');
select concat_ws('//////',first_name,last_name)
from employees;

-- 대문자>>
select	first_name as '이름'
		,lcase(first_name)  
        ,lower(first_name)
        ,lower('asg@!')
        ,lower('가나다')
from employees;

-- 소문자 >> 대문자
select	first_name,
		ucase(first_name),
        upper(first_name),
		upper('ABCabc!#$%'),
		upper('가나다')
from employees;

-- 문자열을 바이트로 표현해줌
select	first_name,
		length(first_name),
		char_length(first_name)
from employees;

-- 해당 calumn 에서 a~b까지만 보여줘 (a는 1 , -1가능)
select	first_name as '이름'
		,substr(first_name,1,5)
        ,substr(first_name,2,6)
        ,substr(first_name,-2,3)
        ,salary as '월급'
from employees
where salary > 6000;

select	substr('980211-2345355',3,2)
from employees;

select	first_name as '이름'
		,lpad(first_name , 10, '*' )
from employees;

select	concat('|','     안녕하세요     ','|')
		,concat('|', trim('     안녕하세요     '),'|')
        ,concat('|', ltrim('     안녕하세요     '),'|')
        ,concat('|', rtrim('     안녕하세요     '),'|')
        ,trim(concat('|',('     안녕하세요     '),'|'))
from dual;

-- 해당 알파벳 바꿔줘
select	first_name as '이름'
		,replace(first_name,'a','*')
        ,substr(first_name,2,3)
        ,replace(first_name,substr(first_name,2,3),'***')
from employees;

select curdate() from dual;
select curtime() from dual;
select current_timestamp(), now() from dual;

-- datediff / timediff
select datediff('2021-06-21','2023-06-21')
from dual;

select	first_name
		,hire_date
        ,floor(datediff(now(),hire_date)/365) as 'workyear'
from employees
order by workyear desc;

-- <<<변환 함수>>
-- 날짜(숫자) => 문자열 로 변경 [표참조 쓰다보면 외워질듯]
select 	now()
		,date_format(now(),'%y-%m-  %d')
from dual;

select 	now()
		,date_format(now(), '%Y- %M - %D')
from dual;

-- 숫자 >> 문자열로 변환
select	first_name as '이름'
		,salary
        ,format(salary,2)
from employees;

-- commission값이 null일때 0으로 변환해서 보내줌  // null일때 사칙연산이 안됨. 
select	first_name as '이름'
		,salary as '월급'
		,commission_pct
        ,(salary * ifnull(commission_pct, 0) +500) as '보너스'
     -- ,ifnull(commission_pct, 0)
from employees;

select max(salary)
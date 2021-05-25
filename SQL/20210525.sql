CREATE table member(
num INT PRIMARY KEY,
NAME VARCHAR(50),
addr VARCHAR(50)
);

DESC member;

INSERT INTO member(num,NAME,addr) VALUES(1,'뚱이','비키니시티');
INSERT INTO member(num,NAME) VALUES(2, '징징이');
INSERT INTO member VALUES(3,'다람이','텍사스');  # 이방법으로 쓰지 말것

SELECT num, name
FROM member

SELECT * FROM member; # *는 잘쓰지않는게 좋음 (데이터 불러오는데 부담) 

DELETE FROM member
WHERE num = 2

UPDATE member
SET addr = '미국'
WHERE num = 3;

select *
FROM emp;

SELECT *
FROM dept;

#emp 테이블에서 사원번호, 사원이름, 직업을 출력.
SELECT empno, ename, job
FROM emp;

#emp 테이블에서 사원번호,급여,부서번호를 출력하세요. 단, 급여가 많은 순서대로 출력

SELECT empno, sal, deptno
FROM emp
ORDER BY sal DESC;

#emp 테이블 에서 사원번호,급여,입사일을 출력. 단,급여가 적은 순서대로.

SELECT empno, sal, hiredate
FROM emp
ORDER BY sal ASC;

# emp 테이블에서 직업,급여를 출력. 단,직업명으로 오름차순, 급여로 내림차순 정렬해서
SELECT job, sal
FROM emp
ORDER BY job ASC, sal DESC;

SELECT empno 사원번호, ename "사원이름"
FROM emp;

SELECT *
FROM emp;

#emp 테이블에서 부서번호가 10 번인 사원들의 급여와 10% 인상된 금액 같이 출력
SELECT  sal, sal *1.1
FROM emp
WHERE deptno = 10
ORDER BY sal DESC;

#emp 테이블에서 급여가 3000 이상인 사원들의 모든 정보를 출력.
SELECT *
FROM emp 
WHERE sal >= 3000
ORDER BY sal DESC;

#emp 테이블에서 부서번호가 30번이 아닌 사람들의 이름과 부서번호를 출력.
SELECT ename, deptno FROM emp
WHERE deptno <> 30

ORDER BY sal DESC;

#emp 테이블에서 부서번호가 10번이고 급여가 3000 이상인 사원들의 이름과 급여를 출력.
SELECT ename, sal FROM emp
WHERE deptno = 10 and sal >= 3000
ORDER BY sal DESC;

#emp 테이블에서 직업이 SALESMAN 이거나 MANAGER 인 사원의 사원번호와 부서번호를 출력.
SELECT ename, deptno FROM emp
WHERE job != "CLERK" and job != "ANALYST" AND JOB != "PRESIDENT" ; #or 대신 나머지를 and로 묶는게 SCAN속도 빠름 

#부서번호가 10번이거나 20번인 사원의 사원번호와 이름, 부서번호 출력. but in 연산자도 or만큼이나 느리니까 지양할것 
SELECT empno, ename, deptno 
FROM emp
WHERE deptno IN (10,20);
# 윗줄 뜻 :  WHERE deptno = 10 OR deptno = 20;



#급여가 1000 과 2000 사이인 사원들의 사원번호,이름,급여를 출력.
SELECT empno, ename, sal 
FROM emp 
WHERE sal BETWEEN 1000 AND 2000;
# 윗줄 뜻 : WHERE sal >= 1000 AND sal <=2000;
SELECT empno, ename 
FROM emp 
WHERE ename BETWEEN 'FORD' AND 'SCOTT' ; #이름도 가능 

#사원이름이 'J' 로 시작하는 사원의 사원이름과 부서번호를 출력. <<<중요>>>
SELECT ename, deptno
FROM emp
WHERE ename LIKE 'J%';

SELECT ename, deptno
FROM emp
WHERE ename LIKE '%LA%'; #앞뒤로 

#사원이름의 두번째 글자가 'A' 인 사원의 이름,급여,입사일을 출력.
SELECT sal, hiredate
FROM emp
WHERE ename LIKE '_A%';

#입사년도가 81년 인 사원들의 입사일과 사원번호를 출력.
SELECT hiredate, empno
FROM emp
WHERE hiredate LIKE '1981%';

#커미션이 NULL 인 사원의 사원이름과 커미션을 출력.
SELECT ename , comm
FROM emp 
WHERE comm IS NULL ; # 애초에 null값을 집어넣지를 말자구요 

# CONCAT(칼럼명, '붙일문자') =>문자열 연결함수 
SELECT CONCAT(ename,'님') name
FROM emp;

SELECT LOWER(ename) NAME
FROM emp; 

# LPAD( '문자열' , 전체 자리수 , '남는자리를 채울 문자') =>왼쪽에 체운다.
SELECT empno, LPAD(empno, 10, '0')
FROM emp;

SELECT LENGTH('구거'); #한글이 삼바이트                         

SELECT ename, LEFT(ename,3), RIGHT(ename,3), SUBSTRING(ename,2,2)
FROM emp;

SELECT FORMAT(21345.253456,1);

#NVL(칼럼명 , 값 ) : 해당 칼럼이 NULL 인경우 정해진 값을 반환한다.
SELECT ename, comm, nvl(comm,0)
FROM emp;

SELECT SUM(comm) / COUNT(*) avg, AVG(nvl(comm,0))
FROM emp; #null값 조심 진짜 절대로 지양할것 

SELECT ABS(-230), MOD(11,3);

SELECT "Hello world!" world;

select CURDATE(), CURTIME(), NOW();

insert INTO member(num, NAME, addr) VALUE(4,'집게사장', '집게리아');

SELECT ADDDATE(NOW(), interval 12 DAY);#12일 후
SELECT SUBDATE(NOW(), interval 12 DAY);#12일 전  
SELECT DATEDIFF('2018-01-01','2020-01-5');

SELECT hiredate, DATE_FORMAT(hiredate, '%y/%m/%d %h:%i:%s')
FROM emp;

SELECT CONVERT('1234',SIGNED);# string -> int 뭐이런거 말하는듯 

SELECT empno, ename
FROM emp
WHERE empno = '7566';

SELECT STR_TO_DATE('2021-05-25', '%y-%m-%d');

DESC emp;

update emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES(9000, 'PATRICK', 'SALESMAN', 7698, '2000-5-05', 1500, 900, 10);

SELECT *
FROM emp
WHERE ename  = 'PATRICK';

# *대신 쓰는 전체 카운트 방법 
SELECT COUNT(empno) 
FROM emp;	

# 진짜 평균 잘내는 법 
SELECT sum(sal)/count(empno) REAL_sal,sum(comm)/count(empno) real_comm,  AVG(sal), AVG(comm)
FROM emp;

SELECT deptno, sum(sal)
FROM emp
GROUP BY deptno
ORDER BY deptno;

#emp 테이블에서 부서번호와 부서별 평균 급여를 출력.
SELECT deptno, sum(sal)/count(empno)
FROM emp
GROUP BY deptno
ORDER BY deptno;

#emp 테이블에서 부서번호와 부서별 평균 급여를 출력. (반올림해서 소수 첫째 자리 까지만)
SELECT deptno, round(sum(sal)/count(empno),1)
FROM emp
GROUP BY deptno
ORDER BY deptno;

#emp 테이블에서 직업과 직업별 최대 급여를 출력.
SELECT job, MAX(sal)
FROM emp
GROUP BY job
ORDER BY sum(sal)/count(empno) desc;

















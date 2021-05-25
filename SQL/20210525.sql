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
WHERE num = 3

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
ORDER BY jab ASC, sal DESC;




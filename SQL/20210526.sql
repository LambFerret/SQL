SELECT ename, sal
FROM emp;


#emp 테이블에서 부서번호와 급여가 1000 이상인 사원들의 
#부서별 평균 급여의 반올림 값을 부서번호로 내림차순 정렬해서 출력.
SELECT deptno, round(AVG(sal),1)
FROM emp
WHERE sal>=1000
group BY deptno
ORDER BY deptno DESC;


SELECT deptno, ROUND(AVG(sal)) salAVG
FROM emp
WHERE sal>=2000
GROUP BY deptno
ORDER BY salAVG DESC;

#emp 테이블에서 각 부서별 같은 업무(job)를 하는 사람의 인원수를 구해서 
#부서번호, 업무(job), 인원 수를 부서번호에 대해서 오름차순 정렬해서 출력

SELECT deptno, job, COUNT(ename)
FROM emp

GROUP BY deptno, job
ORDER BY deptno ASC;

#emp 테이블에서 부서번호와 급여가 1000 이상인 사원들의 부서별 평균 급여를 출력.
# 단, 부서별 평균 급여가 2000 이상인 부서만 출력하세요.
SELECT AVG(sal) salavg
FROM emp
WHERE sal>= 1000
GROUP BY deptno
HAVING salavg<= 3000;

#limit
SELECT empno, ename
FROM emp
ORDER BY empno DESC
LIMIT 15,10;

DESC member;
INSERT INTO member(num, NAME, addr) VALUES (10, '플랑크톤', '비키니시티');
SELECT *
FROM member;

UPDATE member
SET NAME = '퐁퐁부인', addr = '면허시험장'
WHERE num=11

























 
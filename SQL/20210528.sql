SELECT empno, ename, job, nvl(mgr,9999) mgr, 
DATE_FORMAT(hiredate, '%y/%m/%d'), sal , nvl(comm,0) comm,deptno
FROM emp
order BY hiredate DESC
LIMIT 0, 5;

#join순서 중요 primary key를 포함한 b가 있어야하고 이는 다음 공식대로 join
SELECT ename, a.deptno, dname
FROM emp a, dept b
WHERE b.DEPTNO = a.deptno;

#급여가 3000 에서 5000 사이의 사원이름과 부서명을 출력.
SELECT ename, dname, sal
FROM emp a, dept b 
WHERE b.deptno = a.deptno AND sal BETWEEN 3000 AND 5000;

#부서명이 'ACCOUNTNG' 인 사원의 이름, 입사일, 부서번호, 부서명을 출력.
SELECT ename, hiredate, a.deptno, dname
FROM emp a, dept b
WHERE b.deptno = a.deptno AND dname = 'ACCOUNTING';

#- 커미션이 null 이 아닌 사원의 이름, 입사일, 부서명을 출력.
SELECT ename, hiredate, dname
FROM emp a , dept b
WHERE b.deptno= a.deptno AND comm IS NOT NULL;

#	left join
SELECT e.empno, d.deptno, d.dname 
FROM emp e left JOIN dept d 
ON e.deptno = d.deptno ;

# emp 테이블과 dept 테이블을 조인하여 부서번호, 부서명, 이름, 급여를 출력
SELECT d.deptno, d.dname, ename, sal
FROM emp e , dept d
WHERE d.deptno = e.deptno;

# 사원의 이름이 'ALLEN' 인 사원의 이름과 부서명을 출력.
SELECT d.dname, ename
FROM emp e join dept d 
where d.deptno = e.deptno AND ename = 'ALLEN';

# 모든 사원의 이름, 부서번호, 부서명, 급여를 출력.단, emp 테이블에 없는 부서도 출력해보세요.
SELECT ename, d.deptno, count(empno), dname, sal 
FROM emp e right join dept d
on d.deptno = e.deptno;

SELECT d.deptno, dname, count(empno)
FROM emp e right join dept d
on d.deptno = e.deptno 
GROUP BY dname
ORDER BY deptno ASC;

#사원의 이름과 급여, 급여의 등급을 출력.
SELECT ename, sal, grade
FROM emp e join salgrade s
on sal BETWEEN s.LOSAL AND s.HISAL;

SELECT *
FROM salgrade;

#사원의 이름과, 부서명, 급여의 등급을 출력.
SELECT ename, dname, grade
FROM emp e, salgrade s , dept d
WHERE d.deptno = e.deptno AND sal BETWEEN s.losal AND s.HISAL;

#단일행 sub query
SELECT dname 
FROM dept 
WHERE deptno = 
	(SELECT deptno FROM emp WHERE ename='SMITH');

#'ALLEN' 과 동일한 직책(job) 을 가진 사원의 사번과 이름, 직책을 출력.
SELECT empno, ename, job
FROM emp
WHERE job = (SELECT job FROM emp WHERE ename = 'ALLEN');

#'ALLEN' 의 급여와 동일하거나 더 많이 받는 사원의 이름과 급여를 출력.
SELECT ename, sal 
FROM emp 
WHERE sal >= (SELECT sal FROM emp WHERE ename = 'ALLEN');

# 'DALLAS' 에서 근무하는 사원의 이름, 부서번호를 출력.
SELECT ename, deptno 
FROM emp 
WHERE deptno = (SELECT deptno FROM dept WHERE loc = 'DALLAS');

# 'SALES' 부서에서 근무하는 모든 사원의 이름과 급여를 출력.
SELECT ename, sal
FROM emp 
WHERE deptno = (SELECT deptno FROM dept WHERE dname = 'SALES');

# 자신의 직속 상관이 'KING' 인 사원의 이름과 급여를 출력 
SELECT ename, sal
FROM emp 
WHERE mgr = (SELECT empno FROM emp WHERE ename = 'KING')

#급여를 3000 이상받는 사원이 소속된 부서와 
#동일한 부서에서 근무하는 사원들의 이름과 급여, 부서번호를 출력.
#다중 쿼리 
SELECT ename,sal,deptno FROM emp WHERE deptno IN(SELECT deptno FROM emp WHERE sal>=3000);










 
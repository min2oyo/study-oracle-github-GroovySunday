-- 테이블 설명
DESC EMP;

DESC DEPT;

DESC SALGRADE;

------ 04. SELECT문의 기본 형식

---- 04-3. SELECTT, FROM

-- 기본 형식
-- SELECT [조회할 열1 이름], [열2 이름], ..., [열N 이름]
-- FROM [조회할 테이블 이름];

-- 전체 열 조회
SELECT
	*
FROM
	EMP;

-- 부분 열 조회
SELECT
	EMPNO,
	ENAME,
	DEPTNO
FROM
	EMP;

---- 04-4. DISTINCT	// 중복 제거

-- 열이 한 개인 경우
SELECT
	DISTINCT DEPTNO
FROM
	EMP;

-- 열이 여러 개인 경우
SELECT
	DISTINCT JOB,
	DEPTNO
FROM
	EMP;

-- 중복되는 열 제거 없이 그대로 출력	// 기본값
SELECT
	ALL JOB,
	DEPTNO
FROM
	EMP;

---- 04-5. alias	// 별칭

-- 연산 및 가공된 문장 이후 한 칸 띄우고 별칭 지정
SELECT
	ENAME,
	SAL,
	SAL * 12 + COMM ANNSAL,
	COMM
FROM
	EMP;

-- 연산 및 가공된 문장 이후 한 칸 띄우고 별칭을 큰 따옴표로 묶어 지정
SELECT
	ENAME,
	SAL,
	SAL * 12 + COMM "ANNSAL",
	COMM
FROM
	EMP;

-- 연산 및 가공된 문장 이후 한 칸 띄운 후 'AS', 한 칸 뒤에 별칭 지정	// 권장
SELECT
	ENAME,
	SAL,
	SAL * 12 + COMM AS ANNSAL,
	COMM
FROM
	EMP;

-- 연산 및 가공된 문장 이후 한 칸 띄운 후 'AS', 한 칸 뒤에 별칭을 큰따옴표로 묶어 지정
SELECT
	ENAME,
	SAL,
	SAL * 12 + COMM AS "ANNSAL",
	COMM
FROM
	EMP;

---- 04-6. ORDER BY	// 정렬

-- 기본 형식
-- SELECT [조회할 열1 이름], [열2 이름], ..., [열N 이름]
-- FROM [조회할 테이블 이름]
-- ORDER BY [정렬하려는 열 이름(여러 열 지정 가능)] [정렬 옵션];

-- 오름차순 (asc, ascending)	// 기본값
SELECT
	*
FROM
	EMP
ORDER BY
	SAL;

-- 내림차순 (desc, descending)
SELECT
	*
FROM
	EMP
ORDER BY
	SAL DESC;

-- 동시에 사용
SELECT
	*
FROM
	EMP
ORDER BY
	DEPTNO ASC,
	SAL DESC;
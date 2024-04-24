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

------ 05. WHERE절과 연산자

---- 05-1. WHERE

-- 기본 형식
-- SELECT [조회할 열1 이름], [열2 이름], ..., [열N 이름]
-- FROM [조회할 테이블 이름]
-- WHERE [조회할 행을 선별하기 위한 조건식];

-- 예제
SELECT
	*
FROM
	EMP
WHERE
	DEPTNO = 30;

---- 05-2. AND, OR 연산자

-- AND 연산자
SELECT
	*
FROM
	EMP
WHERE
	DEPTNO = 30
	AND JOB = 'SALESMAN';

-- OR 연산자
SELECT
	*
FROM
	EMP
WHERE
	DEPTNO = 30
	OR JOB = 'CLERK';

---- 05-3. 연산자 종류와 활용 방법

-- 산술 연산자
SELECT
	*
FROM
	EMP
WHERE
	SAL * 12 = 36000;

-- 비교 연산자
SELECT
	*
FROM
	EMP
WHERE
	SAL >= 3000;

-- 문자열 (1개)
SELECT
	*
FROM
	EMP
WHERE
	ENAME >= 'F';

-- 문자열 (여러 개)
SELECT
	*
FROM
	EMP
WHERE
	ENAME <= 'FORZ';

-- 등가 비교 연잔사 (!=)	// 권장
SELECT
	*
FROM
	EMP
WHERE
	SAL != 3000;

-- 등가 비교 연잔사 (<>)	// 권장
SELECT
	*
FROM
	EMP
WHERE
	SAL <> 3000;

-- 등가 비교 연잔사 (^=)
SELECT
	*
FROM
	EMP
WHERE
	SAL ^= 3000;

-- 논리 부정 연산자
SELECT
	*
FROM
	EMP
WHERE
	NOT SAL = 3000;

-- IN 연산자

-- 기본 형식
-- SELECT [조회할 열1 이름], [열2 이름], ..., [열N 이름]
-- FROM [조회할 테이블 이름]
-- WHERE 열 이름 IN (데이터1, 데이터2, ... 데이터N);

-- IN 연산자 (일반)
SELECT
	*
FROM
	EMP
WHERE
	JOB = 'MANAGER'
	OR JOB = 'SALESMAN'
	OR JOB = 'CLERK';

-- IN 연산자 (적용)
SELECT
	*
FROM
	EMP
WHERE
	JOB IN ('MANAGER', 'SALESMAN', 'CLERK');

-- IN 연산자 (NOT)
SELECT
	*
FROM
	EMP
WHERE
	JOB NOT IN ('MANAGER', 'SALESMAN', 'CLERK');

-- BETWEEN A AND B 연산자

-- 기본 형식
-- SELECT [조회할 열1 이름], [열2 이름], ..., [열N 이름]
-- FROM [조회할 테이블 이름]
-- WHERE 열 이름 BETWEEN 최솟값 AND 최댓값;

-- BETWEEN A AND B 연산자 (일반)
SELECT
	*
FROM
	EMP
WHERE
	SAL >= 2000
	AND SAL <=3000;

-- BETWEEN A AND B 연산자 (적용)
SELECT
	*
FROM
	EMP
WHERE
	SAL BETWEEN 2000 AND 3000;

-- BETWEEN A AND B 연산자 (NOT)
SELECT
	*
FROM
	EMP
WHERE
	SAL NOT BETWEEN 2000 AND 3000;

-- LIKE 연산자 (S로 시작)
SELECT
	*
FROM
	EMP
WHERE
	ENAME LIKE 'S%';

-- LIKE 연산자 (두 번째 글자가 L)
SELECT
	*
FROM
	EMP
WHERE
	ENAME LIKE '_L%';

-- LIKE 연산자 (사원 이름에 AM 포함)
SELECT
	*
FROM
	EMP
WHERE
	ENAME LIKE '%AM%';

-- LIKE 연산자 (NOT)
SELECT
	*
FROM
	EMP
WHERE
	ENAME NOT LIKE '%AM%';

-- LIKE 연산자 (와일드카드 사용)
SELECT
	*
FROM
	EMP
WHERE
	ENAME LIKE '%AM%';

-- IS NULL 연산자 (등가 비교 연산자)	// 출력 안 됨
SELECT
	*
FROM
	EMP
WHERE
	COMM = NULL;

-- IS NULL 연산자 (예제)
SELECT
	*
FROM
	EMP
WHERE
	COMM IS NULL;

-- IS NULL 연산자 (NOT)	// 직속 상관이 있는 사원 데이터
SELECT
	*
FROM
	EMP
WHERE
	MGR IS NOT NULL;

-- IS NULL 연산자 (AND 연산자)
SELECT
	*
FROM
	EMP
WHERE
	SAL > NULL
	AND COMM IS NULL;

-- IS NULL 연산자 (OR 연산자)
SELECT
	*
FROM
	EMP
WHERE
	SAL > NULL
	OR COMM IS NULL;

-- 집합 연산자 (UNION)	// 같은 열
SELECT
	EMPNO,
	ENAME,
	SAL,
	DEPTNO
FROM
	EMP
WHERE
	DEPTNO = 10
UNION
SELECT
	EMPNO,
	ENAME,
	SAL,
	DEPTNO
FROM
	EMP
WHERE
	DEPTNO = 20;

-- 집합 연산자 (UNION)	// 열 순서 다름
SELECT
	EMPNO,
	ENAME,
	SAL,
	DEPTNO
FROM
	EMP
WHERE
	DEPTNO = 10
UNION
SELECT
	SAL,
	JOB,
	DEPTNO,
	SAL
FROM
	EMP
WHERE
	DEPTNO = 20;

-- 집합 연산자 (UNION)	// 출력 결과 데이터가 같을 떄
SELECT
	EMPNO,
	ENAME,
	SAL,
	DEPTNO
FROM
	EMP
WHERE
	DEPTNO = 10
UNION
SELECT
	EMPNO,
	ENAME,
	SAL,
	DEPTNO
FROM
	EMP
WHERE
	DEPTNO = 10;

-- 집합 연산자 (UNION ALL)	// 출력 결과 데이터가 같을 떄
SELECT
	EMPNO,
	ENAME,
	SAL,
	DEPTNO
FROM
	EMP
WHERE
	DEPTNO = 10
UNION
ALL
SELECT
	EMPNO,
	ENAME,
	SAL,
	DEPTNO
FROM
	EMP
WHERE
	DEPTNO = 10;

-- 집합 연산자 (MINUS)
SELECT
	EMPNO,
	ENAME,
	SAL,
	DEPTNO
FROM
	EMP MINUS
	SELECT
		EMPNO,
		ENAME,
		SAL,
		DEPTNO
	FROM
		EMP
	WHERE
		DEPTNO = 10;

-- 집합 연산자 (INTERSECT)
SELECT
	EMPNO,
	ENAME,
	SAL,
	DEPTNO
FROM
	EMP INTERSECT
	SELECT
		EMPNO,
		ENAME,
		SAL,
		DEPTNO
	FROM
		EMP
	WHERE
		DEPTNO = 10;

---- 06-1. 오라클 함수

-- UPPER, LOWER, INITCAP
SELECT
	ENAME,
	UPPER(ENAME),
	LOWER(ENAME),
	INITCAP(ENAME)
FROM
	EMP;

-- UPPER 함수로 문자열 비교하기(사원 이름이 SCOTT인 데이터 찾기)
SELECT
	*
FROM
	EMP
WHERE
	UPPER(ENAME) = UPPER('scott');

-- UPPER 함수로 문자열 비교하기(사원 이름에 SCOTT 단어를 포함한 데이터 찾기)
SELECT
	*
FROM
	EMP
WHERE
	UPPER(ENAME) LIKE UPPER('%scott%');

-- LENGTH
SELECT
	ENAME,
	LENGTH(ENAME)
FROM
	EMP;

-- LENGTH (사원 이름의 길이가 5 이상인 행 출력)
SELECT
	ENAME,
	LENGTH(ENAME)
FROM
	EMP
WHERE
	LENGTH(ENAME) >= 5;

-- LENGTH, LENGTHB
SELECT
	LENGTH('한글'),
	LENGTHB('한글')
FROM
	DUAL;
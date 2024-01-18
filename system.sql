-- 공통사용자 또는 롤 이름 설정
alter session set "_oracle_script" = true;

-- 계정 삭제
drop user scott cascade;

-- 계정 생성
create user scott identified by tiger;

-- 비밀번호 변경
alter user scott identified by tiger;

-- 계정 권한 취소
revoke connect, resource, dba from scott;

-- 계정 권한 부여
grant connect, resource, dba to scott;

-- 용량 설정
alter user scott quota unlimited on users;
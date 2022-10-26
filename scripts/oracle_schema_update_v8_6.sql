-- Enhanced login security
DECLARE
  l_cnt integer&semi
BEGIN
  SELECT COUNT(*)
    INTO l_cnt 
    FROM dba_tab_columns
   WHERE table_name = 'APPLICATION_USER'
     AND column_name = 'FAILED_LOGIN_ATTEMPTS'&semi
  IF( l_cnt = 0 )
  THEN
    EXECUTE IMMEDIATE 'ALTER TABLE APPLICATION_USER ADD (FAILED_LOGIN_ATTEMPTS INTEGER  DEFAULT 0 NOT NULL, LOCKED NUMBER(1, 0) DEFAULT 0 NOT NULL)'&semi
  END IF&semi
END&semi;
DECLARE
  l_cnt integer&semi
BEGIN
  SELECT COUNT(*)
    INTO l_cnt 
    FROM dba_tab_columns
   WHERE table_name = 'SUPER_APPLICATION_USER'
     AND column_name = 'FAILED_LOGIN_ATTEMPTS'&semi
  IF( l_cnt = 0 )
  THEN
    EXECUTE IMMEDIATE 'ALTER TABLE SUPER_APPLICATION_USER ADD (FAILED_LOGIN_ATTEMPTS INTEGER  DEFAULT 0 NOT NULL, LOCKED NUMBER(1, 0) DEFAULT 0 NOT NULL)'&semi
  END IF&semi
END&semi;
CREATE OR REPLACE FORCE EDITIONABLE VIEW APP_USER_VIEW ("USERNAME", "FIRST_NAME", "LAST_NAME", "DOMAIN_ID", "PRIMARY_GROUP_ID", "PASSWORD", "INITLOGIN_DONE", "LOCKED", "FAILED_LOGIN_ATTEMPTS") AS 
SELECT USERNAME, FIRST_NAME, LAST_NAME, DOMAIN_ID, PRIMARY_GROUP_ID, PASSWORD, INITLOGIN_DONE, LOCKED, FAILED_LOGIN_ATTEMPTS FROM SUPER_APPLICATION_USER
UNION ALL
SELECT USERNAME, FIRST_NAME, LAST_NAME, DOMAIN_ID, PRIMARY_GROUP_ID, password, INITLOGIN_DONE, LOCKED, FAILED_LOGIN_ATTEMPTS FROM APPLICATION_USER
  WHERE STATUS != 'DELETED' AND NOT EXISTS (
  	SELECT USERNAME FROM SUPER_APPLICATION_USER WHERE APPLICATION_USER.USERNAME = SUPER_APPLICATION_USER.USERNAME
  );

CREATE TABLE PASSWORD_HISTORY(
  ID NUMBER(19,0) NOT NULL ENABLE,
  USER_ID NUMBER(19,0) NOT NULL ENABLE,
  PASSWORD RAW(128) NOT NULL ENABLE,
  TIMESTAMP NUMBER(19,0) NOT NULL ENABLE,
  CONSTRAINT PASSWORD_HISTORY_PK PRIMARY KEY(
    ID
  ) ENABLE 
);

CREATE INDEX IDX_PASSWORD_HISTORY_4_USER
ON PASSWORD_HISTORY (
	USER_ID ASC, TIMESTAMP DESC
);

-- Audit trail
CREATE TABLE ENTITY_AUDIT_LOG(
  ID NUMBER(19,0) NOT NULL ENABLE,
  TIMESTAMP NUMBER(19,0) NOT NULL ENABLE,
  ACTION VARCHAR2(10) NOT NULL ENABLE,
  ACTOR_ID NUMBER(19,0) NOT NULL ENABLE,
  ACTOR NVARCHAR2(130) NOT NULL ENABLE,
  ENTITY_TYPE CHAR(2) NOT NULL ENABLE,
  ENTITY_ID NUMBER(19,0) NOT NULL ENABLE,
  OLD_VALUE VARCHAR2(4000),
  NEW_VALUE VARCHAR2(4000),
  CONSTRAINT ENTITY_AUDIT_LOG_PK PRIMARY KEY(
    ID
  ) ENABLE 
);
CREATE INDEX IDX_ENTITY_AUDIT_4_ACTION
ON ENTITY_AUDIT_LOG (
	ACTION ASC
);
CREATE INDEX IDX_ENTITY_AUDIT_4_ACTOR
ON ENTITY_AUDIT_LOG (
	ACTOR ASC
);
CREATE INDEX IDX_ENTITY_AUDIT_4_TYPE
ON ENTITY_AUDIT_LOG (
	ENTITY_TYPE ASC
);

UPDATE OPERATOR_CONFIG set LABEL='exactly matches' WHERE DATA_TYPE='MULTIVAL' AND OPERATOR_KEY='equals_unordered' AND LABEL='=';
UPDATE OPERATOR_CONFIG set OPERATOR_KEY='=', LABEL='=' WHERE DATA_TYPE='MULTIVAL' AND OPERATOR_KEY='has' AND LABEL='has';
UPDATE OPERATOR_CONFIG set OPERATOR_KEY='!=', LABEL='!=' WHERE DATA_TYPE='MULTIVAL' AND OPERATOR_KEY='does_not_have' AND LABEL='does not have';
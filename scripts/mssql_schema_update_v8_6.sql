-- Enhanced login security
IF NOT EXISTS (
  SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'APPLICATION_USER') AND name = 'FAILED_LOGIN_ATTEMPTS'
) BEGIN 
	ALTER TABLE [APPLICATION_USER] ADD [FAILED_LOGIN_ATTEMPTS] [int] NOT NULL DEFAULT 0, [LOCKED] [bit] NOT NULL DEFAULT 0
END;
IF NOT EXISTS (
  SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'SUPER_APPLICATION_USER') AND name = 'FAILED_LOGIN_ATTEMPTS'
) BEGIN 
	ALTER TABLE [SUPER_APPLICATION_USER] ADD [FAILED_LOGIN_ATTEMPTS] [int] NOT NULL DEFAULT 0, [LOCKED] [bit] NOT NULL DEFAULT 0
END;

DROP VIEW IF EXISTS [APP_USER_VIEW];

CREATE VIEW [APP_USER_VIEW] AS
SELECT USERNAME, FIRST_NAME, LAST_NAME, DOMAIN_ID, PRIMARY_GROUP_ID, CONVERT(NVARCHAR(1000), PASSWORD, 2) as PASSWORD, INITLOGIN_DONE, LOCKED, FAILED_LOGIN_ATTEMPTS FROM SUPER_APPLICATION_USER
UNION ALL
SELECT USERNAME, FIRST_NAME, LAST_NAME, DOMAIN_ID, PRIMARY_GROUP_ID, CONVERT(NVARCHAR(1000), PASSWORD, 2) as PASSWORD, INITLOGIN_DONE, LOCKED, FAILED_LOGIN_ATTEMPTS FROM APPLICATION_USER
  WHERE STATUS != 'DELETED' AND NOT EXISTS (
  	SELECT USERNAME FROM SUPER_APPLICATION_USER WHERE APPLICATION_USER.USERNAME = SUPER_APPLICATION_USER.USERNAME
  );

CREATE TABLE [PASSWORD_HISTORY](
  [ID] [NUMERIC](19,0) IDENTITY(1,1) NOT NULL,
  [USER_ID] [NUMERIC](19,0) NOT NULL,
  [PASSWORD] [VARBINARY] (128) NOT NULL,
  [TIMESTAMP] [NUMERIC](19,0) NOT NULL,
  CONSTRAINT [PASSWORD_HISTORY_PK] PRIMARY KEY(
    [ID]
  ) 
);

CREATE INDEX IDX_PASSWORD_HISTORY_4_USER
ON PASSWORD_HISTORY (
	USER_ID ASC, TIMESTAMP DESC
);

-- Audit trail
CREATE TABLE [ENTITY_AUDIT_LOG](
  [ID] [NUMERIC](19,0) IDENTITY(1,1) NOT NULL,
  [TIMESTAMP] [NUMERIC](19,0) NOT NULL,
  [ACTION] [VARCHAR](10) NOT NULL,
  [ACTOR_ID] [NUMERIC](19,0) NOT NULL,
  [ACTOR] [NVARCHAR](130) NOT NULL,
  [ENTITY_TYPE] [CHAR](2) NOT NULL,
  [ENTITY_ID] [NUMERIC](19,0) NOT NULL,
  [OLD_VALUE] [NVARCHAR](4000),
  [NEW_VALUE] [NVARCHAR](4000),
  CONSTRAINT [ENTITY_AUDIT_LOG_PK] PRIMARY KEY(
    [ID]
  ) 
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

UPDATE OPERATOR_CONFIG set [LABEL]='exactly matches' WHERE [DATA_TYPE]='MULTIVAL' AND [OPERATOR_KEY]='equals_unordered' AND [LABEL]='=';
UPDATE OPERATOR_CONFIG set [OPERATOR_KEY]='=', [LABEL]='=' WHERE [DATA_TYPE]='MULTIVAL' AND [OPERATOR_KEY]='has' AND [LABEL]='has';
UPDATE OPERATOR_CONFIG set [OPERATOR_KEY]='!=', [LABEL]='!=' WHERE [DATA_TYPE]='MULTIVAL' AND [OPERATOR_KEY]='does_not_have' AND [LABEL]='does not have';
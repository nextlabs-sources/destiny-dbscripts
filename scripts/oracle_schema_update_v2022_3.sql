UPDATE SYS_CONFIG SET VALUE = REPLACE(VALUE, 'tcp:', 'ssl:'), DEFAULT_VALUE = REPLACE(DEFAULT_VALUE, 'tcp:', 'ssl:') WHERE CONFIG_KEY = 'activemq.broker.connector.bindAddress';
UPDATE SYS_CONFIG SET VALUE = REPLACE(VALUE, 'tcp:', 'ssl:'), DEFAULT_VALUE = REPLACE(DEFAULT_VALUE, 'tcp:', 'ssl:') WHERE CONFIG_KEY = 'config.activeMQConnectionFactory.brokerURL';
UPDATE ACCESS_CONTROL SET REQUEST_METHOD = 'DELETE' WHERE URL_PATTERN = '/api/v1/tools/location/delete';

MERGE INTO SYS_CONFIG USING (SELECT 1 FROM DUAL) ON (APPLICATION = 'application' AND CONFIG_KEY = 'activemq.broker.ssl.enabled')
WHEN MATCHED THEN UPDATE SET VALUE = 'true', DEFAULT_VALUE = 'true', VALUE_FORMAT = '', MAIN_GROUP = 'engine', SUB_GROUP = 'configServer', MAIN_GROUP_ORDER = '30', SUB_GROUP_ORDER = '0', CONFIG_ORDER = '4', HIDDEN = '1', READ_ONLY = '0', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'boolean', FIELD_TYPE = 'checkbox' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'Enable/Disable ActiveMQ broker SSL connection.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'application', 'activemq.broker.ssl.enabled', 'true', 'true', '', 'engine', 'configServer', '30', '0', '4', '1', '0', '1', '0', '0', '1', 'boolean', 'checkbox', '', '1', '', 'Enable/Disable ActiveMQ broker SSL connection.', CURRENT_TIMESTAMP, '-1' );

MERGE INTO SYS_CONFIG USING (SELECT 1 FROM DUAL) ON (APPLICATION = 'app-home' AND CONFIG_KEY = 'spring.security.oauth2.resourceserver.jwt.issuer-uri')
WHEN MATCHED THEN UPDATE SET VALUE = '${server.name}/cas/oidc', DEFAULT_VALUE = '${server.name}/cas/oidc', VALUE_FORMAT = '', MAIN_GROUP = 'security', SUB_GROUP = 'app-home', MAIN_GROUP_ORDER = '40', SUB_GROUP_ORDER = '130', CONFIG_ORDER = '0', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '0', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'JWT Issuer URI', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'app-home', 'spring.security.oauth2.resourceserver.jwt.issuer-uri', '${server.name}/cas/oidc', '${server.name}/cas/oidc', '', 'security', 'app-home', '40', '130', '0', '1', '1', '1', '0', '0', '0', 'text', 'text', '', '1', '', 'JWT Issuer URI', CURRENT_TIMESTAMP, '-1' );

MERGE INTO SYS_CONFIG USING (SELECT 1 FROM DUAL) ON (APPLICATION = 'app-home' AND CONFIG_KEY = 'spring.security.oauth2.resourceserver.jwt.jwk-set-uri')
WHEN MATCHED THEN UPDATE SET VALUE = '${server.name}/cas/oidc/jwks', DEFAULT_VALUE = '${server.name}/cas/oidc/jwks', VALUE_FORMAT = '', MAIN_GROUP = 'security', SUB_GROUP = 'app-home', MAIN_GROUP_ORDER = '40', SUB_GROUP_ORDER = '130', CONFIG_ORDER = '10', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '0', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'JWK URI', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'app-home', 'spring.security.oauth2.resourceserver.jwt.jwk-set-uri', '${server.name}/cas/oidc/jwks', '${server.name}/cas/oidc/jwks', '', 'security', 'app-home', '40', '130', '10', '1', '1', '1', '0', '0', '0', 'text', 'text', '', '1', '', 'JWK URI', CURRENT_TIMESTAMP, '-1' );

MERGE INTO SYS_CONFIG USING (SELECT 1 FROM DUAL) ON (APPLICATION = 'config-service' AND CONFIG_KEY = 'client.applications')
WHEN MATCHED THEN UPDATE SET VALUE = 'console,cas,reporter,administrator,dabs,dac,dcsf,dem,dkms,dms,dps,policy-controller-manager,service-manager,app-home', DEFAULT_VALUE = 'console,cas,reporter,administrator,dabs,dac,dcsf,dem,dkms,dms,dps,policy-controller-manager,service-manager,app-home', VALUE_FORMAT = '', MAIN_GROUP = 'engine', SUB_GROUP = 'configClient', MAIN_GROUP_ORDER = '30', SUB_GROUP_ORDER = '1', CONFIG_ORDER = '0', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '0', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'text', FIELD_TYPE = 'multi-value' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'Configuration updates will be sent to the specified applications only.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'config-service', 'client.applications', 'console,cas,reporter,administrator,dabs,dac,dcsf,dem,dkms,dms,dps,policy-controller-manager,service-manager,app-home', 'console,cas,reporter,administrator,dabs,dac,dcsf,dem,dkms,dms,dps,policy-controller-manager,service-manager,app-home', '', 'engine', 'configClient', '30', '1', '0', '1', '1', '0', '0', '0', '1', 'text', 'multi-value', '', '1', '', 'Configuration updates will be sent to the specified applications only.', CURRENT_TIMESTAMP, '-1' );

CREATE TABLE APPLICATION (
    ID                  NUMBER(19,0) NOT NULL,
    NAME                VARCHAR2(255),
    APPLICATION_ORDER   NUMBER(10,0),
    ICON_URL            VARCHAR2(255),
    URL                 VARCHAR2(255),
    PRIMARY KEY ( ID )
);

INSERT INTO APPLICATION (ID,APPLICATION_ORDER,ICON_URL,NAME,URL) VALUES
	 (HIBERNATE_SEQUENCE.NEXTVAL,100,'/assets/img/policy-studio-icon.svg','Policy Studio','${server.name}/console');
INSERT INTO APPLICATION (ID,APPLICATION_ORDER,ICON_URL,NAME,URL) VALUES
	 (HIBERNATE_SEQUENCE.NEXTVAL,300,'/assets/img/system-administration-icon.svg','System Administration','${server.name}/services/#/dashboard');
INSERT INTO APPLICATION (ID,APPLICATION_ORDER,ICON_URL,NAME,URL) VALUES
	 (HIBERNATE_SEQUENCE.NEXTVAL,200,'/assets/img/audit-report-icon.svg','Audit and Report','${server.name}/reporter');

CREATE TABLE MENU_ITEM (
    ID                 NUMBER(19,0) NOT NULL,
    APPLICATION        VARCHAR2(255),
    MENU_ITEM_NAME     VARCHAR2(255),
    MENU_ITEM_ORDER    NUMBER(10,0),
    MAIN_GROUP         VARCHAR2(255),
    MAIN_GROUP_ORDER   NUMBER(10,0),
    SUB_GROUP          VARCHAR2(255),
    SUB_GROUP_ORDER    NUMBER(10,0),
    PERMISSIONS        VARCHAR2(255),
    URL                VARCHAR2(255),
    PRIMARY KEY ( ID )
);

INSERT INTO MENU_ITEM (ID,APPLICATION,MAIN_GROUP,MAIN_GROUP_ORDER,MENU_ITEM_NAME,MENU_ITEM_ORDER,PERMISSIONS,SUB_GROUP,SUB_GROUP_ORDER,URL) VALUES
	 (HIBERNATE_SEQUENCE.NEXTVAL,'Administrator','Policy Controllers',100,'Status',100,'',NULL,NULL,'${server.name}/policy-controllers/#/status');
INSERT INTO MENU_ITEM (ID,APPLICATION,MAIN_GROUP,MAIN_GROUP_ORDER,MENU_ITEM_NAME,MENU_ITEM_ORDER,PERMISSIONS,SUB_GROUP,SUB_GROUP_ORDER,URL) VALUES
	 (HIBERNATE_SEQUENCE.NEXTVAL,'Administrator','Policy Controllers',100,'Profiles',100,'MANAGE_POLICY_CONTROLLER',NULL,NULL,'${server.name}/policy-controllers/#/profiles');
INSERT INTO MENU_ITEM (ID,APPLICATION,MAIN_GROUP,MAIN_GROUP_ORDER,MENU_ITEM_NAME,MENU_ITEM_ORDER,PERMISSIONS,SUB_GROUP,SUB_GROUP_ORDER,URL) VALUES
	 (HIBERNATE_SEQUENCE.NEXTVAL,'Administrator','ICENets',200,'Status',100,'MANAGE_ICENET',NULL,NULL,'${server.name}/services/#/icenet/status');

UPDATE ACCESS_CONTROL SET REQUEST_METHOD = 'PUT' WHERE URL_PATTERN = '/api/v1/enrollment/upload/{id:[0-9]+}';

UPDATE SYS_CONFIG SET MAIN_GROUP = 'general' WHERE APPLICATION = 'console' AND MAIN_GROUP = 'reporter';
UPDATE SYS_CONFIG SET MAIN_GROUP = 'auth' WHERE APPLICATION = 'cas' AND CONFIG_KEY  LIKE '%cas.authn.pm.reset%';
UPDATE SYS_CONFIG SET MAIN_GROUP = 'auth' WHERE SUB_GROUP = 'user.acc' or SUB_GROUP = 'mfa';
UPDATE SYS_CONFIG SET MAIN_GROUP = 'app' WHERE MAIN_GROUP = 'general' AND SUB_GROUP = 'remote.env' OR SUB_GROUP = 'policy.workflow';
UPDATE SYS_CONFIG SET MAIN_GROUP = 'app' WHERE SUB_GROUP = 'data.transportation' OR MAIN_GROUP = 'dac' or MAIN_GROUP = 'reporter';

UPDATE SYS_CONFIG SET SUB_GROUP_ORDER = 10 WHERE MAIN_GROUP = 'general' AND SUB_GROUP = 'url';
UPDATE SYS_CONFIG SET SUB_GROUP_ORDER = 20 WHERE MAIN_GROUP = 'general' AND SUB_GROUP = 'mail';
UPDATE SYS_CONFIG SET SUB_GROUP_ORDER = 30 WHERE MAIN_GROUP = 'general' AND SUB_GROUP = 'help';
UPDATE SYS_CONFIG SET SUB_GROUP_ORDER = 40 WHERE MAIN_GROUP = 'general' AND SUB_GROUP = 'console.dashboard';

UPDATE SYS_CONFIG SET SUB_GROUP_ORDER = 10 WHERE MAIN_GROUP = 'auth' AND SUB_GROUP = 'user.acc';
UPDATE SYS_CONFIG SET SUB_GROUP_ORDER = 20 WHERE MAIN_GROUP = 'auth' AND SUB_GROUP = 'pm';
UPDATE SYS_CONFIG SET SUB_GROUP_ORDER = 30 WHERE MAIN_GROUP = 'auth' AND SUB_GROUP = 'mfa';

UPDATE SYS_CONFIG SET SUB_GROUP_ORDER = 10 WHERE MAIN_GROUP = 'app' AND SUB_GROUP = 'remote.env';
UPDATE SYS_CONFIG SET SUB_GROUP_ORDER = 20 WHERE MAIN_GROUP = 'app' AND SUB_GROUP = 'policy.workflow';
UPDATE SYS_CONFIG SET SUB_GROUP_ORDER = 30 WHERE MAIN_GROUP = 'app' AND SUB_GROUP = 'data.transportation';
UPDATE SYS_CONFIG SET SUB_GROUP_ORDER = 40 WHERE MAIN_GROUP = 'app' AND SUB_GROUP = 'reporter.config';
UPDATE SYS_CONFIG SET SUB_GROUP_ORDER = 50 WHERE MAIN_GROUP = 'app' AND SUB_GROUP = 'archive';
UPDATE SYS_CONFIG SET SUB_GROUP_ORDER = 60 WHERE MAIN_GROUP = 'app' AND SUB_GROUP = 'index';
UPDATE SYS_CONFIG SET SUB_GROUP_ORDER = 70 WHERE MAIN_GROUP = 'app' AND SUB_GROUP = 'sync';

UPDATE SYS_CONFIG SET MAIN_GROUP_ORDER = 0 WHERE MAIN_GROUP = 'general';
UPDATE SYS_CONFIG SET MAIN_GROUP_ORDER = 10 WHERE MAIN_GROUP = 'app';
UPDATE SYS_CONFIG SET MAIN_GROUP_ORDER = 20 WHERE MAIN_GROUP = 'auth';
UPDATE SYS_CONFIG SET MAIN_GROUP_ORDER = 30 WHERE MAIN_GROUP = 'security';

MERGE INTO SYS_CONFIG USING (SELECT 1 FROM DUAL) ON (APPLICATION = 'policy-controller-manager' AND CONFIG_KEY = 'db.comboPooledDataSource.idleConnectionTestPeriod')
WHEN MATCHED THEN UPDATE SET VALUE = '30', DEFAULT_VALUE = '30', VALUE_FORMAT = '', MAIN_GROUP = 'db', SUB_GROUP = 'policy-controller-manager', MAIN_GROUP_ORDER = '20', SUB_GROUP_ORDER = '20', CONFIG_ORDER = '10', HIDDEN = '1', READ_ONLY = '0', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'integer', FIELD_TYPE = 'number' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = '', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'policy-controller-manager', 'db.comboPooledDataSource.idleConnectionTestPeriod', '30', '30', '', 'db', 'policy-controller-manager', '20', '20', '10', '1', '0', '1', '0', '0', '1', 'integer', 'number', '', '1', '', '', CURRENT_TIMESTAMP, '-1' );

MERGE INTO SYS_CONFIG USING (SELECT 1 FROM DUAL) ON (APPLICATION = 'service-manager' AND CONFIG_KEY = 'db.comboPooledDataSource.idleConnectionTestPeriod')
WHEN MATCHED THEN UPDATE SET VALUE = '30', DEFAULT_VALUE = '30', VALUE_FORMAT = '', MAIN_GROUP = 'db', SUB_GROUP = 'service-manager', MAIN_GROUP_ORDER = '20', SUB_GROUP_ORDER = '30', CONFIG_ORDER = '10', HIDDEN = '1', READ_ONLY = '0', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'integer', FIELD_TYPE = 'number' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = '', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'service-manager', 'db.comboPooledDataSource.idleConnectionTestPeriod', '30', '30', '', 'db', 'service-manager', '20', '30', '10', '1', '0', '1', '0', '0', '1', 'integer', 'number', '', '1', '', '', CURRENT_TIMESTAMP, '-1' );

CREATE TABLE ARCHIVE_DICT_ELEMENTS(
  ID NUMBER(19,0) NOT NULL,
  VERSION NUMBER(10,0) NOT NULL,
  ORIGINAL_ID NUMBER(19,0),
  ENROLLMENT_ID NUMBER(19,0) NOT NULL,
  DICTIONARY_KEY VARCHAR2(900),
  UNIQUE_NAME VARCHAR2(128),
  displayName VARCHAR2(128),
  PATH VARCHAR2(900) NOT NULL,
  PATH_HASH NUMBER(19,0) NOT NULL,
  REPARENTED CHAR(1),
  ACTIVE_FROM NUMBER(19,0) NOT NULL,
  ACTIVE_TO NUMBER(19,0) NOT NULL
);

CREATE TABLE ARCHIVE_DICT_ENUM_GROUP_MEMBERS(
  ID NUMBER(19,0) NOT NULL,
  VERSION NUMBER(10,0) NOT NULL,
  FROM_ID NUMBER(19,0) NOT NULL,
  TO_ID NUMBER(19,0),
  ENROLLMENT_ID NUMBER(19,0) NOT NULL,
  IS_DIRECT CHAR(1) NOT NULL,
  ACTIVE_FROM NUMBER(19,0) NOT NULL,
  ACTIVE_TO NUMBER(19,0) NOT NULL
);

CREATE TABLE ARCHIVE_DICT_ENUM_GROUPS(
  ELEMENT_ID NUMBER(19,0) NOT NULL
);

CREATE TABLE ARCHIVE_DICT_ENUM_MEMBERS(
  ID NUMBER(19,0) NOT NULL,
  VERSION NUMBER(10,0) NOT NULL,
  GROUP_ID NUMBER(19,0) NOT NULL,
  MEMBER_ID NUMBER(19,0) NOT NULL,
  ELEMENT_TYPE_ID NUMBER(19,0) NOT NULL,
  ENROLLMENT_ID NUMBER(19,0) NOT NULL,
  ACTIVE_FROM NUMBER(19,0) NOT NULL,
  ACTIVE_TO NUMBER(19,0) NOT NULL
);

CREATE TABLE ARCHIVE_DICT_STRUCT_GROUPS(
  ELEMENT_ID NUMBER(19,0) NOT NULL,
  FILTER VARCHAR2(900) NOT NULL,
  filterLength NUMBER(10,0)
);

DECLARE
  string20_exists number := 0&semi
  column_type varchar(10)&semi
BEGIN
  select count(*) into string20_exists
  from user_tab_cols
  where upper(column_name) = 'STRING20' and
        upper(table_name) = 'DICT_LEAF_ELEMENTS'&semi

  select value into column_type FROM v$parameter WHERE name = 'max_string_size'&semi

  if(column_type = 'STANDARD') then
    execute immediate 'CREATE TABLE ARCHIVE_DICT_LEAF_ELEMENTS(
                         element_id NUMBER(19,0) NOT NULL,
                         TYPE_ID NUMBER(19,0) NOT NULL,
                         String00 VARCHAR2(4000), String01 VARCHAR2(4000), String02 VARCHAR2(4000), String03 VARCHAR2(4000), String04 VARCHAR2(4000),
                         String05 VARCHAR2(4000), String06 VARCHAR2(4000), String07 VARCHAR2(4000), String08 VARCHAR2(4000), String09 VARCHAR2(4000),
                         String10 VARCHAR2(4000), String11 VARCHAR2(4000), String12 VARCHAR2(4000), String13 VARCHAR2(4000), String14 VARCHAR2(4000),
                         String15 VARCHAR2(4000), String16 VARCHAR2(4000), String17 VARCHAR2(4000), String18 VARCHAR2(4000), String19 VARCHAR2(4000),
                         String20 VARCHAR2(4000), String21 VARCHAR2(4000), String22 VARCHAR2(4000), String23 VARCHAR2(4000), String24 VARCHAR2(4000),
                         String25 VARCHAR2(4000), String26 VARCHAR2(4000), String27 VARCHAR2(4000), String28 VARCHAR2(4000), String29 VARCHAR2(4000),
                         String30 VARCHAR2(4000), String31 VARCHAR2(4000), String32 VARCHAR2(4000), String33 VARCHAR2(4000), String34 VARCHAR2(4000),
                         String35 VARCHAR2(4000), String36 VARCHAR2(4000), String37 VARCHAR2(4000), String38 VARCHAR2(4000), String39 VARCHAR2(4000),
                         String40 VARCHAR2(4000), String41 VARCHAR2(4000), String42 VARCHAR2(4000), String43 VARCHAR2(4000), String44 VARCHAR2(4000),
                         String45 VARCHAR2(4000), String46 VARCHAR2(4000), String47 VARCHAR2(4000), String48 VARCHAR2(4000), String49 VARCHAR2(4000),
                         Number00 NUMBER(19,0), Number01 NUMBER(19,0), Number02 NUMBER(19,0), Number03 NUMBER(19,0), Number04 NUMBER(19,0),
                         Number05 NUMBER(19,0), Number06 NUMBER(19,0), Number07 NUMBER(19,0), Number08 NUMBER(19,0), Number09 NUMBER(19,0),
                         Number10 NUMBER(19,0), Number11 NUMBER(19,0), Number12 NUMBER(19,0), Number13 NUMBER(19,0), Number14 NUMBER(19,0),
                         Number15 NUMBER(19,0), Number16 NUMBER(19,0), Number17 NUMBER(19,0), Number18 NUMBER(19,0), Number19 NUMBER(19,0),
                         Date00 NUMBER(19,0), Date01 NUMBER(19,0), Date02 NUMBER(19,0), Date03 NUMBER(19,0), Date04 NUMBER(19,0),
                         Date05 NUMBER(19,0), Date06 NUMBER(19,0), Date07 NUMBER(19,0), Date08 NUMBER(19,0), Date09 NUMBER(19,0),
                         Date10 NUMBER(19,0), Date11 NUMBER(19,0), Date12 NUMBER(19,0), Date13 NUMBER(19,0), Date14 NUMBER(19,0),
                         Date15 NUMBER(19,0), Date16 NUMBER(19,0), Date17 NUMBER(19,0), Date18 NUMBER(19,0), Date19 NUMBER(19,0),
                         NUMARRAY00 VARCHAR2(2048), NUMARRAY01 VARCHAR2(2048), NUMARRAY02 VARCHAR2(2048), NUMARRAY03 VARCHAR2(2048))'&semi
  else
    execute immediate 'CREATE TABLE ARCHIVE_DICT_LEAF_ELEMENTS(
                         element_id NUMBER(19,0) NOT NULL,
                         TYPE_ID NUMBER(19,0) NOT NULL,
                         String00 VARCHAR2(32767), String01 VARCHAR2(32767), String02 VARCHAR2(32767), String03 VARCHAR2(32767), String04 VARCHAR2(32767),
                         String05 VARCHAR2(32767), String06 VARCHAR2(32767), String07 VARCHAR2(32767), String08 VARCHAR2(32767), String09 VARCHAR2(32767),
                         String10 VARCHAR2(32767), String11 VARCHAR2(32767), String12 VARCHAR2(32767), String13 VARCHAR2(32767), String14 VARCHAR2(32767),
                         String15 VARCHAR2(32767), String16 VARCHAR2(32767), String17 VARCHAR2(32767), String18 VARCHAR2(32767), String19 VARCHAR2(32767),
                         String20 VARCHAR2(32767), String21 VARCHAR2(32767), String22 VARCHAR2(32767), String23 VARCHAR2(32767), String24 VARCHAR2(32767),
                         String25 VARCHAR2(32767), String26 VARCHAR2(32767), String27 VARCHAR2(32767), String28 VARCHAR2(32767), String29 VARCHAR2(32767),
                         String30 VARCHAR2(32767), String31 VARCHAR2(32767), String32 VARCHAR2(32767), String33 VARCHAR2(32767), String34 VARCHAR2(32767),
                         String35 VARCHAR2(32767), String36 VARCHAR2(32767), String37 VARCHAR2(32767), String38 VARCHAR2(32767), String39 VARCHAR2(32767),
                         String40 VARCHAR2(32767), String41 VARCHAR2(32767), String42 VARCHAR2(32767), String43 VARCHAR2(32767), String44 VARCHAR2(32767),
                         String45 VARCHAR2(32767), String46 VARCHAR2(32767), String47 VARCHAR2(32767), String48 VARCHAR2(32767), String49 VARCHAR2(32767),
                         Number00 NUMBER(19,0), Number01 NUMBER(19,0), Number02 NUMBER(19,0), Number03 NUMBER(19,0), Number04 NUMBER(19,0),
                         Number05 NUMBER(19,0), Number06 NUMBER(19,0), Number07 NUMBER(19,0), Number08 NUMBER(19,0), Number09 NUMBER(19,0),
                         Number10 NUMBER(19,0), Number11 NUMBER(19,0), Number12 NUMBER(19,0), Number13 NUMBER(19,0), Number14 NUMBER(19,0),
                         Number15 NUMBER(19,0), Number16 NUMBER(19,0), Number17 NUMBER(19,0), Number18 NUMBER(19,0), Number19 NUMBER(19,0),
                         Date00 NUMBER(19,0), Date01 NUMBER(19,0), Date02 NUMBER(19,0), Date03 NUMBER(19,0), Date04 NUMBER(19,0),
                         Date05 NUMBER(19,0), Date06 NUMBER(19,0), Date07 NUMBER(19,0), Date08 NUMBER(19,0), Date09 NUMBER(19,0),
                         Date10 NUMBER(19,0), Date11 NUMBER(19,0), Date12 NUMBER(19,0), Date13 NUMBER(19,0), Date14 NUMBER(19,0),
                         Date15 NUMBER(19,0), Date16 NUMBER(19,0), Date17 NUMBER(19,0), Date18 NUMBER(19,0), Date19 NUMBER(19,0),
                         NUMARRAY00 VARCHAR2(2048), NUMARRAY01 VARCHAR2(2048), NUMARRAY02 VARCHAR2(2048), NUMARRAY03 VARCHAR2(2048))'&semi
  end if&semi
end&semi;

UPDATE SYS_CONFIG SET VALUE = REPLACE(VALUE, 'tcp:', 'ssl:'), DEFAULT_VALUE = REPLACE(DEFAULT_VALUE, 'tcp:', 'ssl:') WHERE CONFIG_KEY = 'activemq.broker.connector.bindAddress';
UPDATE SYS_CONFIG SET VALUE = REPLACE(VALUE, 'tcp:', 'ssl:'), DEFAULT_VALUE = REPLACE(DEFAULT_VALUE, 'tcp:', 'ssl:') WHERE CONFIG_KEY = 'config.activeMQConnectionFactory.brokerURL';
UPDATE ACCESS_CONTROL SET REQUEST_METHOD = 'DELETE' WHERE URL_PATTERN = '/api/v1/tools/location/delete';

INSERT INTO SYS_CONFIG (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (NEXTVAL('HIBERNATE_SEQUENCE'), 'application', 'activemq.broker.ssl.enabled', 'true', 'true', '', 'engine', 'configServer', '30', '0', '4', '1', '0', '1', '0', '0', '1', 'boolean', 'checkbox', '', '1', '', 'Enable/Disable ActiveMQ broker SSL connection.', CURRENT_TIMESTAMP, '-1' )
ON CONFLICT (APPLICATION, CONFIG_KEY) DO UPDATE SET VALUE = 'true', DEFAULT_VALUE = 'true', VALUE_FORMAT = '', MAIN_GROUP = 'engine', SUB_GROUP = 'configServer', MAIN_GROUP_ORDER = '30', SUB_GROUP_ORDER = '0', CONFIG_ORDER = '4', HIDDEN = '1', READ_ONLY = '0', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'boolean', FIELD_TYPE = 'checkbox' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'Enable/Disable ActiveMQ broker SSL connection.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1';

INSERT INTO SYS_CONFIG (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (NEXTVAL('HIBERNATE_SEQUENCE'), 'app-home', 'spring.security.oauth2.resourceserver.jwt.issuer-uri', '${server.name}/cas/oidc', '${server.name}/cas/oidc', '', 'security', 'app-home', '40', '130', '0', '1', '1', '1', '0', '0', '0', 'text', 'text', '', '1', '', 'JWT Issuer URI', CURRENT_TIMESTAMP, '-1' )
ON CONFLICT (APPLICATION, CONFIG_KEY) DO UPDATE SET VALUE = '${server.name}/cas/oidc', DEFAULT_VALUE = '${server.name}/cas/oidc', VALUE_FORMAT = '', MAIN_GROUP = 'security', SUB_GROUP = 'app-home', MAIN_GROUP_ORDER = '40', SUB_GROUP_ORDER = '130', CONFIG_ORDER = '0', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '0', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'JWT Issuer URI', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1';

INSERT INTO SYS_CONFIG (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (NEXTVAL('HIBERNATE_SEQUENCE'), 'app-home', 'spring.security.oauth2.resourceserver.jwt.jwk-set-uri', '${server.name}/cas/oidc/jwks', '${server.name}/cas/oidc/jwks', '', 'security', 'app-home', '40', '130', '10', '1', '1', '1', '0', '0', '0', 'text', 'text', '', '1', '', 'JWK URI', CURRENT_TIMESTAMP, '-1' )
ON CONFLICT (APPLICATION, CONFIG_KEY) DO UPDATE SET VALUE = '${server.name}/cas/oidc/jwks', DEFAULT_VALUE = '${server.name}/cas/oidc/jwks', VALUE_FORMAT = '', MAIN_GROUP = 'security', SUB_GROUP = 'app-home', MAIN_GROUP_ORDER = '40', SUB_GROUP_ORDER = '130', CONFIG_ORDER = '10', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '0', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'JWK URI', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1';

INSERT INTO SYS_CONFIG (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (NEXTVAL('HIBERNATE_SEQUENCE'), 'config-service', 'client.applications', 'console,cas,reporter,administrator,dabs,dac,dcsf,dem,dkms,dms,dps,policy-controller-manager,service-manager,app-home', 'console,cas,reporter,administrator,dabs,dac,dcsf,dem,dkms,dms,dps,policy-controller-manager,service-manager,app-home', '', 'engine', 'configClient', '30', '1', '0', '1', '1', '0', '0', '0', '1', 'text', 'multi-value', '', '1', '', 'Configuration updates will be sent to the specified applications only.', CURRENT_TIMESTAMP, '-1' )
ON CONFLICT (APPLICATION, CONFIG_KEY) DO UPDATE SET VALUE = 'console,cas,reporter,administrator,dabs,dac,dcsf,dem,dkms,dms,dps,policy-controller-manager,service-manager,app-home', DEFAULT_VALUE = 'console,cas,reporter,administrator,dabs,dac,dcsf,dem,dkms,dms,dps,policy-controller-manager,service-manager,app-home', VALUE_FORMAT = '', MAIN_GROUP = 'engine', SUB_GROUP = 'configClient', MAIN_GROUP_ORDER = '30', SUB_GROUP_ORDER = '1', CONFIG_ORDER = '0', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '0', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'text', FIELD_TYPE = 'multi-value' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'Configuration updates will be sent to the specified applications only.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1';

CREATE TABLE APPLICATION (
    ID                  INT8 NOT NULL,
    NAME                VARCHAR(255),
    APPLICATION_ORDER   INT4,
    ICON_URL            VARCHAR(255),
    URL                 VARCHAR(255),
    PRIMARY KEY ( ID )
);

INSERT INTO APPLICATION (ID,APPLICATION_ORDER,ICON_URL,NAME,URL) VALUES
	 (NEXTVAL('HIBERNATE_SEQUENCE'),100,'/assets/img/policy-studio-icon.svg','Policy Studio','${server.name}/console');
INSERT INTO APPLICATION (ID,APPLICATION_ORDER,ICON_URL,NAME,URL) VALUES
	 (NEXTVAL('HIBERNATE_SEQUENCE'),300,'/assets/img/system-administration-icon.svg','System Administration','${server.name}/services/#/dashboard');
INSERT INTO APPLICATION (ID,APPLICATION_ORDER,ICON_URL,NAME,URL) VALUES
	 (NEXTVAL('HIBERNATE_SEQUENCE'),200,'/assets/img/audit-report-icon.svg','Audit and Report','${server.name}/reporter');

CREATE TABLE MENU_ITEM (
    ID                 INT8 NOT NULL,
    APPLICATION        VARCHAR(255),
    MENU_ITEM_NAME     VARCHAR(255),
    MENU_ITEM_ORDER    INT4,
    MAIN_GROUP         VARCHAR(255),
    MAIN_GROUP_ORDER   INT4,
    PERMISSIONS        VARCHAR(255),
    SUB_GROUP          VARCHAR(255),
    SUB_GROUP_ORDER    INT4,
    URL                VARCHAR(255),
    PRIMARY KEY ( ID )
);

INSERT INTO MENU_ITEM (ID,APPLICATION,MAIN_GROUP,MAIN_GROUP_ORDER,MENU_ITEM_NAME,MENU_ITEM_ORDER,PERMISSIONS,SUB_GROUP,SUB_GROUP_ORDER,URL) VALUES
	 (NEXTVAL('HIBERNATE_SEQUENCE'),'Administrator','Policy Controllers',100,'Status',100,'',NULL,NULL,'${server.name}/policy-controllers/#/status');
INSERT INTO MENU_ITEM (ID,APPLICATION,MAIN_GROUP,MAIN_GROUP_ORDER,MENU_ITEM_NAME,MENU_ITEM_ORDER,PERMISSIONS,SUB_GROUP,SUB_GROUP_ORDER,URL) VALUES
	 (NEXTVAL('HIBERNATE_SEQUENCE'),'Administrator','Policy Controllers',100,'Profiles',100,'MANAGE_POLICY_CONTROLLER',NULL,NULL,'${server.name}/policy-controllers/#/profiles');
INSERT INTO MENU_ITEM (ID,APPLICATION,MAIN_GROUP,MAIN_GROUP_ORDER,MENU_ITEM_NAME,MENU_ITEM_ORDER,PERMISSIONS,SUB_GROUP,SUB_GROUP_ORDER,URL) VALUES
	 (NEXTVAL('HIBERNATE_SEQUENCE'),'Administrator','ICENets',200,'Status',100,'MANAGE_ICENET',NULL,NULL,'${server.name}/services/#/icenet/status');

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

INSERT INTO SYS_CONFIG (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (NEXTVAL('HIBERNATE_SEQUENCE'), 'policy-controller-manager', 'db.comboPooledDataSource.idleConnectionTestPeriod', '30', '30', '', 'db', 'policy-controller-manager', '20', '20', '10', '1', '0', '1', '0', '0', '1', 'integer', 'number', '', '1', '', '', CURRENT_TIMESTAMP, '-1' )
ON CONFLICT (APPLICATION, CONFIG_KEY) DO UPDATE SET VALUE = '30', DEFAULT_VALUE = '30', VALUE_FORMAT = '', MAIN_GROUP = 'db', SUB_GROUP = 'policy-controller-manager', MAIN_GROUP_ORDER = '20', SUB_GROUP_ORDER = '20', CONFIG_ORDER = '10', HIDDEN = '1', READ_ONLY = '0', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'integer', FIELD_TYPE = 'number' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = '', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1';

INSERT INTO SYS_CONFIG (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (NEXTVAL('HIBERNATE_SEQUENCE'), 'service-manager', 'db.comboPooledDataSource.idleConnectionTestPeriod', '30', '30', '', 'db', 'service-manager', '20', '30', '10', '1', '0', '1', '0', '0', '1', 'integer', 'number', '', '1', '', '', CURRENT_TIMESTAMP, '-1' )
ON CONFLICT (APPLICATION, CONFIG_KEY) DO UPDATE SET VALUE = '30', DEFAULT_VALUE = '30', VALUE_FORMAT = '', MAIN_GROUP = 'db', SUB_GROUP = 'service-manager', MAIN_GROUP_ORDER = '20', SUB_GROUP_ORDER = '30', CONFIG_ORDER = '10', HIDDEN = '1', READ_ONLY = '0', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'integer', FIELD_TYPE = 'number' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = '', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1';

CREATE TABLE ARCHIVE_DICT_ELEMENTS(
  ID INT8 NOT NULL,
  VERSION INT4 NOT NULL,
  ORIGINAL_ID INT8,
  ENROLLMENT_ID INT8 NOT NULL,
  DICTIONARY_KEY VARCHAR(900),
  UNIQUE_NAME VARCHAR(128),
  displayName VARCHAR(128),
  PATH VARCHAR(900) NOT NULL,
  PATH_HASH INT8 NOT NULL,
  REPARENTED CHAR(1),
  ACTIVE_FROM INT8 NOT NULL,
  ACTIVE_TO INT8 NOT NULL
);

CREATE TABLE ARCHIVE_DICT_ENUM_GROUP_MEMBERS(
  ID INT8 NOT NULL,
  VERSION INT4 NOT NULL,
  FROM_ID INT8 NOT NULL,
  TO_ID INT8,
  ENROLLMENT_ID INT8 NOT NULL,
  IS_DIRECT CHAR(1) NOT NULL,
  ACTIVE_FROM INT8 NOT NULL,
  ACTIVE_TO INT8 NOT NULL
);

CREATE TABLE ARCHIVE_DICT_ENUM_GROUPS(
  ELEMENT_ID INT8 NOT NULL
);

CREATE TABLE ARCHIVE_DICT_ENUM_MEMBERS(
  ID INT8 NOT NULL,
  VERSION INT4 NOT NULL,
  GROUP_ID INT8 NOT NULL,
  MEMBER_ID INT8 NOT NULL,
  ELEMENT_TYPE_ID INT8 NOT NULL,
  ENROLLMENT_ID INT8 NOT NULL,
  ACTIVE_FROM INT8 NOT NULL,
  ACTIVE_TO INT8 NOT NULL
);

CREATE TABLE ARCHIVE_DICT_STRUCT_GROUPS(
  ELEMENT_ID INT8 NOT NULL,
  FILTER VARCHAR(900) NOT NULL,
  filterLength INT4 NOT NULL
);

CREATE TABLE ARCHIVE_DICT_LEAF_ELEMENTS(
  element_id INT8 NOT NULL,
  TYPE_ID INT8 NOT NULL,
  String00 VARCHAR(4000),
  String01 VARCHAR(4000),
  String02 VARCHAR(4000),
  String03 VARCHAR(4000),
  String04 VARCHAR(4000),
  String05 VARCHAR(4000),
  String06 VARCHAR(4000),
  String07 VARCHAR(4000),
  String08 VARCHAR(4000),
  String09 VARCHAR(4000),
  String10 VARCHAR(4000),
  String11 VARCHAR(4000),
  String12 VARCHAR(4000),
  String13 VARCHAR(4000),
  String14 VARCHAR(4000),
  String15 VARCHAR(4000),
  String16 VARCHAR(4000),
  String17 VARCHAR(4000),
  String18 VARCHAR(4000),
  String19 VARCHAR(4000),
  String20 VARCHAR(4000),
  String21 VARCHAR(4000),
  String22 VARCHAR(4000),
  String23 VARCHAR(4000),
  String24 VARCHAR(4000),
  String25 VARCHAR(4000),
  String26 VARCHAR(4000),
  String27 VARCHAR(4000),
  String28 VARCHAR(4000),
  String29 VARCHAR(4000),
  String30 VARCHAR(4000),
  String31 VARCHAR(4000),
  String32 VARCHAR(4000),
  String33 VARCHAR(4000),
  String34 VARCHAR(4000),
  String35 VARCHAR(4000),
  String36 VARCHAR(4000),
  String37 VARCHAR(4000),
  String38 VARCHAR(4000),
  String39 VARCHAR(4000),
  String40 VARCHAR(4000),
  String41 VARCHAR(4000),
  String42 VARCHAR(4000),
  String43 VARCHAR(4000),
  String44 VARCHAR(4000),
  String45 VARCHAR(4000),
  String46 VARCHAR(4000),
  String47 VARCHAR(4000),
  String48 VARCHAR(4000),
  String49 VARCHAR(4000),
  Number00 INT8,
  Number01 INT8,
  Number02 INT8,
  Number03 INT8,
  Number04 INT8,
  Number05 INT8,
  Number06 INT8,
  Number07 INT8,
  Number08 INT8,
  Number09 INT8,
  Number10 INT8,
  Number11 INT8,
  Number12 INT8,
  Number13 INT8,
  Number14 INT8,
  Number15 INT8,
  Number16 INT8,
  Number17 INT8,
  Number18 INT8,
  Number19 INT8,
  Date00 INT8,
  Date01 INT8,
  Date02 INT8,
  Date03 INT8,
  Date04 INT8,
  Date05 INT8,
  Date06 INT8,
  Date07 INT8,
  Date08 INT8,
  Date09 INT8,
  Date10 INT8,
  Date11 INT8,
  Date12 INT8,
  Date13 INT8,
  Date14 INT8,
  Date15 INT8,
  Date16 INT8,
  Date17 INT8,
  Date18 INT8,
  Date19 INT8,
  NUMARRAY00 VARCHAR(2048),
  NUMARRAY01 VARCHAR(2048),
  NUMARRAY02 VARCHAR(2048),
  NUMARRAY03 VARCHAR(2048)
);

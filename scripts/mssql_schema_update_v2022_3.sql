UPDATE SYS_CONFIG SET VALUE = REPLACE(VALUE, 'tcp:', 'ssl:'), DEFAULT_VALUE = REPLACE(DEFAULT_VALUE, 'tcp:', 'ssl:') WHERE CONFIG_KEY = 'activemq.broker.connector.bindAddress';
UPDATE SYS_CONFIG SET VALUE = REPLACE(VALUE, 'tcp:', 'ssl:'), DEFAULT_VALUE = REPLACE(DEFAULT_VALUE, 'tcp:', 'ssl:') WHERE CONFIG_KEY = 'config.activeMQConnectionFactory.brokerURL';
UPDATE ACCESS_CONTROL SET REQUEST_METHOD = 'DELETE' WHERE URL_PATTERN = '/api/v1/tools/location/delete';

MERGE INTO SYS_CONFIG SC1 USING (SELECT 'application' AS APPLICATION, 'activemq.broker.ssl.enabled' AS CONFIG_KEY) AS SC2 ON (SC1.APPLICATION = SC2.APPLICATION AND SC1.CONFIG_KEY = SC2.CONFIG_KEY)
WHEN MATCHED THEN UPDATE SET VALUE = 'true', DEFAULT_VALUE = 'true', VALUE_FORMAT = '', MAIN_GROUP = 'engine', SUB_GROUP = 'configServer', MAIN_GROUP_ORDER = '30', SUB_GROUP_ORDER = '0', CONFIG_ORDER = '4', HIDDEN = '1', READ_ONLY = '0', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'boolean', FIELD_TYPE = 'checkbox' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'Enable/Disable ActiveMQ broker SSL connection.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES ('application', 'activemq.broker.ssl.enabled', 'true', 'true', '', 'engine', 'configServer', '30', '0', '4', '1', '0', '1', '0', '0', '1', 'boolean', 'checkbox', '', '1', '', 'Enable/Disable ActiveMQ broker SSL connection.', CURRENT_TIMESTAMP, '-1' )&semi;

MERGE INTO SYS_CONFIG SC1 USING (SELECT 'app-home' AS APPLICATION, 'spring.security.oauth2.resourceserver.jwt.issuer-uri' AS CONFIG_KEY) AS SC2 ON (SC1.APPLICATION = SC2.APPLICATION AND SC1.CONFIG_KEY = SC2.CONFIG_KEY)
WHEN MATCHED THEN UPDATE SET VALUE = '${server.name}/cas/oidc', DEFAULT_VALUE = '${server.name}/cas/oidc', VALUE_FORMAT = '', MAIN_GROUP = 'security', SUB_GROUP = 'app-home', MAIN_GROUP_ORDER = '40', SUB_GROUP_ORDER = '130', CONFIG_ORDER = '0', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '0', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'JWT Issuer URI', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES ('app-home', 'spring.security.oauth2.resourceserver.jwt.issuer-uri', '${server.name}/cas/oidc', '${server.name}/cas/oidc', '', 'security', 'app-home', '40', '130', '0', '1', '1', '1', '0', '0', '0', 'text', 'text', '', '1', '', 'JWT Issuer URI', CURRENT_TIMESTAMP, '-1' )&semi;

MERGE INTO SYS_CONFIG SC1 USING (SELECT 'app-home' AS APPLICATION, 'spring.security.oauth2.resourceserver.jwt.jwk-set-uri' AS CONFIG_KEY) AS SC2 ON (SC1.APPLICATION = SC2.APPLICATION AND SC1.CONFIG_KEY = SC2.CONFIG_KEY)
WHEN MATCHED THEN UPDATE SET VALUE = '${server.name}/cas/oidc/jwks', DEFAULT_VALUE = '${server.name}/cas/oidc/jwks', VALUE_FORMAT = '', MAIN_GROUP = 'security', SUB_GROUP = 'app-home', MAIN_GROUP_ORDER = '40', SUB_GROUP_ORDER = '130', CONFIG_ORDER = '10', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '0', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'JWK URI', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES ('app-home', 'spring.security.oauth2.resourceserver.jwt.jwk-set-uri', '${server.name}/cas/oidc/jwks', '${server.name}/cas/oidc/jwks', '', 'security', 'app-home', '40', '130', '10', '1', '1', '1', '0', '0', '0', 'text', 'text', '', '1', '', 'JWK URI', CURRENT_TIMESTAMP, '-1' )&semi;

MERGE INTO SYS_CONFIG SC1 USING (SELECT 'config-service' AS APPLICATION, 'client.applications' AS CONFIG_KEY) AS SC2 ON (SC1.APPLICATION = SC2.APPLICATION AND SC1.CONFIG_KEY = SC2.CONFIG_KEY)
WHEN MATCHED THEN UPDATE SET VALUE = 'console,cas,reporter,administrator,dabs,dac,dcsf,dem,dkms,dms,dps,policy-controller-manager,service-manager,app-home', DEFAULT_VALUE = 'console,cas,reporter,administrator,dabs,dac,dcsf,dem,dkms,dms,dps,policy-controller-manager,service-manager,app-home', VALUE_FORMAT = '', MAIN_GROUP = 'engine', SUB_GROUP = 'configClient', MAIN_GROUP_ORDER = '30', SUB_GROUP_ORDER = '1', CONFIG_ORDER = '0', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '0', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'text', FIELD_TYPE = 'multi-value' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'Configuration updates will be sent to the specified applications only.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES ('config-service', 'client.applications', 'console,cas,reporter,administrator,dabs,dac,dcsf,dem,dkms,dms,dps,policy-controller-manager,service-manager,app-home', 'console,cas,reporter,administrator,dabs,dac,dcsf,dem,dkms,dms,dps,policy-controller-manager,service-manager,app-home', '', 'engine', 'configClient', '30', '1', '0', '1', '1', '0', '0', '0', '1', 'text', 'multi-value', '', '1', '', 'Configuration updates will be sent to the specified applications only.', CURRENT_TIMESTAMP, '-1' )&semi;

CREATE TABLE APPLICATION (
    ID                  NUMERIC (18, 0) IDENTITY(1,1) NOT NULL,
    NAME                VARCHAR(255),
    APPLICATION_ORDER   INTEGER,
    ICON_URL            VARCHAR(255),
    URL                 VARCHAR(255),
    CONSTRAINT APPLICATION_PK PRIMARY KEY ( ID )
);

INSERT INTO APPLICATION (APPLICATION_ORDER,ICON_URL,NAME,URL) VALUES
	 (100,'/assets/img/policy-studio-icon.svg','Policy Studio','${server.name}/console');
INSERT INTO APPLICATION (APPLICATION_ORDER,ICON_URL,NAME,URL) VALUES
	 (300,'/assets/img/system-administration-icon.svg','System Administration','${server.name}/services/#/dashboard');
INSERT INTO APPLICATION (APPLICATION_ORDER,ICON_URL,NAME,URL) VALUES
	 (200,'/assets/img/audit-report-icon.svg','Audit and Report','${server.name}/reporter');

CREATE TABLE MENU_ITEM (
    ID                 NUMERIC (18, 0) IDENTITY(1,1) NOT NULL,
    APPLICATION        VARCHAR(255),
    MENU_ITEM_NAME     VARCHAR(255),
    MENU_ITEM_ORDER    INTEGER,
    MAIN_GROUP         VARCHAR(255),
    MAIN_GROUP_ORDER   INTEGER,
    SUB_GROUP          VARCHAR(255),
    SUB_GROUP_ORDER    INTEGER,
    PERMISSIONS        VARCHAR(255),
    URL                VARCHAR(255),
    CONSTRAINT MENU_ITEM_PK PRIMARY KEY ( ID )
);

INSERT INTO MENU_ITEM (APPLICATION,MAIN_GROUP,MAIN_GROUP_ORDER,MENU_ITEM_NAME,MENU_ITEM_ORDER,PERMISSIONS,SUB_GROUP,SUB_GROUP_ORDER,URL) VALUES
	 ('Administrator','Policy Controllers',100,'Status',100,'',NULL,NULL,'${server.name}/policy-controllers/#/status');
INSERT INTO MENU_ITEM (APPLICATION,MAIN_GROUP,MAIN_GROUP_ORDER,MENU_ITEM_NAME,MENU_ITEM_ORDER,PERMISSIONS,SUB_GROUP,SUB_GROUP_ORDER,URL) VALUES
	 ('Administrator','Policy Controllers',100,'Profiles',100,'MANAGE_POLICY_CONTROLLER',NULL,NULL,'${server.name}/policy-controllers/#/profiles');
INSERT INTO MENU_ITEM (APPLICATION,MAIN_GROUP,MAIN_GROUP_ORDER,MENU_ITEM_NAME,MENU_ITEM_ORDER,PERMISSIONS,SUB_GROUP,SUB_GROUP_ORDER,URL) VALUES
	 ('Administrator','ICENets',200,'Status',100,'MANAGE_ICENET',NULL,NULL,'${server.name}/services/#/icenet/status');


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

UPDATE SYS_CONFIG SET SUB_GROUP_ORDER = 1 WHERE MAIN_GROUP = 'auth' AND SUB_GROUP = 'user.acc';
UPDATE SYS_CONFIG SET SUB_GROUP_ORDER = 2 WHERE MAIN_GROUP = 'auth' AND SUB_GROUP = 'pm';
UPDATE SYS_CONFIG SET SUB_GROUP_ORDER = 3 WHERE MAIN_GROUP = 'auth' AND SUB_GROUP = 'mfa';

UPDATE SYS_CONFIG SET SUB_GROUP_ORDER = 1 WHERE MAIN_GROUP = 'app' AND SUB_GROUP = 'remote.env';
UPDATE SYS_CONFIG SET SUB_GROUP_ORDER = 2 WHERE MAIN_GROUP = 'app' AND SUB_GROUP = 'policy.workflow';
UPDATE SYS_CONFIG SET SUB_GROUP_ORDER = 3 WHERE MAIN_GROUP = 'app' AND SUB_GROUP = 'data.transportation';
UPDATE SYS_CONFIG SET SUB_GROUP_ORDER = 4 WHERE MAIN_GROUP = 'app' AND SUB_GROUP = 'reporter.config';
UPDATE SYS_CONFIG SET SUB_GROUP_ORDER = 5 WHERE MAIN_GROUP = 'app' AND SUB_GROUP = 'archive';
UPDATE SYS_CONFIG SET SUB_GROUP_ORDER = 6 WHERE MAIN_GROUP = 'app' AND SUB_GROUP = 'index';
UPDATE SYS_CONFIG SET SUB_GROUP_ORDER = 7 WHERE MAIN_GROUP = 'app' AND SUB_GROUP = 'sync';

UPDATE SYS_CONFIG SET MAIN_GROUP_ORDER = 0 WHERE MAIN_GROUP = 'general';
UPDATE SYS_CONFIG SET MAIN_GROUP_ORDER = 10 WHERE MAIN_GROUP = 'app';
UPDATE SYS_CONFIG SET MAIN_GROUP_ORDER = 20 WHERE MAIN_GROUP = 'auth';
UPDATE SYS_CONFIG SET MAIN_GROUP_ORDER = 30 WHERE MAIN_GROUP = 'security';

MERGE INTO SYS_CONFIG SC1 USING (SELECT 'policy-controller-manager' AS APPLICATION, 'db.comboPooledDataSource.idleConnectionTestPeriod' AS CONFIG_KEY) AS SC2 ON (SC1.APPLICATION = SC2.APPLICATION AND SC1.CONFIG_KEY = SC2.CONFIG_KEY)
WHEN MATCHED THEN UPDATE SET VALUE = '30', DEFAULT_VALUE = '30', VALUE_FORMAT = '', MAIN_GROUP = 'db', SUB_GROUP = 'policy-controller-manager', MAIN_GROUP_ORDER = '20', SUB_GROUP_ORDER = '20', CONFIG_ORDER = '10', HIDDEN = '1', READ_ONLY = '0', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'integer', FIELD_TYPE = 'number' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = '', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES ('policy-controller-manager', 'db.comboPooledDataSource.idleConnectionTestPeriod', '30', '30', '', 'db', 'policy-controller-manager', '20', '20', '10', '1', '0', '1', '0', '0', '1', 'integer', 'number', '', '1', '', '', CURRENT_TIMESTAMP, '-1' )&semi;

MERGE INTO SYS_CONFIG SC1 USING (SELECT 'service-manager' AS APPLICATION, 'db.comboPooledDataSource.idleConnectionTestPeriod' AS CONFIG_KEY) AS SC2 ON (SC1.APPLICATION = SC2.APPLICATION AND SC1.CONFIG_KEY = SC2.CONFIG_KEY)
WHEN MATCHED THEN UPDATE SET VALUE = '30', DEFAULT_VALUE = '30', VALUE_FORMAT = '', MAIN_GROUP = 'db', SUB_GROUP = 'service-manager', MAIN_GROUP_ORDER = '20', SUB_GROUP_ORDER = '30', CONFIG_ORDER = '10', HIDDEN = '1', READ_ONLY = '0', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'integer', FIELD_TYPE = 'number' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = '', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES ('service-manager', 'db.comboPooledDataSource.idleConnectionTestPeriod', '30', '30', '', 'db', 'service-manager', '20', '30', '10', '1', '0', '1', '0', '0', '1', 'integer', 'number', '', '1', '', '', CURRENT_TIMESTAMP, '-1' )&semi;

--
-- Enrollment archive tables
--
CREATE TABLE [dbo].[ARCHIVE_DICT_ELEMENTS](
	[ID] [numeric](19, 0) NOT NULL,
	[VERSION] [int] NOT NULL,
	[ORIGINAL_ID] [numeric](19, 0) NULL,
	[ENROLLMENT_ID] [numeric](19, 0) NOT NULL,
	[DICTIONARY_KEY] [nvarchar](900) NULL,
	[UNIQUE_NAME] [nvarchar](128) NULL,
	[displayName] [nvarchar](128) NULL,
	[PATH] [nvarchar](900) NOT NULL,
	[PATH_HASH] [numeric](19, 0) NOT NULL,
	[REPARENTED] [char](1) NULL,
	[ACTIVE_FROM] [numeric](19, 0) NOT NULL,
	[ACTIVE_TO] [numeric](19, 0) NOT NULL
);

CREATE TABLE [dbo].[ARCHIVE_DICT_ENUM_GROUP_MEMBERS](
	[ID] [numeric](19, 0) NOT NULL,
	[VERSION] [int] NOT NULL,
	[FROM_ID] [numeric](19, 0) NOT NULL,
	[TO_ID] [numeric](19, 0) NULL,
	[ENROLLMENT_ID] [numeric](19, 0) NOT NULL,
	[IS_DIRECT] [char](1) NOT NULL,
	[ACTIVE_FROM] [numeric](19, 0) NOT NULL,
	[ACTIVE_TO] [numeric](19, 0) NOT NULL
);

CREATE TABLE [dbo].[ARCHIVE_DICT_ENUM_GROUPS](
	[ELEMENT_ID] [numeric](19, 0) NOT NULL
);

CREATE TABLE [dbo].[ARCHIVE_DICT_ENUM_MEMBERS](
	[ID] [numeric](19, 0) NOT NULL,
	[VERSION] [int] NOT NULL,
	[GROUP_ID] [numeric](19, 0) NOT NULL,
	[MEMBER_ID] [numeric](19, 0) NOT NULL,
	[ELEMENT_TYPE_ID] [numeric](19, 0) NOT NULL,
	[ENROLLMENT_ID] [numeric](19, 0) NOT NULL,
	[ACTIVE_FROM] [numeric](19, 0) NOT NULL,
	[ACTIVE_TO] [numeric](19, 0) NOT NULL
);

CREATE TABLE [dbo].[ARCHIVE_DICT_STRUCT_GROUPS](
	[ELEMENT_ID] [numeric](19, 0) NOT NULL,
	[FILTER] [nvarchar](900) NOT NULL,
	[filterLength] [int]
);

IF ((SELECT CHARACTER_MAXIMUM_LENGTH FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME = 'STRING00' and TABLE_NAME = 'DICT_LEAF_ELEMENTS') = 4000)
BEGIN
  CREATE TABLE [dbo].[ARCHIVE_DICT_LEAF_ELEMENTS](
	[element_id] [numeric](19, 0) NOT NULL,
	[TYPE_ID] [numeric](19, 0) NULL,
	[String00] [nvarchar](4000) NULL,
	[String01] [nvarchar](4000) NULL,
	[String02] [nvarchar](4000) NULL,
	[String03] [nvarchar](4000) NULL,
	[String04] [nvarchar](4000) NULL,
	[String05] [nvarchar](4000) NULL,
	[String06] [nvarchar](4000) NULL,
	[String07] [nvarchar](4000) NULL,
	[String08] [nvarchar](4000) NULL,
	[String09] [nvarchar](4000) NULL,
	[String10] [nvarchar](4000) NULL,
	[String11] [nvarchar](4000) NULL,
	[String12] [nvarchar](4000) NULL,
	[String13] [nvarchar](4000) NULL,
	[String14] [nvarchar](4000) NULL,
	[String15] [nvarchar](4000) NULL,
	[String16] [nvarchar](4000) NULL,
	[String17] [nvarchar](4000) NULL,
	[String18] [nvarchar](4000) NULL,
	[String19] [nvarchar](4000) NULL,
	[String20] [nvarchar](4000) NULL,
	[String21] [nvarchar](4000) NULL,
	[String22] [nvarchar](4000) NULL,
	[String23] [nvarchar](4000) NULL,
	[String24] [nvarchar](4000) NULL,
	[String25] [nvarchar](4000) NULL,
	[String26] [nvarchar](4000) NULL,
	[String27] [nvarchar](4000) NULL,
	[String28] [nvarchar](4000) NULL,
	[String29] [nvarchar](4000) NULL,
	[String30] [nvarchar](4000) NULL,
	[String31] [nvarchar](4000) NULL,
	[String32] [nvarchar](4000) NULL,
	[String33] [nvarchar](4000) NULL,
	[String34] [nvarchar](4000) NULL,
	[String35] [nvarchar](4000) NULL,
	[String36] [nvarchar](4000) NULL,
	[String37] [nvarchar](4000) NULL,
	[String38] [nvarchar](4000) NULL,
	[String39] [nvarchar](4000) NULL,
	[String40] [nvarchar](4000) NULL,
	[String41] [nvarchar](4000) NULL,
	[String42] [nvarchar](4000) NULL,
	[String43] [nvarchar](4000) NULL,
	[String44] [nvarchar](4000) NULL,
	[String45] [nvarchar](4000) NULL,
	[String46] [nvarchar](4000) NULL,
	[String47] [nvarchar](4000) NULL,
	[String48] [nvarchar](4000) NULL,
	[String49] [nvarchar](4000) NULL,
	[Number00] [numeric](19, 0) NULL,
	[Number01] [numeric](19, 0) NULL,
	[Number02] [numeric](19, 0) NULL,
	[Number03] [numeric](19, 0) NULL,
	[Number04] [numeric](19, 0) NULL,
	[Number05] [numeric](19, 0) NULL,
	[Number06] [numeric](19, 0) NULL,
	[Number07] [numeric](19, 0) NULL,
	[Number08] [numeric](19, 0) NULL,
	[Number09] [numeric](19, 0) NULL,
	[Number10] [numeric](19, 0) NULL,
	[Number11] [numeric](19, 0) NULL,
	[Number12] [numeric](19, 0) NULL,
	[Number13] [numeric](19, 0) NULL,
	[Number14] [numeric](19, 0) NULL,
	[Number15] [numeric](19, 0) NULL,
	[Number16] [numeric](19, 0) NULL,
	[Number17] [numeric](19, 0) NULL,
	[Number18] [numeric](19, 0) NULL,
	[Number19] [numeric](19, 0) NULL,
	[Date00] [numeric](19, 0) NULL,
	[Date01] [numeric](19, 0) NULL,
	[Date02] [numeric](19, 0) NULL,
	[Date03] [numeric](19, 0) NULL,
	[Date04] [numeric](19, 0) NULL,
	[Date05] [numeric](19, 0) NULL,
	[Date06] [numeric](19, 0) NULL,
	[Date07] [numeric](19, 0) NULL,
	[Date08] [numeric](19, 0) NULL,
	[Date09] [numeric](19, 0) NULL,
	[Date10] [numeric](19, 0) NULL,
	[Date11] [numeric](19, 0) NULL,
	[Date12] [numeric](19, 0) NULL,
	[Date13] [numeric](19, 0) NULL,
	[Date14] [numeric](19, 0) NULL,
	[Date15] [numeric](19, 0) NULL,
	[Date16] [numeric](19, 0) NULL,
	[Date17] [numeric](19, 0) NULL,
	[Date18] [numeric](19, 0) NULL,
	[Date19] [numeric](19, 0) NULL,
	[NUMARRAY00] [nvarchar](2048) NULL,
	[NUMARRAY01] [nvarchar](2048) NULL,
	[NUMARRAY02] [nvarchar](2048) NULL,
	[NUMARRAY03] [nvarchar](2048) NULL)
END
ELSE
BEGIN
  CREATE TABLE [dbo].[ARCHIVE_DICT_LEAF_ELEMENTS](
	[element_id] [numeric](19, 0) NOT NULL,
	[TYPE_ID] [numeric](19, 0) NULL,
	[String00] [nvarchar](MAX) NULL,
	[String01] [nvarchar](MAX) NULL,
	[String02] [nvarchar](MAX) NULL,
	[String03] [nvarchar](MAX) NULL,
	[String04] [nvarchar](MAX) NULL,
	[String05] [nvarchar](MAX) NULL,
	[String06] [nvarchar](MAX) NULL,
	[String07] [nvarchar](MAX) NULL,
	[String08] [nvarchar](MAX) NULL,
	[String09] [nvarchar](MAX) NULL,
	[String10] [nvarchar](MAX) NULL,
	[String11] [nvarchar](MAX) NULL,
	[String12] [nvarchar](MAX) NULL,
	[String13] [nvarchar](MAX) NULL,
	[String14] [nvarchar](MAX) NULL,
	[String15] [nvarchar](MAX) NULL,
	[String16] [nvarchar](MAX) NULL,
	[String17] [nvarchar](MAX) NULL,
	[String18] [nvarchar](MAX) NULL,
	[String19] [nvarchar](MAX) NULL,
	[String20] [nvarchar](MAX) NULL,
	[String21] [nvarchar](MAX) NULL,
	[String22] [nvarchar](MAX) NULL,
	[String23] [nvarchar](MAX) NULL,
	[String24] [nvarchar](MAX) NULL,
	[String25] [nvarchar](MAX) NULL,
	[String26] [nvarchar](MAX) NULL,
	[String27] [nvarchar](MAX) NULL,
	[String28] [nvarchar](MAX) NULL,
	[String29] [nvarchar](MAX) NULL,
	[String30] [nvarchar](MAX) NULL,
	[String31] [nvarchar](MAX) NULL,
	[String32] [nvarchar](MAX) NULL,
	[String33] [nvarchar](MAX) NULL,
	[String34] [nvarchar](MAX) NULL,
	[String35] [nvarchar](MAX) NULL,
	[String36] [nvarchar](MAX) NULL,
	[String37] [nvarchar](MAX) NULL,
	[String38] [nvarchar](MAX) NULL,
	[String39] [nvarchar](MAX) NULL,
	[String40] [nvarchar](MAX) NULL,
	[String41] [nvarchar](MAX) NULL,
	[String42] [nvarchar](MAX) NULL,
	[String43] [nvarchar](MAX) NULL,
	[String44] [nvarchar](MAX) NULL,
	[String45] [nvarchar](MAX) NULL,
	[String46] [nvarchar](MAX) NULL,
	[String47] [nvarchar](MAX) NULL,
	[String48] [nvarchar](MAX) NULL,
	[String49] [nvarchar](MAX) NULL,
	[Number00] [numeric](19, 0) NULL,
	[Number01] [numeric](19, 0) NULL,
	[Number02] [numeric](19, 0) NULL,
	[Number03] [numeric](19, 0) NULL,
	[Number04] [numeric](19, 0) NULL,
	[Number05] [numeric](19, 0) NULL,
	[Number06] [numeric](19, 0) NULL,
	[Number07] [numeric](19, 0) NULL,
	[Number08] [numeric](19, 0) NULL,
	[Number09] [numeric](19, 0) NULL,
	[Number10] [numeric](19, 0) NULL,
	[Number11] [numeric](19, 0) NULL,
	[Number12] [numeric](19, 0) NULL,
	[Number13] [numeric](19, 0) NULL,
	[Number14] [numeric](19, 0) NULL,
	[Number15] [numeric](19, 0) NULL,
	[Number16] [numeric](19, 0) NULL,
	[Number17] [numeric](19, 0) NULL,
	[Number18] [numeric](19, 0) NULL,
	[Number19] [numeric](19, 0) NULL,
	[Date00] [numeric](19, 0) NULL,
	[Date01] [numeric](19, 0) NULL,
	[Date02] [numeric](19, 0) NULL,
	[Date03] [numeric](19, 0) NULL,
	[Date04] [numeric](19, 0) NULL,
	[Date05] [numeric](19, 0) NULL,
	[Date06] [numeric](19, 0) NULL,
	[Date07] [numeric](19, 0) NULL,
	[Date08] [numeric](19, 0) NULL,
	[Date09] [numeric](19, 0) NULL,
	[Date10] [numeric](19, 0) NULL,
	[Date11] [numeric](19, 0) NULL,
	[Date12] [numeric](19, 0) NULL,
	[Date13] [numeric](19, 0) NULL,
	[Date14] [numeric](19, 0) NULL,
	[Date15] [numeric](19, 0) NULL,
	[Date16] [numeric](19, 0) NULL,
	[Date17] [numeric](19, 0) NULL,
	[Date18] [numeric](19, 0) NULL,
	[Date19] [numeric](19, 0) NULL,
	[NUMARRAY00] [nvarchar](2048) NULL,
	[NUMARRAY01] [nvarchar](2048) NULL,
	[NUMARRAY02] [nvarchar](2048) NULL,
	[NUMARRAY03] [nvarchar](2048) NULL)
END;

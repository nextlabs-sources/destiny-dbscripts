DELETE FROM MENU_ITEM WHERE APPLICATION = 'Administrator';

INSERT INTO MENU_ITEM (APPLICATION,MAIN_GROUP,MAIN_GROUP_ORDER,SUB_GROUP,SUB_GROUP_ORDER,MENU_ITEM_NAME,MENU_ITEM_ORDER,PERMISSIONS,URL) VALUES
	 ('Policy Studio','',0,NULL,NULL,'Dashboard',100,'AUTHORISED','${server.name}/console/#/Dashboard');
INSERT INTO MENU_ITEM (APPLICATION,MAIN_GROUP,MAIN_GROUP_ORDER,SUB_GROUP,SUB_GROUP_ORDER,MENU_ITEM_NAME,MENU_ITEM_ORDER,PERMISSIONS,URL) VALUES
	 ('Policy Studio','Policy model',200,NULL,NULL,'Component types',100,'VIEW_POLICY_MODEL','${server.name}/console/#/PolicyStudio/PolicyModel');
INSERT INTO MENU_ITEM (APPLICATION,MAIN_GROUP,MAIN_GROUP_ORDER,SUB_GROUP,SUB_GROUP_ORDER,MENU_ITEM_NAME,MENU_ITEM_ORDER,PERMISSIONS,URL) VALUES
	 ('Policy Studio','Policy model',200,'Components',100,'Subjects',200,'VIEW_COMPONENT,VIEW_COMPONENT_FOLDER','${server.name}/console/#/PolicyStudio/Components/Subject');
INSERT INTO MENU_ITEM (APPLICATION,MAIN_GROUP,MAIN_GROUP_ORDER,SUB_GROUP,SUB_GROUP_ORDER,MENU_ITEM_NAME,MENU_ITEM_ORDER,PERMISSIONS,URL) VALUES
	 ('Policy Studio','Policy model',200,'Components',100,'Resources',300,'VIEW_COMPONENT,VIEW_COMPONENT_FOLDER','${server.name}/console/#/PolicyStudio/Components/Resource');
INSERT INTO MENU_ITEM (APPLICATION,MAIN_GROUP,MAIN_GROUP_ORDER,SUB_GROUP,SUB_GROUP_ORDER,MENU_ITEM_NAME,MENU_ITEM_ORDER,PERMISSIONS,URL) VALUES
	 ('Policy Studio','Policy model',200,'Components',100,'Actions',400,'VIEW_COMPONENT,VIEW_COMPONENT_FOLDER','${server.name}/console/#/PolicyStudio/Components/Action');
INSERT INTO MENU_ITEM (APPLICATION,MAIN_GROUP,MAIN_GROUP_ORDER,SUB_GROUP,SUB_GROUP_ORDER,MENU_ITEM_NAME,MENU_ITEM_ORDER,PERMISSIONS,URL) VALUES
	 ('Policy Studio','Policy model',200,NULL,NULL,'Policies',500,'VIEW_POLICY,VIEW_POLICY_FOLDER','${server.name}/console/#/PolicyStudio/Policies');
INSERT INTO MENU_ITEM (APPLICATION,MAIN_GROUP,MAIN_GROUP_ORDER,SUB_GROUP,SUB_GROUP_ORDER,MENU_ITEM_NAME,MENU_ITEM_ORDER,PERMISSIONS,URL) VALUES
	 ('Policy Studio','Policy model',200,NULL,NULL,'XACML policies',600,'XACML_POLICY','${server.name}/console/#/PolicyStudio/Tools/XacmlPolicy/list');
INSERT INTO MENU_ITEM (APPLICATION,MAIN_GROUP,MAIN_GROUP_ORDER,SUB_GROUP,SUB_GROUP_ORDER,MENU_ITEM_NAME,MENU_ITEM_ORDER,PERMISSIONS,URL) VALUES
	 ('Policy Studio','Policy model',200,NULL,NULL,'Policy validator',700,'POLICY_VALIDATOR','${server.name}/policy-validator');
INSERT INTO MENU_ITEM (APPLICATION,MAIN_GROUP,MAIN_GROUP_ORDER,SUB_GROUP,SUB_GROUP_ORDER,MENU_ITEM_NAME,MENU_ITEM_ORDER,PERMISSIONS,URL) VALUES
	 ('Policy Studio','Attributes',300,NULL,NULL,'Properties',100,'ENROLLMENT_MANAGEMENT','${server.name}/console/#/PolicyStudio/Tools/EnrollmentManagement/Property/list');
INSERT INTO MENU_ITEM (APPLICATION,MAIN_GROUP,MAIN_GROUP_ORDER,SUB_GROUP,SUB_GROUP_ORDER,MENU_ITEM_NAME,MENU_ITEM_ORDER,PERMISSIONS,URL) VALUES
	 ('Policy Studio','Attributes',300,NULL,NULL,'Data sources',200,'ENROLLMENT_MANAGEMENT','${server.name}/console/#/PolicyStudio/Tools/EnrollmentManagement/Enrollments');
INSERT INTO MENU_ITEM (APPLICATION,MAIN_GROUP,MAIN_GROUP_ORDER,SUB_GROUP,SUB_GROUP_ORDER,MENU_ITEM_NAME,MENU_ITEM_ORDER,PERMISSIONS,URL) VALUES
	 ('Policy Studio','Attributes',300,NULL,NULL,'Data viewer',300,'ENROLLMENT_MANAGEMENT','${server.name}/console/#/PolicyStudio/Tools/EnrollmentManagement/EnrolledDataViewer');
INSERT INTO MENU_ITEM (APPLICATION,MAIN_GROUP,MAIN_GROUP_ORDER,SUB_GROUP,SUB_GROUP_ORDER,MENU_ITEM_NAME,MENU_ITEM_ORDER,PERMISSIONS,URL) VALUES
	 ('Policy Studio','Attributes',300,NULL,NULL,'Locations',400,'ENROLLMENT_MANAGEMENT','${server.name}/console/#/PolicyStudio/Tools/EnrollmentManagement/Locations/list');

INSERT INTO MENU_ITEM (APPLICATION,MAIN_GROUP,MAIN_GROUP_ORDER,SUB_GROUP,SUB_GROUP_ORDER,MENU_ITEM_NAME,MENU_ITEM_ORDER,PERMISSIONS,URL) VALUES
	 ('System Administration','Policy controllers',100,NULL,NULL,'Status',100,'MANAGE_POLICY_CONTROLLER','${server.name}/policy-controllers/#/status');
INSERT INTO MENU_ITEM (APPLICATION,MAIN_GROUP,MAIN_GROUP_ORDER,SUB_GROUP,SUB_GROUP_ORDER,MENU_ITEM_NAME,MENU_ITEM_ORDER,PERMISSIONS,URL) VALUES
	 ('System Administration','Policy controllers',100,NULL,NULL,'Profiles',200,'MANAGE_POLICY_CONTROLLER_PROFILE','${server.name}/policy-controllers/#/profiles');
INSERT INTO MENU_ITEM (APPLICATION,MAIN_GROUP,MAIN_GROUP_ORDER,SUB_GROUP,SUB_GROUP_ORDER,MENU_ITEM_NAME,MENU_ITEM_ORDER,PERMISSIONS,URL) VALUES
     ('System Administration','Policy controllers',100,NULL,NULL,'Plugins',300,'MANAGE_PDP_PLUGIN','${server.name}/console/#/PolicyStudio/Tools/PDPPlugin');
INSERT INTO MENU_ITEM (APPLICATION,MAIN_GROUP,MAIN_GROUP_ORDER,SUB_GROUP,SUB_GROUP_ORDER,MENU_ITEM_NAME,MENU_ITEM_ORDER,PERMISSIONS,URL) VALUES
	 ('System Administration','ICENets',200,NULL,NULL,'Status',100,'MANAGE_ICENET','${server.name}/services/#/icenet/status');
INSERT INTO MENU_ITEM (APPLICATION,MAIN_GROUP,MAIN_GROUP_ORDER,SUB_GROUP,SUB_GROUP_ORDER,MENU_ITEM_NAME,MENU_ITEM_ORDER,PERMISSIONS,URL) VALUES
	 ('System Administration','Application users',300,NULL,NULL,'User sources',100,'MANAGE_USERS','${server.name}/console/#/loginconfig/usersource');
INSERT INTO MENU_ITEM (APPLICATION,MAIN_GROUP,MAIN_GROUP_ORDER,SUB_GROUP,SUB_GROUP_ORDER,MENU_ITEM_NAME,MENU_ITEM_ORDER,PERMISSIONS,URL) VALUES
	 ('System Administration','Application users',300,NULL,NULL,'Users',200,'MANAGE_USERS','${server.name}/console/#/Users/userlist');
INSERT INTO MENU_ITEM (APPLICATION,MAIN_GROUP,MAIN_GROUP_ORDER,SUB_GROUP,SUB_GROUP_ORDER,MENU_ITEM_NAME,MENU_ITEM_ORDER,PERMISSIONS,URL) VALUES
	 ('System Administration','Application users',300,NULL,NULL,'Groups',300,'MANAGE_USERS','${server.name}/console/#/Users/grouplist');
INSERT INTO MENU_ITEM (APPLICATION,MAIN_GROUP,MAIN_GROUP_ORDER,SUB_GROUP,SUB_GROUP_ORDER,MENU_ITEM_NAME,MENU_ITEM_ORDER,PERMISSIONS,URL) VALUES
	 ('System Administration','Application users',300,NULL,NULL,'Delegation policies',400,'MANAGE_DELEGATION_POLICIES','${server.name}/console/#/Delegations/');
INSERT INTO MENU_ITEM (APPLICATION,MAIN_GROUP,MAIN_GROUP_ORDER,SUB_GROUP,SUB_GROUP_ORDER,MENU_ITEM_NAME,MENU_ITEM_ORDER,PERMISSIONS,URL) VALUES
	 ('System Administration','Configuration',300,NULL,NULL,'System',200,'MANAGE_SYSTEM_CONFIGURATION','${server.name}/console/#/PolicyStudio/Configuration/System');
INSERT INTO MENU_ITEM (APPLICATION,MAIN_GROUP,MAIN_GROUP_ORDER,SUB_GROUP,SUB_GROUP_ORDER,MENU_ITEM_NAME,MENU_ITEM_ORDER,PERMISSIONS,URL) VALUES
	 ('System Administration','Configuration',400,NULL,NULL,'Logging',300,'MANAGE_LOGGING_CONFIGURATION','${server.name}/console/#/PolicyStudio/Configuration/Log');
INSERT INTO MENU_ITEM (APPLICATION,MAIN_GROUP,MAIN_GROUP_ORDER,SUB_GROUP,SUB_GROUP_ORDER,MENU_ITEM_NAME,MENU_ITEM_ORDER,PERMISSIONS,URL) VALUES
	 ('System Administration','Configuration',400,NULL,NULL,'TLS',400,'MANAGE_SECURE_STORE','${server.name}/console/#/PolicyStudio/Tools/SecureStore');
INSERT INTO MENU_ITEM (APPLICATION,MAIN_GROUP,MAIN_GROUP_ORDER,SUB_GROUP,SUB_GROUP_ORDER,MENU_ITEM_NAME,MENU_ITEM_ORDER,PERMISSIONS,URL) VALUES
	 ('System Administration','Configuration',400,NULL,NULL,'Environment target hosts',500,'VIEW_ENVIRONMENT_CONFIGURATION','${server.name}/console/#/PolicyStudio/Configuration/Environment');
INSERT INTO MENU_ITEM (APPLICATION,MAIN_GROUP,MAIN_GROUP_ORDER,SUB_GROUP,SUB_GROUP_ORDER,MENU_ITEM_NAME,MENU_ITEM_ORDER,PERMISSIONS,URL) VALUES
	 ('System Administration','',0,NULL,NULL,'Dashboard',100,'AUTHORISED','${server.name}/services/#/dashboard');

INSERT INTO MENU_ITEM (APPLICATION,MAIN_GROUP,MAIN_GROUP_ORDER,SUB_GROUP,SUB_GROUP_ORDER,MENU_ITEM_NAME,MENU_ITEM_ORDER,PERMISSIONS,URL) VALUES
	 ('Audit and Report',NULL,NULL,NULL,NULL,'Audit and Report',100,'MANAGE_REPORTER','${server.name}/reporter');

DELETE FROM PM_ACTION_CONFIG WHERE SHORT_NAME IN ('VIEW_XACML_POLICY', 'CREATE_XACML_POLICY', 'DELETE_XACML_POLICY');
DELETE FROM DEVELOPMENT_ENTITIES WHERE DESCRIPTION IN ('View Xacml Policy', 'Create Xacml Policy', 'Delete Xacml Policy');

UPDATE SYS_CONFIG SET APPLICATION = 'application' WHERE APPLICATION = 'console' AND CONFIG_KEY = 'mm.dd.yyyy';

ALTER TABLE DICT_ELEMENTS ALTER COLUMN UNIQUE_NAME NVARCHAR (255) NULL;

DROP VIEW IF EXISTS COMPONENT_INFO;

CREATE VIEW COMPONENT_INFO AS (
SELECT
	COMPONENT.COMPONENTURL,
	COMPONENT.HEARTBEATRATE,
	COMPONENT.ID,
	COMPONENT.LASTHEARTBEAT,
	COMPONENT.NAME,
	COMPONENT.TYPE,
	COMPONENT.TYPEDISPLAYNAME,
	CASE
		WHEN (COMPONENT.LASTHEARTBEAT + COMPONENT.HEARTBEATRATE * 1000) > (
		SELECT
			DATEDIFF(SECOND, '19700101', SYSUTCDATETIME()) * CAST(1000 AS BIGINT)) THEN 'ACTIVE'
		ELSE 'INACTIVE'
	END STATUS
FROM
	COMPONENT);

UPDATE SYS_CONFIG SET APPLICATION = 'application' WHERE CONFIG_KEY = 'db.hibernate.ddl.auto' AND APPLICATION = 'console';
UPDATE SYS_CONFIG SET APPLICATION = 'application' WHERE CONFIG_KEY = 'db.hibernate.show.sql' AND APPLICATION = 'console';

UPDATE ACCESS_CONTROL SET EXPRESSION = 'hasAuthority(''XACML_POLICY'')' WHERE EXPRESSION IN ('hasAuthority(''VIEW_XACML_POLICY'')', 'hasAuthority(''CREATE_XACML_POLICY'')', 'hasAuthority(''DELETE_XACML_POLICY'')');

UPDATE SYS_CONFIG SET CONFIG_KEY = 'cc-oidc-config.services[0].encryptIdToken', VALUE = 'false', DEFAULT_VALUE = 'false' WHERE CONFIG_KEY = 'cc-oidc-config.services[0].serviceId.encryptIdToken';
UPDATE SYS_CONFIG SET VALUE = 'https://docs.nextlabs.com/cc/2022.05' WHERE APPLICATION = 'application' AND CONFIG_KEY = 'help.url.base';
UPDATE SYS_CONFIG SET VALUE = '(${server.name}|https://${server.hostname})(:\d*)?\/.*', DEFAULT_VALUE = '(${server.name}|https://${server.hostname})(:\d*)?\/.*' WHERE CONFIG_KEY ='cc-oidc-config.services[0].serviceId';
UPDATE SYS_CONFIG SET VALUE = LOWER(VALUE), DEFAULT_VALUE = LOWER(DEFAULT_VALUE) WHERE CONFIG_KEY IN ('config.activeMQConnectionFactory.brokerURL', 'server.name', 'web.service.server.name', 'policyValidator.url');

UPDATE SECURE_STORE SET NAME = 'fpe-keystore.p12' WHERE NAME = 'fpe-keystore.jks';
MERGE INTO ACCESS_CONTROL AC1 USING (SELECT 'GET' AS REQUEST_METHOD, '/api/v1/secureStore/getEntriesByStore/{storeName:.+}' AS URL_PATTERN) AS AC2 ON (AC1.REQUEST_METHOD = AC2.REQUEST_METHOD AND AC1.URL_PATTERN = AC2.URL_PATTERN)
WHEN NOT MATCHED THEN INSERT (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('GET', '/api/v1/secureStore/getEntriesByStore/{storeName:.+}', 'hasAuthority(''MANAGE_SECURE_STORE'')')&semi;

UPDATE LOGGER_CONFIG SET CONFIG =
'<?xml version="1.0" encoding="UTF-8"?>
<!--LOGGER_DISPLAY_NAMES
=General
com.bluejungle.pf.engine.destiny=Policy Evaluation
org.apereo.cas=CAS Framework
perfStatsLogger=CAS Performance Stats
org.hibernate=Hibernate Framework
com.mchange=Connection Pool
org.elasticsearch.client=Elastic Search
-->
<Configuration status="WARN">
    <Properties>
        <Property name="logging.pattern">%d %-5p [%t] %c{1.}: %enc{%m}{CRLF}%n</Property>
        <Property name="file.path">${sys:cc.home}/server/logs/${sys:server.hostname}</Property>
        <Property name="file.prefix">${sys:cc.home}/server/logs/${sys:server.hostname}/${web:contextPath}</Property>
    </Properties>
    <Appenders>
        <Console name="Console" target="SYSTEM_OUT">
            <PatternLayout pattern="${logging.pattern}"/>
        </Console>
        <RollingFile name="PolicyEvaluationLog" fileName="${file.prefix}.policyevaluation.log"
                     filePattern="${file.prefix}.policyevaluation-%i.log.gz" createOnDemand="true">
            <PatternLayout>
                <Pattern>${logging.pattern}</Pattern>
            </PatternLayout>
            <Policies>
                <SizeBasedTriggeringPolicy size="2 MB"/>
            </Policies>
            <DefaultRolloverStrategy max="2"/>
        </RollingFile>
        <RollingFile name="RootLogFile" fileName="${file.prefix}.log"
                     filePattern="${file.prefix}-%i.log.gz" createOnDemand="true">
            <PatternLayout>
                <Pattern>${logging.pattern}</Pattern>
            </PatternLayout>
            <Policies>
                <SizeBasedTriggeringPolicy size="2 MB"/>
            </Policies>
            <DefaultRolloverStrategy max="10"/>
        </RollingFile>
    </Appenders>
    <Loggers>
        <Root level="INFO">
            <AppenderRef ref="Console"/>
            <AppenderRef ref="RootLogFile"/>
        </Root>
        <Logger name="com.bluejungle.pf.engine.destiny" level="INFO">
            <AppenderRef ref="PolicyEvaluationLog"/>
            <AppenderRef ref="Console"/>
            <AppenderRef ref="RootLogFile"/>
        </Logger>
        <Logger name="com.mchange" level="ERROR">
        </Logger>
        <Logger name="perfStatsLogger" level="OFF">
        </Logger>
        <Logger name="org.hibernate" level="ERROR">
        </Logger>
        <Logger name="org.apereo.cas" level="WARN">
        </Logger>
        <Logger name="org.elasticsearch.client" level="ERROR">
        </Logger>
    </Loggers>
</Configuration>
'
WHERE TYPE = 'DEFAULT';

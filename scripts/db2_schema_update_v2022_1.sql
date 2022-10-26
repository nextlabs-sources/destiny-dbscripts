MERGE INTO SYS_CONFIG USING (SELECT 1 FROM SYSIBM.SYSDUMMY1) ON (APPLICATION = 'application' AND CONFIG_KEY = 'cc-oidc-config.services[0].bypassApprovalPrompt')
WHEN MATCHED THEN UPDATE SET VALUE = 'true', DEFAULT_VALUE = 'ture', VALUE_FORMAT = '', MAIN_GROUP = 'security', SUB_GROUP = 'cas-oidc-policy-validator', MAIN_GROUP_ORDER = '40', SUB_GROUP_ORDER = '30', CONFIG_ORDER = '42', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '0', DATA_TYPE = 'boolean', FIELD_TYPE = 'checkbox' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'Bypass CAS OIDC approval prompt.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'application', 'cc-oidc-config.services[0].bypassApprovalPrompt', 'true', 'ture', '', 'security', 'cas-oidc-policy-validator', '40', '5', '0', '1', '1', '1', '0', '0', '0', 'boolean', 'checkbox', '', '1', '', 'Bypass CAS OIDC approval prompt.', CURRENT_TIMESTAMP, '-1' );

MERGE INTO SYS_CONFIG USING (SELECT 1 FROM SYSIBM.SYSDUMMY1) ON (APPLICATION = 'application' AND CONFIG_KEY = 'cc-oidc-config.services[0].serviceId')
WHEN MATCHED THEN UPDATE SET VALUE = '${server.name}(:\d*)?\/.*', DEFAULT_VALUE = '${server.name}(:\d*)?\/.*', VALUE_FORMAT = '', MAIN_GROUP = 'security', SUB_GROUP = 'cas', MAIN_GROUP_ORDER = '40', SUB_GROUP_ORDER = '5', CONFIG_ORDER = '0', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '0', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'OIDC service id', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'application', 'cc-oidc-config.services[0].serviceId', '${server.name}(:\d*)?\/.*', '${server.name}(:\d*)?\/.*', '', 'security', 'cas', '40', '5', '0', '1', '1', '1', '0', '0', '0', 'text', 'text', '', '1', '', 'OIDC service id', CURRENT_TIMESTAMP, '-1' );

DELETE FROM SYS_CONFIG WHERE CONFIG_KEY = 'cc-oidc-config.services[1].bypassApprovalPrompt' AND APPLICATION = 'application';
DELETE FROM SYS_CONFIG WHERE CONFIG_KEY = 'cc-oidc-config.services[1].clientId' AND APPLICATION = 'application';
DELETE FROM SYS_CONFIG WHERE CONFIG_KEY = 'cc-oidc-config.services[1].clientSecret' AND APPLICATION = 'application';
DELETE FROM SYS_CONFIG WHERE CONFIG_KEY = 'cc-oidc-config.services[1].encryptIdToken' AND APPLICATION = 'application';
DELETE FROM SYS_CONFIG WHERE CONFIG_KEY = 'cc-oidc-config.services[1].serviceId' AND APPLICATION = 'application';

UPDATE ACCESS_CONTROL SET REQUEST_METHOD = 'DELETE' WHERE URL_PATTERN = '/api/v1/tools/property/delete';

MERGE INTO SYS_CONFIG USING (SELECT 1 FROM SYSIBM.SYSDUMMY1) ON (APPLICATION = 'service-manager' AND CONFIG_KEY = 'spring.security.oauth2.resourceserver.jwt.issuer-uri')
WHEN MATCHED THEN UPDATE SET VALUE = '${server.name}/cas/oidc', DEFAULT_VALUE = '${server.name}/cas/oidc', VALUE_FORMAT = '', MAIN_GROUP = 'security', SUB_GROUP = 'service-manager', MAIN_GROUP_ORDER = '40', SUB_GROUP_ORDER = '120', CONFIG_ORDER = '0', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '0', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'JWT Issuer URI', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'service-manager', 'spring.security.oauth2.resourceserver.jwt.issuer-uri', '${server.name}/cas/oidc', '${server.name}/cas/oidc', '', 'security', 'service-manager', '40', '120', '0', '1', '1', '1', '0', '0', '0', 'text', 'text', '', '1', '', 'JWT Issuer URI', CURRENT_TIMESTAMP, '-1' );

MERGE INTO SYS_CONFIG USING (SELECT 1 FROM SYSIBM.SYSDUMMY1) ON (APPLICATION = 'policy-controller-manager' AND CONFIG_KEY = 'spring.security.oauth2.resourceserver.jwt.issuer-uri')
WHEN MATCHED THEN UPDATE SET VALUE = '${server.name}/cas/oidc', DEFAULT_VALUE = '${server.name}/cas/oidc', VALUE_FORMAT = '', MAIN_GROUP = 'security', SUB_GROUP = 'policy-controller-manager', MAIN_GROUP_ORDER = '40', SUB_GROUP_ORDER = '110', CONFIG_ORDER = '0', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '0', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'JWT Issuer URI', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'policy-controller-manager', 'spring.security.oauth2.resourceserver.jwt.issuer-uri', '${server.name}/cas/oidc', '${server.name}/cas/oidc', '', 'security', 'policy-controller-manager', '40', '110', '0', '1', '1', '1', '0', '0', '0', 'text', 'text', '', '1', '', 'JWT Issuer URI', CURRENT_TIMESTAMP, '-1' );

MERGE INTO SYS_CONFIG USING (SELECT 1 FROM SYSIBM.SYSDUMMY1) ON (APPLICATION = 'config-service' AND CONFIG_KEY = 'client.applications')
WHEN MATCHED THEN UPDATE SET VALUE = 'console,cas,reporter,administrator,dabs,dac,dcsf,dem,dkms,dms,dps,policy-controller-manager,service-manager', DEFAULT_VALUE = 'console,cas,reporter,administrator,dabs,dac,dcsf,dem,dkms,dms,dps,policy-controller-manager,service-manager', VALUE_FORMAT = '', MAIN_GROUP = 'engine', SUB_GROUP = 'configClient', MAIN_GROUP_ORDER = '30', SUB_GROUP_ORDER = '1', CONFIG_ORDER = '0', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '0', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'text', FIELD_TYPE = 'multi-value' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'Configuration updates will be sent to the specified applications only.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'config-service', 'client.applications', 'console,cas,reporter,administrator,dabs,dac,dcsf,dem,dkms,dms,dps,policy-controller-manager,service-manager', 'console,cas,reporter,administrator,dabs,dac,dcsf,dem,dkms,dms,dps,policy-controller-manager,service-manager', '', 'engine', 'configClient', '30', '1', '0', '1', '1', '0', '0', '0', '1', 'text', 'multi-value', '', '1', '', 'Configuration updates will be sent to the specified applications only.', CURRENT_TIMESTAMP, '-1' );

MERGE INTO SYS_CONFIG USING (SELECT 1 FROM SYSIBM.SYSDUMMY1) ON (APPLICATION = 'service-manager' AND CONFIG_KEY = 'spring.security.oauth2.resourceserver.jwt.jwk-set-uri')
WHEN MATCHED THEN UPDATE SET VALUE = '${server.name}/cas/oidc/jwks', DEFAULT_VALUE = '${server.name}/cas/oidc/jwks', VALUE_FORMAT = '', MAIN_GROUP = 'security', SUB_GROUP = 'service-manager', MAIN_GROUP_ORDER = '40', SUB_GROUP_ORDER = '120', CONFIG_ORDER = '10', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '0', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'JWK URI', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'service-manager', 'spring.security.oauth2.resourceserver.jwt.jwk-set-uri', '${server.name}/cas/oidc/jwks', '${server.name}/cas/oidc/jwks', '', 'security', 'service-manager', '40', '120', '10', '1', '1', '1', '0', '0', '0', 'text', 'text', '', '1', '', 'JWK URI', CURRENT_TIMESTAMP, '-1' );

MERGE INTO SYS_CONFIG USING (SELECT 1 FROM SYSIBM.SYSDUMMY1) ON (APPLICATION = 'policy-controller-manager' AND CONFIG_KEY = 'spring.security.oauth2.resourceserver.jwt.jwk-set-uri')
WHEN MATCHED THEN UPDATE SET VALUE = '${server.name}/cas/oidc/jwks', DEFAULT_VALUE = '${server.name}/cas/oidc/jwks', VALUE_FORMAT = '', MAIN_GROUP = 'security', SUB_GROUP = 'policy-controller-manager', MAIN_GROUP_ORDER = '40', SUB_GROUP_ORDER = '110', CONFIG_ORDER = '10', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '0', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'JWK URI', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'policy-controller-manager', 'spring.security.oauth2.resourceserver.jwt.jwk-set-uri', '${server.name}/cas/oidc/jwks', '${server.name}/cas/oidc/jwks', '', 'security', 'policy-controller-manager', '40', '110', '10', '1', '1', '1', '0', '0', '0', 'text', 'text', '', '1', '', 'JWK URI', CURRENT_TIMESTAMP, '-1' );

ALTER TABLE DICT_ENROLLMENTS ALTER COLUMN domain_name SET DATA TYPE VARCHAR(255);
ALTER TABLE DICT_ENROLLMENTS ALTER COLUMN domain_name SET NOT NULL;

UPDATE SYS_CONFIG SET UI = 1 WHERE APPLICATION  = 'application' AND CONFIG_KEY = 'help.url.base';

CREATE OR REPLACE FUNCTION CURRENT_TIME_SECONDS () RETURNS BIGINT BEGIN DECLARE OUT_RESULT BIGINT&semi
SET
OUT_RESULT = (
SELECT
	(DAYS(current_timestamp - CURRENT_TIMEZONE) - DAYS('1970-01-01')) * 86400 + (MIDNIGHT_SECONDS(current_timestamp - CURRENT_TIMEZONE))
FROM
	SYSIBM.SYSDUMMY1)&semi
RETURN OUT_RESULT&semi
END&semi;

CREATE OR REPLACE VIEW AGENT_INFO AS (SELECT
	AGENT.COMM_PROFILE_ID,
	AGENT.COMM_PROFILE_NAME,
	AGENT.DEPLOYMENT_BUNDLE_TS,
	AGENT.HOST,
	AGENT.ID,
	AGENT.ISPUSHREADY,
	AGENT.LASTHEARTBEAT,
	AGENT.PUSHPORT,
	AGENT.REGISTERED,
	AGENT.TYPE,
	AGENT.VERSION,
CASE
		WHEN (AGENT.LASTHEARTBEAT + (
		SELECT
			HEART_BEAT_FREQ_TIME * (
		CASE
				WHEN HEART_BEAT_FREQ_TIME_UNIT = 'seconds' THEN 1000
				WHEN HEART_BEAT_FREQ_TIME_UNIT = 'minutes' THEN 60000
				WHEN HEART_BEAT_FREQ_TIME_UNIT = 'hours' THEN 3600000
				ELSE 1
			END) HEART_BEAT_FREQ_TIME_MS
		FROM
			COMM_PROFILE
		WHERE
			ID = AGENT.COMM_PROFILE_ID)) > (
		SELECT
			CAST((DAYS(current_timestamp - CURRENT_TIMEZONE) - DAYS('1970-01-01')) * 86400 + (MIDNIGHT_SECONDS(current_timestamp - CURRENT_TIMEZONE)) AS BIGINT) * 1000
		FROM
			SYSIBM.SYSDUMMY1) THEN 'ACTIVE'
		ELSE 'INACTIVE'
	END STATUS,
CASE
		WHEN (
		SELECT
			COALESCE(MAX(AS_OF), 0)
		FROM
			DEPLOYMENT_RECORDS) <= AGENT.DEPLOYMENT_BUNDLE_TS THEN 'UP_TO_DATE'
		ELSE 'OUT_OF_DATE'
	END POLICY_STATUS
FROM
	AGENT);

CREATE OR REPLACE
VIEW COMPONENT_INFO AS (
SELECT
	COMPONENT.COMPONENTURL,
	COMPONENT.HEARTBEATRATE,
	COMPONENT.ID,
	COMPONENT.LASTHEARTBEAT,
	COMPONENT.NAME,
	COMPONENT.TYPE,
CASE
		WHEN (COMPONENT.LASTHEARTBEAT + COMPONENT.HEARTBEATRATE) > (
		SELECT
			CAST((DAYS(current_timestamp - CURRENT_TIMEZONE) - DAYS('1970-01-01')) * 86400 + (MIDNIGHT_SECONDS(current_timestamp - CURRENT_TIMEZONE)) AS BIGINT) * 1000
		FROM
			SYSIBM.SYSDUMMY1) THEN 'ACTIVE'
		ELSE 'INACTIVE'
	END STATUS
FROM
	COMPONENT);

CREATE VIEW COMM_PROFILE_INFO AS (
SELECT
	COMM_PROFILE.ID,
	COMM_PROFILE.AGENT_TYPE,
	COMM_PROFILE.CREATED_DATE,
	COMM_PROFILE.CURR_ACT_JOURN_SETTINGS_NAME,
	COMM_PROFILE.CUST_ACT_JOURN_SETTINGS_ID,
	COMM_PROFILE.DABS_LOCATION,
	COMM_PROFILE.DEFAULT_PORT,
	COMM_PROFILE.DEFAULT_PROFILE,
	COMM_PROFILE.HEART_BEAT_FREQ_TIME,
	COMM_PROFILE.HEART_BEAT_FREQ_TIME_UNIT,
	COMM_PROFILE.LOG_FREQ_TIME,
	COMM_PROFILE.LOG_FREQ_TIME_UNIT,
	COMM_PROFILE.LOG_LIMIT,
	COMM_PROFILE.MODIFIED_DATE,
	COMM_PROFILE.NAME,
	COMM_PROFILE.PASSWORD_HASH,
	COMM_PROFILE.PUSH_ENABLED,
	(
	SELECT
		COUNT(*)
	FROM
		AGENT_INFO
	WHERE
		COMM_PROFILE_ID = COMM_PROFILE.ID) AGENT_COUNT,
	(
	SELECT
		COUNT(*)
	FROM
		AGENT_INFO
	WHERE
		COMM_PROFILE_ID = COMM_PROFILE.ID
		AND STATUS = 'ACTIVE') ACTIVE_AGENT_COUNT,
	(
	SELECT
		COUNT(*)
	FROM
		AGENT_INFO
	WHERE
		COMM_PROFILE_ID = COMM_PROFILE.ID
		AND STATUS = 'INACTIVE') INACTIVE_AGENT_COUNT,
	(
	SELECT
		COUNT(*)
	FROM
		AGENT_INFO
	WHERE
		COMM_PROFILE_ID = COMM_PROFILE.ID
		AND STATUS = 'ACTIVE'
		AND POLICY_STATUS = 'UP_TO_DATE') ACTIVE_UPDATED_AGENT_COUNT,
	(
	SELECT
		COUNT(*)
	FROM
		AGENT_INFO
	WHERE
		COMM_PROFILE_ID = COMM_PROFILE.ID
		AND STATUS = 'INACTIVE'
		AND POLICY_STATUS = 'UP_TO_DATE') INACTIVE_UPDATED_AGENT_COUNT
FROM
	COMM_PROFILE);

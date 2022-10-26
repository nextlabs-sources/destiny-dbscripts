UPDATE LOGGER_CONFIG SET CONFIG = 
'<?xml version="1.0" encoding="UTF-8"?>
<!--LOGGER_DISPLAY_NAMES
=General
com.bluejungle.pf.engine.destiny=Policy Evaluation
org.apereo.cas=CAS Framework
perfStatsLogger=CAS Performance Stats
org.hibernate=Hibernate Framework
com.mchange=Connection Pool
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
            <AppenderRef ref="Console" level="WARN"/>
            <AppenderRef ref="RootLogFile"/>
        </Root>
        <Logger name="com.bluejungle.pf.engine.destiny" level="INFO">
            <AppenderRef ref="PolicyEvaluationLog"/>
        </Logger>
        <Logger name="com.mchange" level="ERROR">
        </Logger>
        <Logger name="perfStatsLogger" level="OFF">
        </Logger>
        <Logger name="org.hibernate" level="ERROR">
        </Logger>
        <Logger name="org.apereo.cas" level="WARN">
        </Logger>
    </Loggers>
</Configuration>
'
WHERE TYPE = 'DEFAULT';

ALTER TABLE ENTITY_AUDIT_LOG
ALTER COLUMN ACTION VARCHAR(30) NOT NULL;

UPDATE SYS_CONFIG SET FIELD_TYPE='number', PATTERN='^[0-9]+$' WHERE CONFIG_KEY='failed.login.attempts';
UPDATE SYS_CONFIG SET REQUIRED='true' WHERE CONFIG_KEY='activemq.broker.connector.bindAddress';
UPDATE SYS_CONFIG SET HIDDEN = 1, READ_ONLY = 1 WHERE CONFIG_KEY = 'key.store.password';
UPDATE SYS_CONFIG SET HIDDEN = 1, READ_ONLY = 1 WHERE CONFIG_KEY = 'trust.store.password';

ALTER TABLE APPLICATION_USER
ALTER COLUMN password VARBINARY(256) NULL;

ALTER TABLE SUPER_APPLICATION_USER
ALTER COLUMN password VARBINARY(256) NULL;

ALTER TABLE PASSWORD_HISTORY
ALTER COLUMN password VARBINARY(256) not NULL;

IF NOT EXISTS (
  SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'APPLICATION_USER') AND name = 'MANUAL_PROVISION'
) BEGIN 
	ALTER TABLE APPLICATION_USER ADD MANUAL_PROVISION [bit] NOT NULL DEFAULT 1
END;
IF NOT EXISTS (
  SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'SUPER_APPLICATION_USER') AND name = 'MANUAL_PROVISION'
) BEGIN 
	ALTER TABLE SUPER_APPLICATION_USER ADD MANUAL_PROVISION [bit] NOT NULL DEFAULT 1
END;

INSERT INTO SYS_CONFIG (APPLICATION,CONFIG_KEY,VALUE,DEFAULT_VALUE,VALUE_FORMAT,MAIN_GROUP,SUB_GROUP,MAIN_GROUP_ORDER,SUB_GROUP_ORDER,CONFIG_ORDER,HIDDEN,READ_ONLY,ADVANCED,UI,ENCRYPTED,RESTART_REQUIRED,DATA_TYPE,FIELD_TYPE,OPTIONS,REQUIRED,PATTERN,DESCRIPTION,MODIFIED_ON,MODIFIED_BY) 
VALUES ('application','pbkdf2.encoding.iteration.count','200000','200000','','security','authentication.password.config',40,90,32,1,1,1,0,1,1,'number','number','',1,'','The number of iterations for PBKDF2 password encoding. Should not be changed after the installation.',CURRENT_TIMESTAMP,-1);

INSERT INTO SYS_CONFIG (APPLICATION,CONFIG_KEY,VALUE,DEFAULT_VALUE,VALUE_FORMAT,MAIN_GROUP,SUB_GROUP,MAIN_GROUP_ORDER,SUB_GROUP_ORDER,CONFIG_ORDER,HIDDEN,READ_ONLY,ADVANCED,UI,ENCRYPTED,RESTART_REQUIRED,DATA_TYPE,FIELD_TYPE,OPTIONS,REQUIRED,PATTERN,DESCRIPTION,MODIFIED_ON,MODIFIED_BY) 
VALUES ('application','pbkdf2.encoding.hash.width','512','512','','security','authentication.password.config',40,90,32,1,1,1,0,1,1,'number','number','',1,'','Width of the resulting password hash in bits. Password hash stored in db is of format: algorigthm_name + salt + password hash. Should not be changed after the installation.',CURRENT_TIMESTAMP,-1);

INSERT INTO SYS_CONFIG (APPLICATION,CONFIG_KEY,VALUE,DEFAULT_VALUE,VALUE_FORMAT,MAIN_GROUP,SUB_GROUP,MAIN_GROUP_ORDER,SUB_GROUP_ORDER,CONFIG_ORDER,HIDDEN,READ_ONLY,ADVANCED,UI,ENCRYPTED,RESTART_REQUIRED,DATA_TYPE,FIELD_TYPE,OPTIONS,REQUIRED,PATTERN,DESCRIPTION,MODIFIED_ON,MODIFIED_BY) 
VALUES ('application','pbkdf2.encoding.salt.width','512','512','','security','authentication.password.config',40,90,32,1,1,1,0,1,1,'number','number','',1,'','Width of salt in bits. Password hash stored in db is of format algorigthm_name + salt + password hash. Should not be changed after the installation.',CURRENT_TIMESTAMP,-1);


INSERT INTO SYS_CONFIG (APPLICATION,CONFIG_KEY,VALUE,DEFAULT_VALUE,VALUE_FORMAT,MAIN_GROUP,SUB_GROUP,MAIN_GROUP_ORDER,SUB_GROUP_ORDER,CONFIG_ORDER,HIDDEN,READ_ONLY,ADVANCED,UI,ENCRYPTED,RESTART_REQUIRED,DATA_TYPE,FIELD_TYPE,OPTIONS,REQUIRED,PATTERN,DESCRIPTION,MODIFIED_ON,MODIFIED_BY) 
VALUES ('application','pbkdf2.encoding.secret.key','','','','security','authentication.password.config',40,90,32,1,1,1,0,1,1,'text','text','',1,'','Secret key used for password encoding. Should not be changed after the installation.',CURRENT_TIMESTAMP,-1);

CREATE NONCLUSTERED INDEX [RPALogComboIndex1Idx] ON [dbo].[RPA_LOG]
(
	[log_level] ASC,
	[time] ASC
)
INCLUDE([id],[user_name],[action],[policy_fullname],[policy_decision],[from_resource_name])
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY];

CREATE NONCLUSTERED INDEX [RPALogComboIndex2Idx] ON [dbo].[RPA_LOG]
(
	[log_level] ASC,
	[time] ASC
)
INCLUDE([policy_decision],[from_resource_name]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY];

CREATE NONCLUSTERED INDEX [RPALogComboIndex3Idx] ON [dbo].[RPA_LOG]
(
	[user_name] ASC,
	[log_level] ASC,
	[time] ASC
)
INCLUDE([id],[policy_decision]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY];

CREATE NONCLUSTERED INDEX [RPALogComboIndex4Idx] ON [dbo].[RPA_LOG]
(
	[day_nb] ASC,
	[log_level] ASC,
	[time] ASC
)
INCLUDE([id],[policy_decision]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY];

CREATE STATISTICS [RPALogLevelTimeStat] ON [dbo].[RPA_LOG]([log_level], [id]);

CREATE STATISTICS [RPALogIdUsernameStat] ON [dbo].[RPA_LOG]([id], [user_name]);

CREATE STATISTICS [RPALogTimeIdStat] ON [dbo].[RPA_LOG]([time], [id]);

CREATE STATISTICS [RPALogIdDayNbStat] ON [dbo].[RPA_LOG]([id], [day_nb]);

CREATE STATISTICS [RPALogIdTimeUsernameStat] ON [dbo].[RPA_LOG]([id], [time], [user_name]);

CREATE STATISTICS [RPALogIdLogLevelTimeUsernameStat] ON [dbo].[RPA_LOG]([id], [log_level], [time], [user_name]);

INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('GET', '/api/v1/policy/mgmt/retrieveAllPolicies', 'hasAuthority(''VIEW_POLICY'') and hasAuthority(''VIEW_COMPONENT'') and hasAuthority(''VIEW_POLICY_MODEL'')');

CREATE TABLE SECURE_STORE (
    [ID]                 [numeric] (18, 0) IDENTITY(1,1) NOT NULL,
    [NAME]               [varchar] (255) NOT NULL,
    [STORE_FILE]         [varbinary] (MAX) NULL,
    [HASH_ALGORITHM]     [varchar] (25) NOT NULL,
    [CHECKSUM]           [varchar] (256) NOT NULL,
    [MODIFIED_ON]        [datetime] NOT NULL,
    [MODIFIED_BY]        [numeric] (10,0) DEFAULT -1 NOT NULL,
    CONSTRAINT SECURE_STORE_PK PRIMARY KEY ( [ID] ),
	CONSTRAINT SECURE_STORE_UK1 UNIQUE ( [NAME] )
);

INSERT INTO SECURE_STORE (NAME, HASH_ALGORITHM, CHECKSUM, MODIFIED_ON) VALUES ('agent-keystore.jks', 'SHA1', '00', current_timestamp);
INSERT INTO SECURE_STORE (NAME, HASH_ALGORITHM, CHECKSUM, MODIFIED_ON) VALUES ('agent-truststore.jks', 'SHA1', '00', current_timestamp);
INSERT INTO SECURE_STORE (NAME, HASH_ALGORITHM, CHECKSUM, MODIFIED_ON) VALUES ('application-keystore.jks', 'SHA1', '00', current_timestamp);
INSERT INTO SECURE_STORE (NAME, HASH_ALGORITHM, CHECKSUM, MODIFIED_ON) VALUES ('application-truststore.jks', 'SHA1', '00', current_timestamp);
INSERT INTO SECURE_STORE (NAME, HASH_ALGORITHM, CHECKSUM, MODIFIED_ON) VALUES ('cacerts.jks', 'SHA1', '00', current_timestamp);
INSERT INTO SECURE_STORE (NAME, HASH_ALGORITHM, CHECKSUM, MODIFIED_ON) VALUES ('dcc-keystore.jks', 'SHA1', '00', current_timestamp);
INSERT INTO SECURE_STORE (NAME, HASH_ALGORITHM, CHECKSUM, MODIFIED_ON) VALUES ('dcc-truststore.jks', 'SHA1', '00', current_timestamp);
INSERT INTO SECURE_STORE (NAME, HASH_ALGORITHM, CHECKSUM, MODIFIED_ON) VALUES ('digital-signature-keystore.jks', 'SHA1', '00', current_timestamp);
INSERT INTO SECURE_STORE (NAME, HASH_ALGORITHM, CHECKSUM, MODIFIED_ON) VALUES ('digital-signature-truststore.jks', 'SHA1', '00', current_timestamp);
INSERT INTO SECURE_STORE (NAME, HASH_ALGORITHM, CHECKSUM, MODIFIED_ON) VALUES ('legacy-agent-keystore.jks', 'SHA1', '00', current_timestamp);
INSERT INTO SECURE_STORE (NAME, HASH_ALGORITHM, CHECKSUM, MODIFIED_ON) VALUES ('legacy-agent-truststore-kp.jks', 'SHA1', '00', current_timestamp);
INSERT INTO SECURE_STORE (NAME, HASH_ALGORITHM, CHECKSUM, MODIFIED_ON) VALUES ('legacy-agent-truststore.jks', 'SHA1', '00', current_timestamp);
INSERT INTO SECURE_STORE (NAME, HASH_ALGORITHM, CHECKSUM, MODIFIED_ON) VALUES ('web-keystore.jks', 'SHA1', '00', current_timestamp);
INSERT INTO SECURE_STORE (NAME, HASH_ALGORITHM, CHECKSUM, MODIFIED_ON) VALUES ('web-truststore.jks', 'SHA1', '00', current_timestamp);

INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('GET', '/api/v1/secureStore/list/storeNames/{storeType:.+}', 'hasAuthority(''MANAGE_SECURE_STORE'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('GET', '/api/v1/secureStore/list/entries/{storeType:.+}', 'hasAuthority(''MANAGE_SECURE_STORE'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('GET', '/api/v1/secureStore/list/storeFiles', 'hasAuthority(''MANAGE_SECURE_STORE'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('GET', '/api/v1/secureStore/list/digestAlgorithms', 'hasAuthority(''MANAGE_SECURE_STORE'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('GET', '/api/v1/secureStore/list/keyAlgorithms', 'hasAuthority(''MANAGE_SECURE_STORE'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('GET', '/api/v1/secureStore/list/signatureAlgorithms/{keyAlgorithm:(DSA|RSA|EC)}', 'hasAuthority(''MANAGE_SECURE_STORE'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('GET', '/api/v1/secureStore/entryDetails/{storeName:.+}/{alias:.+}', 'hasAuthority(''MANAGE_SECURE_STORE'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('PUT', '/api/v1/secureStore/changePassword', 'hasAuthority(''MANAGE_SECURE_STORE'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/secureStore/generateKey', 'hasAuthority(''MANAGE_SECURE_STORE'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/secureStore/generateCSR', 'hasAuthority(''MANAGE_SECURE_STORE'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('DELETE', '/api/v1/secureStore/remove/{storeName:.+}/{alias:.+}', 'hasAuthority(''MANAGE_SECURE_STORE'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('DELETE', '/api/v1/secureStore/bulkDelete', 'hasAuthority(''MANAGE_SECURE_STORE'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/secureStore/importCertificate', 'hasAuthority(''MANAGE_SECURE_STORE'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('GET', '/api/v1/secureStore/exportCertificate/{storeName:.+}/{alias:.+}', 'hasAuthority(''MANAGE_SECURE_STORE'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('GET', '/api/v1/secureStore/exportAll', 'hasAuthority(''MANAGE_SECURE_STORE'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('GET', '/exports/SecureStore/*', 'hasAuthority(''MANAGE_SECURE_STORE'')');
UPDATE ACCESS_CONTROL SET URL_PATTERN = '/exports/Policy/*' WHERE REQUEST_METHOD = 'GET' AND URL_PATTERN = '/exports/*' AND EXPRESSION = 'hasAuthority(''VIEW_POLICY'')';

CREATE TABLE PROVISIONED_USER_GROUP (
    [ID]                 [numeric] (18, 0) IDENTITY(1,1) NOT NULL,
    [AUTH_HANDLER_ID]    [numeric] (18, 0) NOT NULL,
    [GROUP_ID]           [varchar] (255) NOT NULL,
    [CREATED_ON]         datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
    [CREATED_BY]         [numeric](10,0) DEFAULT -1 NOT NULL,
    CONSTRAINT PROVISIONED_USER_GROUP_PK PRIMARY KEY ( [ID] ),
    CONSTRAINT PROVISIONED_USER_GROUP_UK1 UNIQUE ( [AUTH_HANDLER_ID], [GROUP_ID] )
);

INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/auth/handlers/listExtGroups', 'hasAuthority(''MANAGE_USERS'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/profile/user/group/list', 'hasAuthority(''MANAGE_USERS'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/profile/user/group/import', 'hasAuthority(''MANAGE_USERS'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('DELETE', '/api/v1/profile/user/group/remove/{id:[0-9]+}', 'hasAuthority(''MANAGE_USERS'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('DELETE', '/api/v1/profile/user/group/bulkDelete', 'hasAuthority(''MANAGE_USERS'')');

INSERT INTO SYS_CONFIG (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY) VALUES ('cas', 'cas.authn.oauth.accessToken.maxTimeToLiveInSeconds', '1200', '1200', '', 'security', 'cas', 40, 5, 32, 0, 0, 1, 1, 0, 1, 'integer', 'number', '', 1, '', 'Validity of Control Center Console JWT ID token in seconds', CURRENT_TIMESTAMP, -1);
INSERT INTO SYS_CONFIG (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY) VALUES ('cas', 'cas.authn.oauth.refreshToken.timeToKillInSeconds', '1209600', '1209600', '', 'security', 'cas', 40, 6, 32, 0, 0, 1, 1, 0, 1, 'integer', 'number', '', 1, '', 'Validity of Control Center Console JWT refresh token in seconds', CURRENT_TIMESTAMP, -1);

INSERT INTO SYS_CONFIG (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY) VALUES ('application', 'cc-oidc-config.signingJwks', '', '', '', 'security', 'cas', 40, 5, 0, 1, 1, 1, 0, 1, 1, 'text', 'text', '', 1, '', 'Generated OIDC signing jwks.', current_timestamp, -1);
INSERT INTO SYS_CONFIG (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY) VALUES ('application', 'cc-oidc-config.encryptionJwks', '', '', '', 'security', 'cas', 40, 5, 0, 1, 1, 1, 0, 1, 1, 'text', 'text', '', 1, '', 'Generated OIDC encrypting jwks.', current_timestamp, -1);
INSERT INTO SYS_CONFIG (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY) VALUES ('application', 'cas.authn.oidc.jwksFile', 'cc_property:/cc-oidc-config.signingJwks', 'cc_property:/cc-oidc-config.signingJwks', '', 'security', 'cas', 40, 5, 0, 1, 1, 1, 0, 0, 1, 'text', 'text', '', 1, '', 'OIDC signing key property.', current_timestamp, -1);
INSERT INTO SYS_CONFIG (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY) VALUES ('application', 'cc-oidc-config.signingJwksProperty', 'cc_property:/cc-oidc-config.signingJwks', 'cc_property:/cc-oidc-config.signingJwks', '', 'security', 'cas', 40, 5, 0, 1, 1, 1, 0, 0, 1, 'text', 'text', '', 1, '', 'OIDC signing key property.', current_timestamp, -1);
INSERT INTO SYS_CONFIG (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY) VALUES ('application', 'cc-oidc-config.encryptionJwksProperty', 'cc_property:/cc-oidc-config.encryptionJwks', 'cc_property:/cc-oidc-config.encryptionJwks', '', 'security', 'cas', 40, 5, 0, 1, 1, 1, 0, 0, 1, 'text', 'text', '', 1, '', 'OIDC encryption key property.', current_timestamp, -1);
INSERT INTO SYS_CONFIG (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY) VALUES ('application', 'cc-oidc-config.services[0].clientId', 'ControlCenterOIDCClient', 'ControlCenterOIDCClient', '', 'security', 'cas', 40, 5, 0, 1, 1, 1, 0, 0, 1, 'text', 'text', '', 1, '', 'Control Centre OIDC client ID.', current_timestamp, -1);
INSERT INTO SYS_CONFIG (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY) VALUES ('application', 'cc-oidc-config.services[0].clientSecret', '', '', '', 'security', 'cas', 40, 5, 0, 1, 1, 1, 0, 1, 1, 'text', 'text', '', 1, '', 'Generated Control Centre OIDC client secret.', current_timestamp, -1);
INSERT INTO SYS_CONFIG (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY) VALUES ('application', 'cc-oidc-config.services[0].serviceUrl', '${server.name}/console', '${server.name}/console', '', 'security', 'cas', 40, 5, 0, 1, 1, 1, 0, 0, 1, 'text', 'text', '', 1, '', 'OIDC client service url', current_timestamp, -1);
INSERT INTO SYS_CONFIG (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY) VALUES ('application', 'cc-oidc-config.allowedServices', '${server.name}/console', '${server.name}/console', '', 'security', 'cas', 40, 5, 0, 1, 1, 1, 0, 0, 1, 'text', 'text', '', 1, '', 'Comma seperated OIDC services, which is validated against callback url.', current_timestamp, -1);
INSERT INTO SYS_CONFIG (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY) VALUES ('application', 'cc-oidc-config.encryptionAlgorithm', 'RSA-OAEP-256', 'RSA-OAEP-256', '', 'security', 'cas', 40, 5, 0, 1, 1, 1, 0, 0, 1, 'text', 'text', '', 1, '', 'CAS OIDC token encryption algorithm.', current_timestamp, -1);
INSERT INTO SYS_CONFIG (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY) VALUES ('application', 'cc-oidc-config.signingAlgorithm', 'RS256', 'RS256', '', 'security', 'cas', 40, 5, 0, 1, 1, 1, 0, 0, 1, 'text', 'text', '', 1, '', 'CAS OIDC token encryption algorithm.', current_timestamp, -1);
INSERT INTO SYS_CONFIG (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY) VALUES ('application', 'cc-oidc-config.encryptionEncoding', 'A256GCM', 'A256GCM', '', 'security', 'cas', 40, 5, 0, 1, 1, 1, 0, 0, 1, 'text', 'text', '', 1, '', 'CAS OIDC token encryption encoding.', current_timestamp, -1);
INSERT INTO SYS_CONFIG (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY) VALUES ('application', 'cc-oidc-config.oidcIssuer', '${server.name}/cas/oidc', '${server.name}/cas/oidc', '', 'security', 'cas', 40, 5, 0, 1, 1, 1, 0, 0, 1, 'text', 'text', '', 1, '', 'OpenID Connect authorize endpoint.', current_timestamp, -1);
INSERT INTO SYS_CONFIG (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY) VALUES ('dabs', 'secureStore.update.refresher.enabled', 'true', 'true', '', 'secureStore', 'dabs', 100, 10, 2, 1, 1, 1, 0, 0, 1, 'boolean', 'checkbox', '', 1, '', 'Enable/Disable Secure Store Configuration Refresh', current_timestamp, -1);

INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/oidc/mgmt/addService', 'hasAuthority(''MANAGE_SYSTEM_CONFIGURATION'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/oidc/accessToken', 'permitAll');

INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('GET', '/api/v1/tools/location/findAll', 'hasAnyAuthority(''ENROLLMENT_MANAGEMENT'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/tools/location/save', 'hasAnyAuthority(''ENROLLMENT_MANAGEMENT'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/tools/location/update', 'hasAnyAuthority(''ENROLLMENT_MANAGEMENT'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/tools/location/delete', 'hasAnyAuthority(''ENROLLMENT_MANAGEMENT'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/tools/location/bulkDelete', 'hasAnyAuthority(''ENROLLMENT_MANAGEMENT'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('GET', '/api/v1/tools/location/fields', 'hasAnyAuthority(''ENROLLMENT_MANAGEMENT'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/tools/location/search', 'hasAnyAuthority(''ENROLLMENT_MANAGEMENT'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/tools/location/search/add', 'hasAnyAuthority(''ENROLLMENT_MANAGEMENT'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('GET', '/api/v1/tools/location/search/savedlist', 'hasAnyAuthority(''ENROLLMENT_MANAGEMENT'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('GET', '/api/v1/tools/location/search/savedlist/{name:.+}', 'hasAnyAuthority(''ENROLLMENT_MANAGEMENT'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('DELETE', '/api/v1/tools/location/search/remove/{id:[0-9]+}', 'hasAnyAuthority(''ENROLLMENT_MANAGEMENT'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/tools/location/validateImportFile', 'hasAnyAuthority(''ENROLLMENT_MANAGEMENT'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/tools/location/bulkImport', 'hasAnyAuthority(''ENROLLMENT_MANAGEMENT'')');

INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/tools/property/save', 'hasAnyAuthority(''ENROLLMENT_MANAGEMENT'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/tools/property/delete', 'hasAnyAuthority(''ENROLLMENT_MANAGEMENT'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/tools/property/bulkDelete', 'hasAnyAuthority(''ENROLLMENT_MANAGEMENT'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('GET', '/api/v1/tools/property/fields', 'hasAnyAuthority(''ENROLLMENT_MANAGEMENT'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/tools/property/search', 'hasAnyAuthority(''ENROLLMENT_MANAGEMENT'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/tools/property/search/add', 'hasAnyAuthority(''ENROLLMENT_MANAGEMENT'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('GET', '/api/v1/tools/property/search/savedlist', 'hasAnyAuthority(''ENROLLMENT_MANAGEMENT'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('GET', '/api/v1/tools/property/search/savedlist/{name:.+}', 'hasAnyAuthority(''ENROLLMENT_MANAGEMENT'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('DELETE', '/api/v1/tools/property/search/remove/{id:[0-9]+}', 'hasAnyAuthority(''ENROLLMENT_MANAGEMENT'')');

INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('GET', '/api/v1/system/status', 'permitAll');

INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/policy/mgmt/generatePDF', 'hasAuthority(''VIEW_POLICY'') and hasAuthority(''VIEW_COMPONENT'') and hasAuthority(''VIEW_POLICY_MODEL'')');

INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/policy/mgmt/importXacmlPolicy', 'hasAuthority(''CREATE_XACML_POLICY'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('DELETE', '/api/v1/policy/mgmt/removeXacmlPolicy/{id:[0-9]+}', 'hasAuthority(''DELETE_XACML_POLICY'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('DELETE', '/api/v1/policy/mgmt/bulkDeleteXacmlPolicy', 'hasAuthority(''DELETE_XACML_POLICY'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/policy/mgmt/exportXacmlPolicy', 'hasAuthority(''VIEW_XACML_POLICY'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/xacmlPolicy/search', 'hasAuthority(''VIEW_XACML_POLICY'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('GET', '/exports/XacmlPolicy/*', 'hasAuthority(''VIEW_XACML_POLICY'')');

DELETE FROM ACCESS_CONTROL WHERE URL_PATTERN = '/api/v1/policyvalidator/log/{logId:[0-9]+}';
DELETE FROM ACCESS_CONTROL WHERE URL_PATTERN = '/api/v1/policyvalidator/validate';

MERGE INTO SYS_CONFIG SC1 USING (SELECT 'application' AS APPLICATION, 'application.build' AS CONFIG_KEY) AS SC2 ON (SC1.APPLICATION = SC2.APPLICATION AND SC1.CONFIG_KEY = SC2.CONFIG_KEY)
WHEN MATCHED THEN UPDATE SET VALUE = '-1', DEFAULT_VALUE = '-1', VALUE_FORMAT = '', MAIN_GROUP = 'general', SUB_GROUP = 'information', MAIN_GROUP_ORDER = '0', SUB_GROUP_ORDER = '70', CONFIG_ORDER = '10', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '0', UI = '1', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'Control Center application build number.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES ('application', 'application.build', '-1', '-1', '', 'general', 'information', '0', '70', '10', '1', '1', '0', '1', '0', '1', 'text', 'text', '', '1', '', 'Control Center application build number.', CURRENT_TIMESTAMP, '-1' )&semi;

MERGE INTO SYS_CONFIG SC1 USING (SELECT 'console' AS APPLICATION, 'data.transportation.trustStoreFile' AS CONFIG_KEY) AS SC2 ON (SC1.APPLICATION = SC2.APPLICATION AND SC1.CONFIG_KEY = SC2.CONFIG_KEY)
WHEN MATCHED THEN UPDATE SET VALUE = '${cc.home}/server/certificates/digital-signature-truststore.jks', DEFAULT_VALUE = '${cc.home}/server/certificates/digital-signature-truststore.jks', VALUE_FORMAT = '', MAIN_GROUP = 'policy', SUB_GROUP = 'data.transportation', MAIN_GROUP_ORDER = '10', SUB_GROUP_ORDER = '0', CONFIG_ORDER = '7', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '0', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '0', PATTERN = '', DESCRIPTION = '', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES ('console', 'data.transportation.trustStoreFile', '${cc.home}/server/certificates/digital-signature-truststore.jks', '${cc.home}/server/certificates/digital-signature-truststore.jks', '', 'policy', 'data.transportation', '10', '0', '7', '1', '1', '0', '0', '0', '1', 'text', 'text', '', '0', '', '', CURRENT_TIMESTAMP, '-1' )&semi;

MERGE INTO SYS_CONFIG SC1 USING (SELECT 'console' AS APPLICATION, 'dashboard.widget.active-users.enabled' AS CONFIG_KEY) AS SC2 ON (SC1.APPLICATION = SC2.APPLICATION AND SC1.CONFIG_KEY = SC2.CONFIG_KEY)
WHEN MATCHED THEN UPDATE SET VALUE = 'false', DEFAULT_VALUE = 'false', VALUE_FORMAT = '', MAIN_GROUP = 'reporter', SUB_GROUP = 'console.dashboard', MAIN_GROUP_ORDER = '65', SUB_GROUP_ORDER = '10', CONFIG_ORDER = '30', HIDDEN = '0', READ_ONLY = '0', ADVANCED = '1', UI = '1', ENCRYPTED = '0', RESTART_REQUIRED = '0', DATA_TYPE = 'boolean', FIELD_TYPE = 'checkbox' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'Show/Hide Active Users Widget in Console Dashboard.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES ('console', 'dashboard.widget.active-users.enabled', 'false', 'false', '', 'reporter', 'console.dashboard', '65', '10', '30', '0', '0', '1', '1', '0', '0', 'boolean', 'checkbox', '', '1', '', 'Show/Hide Active Users Widget in Console Dashboard.', CURRENT_TIMESTAMP, '-1' )&semi;

MERGE INTO SYS_CONFIG SC1 USING (SELECT 'console' AS APPLICATION, 'dashboard.widget.activities-by-resource.enabled' AS CONFIG_KEY) AS SC2 ON (SC1.APPLICATION = SC2.APPLICATION AND SC1.CONFIG_KEY = SC2.CONFIG_KEY)
WHEN MATCHED THEN UPDATE SET VALUE = 'false', DEFAULT_VALUE = 'false', VALUE_FORMAT = '', MAIN_GROUP = 'reporter', SUB_GROUP = 'console.dashboard', MAIN_GROUP_ORDER = '65', SUB_GROUP_ORDER = '10', CONFIG_ORDER = '40', HIDDEN = '0', READ_ONLY = '0', ADVANCED = '1', UI = '1', ENCRYPTED = '0', RESTART_REQUIRED = '0', DATA_TYPE = 'boolean', FIELD_TYPE = 'checkbox' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'Show/Hide Activities by Resource Widget in Console Dashboard.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES ('console', 'dashboard.widget.activities-by-resource.enabled', 'false', 'false', '', 'reporter', 'console.dashboard', '65', '10', '40', '0', '0', '1', '1', '0', '0', 'boolean', 'checkbox', '', '1', '', 'Show/Hide Activities by Resource Widget in Console Dashboard.', CURRENT_TIMESTAMP, '-1' )&semi;

MERGE INTO SYS_CONFIG SC1 USING (SELECT 'console' AS APPLICATION, 'dashboard.widget.activity-alerts.enabled' AS CONFIG_KEY) AS SC2 ON (SC1.APPLICATION = SC2.APPLICATION AND SC1.CONFIG_KEY = SC2.CONFIG_KEY)
WHEN MATCHED THEN UPDATE SET VALUE = 'false', DEFAULT_VALUE = 'false', VALUE_FORMAT = '', MAIN_GROUP = 'reporter', SUB_GROUP = 'console.dashboard', MAIN_GROUP_ORDER = '65', SUB_GROUP_ORDER = '10', CONFIG_ORDER = '60', HIDDEN = '0', READ_ONLY = '0', ADVANCED = '1', UI = '1', ENCRYPTED = '0', RESTART_REQUIRED = '0', DATA_TYPE = 'boolean', FIELD_TYPE = 'checkbox' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'Show/Hide Activity Alerts Widget in Console Dashboard.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES ('console', 'dashboard.widget.activity-alerts.enabled', 'false', 'false', '', 'reporter', 'console.dashboard', '65', '10', '60', '0', '0', '1', '1', '0', '0', 'boolean', 'checkbox', '', '1', '', 'Show/Hide Activity Alerts Widget in Console Dashboard.', CURRENT_TIMESTAMP, '-1' )&semi;

MERGE INTO SYS_CONFIG SC1 USING (SELECT 'console' AS APPLICATION, 'dashboard.widget.enrollment.enabled' AS CONFIG_KEY) AS SC2 ON (SC1.APPLICATION = SC2.APPLICATION AND SC1.CONFIG_KEY = SC2.CONFIG_KEY)
WHEN MATCHED THEN UPDATE SET VALUE = 'true', DEFAULT_VALUE = 'true', VALUE_FORMAT = '', MAIN_GROUP = 'reporter', SUB_GROUP = 'console.dashboard', MAIN_GROUP_ORDER = '65', SUB_GROUP_ORDER = '10', CONFIG_ORDER = '90', HIDDEN = '0', READ_ONLY = '0', ADVANCED = '1', UI = '1', ENCRYPTED = '0', RESTART_REQUIRED = '0', DATA_TYPE = 'boolean', FIELD_TYPE = 'checkbox' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'Show/Hide Enrollment Widget in Console Dashboard.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES ('console', 'dashboard.widget.enrollment.enabled', 'true', 'true', '', 'reporter', 'console.dashboard', '65', '10', '90', '0', '0', '1', '1', '0', '0', 'boolean', 'checkbox', '', '1', '', 'Show/Hide Enrollment Widget in Console Dashboard.', CURRENT_TIMESTAMP, '-1' )&semi;

MERGE INTO SYS_CONFIG SC1 USING (SELECT 'console' AS APPLICATION, 'dashboard.widget.frequently-evaluated-policies.enabled' AS CONFIG_KEY) AS SC2 ON (SC1.APPLICATION = SC2.APPLICATION AND SC1.CONFIG_KEY = SC2.CONFIG_KEY)
WHEN MATCHED THEN UPDATE SET VALUE = 'false', DEFAULT_VALUE = 'false', VALUE_FORMAT = '', MAIN_GROUP = 'reporter', SUB_GROUP = 'console.dashboard', MAIN_GROUP_ORDER = '65', SUB_GROUP_ORDER = '10', CONFIG_ORDER = '50', HIDDEN = '0', READ_ONLY = '0', ADVANCED = '1', UI = '1', ENCRYPTED = '0', RESTART_REQUIRED = '0', DATA_TYPE = 'boolean', FIELD_TYPE = 'checkbox' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'Show/Hide Frequently Evaluated Policies Widget in Console Dashboard.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES ('console', 'dashboard.widget.frequently-evaluated-policies.enabled', 'false', 'false', '', 'reporter', 'console.dashboard', '65', '10', '50', '0', '0', '1', '1', '0', '0', 'boolean', 'checkbox', '', '1', '', 'Show/Hide Frequently Evaluated Policies Widget in Console Dashboard.', CURRENT_TIMESTAMP, '-1' )&semi;

MERGE INTO SYS_CONFIG SC1 USING (SELECT 'console' AS APPLICATION, 'dashboard.widget.pdp-throughput.enabled' AS CONFIG_KEY) AS SC2 ON (SC1.APPLICATION = SC2.APPLICATION AND SC1.CONFIG_KEY = SC2.CONFIG_KEY)
WHEN MATCHED THEN UPDATE SET VALUE = 'false', DEFAULT_VALUE = 'false', VALUE_FORMAT = '', MAIN_GROUP = 'reporter', SUB_GROUP = 'console.dashboard', MAIN_GROUP_ORDER = '65', SUB_GROUP_ORDER = '10', CONFIG_ORDER = '20', HIDDEN = '0', READ_ONLY = '0', ADVANCED = '1', UI = '1', ENCRYPTED = '0', RESTART_REQUIRED = '0', DATA_TYPE = 'boolean', FIELD_TYPE = 'checkbox' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'Show/Hide PDP Throughput Widget in Console Dashboard.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES ('console', 'dashboard.widget.pdp-throughput.enabled', 'false', 'false', '', 'reporter', 'console.dashboard', '65', '10', '20', '0', '0', '1', '1', '0', '0', 'boolean', 'checkbox', '', '1', '', 'Show/Hide PDP Throughput Widget in Console Dashboard.', CURRENT_TIMESTAMP, '-1' )&semi;

MERGE INTO SYS_CONFIG SC1 USING (SELECT 'console' AS APPLICATION, 'dashboard.widget.policies-grouped-by-tags.enabled' AS CONFIG_KEY) AS SC2 ON (SC1.APPLICATION = SC2.APPLICATION AND SC1.CONFIG_KEY = SC2.CONFIG_KEY)
WHEN MATCHED THEN UPDATE SET VALUE = 'false', DEFAULT_VALUE = 'false', VALUE_FORMAT = '', MAIN_GROUP = 'reporter', SUB_GROUP = 'console.dashboard', MAIN_GROUP_ORDER = '65', SUB_GROUP_ORDER = '10', CONFIG_ORDER = '70', HIDDEN = '0', READ_ONLY = '0', ADVANCED = '1', UI = '1', ENCRYPTED = '0', RESTART_REQUIRED = '0', DATA_TYPE = 'boolean', FIELD_TYPE = 'checkbox' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'Show/Hide Policies Grouped by Tags Widget in Console Dashboard.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES ('console', 'dashboard.widget.policies-grouped-by-tags.enabled', 'false', 'false', '', 'reporter', 'console.dashboard', '65', '10', '70', '0', '0', '1', '1', '0', '0', 'boolean', 'checkbox', '', '1', '', 'Show/Hide Policies Grouped by Tags Widget in Console Dashboard.', CURRENT_TIMESTAMP, '-1' )&semi;

MERGE INTO SYS_CONFIG SC1 USING (SELECT 'console' AS APPLICATION, 'dashboard.widget.policies-not-matched-in-any-request.enabled' AS CONFIG_KEY) AS SC2 ON (SC1.APPLICATION = SC2.APPLICATION AND SC1.CONFIG_KEY = SC2.CONFIG_KEY)
WHEN MATCHED THEN UPDATE SET VALUE = 'false', DEFAULT_VALUE = 'false', VALUE_FORMAT = '', MAIN_GROUP = 'reporter', SUB_GROUP = 'console.dashboard', MAIN_GROUP_ORDER = '65', SUB_GROUP_ORDER = '10', CONFIG_ORDER = '80', HIDDEN = '0', READ_ONLY = '0', ADVANCED = '1', UI = '1', ENCRYPTED = '0', RESTART_REQUIRED = '0', DATA_TYPE = 'boolean', FIELD_TYPE = 'checkbox' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'Show/Hide Policies not Matched in Any Request Widget in Console Dashboard.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES ('console', 'dashboard.widget.policies-not-matched-in-any-request.enabled', 'false', 'false', '', 'reporter', 'console.dashboard', '65', '10', '80', '0', '0', '1', '1', '0', '0', 'boolean', 'checkbox', '', '1', '', 'Show/Hide Policies not Matched in Any Request Widget in Console Dashboard.', CURRENT_TIMESTAMP, '-1' )&semi;

MERGE INTO SYS_CONFIG SC1 USING (SELECT 'console' AS APPLICATION, 'dashboard.widget.recent-activities.enabled' AS CONFIG_KEY) AS SC2 ON (SC1.APPLICATION = SC2.APPLICATION AND SC1.CONFIG_KEY = SC2.CONFIG_KEY)
WHEN MATCHED THEN UPDATE SET VALUE = 'true', DEFAULT_VALUE = 'true', VALUE_FORMAT = '', MAIN_GROUP = 'reporter', SUB_GROUP = 'console.dashboard', MAIN_GROUP_ORDER = '65', SUB_GROUP_ORDER = '10', CONFIG_ORDER = '100', HIDDEN = '0', READ_ONLY = '0', ADVANCED = '1', UI = '1', ENCRYPTED = '0', RESTART_REQUIRED = '0', DATA_TYPE = 'boolean', FIELD_TYPE = 'checkbox' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'Show/Hide Recent Activities Widget in Console Dashboard.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES ('console', 'dashboard.widget.recent-activities.enabled', 'true', 'true', '', 'reporter', 'console.dashboard', '65', '10', '100', '0', '0', '1', '1', '0', '0', 'boolean', 'checkbox', '', '1', '', 'Show/Hide Recent Activities Widget in Console Dashboard.', CURRENT_TIMESTAMP, '-1' )&semi;

MERGE INTO SYS_CONFIG SC1 USING (SELECT 'console' AS APPLICATION, 'dashboard.widget.system-configuration-status.enabled' AS CONFIG_KEY) AS SC2 ON (SC1.APPLICATION = SC2.APPLICATION AND SC1.CONFIG_KEY = SC2.CONFIG_KEY)
WHEN MATCHED THEN UPDATE SET VALUE = 'true', DEFAULT_VALUE = 'true', VALUE_FORMAT = '', MAIN_GROUP = 'reporter', SUB_GROUP = 'console.dashboard', MAIN_GROUP_ORDER = '65', SUB_GROUP_ORDER = '10', CONFIG_ORDER = '0', HIDDEN = '0', READ_ONLY = '0', ADVANCED = '1', UI = '1', ENCRYPTED = '0', RESTART_REQUIRED = '0', DATA_TYPE = 'boolean', FIELD_TYPE = 'checkbox' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'Show/Hide System Configuration Status Widget in Console Dashboard.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES ('console', 'dashboard.widget.system-configuration-status.enabled', 'true', 'true', '', 'reporter', 'console.dashboard', '65', '10', '0', '0', '0', '1', '1', '0', '0', 'boolean', 'checkbox', '', '1', '', 'Show/Hide System Configuration Status Widget in Console Dashboard.', CURRENT_TIMESTAMP, '-1' )&semi;

MERGE INTO SYS_CONFIG SC1 USING (SELECT 'console' AS APPLICATION, 'dashboard.widget.system-details.enabled' AS CONFIG_KEY) AS SC2 ON (SC1.APPLICATION = SC2.APPLICATION AND SC1.CONFIG_KEY = SC2.CONFIG_KEY)
WHEN MATCHED THEN UPDATE SET VALUE = 'true', DEFAULT_VALUE = 'true', VALUE_FORMAT = '', MAIN_GROUP = 'reporter', SUB_GROUP = 'console.dashboard', MAIN_GROUP_ORDER = '65', SUB_GROUP_ORDER = '10', CONFIG_ORDER = '10', HIDDEN = '0', READ_ONLY = '0', ADVANCED = '1', UI = '1', ENCRYPTED = '0', RESTART_REQUIRED = '0', DATA_TYPE = 'boolean', FIELD_TYPE = 'checkbox' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'Show/Hide System Details Widget in Console Dashboard.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES ('console', 'dashboard.widget.system-details.enabled', 'true', 'true', '', 'reporter', 'console.dashboard', '65', '10', '10', '0', '0', '1', '1', '0', '0', 'boolean', 'checkbox', '', '1', '', 'Show/Hide System Details Widget in Console Dashboard.', CURRENT_TIMESTAMP, '-1' )&semi;

UPDATE SYS_CONFIG SET SUB_GROUP = 'reporter.config' WHERE APPLICATION = 'dms' AND CONFIG_KEY IN ('reporter.monitor.execution.interval', 'reporter.show.sharepoint', 'reporter.use.past.data.for.monitoring');

UPDATE SYS_CONFIG SET VALUE = 'https://docs.nextlabs.com/cc/2020.04' WHERE APPLICATION = 'application' AND CONFIG_KEY = 'help.url.base';

UPDATE SYS_CONFIG SET VALUE = '30', DEFAULT_VALUE = '30' WHERE APPLICATION = 'console' AND CONFIG_KEY = 'db.comboPooledDataSource.maxPoolSize';

MERGE INTO SYS_CONFIG SC1 USING (SELECT 'console' AS APPLICATION, 'db.comboPooledDataSource.maxIdleTimeExcessConnections' AS CONFIG_KEY) AS SC2 ON (SC1.APPLICATION = SC2.APPLICATION AND SC1.CONFIG_KEY = SC2.CONFIG_KEY)
WHEN MATCHED THEN UPDATE SET VALUE = '300', DEFAULT_VALUE = '300', VALUE_FORMAT = '', MAIN_GROUP = 'db', SUB_GROUP = 'console', MAIN_GROUP_ORDER = '20', SUB_GROUP_ORDER = '6', CONFIG_ORDER = '10', HIDDEN = '1', READ_ONLY = '0', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'integer', FIELD_TYPE = 'integer' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'Number of seconds that Connections in excess of minPoolSize should be permitted to remain idle in the pool.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES ('console', 'db.comboPooledDataSource.maxIdleTimeExcessConnections', '300', '300', '', 'db', 'console', '20', '6', '10', '1', '0', '1', '0', '0', '1', 'integer', 'integer', '', '1', '', 'Number of seconds that Connections in excess of minPoolSize should be permitted to remain idle in the pool.', CURRENT_TIMESTAMP, '-1' )&semi;

UPDATE SYS_CONFIG SET REQUIRED='1' WHERE CONFIG_KEY = 'dac.archive.time.of.day';

INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('GET', '/scim/v2/ServiceProviderConfig', 'hasAnyAuthority(''ENROLLMENT_MANAGEMENT'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('GET', '/scim/v2/Schemas', 'hasAnyAuthority(''ENROLLMENT_MANAGEMENT'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('GET', '/scim/v2/ResourceTypes', 'hasAnyAuthority(''ENROLLMENT_MANAGEMENT'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('GET', '/scim/v2/Users', 'hasAnyAuthority(''ENROLLMENT_MANAGEMENT'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('GET', '/scim/v2/Users/{id:[0-9]+}', 'hasAnyAuthority(''ENROLLMENT_MANAGEMENT'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/scim/v2/Users', 'hasAnyAuthority(''ENROLLMENT_MANAGEMENT'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('PUT', '/scim/v2/Users', 'hasAnyAuthority(''ENROLLMENT_MANAGEMENT'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('PATCH', '/scim/v2/Users', 'hasAnyAuthority(''ENROLLMENT_MANAGEMENT'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('DELETE', '/scim/v2/Users/{id:[0-9]+}', 'hasAnyAuthority(''ENROLLMENT_MANAGEMENT'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('GET', '/scim/v2/Bulk', 'hasAnyAuthority(''ENROLLMENT_MANAGEMENT'')');

INSERT INTO SYS_CONFIG (APPLICATION,CONFIG_KEY,VALUE,DEFAULT_VALUE,VALUE_FORMAT,MAIN_GROUP,SUB_GROUP,MAIN_GROUP_ORDER,SUB_GROUP_ORDER,CONFIG_ORDER,HIDDEN,READ_ONLY,ADVANCED,UI,ENCRYPTED,RESTART_REQUIRED,DATA_TYPE,FIELD_TYPE,OPTIONS,REQUIRED,PATTERN,DESCRIPTION,MODIFIED_ON,MODIFIED_BY) 
VALUES ('console','scim2.baseUrl','${server.name}/console','${server.name}/console','','general','url',0,10,3,1,1,1,0,1,1,'text','text','',1,'','Base url for SCIM',CURRENT_TIMESTAMP,-1);

UPDATE ACCESS_CONTROL SET URL_PATTERN='/api/v1/tools/uploadFileExtra' WHERE URL_PATTERN='/api/v1/tools/uploadFileExtra/{fileName}';

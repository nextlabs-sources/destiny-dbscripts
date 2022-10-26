UPDATE SYS_CONFIG SET CONFIG_KEY = 'cas.authn.pac4j.oidc[0].azure.order', VALUE = '0', DEFAULT_VALUE = '0' WHERE CONFIG_KEY = 'cas.authn.pac4j.oidc[0].type';
UPDATE SYS_CONFIG SET CONFIG_KEY = 'cas.authn.pac4j.oidc[0].azure.id' WHERE CONFIG_KEY = 'cas.authn.pac4j.oidc[0].id';
UPDATE SYS_CONFIG SET CONFIG_KEY = 'cas.authn.pac4j.oidc[0].azure.secret' WHERE CONFIG_KEY = 'cas.authn.pac4j.oidc[0].secret';
UPDATE SYS_CONFIG SET CONFIG_KEY = 'cas.authn.pac4j.oidc[0].azure.client-name' WHERE CONFIG_KEY = 'cas.authn.pac4j.oidc[0].clientName';
UPDATE SYS_CONFIG SET CONFIG_KEY = 'cas.authn.pac4j.oidc[0].azure.auto-redirect' WHERE CONFIG_KEY = 'cas.authn.pac4j.oidc[0].autoRedirect';
UPDATE SYS_CONFIG SET CONFIG_KEY = 'cas.authn.pac4j.oidc[0].azure.principal-attribute-id' WHERE CONFIG_KEY = 'cas.authn.pac4j.oidc[0].principalAttributeId';
UPDATE SYS_CONFIG SET CONFIG_KEY = 'cas.authn.pac4j.oidc[0].azure.tenant' WHERE CONFIG_KEY = 'cas.authn.pac4j.oidc[0].azureTenantId';
UPDATE SYS_CONFIG SET CONFIG_KEY = 'cas.authn.pac4j.oidc[0].azure.discovery-uri' WHERE CONFIG_KEY = 'cas.authn.pac4j.oidc[0].discoveryUri';
UPDATE SYS_CONFIG SET CONFIG_KEY = 'cas.authn.pac4j.oidc[0].azure.logout-url' WHERE CONFIG_KEY = 'cas.authn.pac4j.oidc[0].logoutUrl';
UPDATE SYS_CONFIG SET CONFIG_KEY = 'cas.authn.pac4j.oidc[0].azure.max-clock-skew' WHERE CONFIG_KEY = 'cas.authn.pac4j.oidc[0].maxClockSkew';
UPDATE SYS_CONFIG SET CONFIG_KEY = 'cas.authn.pac4j.oidc[0].azure.scope' WHERE CONFIG_KEY = 'cas.authn.pac4j.oidc[0].scope';
UPDATE SYS_CONFIG SET CONFIG_KEY = 'cas.authn.pac4j.oidc[0].azure.use-nonce' WHERE CONFIG_KEY = 'cas.authn.pac4j.oidc[0].useNonce';
UPDATE SYS_CONFIG SET CONFIG_KEY = 'cas.authn.pac4j.oidc[0].azure.preferred-jws-algorithm', VALUE = 'RS256', DEFAULT_VALUE = 'RS256' WHERE CONFIG_KEY = 'cas.authn.pac4j.oidc[0].preferredJwsAlgorithm';
UPDATE SYS_CONFIG SET CONFIG_KEY = 'cas.authn.pac4j.oidc[0].azure.response-mode' WHERE CONFIG_KEY = 'cas.authn.pac4j.oidc[0].responseMode';
UPDATE SYS_CONFIG SET CONFIG_KEY = 'cas.authn.pac4j.oidc[0].azure.response-type' WHERE CONFIG_KEY = 'cas.authn.pac4j.oidc[0].responseType';
UPDATE SYS_CONFIG SET CONFIG_KEY = 'cas.authn.pac4j.oidc[0].azure.callback-url-type', VALUE = 'PATH_PARAMETER', DEFAULT_VALUE = 'PATH_PARAMETER' WHERE CONFIG_KEY = 'cas.authn.pac4j.oidc[0].usePathBasedCallbackUrl';
MERGE INTO SYS_CONFIG USING (SELECT 1 FROM SYS_CONFIG A WHERE A.CONFIG_KEY = 'cas.authn.pac4j.oidc[0].azure.client-name') ON (APPLICATION = 'cas' AND CONFIG_KEY = 'cas.authn.pac4j.oidc[0].azure.read-timeout') WHEN MATCHED THEN UPDATE SET VALUE = 'PT5S', DEFAULT_VALUE = 'PT5S', VALUE_FORMAT = '', MAIN_GROUP = 'idprovider', SUB_GROUP = 'oidc', MAIN_GROUP_ORDER = '99', SUB_GROUP_ORDER = '99', CONFIG_ORDER = '16', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = '', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1' WHEN NOT MATCHED THEN INSERT (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'cas', 'cas.authn.pac4j.oidc[0].azure.read-timeout', 'PT5S', 'PT5S', '', 'idprovider', 'oidc', '99', '99', '16', '1', '1', '1', '0', '0', '1', 'text', 'text', '', '1', '', '', CURRENT_TIMESTAMP, '-1' );
MERGE INTO SYS_CONFIG USING (SELECT 1 FROM SYS_CONFIG A WHERE A.CONFIG_KEY = 'cas.authn.pac4j.oidc[0].azure.client-name') ON (APPLICATION = 'cas' AND CONFIG_KEY = 'cas.authn.pac4j.oidc[0].azure.connect-timeout') WHEN MATCHED THEN UPDATE SET VALUE = 'PT5S', DEFAULT_VALUE = 'PT5S', VALUE_FORMAT = '', MAIN_GROUP = 'idprovider', SUB_GROUP = 'oidc', MAIN_GROUP_ORDER = '99', SUB_GROUP_ORDER = '99', CONFIG_ORDER = '17', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = '', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1' WHEN NOT MATCHED THEN INSERT (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'cas', 'cas.authn.pac4j.oidc[0].azure.connect-timeout', 'PT5S', 'PT5S', '', 'idprovider', 'oidc', '99', '99', '17', '1', '1', '1', '0', '0', '1', 'text', 'text', '', '1', '', '', CURRENT_TIMESTAMP, '-1' );
MERGE INTO SYS_CONFIG USING (SELECT 1 FROM SYS_CONFIG A WHERE A.CONFIG_KEY = 'cas.authn.pac4j.oidc[0].azure.client-name') ON (APPLICATION = 'cas' AND CONFIG_KEY = 'cas.authn.pac4j.oidc[0].azure.expire-session-with-token') WHEN MATCHED THEN UPDATE SET VALUE = 'false', DEFAULT_VALUE = 'false', VALUE_FORMAT = '', MAIN_GROUP = 'idprovider', SUB_GROUP = 'oidc', MAIN_GROUP_ORDER = '99', SUB_GROUP_ORDER = '99', CONFIG_ORDER = '18', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = '', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1' WHEN NOT MATCHED THEN INSERT (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'cas', 'cas.authn.pac4j.oidc[0].azure.expire-session-with-token', 'false', 'false', '', 'idprovider', 'oidc', '99', '99', '18', '1', '1', '1', '0', '0', '1', 'text', 'text', '', '1', '', '', CURRENT_TIMESTAMP, '-1' );
MERGE INTO SYS_CONFIG USING (SELECT 1 FROM SYS_CONFIG A WHERE A.CONFIG_KEY = 'cas.authn.pac4j.oidc[0].azure.client-name') ON (APPLICATION = 'cas' AND CONFIG_KEY = 'cas.authn.pac4j.oidc[0].azure.token-expiration-advance') WHEN MATCHED THEN UPDATE SET VALUE = '0', DEFAULT_VALUE = '0', VALUE_FORMAT = '', MAIN_GROUP = 'idprovider', SUB_GROUP = 'oidc', MAIN_GROUP_ORDER = '99', SUB_GROUP_ORDER = '99', CONFIG_ORDER = '19', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = '', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1' WHEN NOT MATCHED THEN INSERT (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'cas', 'cas.authn.pac4j.oidc[0].azure.token-expiration-advance', '0', '0', '', 'idprovider', 'oidc', '99', '99', '19', '1', '1', '1', '0', '0', '1', 'text', 'text', '', '1', '', '', CURRENT_TIMESTAMP, '-1' );
MERGE INTO SYS_CONFIG USING (SELECT 1 FROM SYS_CONFIG A WHERE A.CONFIG_KEY = 'cas.authn.pac4j.oidc[0].azure.client-name') ON (APPLICATION = 'cas' AND CONFIG_KEY = 'cas.authn.pac4j.oidc[0].azure.enabled') WHEN MATCHED THEN UPDATE SET VALUE = 'true', DEFAULT_VALUE = 'true', VALUE_FORMAT = '', MAIN_GROUP = 'idprovider', SUB_GROUP = 'oidc', MAIN_GROUP_ORDER = '99', SUB_GROUP_ORDER = '99', CONFIG_ORDER = '20', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = '', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1' WHEN NOT MATCHED THEN INSERT (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'cas', 'cas.authn.pac4j.oidc[0].azure.enabled', 'true', 'true', '', 'idprovider', 'oidc', '99', '99', '20', '1', '1', '1', '0', '0', '1', 'text', 'text', '', '1', '', '', CURRENT_TIMESTAMP, '-1' );

MERGE INTO SYS_CONFIG USING (SELECT 1 FROM DUAL) ON (APPLICATION = 'cas' AND CONFIG_KEY = 'cas.authn.oauth.accessToken.crypto.encryption.key') WHEN MATCHED THEN UPDATE SET VALUE = '', DEFAULT_VALUE = '', VALUE_FORMAT = '', MAIN_GROUP = 'security', SUB_GROUP = 'cas', MAIN_GROUP_ORDER = '40', SUB_GROUP_ORDER = '5', CONFIG_ORDER = '0', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'Generated OAuth JWT Access Token encryption key of size 256.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1' WHEN NOT MATCHED THEN INSERT (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'cas', 'cas.authn.oauth.accessToken.crypto.encryption.key', '', '', '', 'security', 'cas', '40', '5', '0', '1', '1', '1', '0', '0', '1', 'text', 'text', '', '1', '', 'Generated OAuth JWT Access Token encryption key of size 256.', CURRENT_TIMESTAMP, '-1' );
MERGE INTO SYS_CONFIG USING (SELECT 1 FROM DUAL) ON (APPLICATION = 'cas' AND CONFIG_KEY = 'cas.authn.oauth.accessToken.crypto.signing.key') WHEN MATCHED THEN UPDATE SET VALUE = '', DEFAULT_VALUE = '', VALUE_FORMAT = '', MAIN_GROUP = 'security', SUB_GROUP = 'cas', MAIN_GROUP_ORDER = '40', SUB_GROUP_ORDER = '5', CONFIG_ORDER = '0', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'Generated OAuth JWT Access Token signing key of size 512.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1' WHEN NOT MATCHED THEN INSERT (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'cas', 'cas.authn.oauth.accessToken.crypto.signing.key', '', '', '', 'security', 'cas', '40', '5', '0', '1', '1', '1', '0', '0', '1', 'text', 'text', '', '1', '', 'Generated OAuth JWT Access Token signing key of size 512.', CURRENT_TIMESTAMP, '-1' );
MERGE INTO SYS_CONFIG USING (SELECT 1 FROM DUAL) ON (APPLICATION = 'cas' AND CONFIG_KEY = 'cas.authn.oauth.crypto.encryption.key') WHEN MATCHED THEN UPDATE SET VALUE = '', DEFAULT_VALUE = '', VALUE_FORMAT = '', MAIN_GROUP = 'security', SUB_GROUP = 'cas', MAIN_GROUP_ORDER = '40', SUB_GROUP_ORDER = '5', CONFIG_ORDER = '0', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'Generated OAuth encryption key of size 512.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1' WHEN NOT MATCHED THEN INSERT (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'cas', 'cas.authn.oauth.crypto.encryption.key', '', '', '', 'security', 'cas', '40', '5', '0', '1', '1', '1', '0', '0', '1', 'text', 'text', '', '1', '', 'Generated OAuth encryption key of size 512.', CURRENT_TIMESTAMP, '-1' );
MERGE INTO SYS_CONFIG USING (SELECT 1 FROM DUAL) ON (APPLICATION = 'cas' AND CONFIG_KEY = 'cas.authn.oauth.crypto.signing.key') WHEN MATCHED THEN UPDATE SET VALUE = '', DEFAULT_VALUE = '', VALUE_FORMAT = '', MAIN_GROUP = 'security', SUB_GROUP = 'cas', MAIN_GROUP_ORDER = '40', SUB_GROUP_ORDER = '5', CONFIG_ORDER = '0', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'Generated OAuth signing key of size 512.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1' WHEN NOT MATCHED THEN INSERT (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'cas', 'cas.authn.oauth.crypto.signing.key', '', '', '', 'security', 'cas', '40', '5', '0', '1', '1', '1', '0', '0', '1', 'text', 'text', '', '1', '', 'Generated OAuth signing key of size 512.', CURRENT_TIMESTAMP, '-1' );

UPDATE SYS_CONFIG SET VALUE_FORMAT = '{cipher}%s', OPTIONS = '', PATTERN = '' WHERE CONFIG_KEY LIKE 'cas.%.encryption.key' OR CONFIG_KEY LIKE 'cas.%.signing.key';

INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/auth/handlers/addWithAttachment', 'hasAnyAuthority(''MANAGE_USERS'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/auth/handlers/modifyWithAttachment', 'hasAnyAuthority(''MANAGE_USERS'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/auth/handlers/downloadFileResource/{resourceKey:.+}', 'hasAnyAuthority(''MANAGE_USERS'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/exports/LoginConfig/*', 'hasAnyAuthority(''MANAGE_USERS'')');
INSERT INTO SECURE_STORE (ID, NAME, HASH_ALGORITHM, CHECKSUM, MODIFIED_ON) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'saml2-keystore.jks', 'SHA1', '00', current_timestamp);
CREATE TABLE FILE_RESOURCE (
    ID                 NUMBER NOT NULL,
    APPLICATION        VARCHAR2(255 BYTE) NOT NULL,
    MODULE             VARCHAR2(25 BYTE) NOT NULL,
    FILE_KEY           VARCHAR2(25 BYTE) NOT NULL,
	PATH               VARCHAR2(260 BYTE) NOT NULL,
    CONTENT            BLOB NULL,
    MODIFIED_ON        TIMESTAMP(6) DEFAULT current_timestamp NOT NULL,
    MODIFIED_BY        NUMBER(10,0) DEFAULT -1 NOT NULL,
    CONSTRAINT FILE_RESOURCE_PK PRIMARY KEY ( ID ),
	CONSTRAINT FILE_RESOURCE_UK1 UNIQUE ( APPLICATION, MODULE, FILE_KEY )
);

UPDATE SYS_CONFIG SET CONFIG_KEY = 'cc-oidc-config.services[0].serviceId' WHERE CONFIG_KEY = 'cc-oidc-config.services[0].serviceUrl' AND application = 'application';

MERGE INTO SYS_CONFIG USING (SELECT 1 FROM DUAL) ON (APPLICATION = 'application' AND CONFIG_KEY = 'cc-oidc-config.services[0].encryptIdToken')
WHEN MATCHED THEN UPDATE SET VALUE = 'false', DEFAULT_VALUE = 'false', VALUE_FORMAT = '', MAIN_GROUP = 'security', SUB_GROUP = 'cas', MAIN_GROUP_ORDER = '40', SUB_GROUP_ORDER = '5', CONFIG_ORDER = '40', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '0', DATA_TYPE = 'boolean', FIELD_TYPE = 'checkbox' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'Encrypt OIDC id token.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'application', 'cc-oidc-config.services[0].encryptIdToken', 'false', 'false', '', 'security', 'cas', '40', '5', '40', '1', '1', '1', '0', '0', '0', 'boolean', 'checkbox', '', '1', '', 'Encrypt OIDC id token.', CURRENT_TIMESTAMP, '-1' );

MERGE INTO SYS_CONFIG USING (SELECT 1 FROM DUAL) ON (APPLICATION = 'application' AND CONFIG_KEY = 'cc-oidc-config.services[1].bypassApprovalPrompt')
WHEN MATCHED THEN UPDATE SET VALUE = 'true', DEFAULT_VALUE = 'ture', VALUE_FORMAT = '', MAIN_GROUP = 'security', SUB_GROUP = 'cas-oidc-policy-validator', MAIN_GROUP_ORDER = '40', SUB_GROUP_ORDER = '30', CONFIG_ORDER = '42', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '0', DATA_TYPE = 'boolean', FIELD_TYPE = 'checkbox' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'Bypass CAS OIDC approval prompt.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'application', 'cc-oidc-config.services[1].bypassApprovalPrompt', 'true', 'ture', '', 'security', 'cas-oidc-policy-validator', '40', '30', '42', '1', '1', '1', '0', '0', '0', 'boolean', 'checkbox', '', '1', '', 'Bypass CAS OIDC approval prompt.', CURRENT_TIMESTAMP, '-1' );

MERGE INTO SYS_CONFIG USING (SELECT 1 FROM DUAL) ON (APPLICATION = 'application' AND CONFIG_KEY = 'cc-oidc-config.services[1].clientId')
WHEN MATCHED THEN UPDATE SET VALUE = 'nextlabs-policy-validator', DEFAULT_VALUE = 'nextlabs-policy-validator', VALUE_FORMAT = '', MAIN_GROUP = 'security', SUB_GROUP = 'cas-oidc-policy-validator', MAIN_GROUP_ORDER = '40', SUB_GROUP_ORDER = '30', CONFIG_ORDER = '40', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '0', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'Client id for NextLabs Policy Validator OIDC authentication.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'application', 'cc-oidc-config.services[1].clientId', 'nextlabs-policy-validator', 'nextlabs-policy-validator', '', 'security', 'cas-oidc-policy-validator', '40', '30', '40', '1', '1', '1', '0', '0', '0', 'text', 'text', '', '1', '', 'Client id for NextLabs Policy Validator OIDC authentication.', CURRENT_TIMESTAMP, '-1' );

MERGE INTO SYS_CONFIG USING (SELECT 1 FROM DUAL) ON (APPLICATION = 'application' AND CONFIG_KEY = 'cc-oidc-config.services[1].clientSecret')
WHEN MATCHED THEN UPDATE SET VALUE = '', DEFAULT_VALUE = '', VALUE_FORMAT = '{cipher}%s', MAIN_GROUP = 'security', SUB_GROUP = 'cas-oidc-policy-validator', MAIN_GROUP_ORDER = '40', SUB_GROUP_ORDER = '30', CONFIG_ORDER = '44', HIDDEN = '0', READ_ONLY = '0', ADVANCED = '1', UI = '0', ENCRYPTED = '1', RESTART_REQUIRED = '0', DATA_TYPE = 'text', FIELD_TYPE = 'password' , OPTIONS = '', REQUIRED = '0', PATTERN = '^[a-zA-Z0-9]{16,32}$', DESCRIPTION = 'Client secret for NextLabs Policy Validator OIDC authentication. The client secret must be between 16 and 32 alphanumeric characters.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'application', 'cc-oidc-config.services[1].clientSecret', '', '', '{cipher}%s', 'security', 'cas-oidc-policy-validator', '40', '30', '44', '0', '0', '1', '0', '1', '0', 'text', 'password', '', '0', '^[a-zA-Z0-9]{16,32}$', 'Client secret for NextLabs Policy Validator OIDC authentication. The client secret must be between 16 and 32 alphanumeric characters.', CURRENT_TIMESTAMP, '-1' );

MERGE INTO SYS_CONFIG USING (SELECT 1 FROM DUAL) ON (APPLICATION = 'application' AND CONFIG_KEY = 'cc-oidc-config.services[1].encryptIdToken')
WHEN MATCHED THEN UPDATE SET VALUE = 'false', DEFAULT_VALUE = 'false', VALUE_FORMAT = '', MAIN_GROUP = 'security', SUB_GROUP = 'cas-oidc-policy-validator', MAIN_GROUP_ORDER = '40', SUB_GROUP_ORDER = '30', CONFIG_ORDER = '41', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '0', DATA_TYPE = 'boolean', FIELD_TYPE = 'checkbox' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'Encrypt OIDC id token.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'application', 'cc-oidc-config.services[1].encryptIdToken', 'false', 'false', '', 'security', 'cas-oidc-policy-validator', '40', '30', '41', '1', '1', '1', '0', '0', '0', 'boolean', 'checkbox', '', '1', '', 'Encrypt OIDC id token.', CURRENT_TIMESTAMP, '-1' );

MERGE INTO SYS_CONFIG USING (SELECT 1 FROM DUAL) ON (APPLICATION = 'application' AND CONFIG_KEY = 'cc-oidc-config.services[1].serviceId')
WHEN MATCHED THEN UPDATE SET VALUE = '${server.name}/policy-validator/authorization-code/callback', DEFAULT_VALUE = '${server.name}/policy-validator/authorization-code/callback', VALUE_FORMAT = '', MAIN_GROUP = 'security', SUB_GROUP = 'cas-oidc-policy-validator', MAIN_GROUP_ORDER = '40', SUB_GROUP_ORDER = '30', CONFIG_ORDER = '43', HIDDEN = '0', READ_ONLY = '0', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '0', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'Service id for NextLabs Policy Validator OIDC authentication.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'application', 'cc-oidc-config.services[1].serviceId', '${server.name}/policy-validator/authorization-code/callback', '${server.name}/policy-validator/authorization-code/callback', '', 'security', 'cas-oidc-policy-validator', '40', '30', '43', '0', '0', '1', '0', '0', '0', 'text', 'text', '', '1', '', 'Service id for NextLabs Policy Validator OIDC authentication.', CURRENT_TIMESTAMP, '-1' );

create table ENTITY_WORKFLOW_REQUEST
(
    ID number(19) not null
        constraint ENTITY_WORKFLOW_REQUEST_PKEY
            primary key,
    DEVELOPMENT_ID number(19),
    STATUS varchar2(255) not null,
    ENTITY_TYPE varchar2(255) not null,
    OLD_PQL clob,
    UPDATED_PQL clob,
    CREATED_DATE date,
    LAST_UPDATED_BY number(19),
    LAST_UPDATED date,
    CREATED_BY number(19),
    VERSION number(10) not null,
    constraint DEVELOPMENT_ID_FK foreign key (DEVELOPMENT_ID) references DEVELOPMENT_ENTITIES
);

create table WORKFLOW_LEVEL
(
    ID number(19) not null
        constraint WORKFLOW_LEVEL_PKEY
            primary key,
    NAME varchar2(255) not null,
    DESCRIPTION varchar2(4000),
    LEVEL_ORDER int not null,
    CREATED_DATE date,
    LAST_UPDATED_BY number(19),
    LAST_UPDATED date,
    CREATED_BY number(19),
    VERSION number(10) not null
);

create table WORKFLOW_REQUEST_LEVEL
(
    ID number(19) not null
        constraint WORKFLOW_REQUEST_LEVEL_PKEY
            primary key,
    LEVEL_ID number(19) not null,
    ENTITY_WORKFLOW_REQUEST_ID number(19),
    APPROVED_BY number(19),
    APPROVED_TIME date,
    STATUS varchar2(255) not null,
    CREATED_DATE date,
    LAST_UPDATED_BY number(19),
    LAST_UPDATED date,
    CREATED_BY number(19),
    VERSION number(10) not null,
    constraint WORKFLOW_LEVEL_FK foreign key (LEVEL_ID) references WORKFLOW_LEVEL,
    constraint ENTITY_WORKFLOW_REQUEST_FK FOREIGN KEY (ENTITY_WORKFLOW_REQUEST_ID) REFERENCES ENTITY_WORKFLOW_REQUEST
);

create table WORKFLOW_REQUEST_COMMENT
(
    ID number(19) not null
        constraint WORKFLOW_REQUEST_COMMENT_PKEY
            primary key,
    PARENT_COMMENT_ID number(19),
    ENTITY_WORKFLOW_REQUEST_ID number(19),
    CONTENT clob,
    CREATED_DATE date,
    LAST_UPDATED_BY number(19),
    LAST_UPDATED date,
    CREATED_BY number(19),
    VERSION number(10) not null,
    constraint WORKFLOW_PARENT_COMMENT_FK foreign key (PARENT_COMMENT_ID) references WORKFLOW_REQUEST_COMMENT,
    constraint ENTITY_WORKFLOW_REQUEST_FK1 foreign key (ENTITY_WORKFLOW_REQUEST_ID) references ENTITY_WORKFLOW_REQUEST
);

create table NOTIFICATION
(
    ID number(19) not null
        constraint NOTIFICATION_PK
            primary key,
    METADATA clob,
    SUBJECT clob,
    CONTENT clob,
    ENTITY_ID number(19),
    ENTITY_TYPE varchar2(255),
    NOTIFICATION_TYPE varchar2(255),
    CREATED_DATE date,
    LAST_UPDATED_BY number(19),
    LAST_UPDATED date,
    CREATED_BY number(19),
    VERSION number(10) not null
);

create table APPLICATION_USER_NOTIFICATION
(
    USER_ID number(19)
        constraint APPLICATION_USER_NOTIFICATION_APPLICATION_USER_ID_FK
            references APPLICATION_USER,
    NOTIFICATION_ID number(19)
        constraint APPLICATION_USER_NOTIFICATION_NOTIFICATION_ID_FK
            references NOTIFICATION,
    NOTIFIED CHAR(1 BYTE),
    IS_ACTIVE CHAR(1 BYTE),
    constraint APPLICATION_USER_NOTIFICATION_PK
        primary key (NOTIFICATION_ID, USER_ID)
);

create table SUPER_APPLICATION_USER_NOTIFICATION
(
    USER_ID number(19)
        constraint SUPER_APPLICATION_USER_NOTIFICATION_APPLICATION_USER_ID_FK
            references SUPER_APPLICATION_USER,
    NOTIFICATION_ID number(19)
        constraint SUPER_APPLICATION_USER_NOTIFICATION_NOTIFICATION_ID_FK
            references NOTIFICATION,
    NOTIFIED CHAR(1 BYTE),
    IS_ACTIVE CHAR(1 BYTE),
    constraint SUPER_APPLICATION_USER_NOTIFICATION_PK
        primary key (NOTIFICATION_ID, USER_ID)
);

INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/policyWorkflow/submit/{id:[0-9]+}', 'hasAuthority(''CREATE_POLICY'') or hasAuthority(''EDIT_POLICY'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/policyWorkflowComment/search', 'hasAuthority(''VIEW_POLICY'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/notification/search', 'authenticated');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/notification/mgmt/markAsRead/{notificationId:[0-9]+}', 'authenticated');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/policyWorkflow/approve/{id:[0-9]+}', 'hasAuthority(''VIEW_POLICY'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/policyWorkflow/return/{id:[0-9]+}', 'hasAuthority(''VIEW_POLICY'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/policyWorkflow/addComment', 'hasAuthority(''VIEW_POLICY'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/secured/**/**', 'authenticated');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/secured/**/**/**', 'authenticated');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/secured/socket', 'authenticated');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/secured/success', 'authenticated');

INSERT INTO WORKFLOW_LEVEL (ID, NAME, DESCRIPTION, LEVEL_ORDER, CREATED_DATE, LAST_UPDATED_BY, LAST_UPDATED, CREATED_BY, VERSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'Approval level 1', 'Approval level 1 description', 1, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 1);

MERGE INTO SYS_CONFIG USING (SELECT 1 FROM DUAL) ON (APPLICATION = 'console' AND CONFIG_KEY = 'policy.workflow.enable')
WHEN MATCHED THEN UPDATE SET VALUE = 'false', DEFAULT_VALUE = 'false', VALUE_FORMAT = '', MAIN_GROUP = 'general', SUB_GROUP = 'policy.workflow', MAIN_GROUP_ORDER = '0', SUB_GROUP_ORDER = '100', CONFIG_ORDER = '0', HIDDEN = '0', READ_ONLY = '0', ADVANCED = '0', UI = '1', ENCRYPTED = '0', RESTART_REQUIRED = '0', DATA_TYPE = 'boolean', FIELD_TYPE = 'checkbox' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'Turn the policy workflow on or off.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'console', 'policy.workflow.enable', 'false', 'false', '', 'general', 'policy.workflow', '0', '100', '0', '0', '0', '0', '1', '0', '0', 'boolean', 'checkbox', '', '1', '', 'Turn the policy workflow on or off.', CURRENT_TIMESTAMP, '-1' );

alter table DEVELOPMENT_ENTITIES
    add APPROVEDPQL clob;

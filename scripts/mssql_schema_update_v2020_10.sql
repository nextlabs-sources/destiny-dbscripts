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
MERGE INTO SYS_CONFIG SC1 USING (SELECT 'cas' AS APPLICATION, 'cas.authn.pac4j.oidc[0].azure.read-timeout' AS CONFIG_KEY) AS SC2 ON (SC1.APPLICATION = SC2.APPLICATION AND SC1.CONFIG_KEY = SC2.CONFIG_KEY) WHEN MATCHED THEN UPDATE SET VALUE = 'PT5S', DEFAULT_VALUE = 'PT5S', VALUE_FORMAT = '', MAIN_GROUP = 'idprovider', SUB_GROUP = 'oidc', MAIN_GROUP_ORDER = '99', SUB_GROUP_ORDER = '99', CONFIG_ORDER = '16', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = '', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1' WHEN NOT MATCHED AND EXISTS (SELECT 1 FROM SYS_CONFIG WHERE CONFIG_KEY = 'cas.authn.pac4j.oidc[0].azure.client-name') THEN INSERT (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES ('cas', 'cas.authn.pac4j.oidc[0].azure.read-timeout', 'PT5S', 'PT5S', '', 'idprovider', 'oidc', '99', '99', '16', '1', '1', '1', '0', '0', '1', 'text', 'text', '', '1', '', '', CURRENT_TIMESTAMP, '-1' )&semi;
MERGE INTO SYS_CONFIG SC1 USING (SELECT 'cas' AS APPLICATION, 'cas.authn.pac4j.oidc[0].azure.connect-timeout' AS CONFIG_KEY) AS SC2 ON (SC1.APPLICATION = SC2.APPLICATION AND SC1.CONFIG_KEY = SC2.CONFIG_KEY) WHEN MATCHED THEN UPDATE SET VALUE = 'PT5S', DEFAULT_VALUE = 'PT5S', VALUE_FORMAT = '', MAIN_GROUP = 'idprovider', SUB_GROUP = 'oidc', MAIN_GROUP_ORDER = '99', SUB_GROUP_ORDER = '99', CONFIG_ORDER = '17', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = '', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1' WHEN NOT MATCHED AND EXISTS (SELECT 1 FROM SYS_CONFIG WHERE CONFIG_KEY = 'cas.authn.pac4j.oidc[0].azure.client-name') THEN INSERT (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES ('cas', 'cas.authn.pac4j.oidc[0].azure.connect-timeout', 'PT5S', 'PT5S', '', 'idprovider', 'oidc', '99', '99', '17', '1', '1', '1', '0', '0', '1', 'text', 'text', '', '1', '', '', CURRENT_TIMESTAMP, '-1' )&semi;
MERGE INTO SYS_CONFIG SC1 USING (SELECT 'cas' AS APPLICATION, 'cas.authn.pac4j.oidc[0].azure.expire-session-with-token' AS CONFIG_KEY) AS SC2 ON (SC1.APPLICATION = SC2.APPLICATION AND SC1.CONFIG_KEY = SC2.CONFIG_KEY) WHEN MATCHED THEN UPDATE SET VALUE = 'false', DEFAULT_VALUE = 'false', VALUE_FORMAT = '', MAIN_GROUP = 'idprovider', SUB_GROUP = 'oidc', MAIN_GROUP_ORDER = '99', SUB_GROUP_ORDER = '99', CONFIG_ORDER = '18', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = '', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1' WHEN NOT MATCHED AND EXISTS (SELECT 1 FROM SYS_CONFIG WHERE CONFIG_KEY = 'cas.authn.pac4j.oidc[0].azure.client-name') THEN INSERT (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES ('cas', 'cas.authn.pac4j.oidc[0].azure.expire-session-with-token', 'false', 'false', '', 'idprovider', 'oidc', '99', '99', '18', '1', '1', '1', '0', '0', '1', 'text', 'text', '', '1', '', '', CURRENT_TIMESTAMP, '-1' )&semi;
MERGE INTO SYS_CONFIG SC1 USING (SELECT 'cas' AS APPLICATION, 'cas.authn.pac4j.oidc[0].azure.token-expiration-advance' AS CONFIG_KEY) AS SC2 ON (SC1.APPLICATION = SC2.APPLICATION AND SC1.CONFIG_KEY = SC2.CONFIG_KEY) WHEN MATCHED THEN UPDATE SET VALUE = '0', DEFAULT_VALUE = '0', VALUE_FORMAT = '', MAIN_GROUP = 'idprovider', SUB_GROUP = 'oidc', MAIN_GROUP_ORDER = '99', SUB_GROUP_ORDER = '99', CONFIG_ORDER = '19', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = '', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1' WHEN NOT MATCHED AND EXISTS (SELECT 1 FROM SYS_CONFIG WHERE CONFIG_KEY = 'cas.authn.pac4j.oidc[0].azure.client-name') THEN INSERT (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES ('cas', 'cas.authn.pac4j.oidc[0].azure.token-expiration-advance', '0', '0', '', 'idprovider', 'oidc', '99', '99', '19', '1', '1', '1', '0', '0', '1', 'text', 'text', '', '1', '', '', CURRENT_TIMESTAMP, '-1' )&semi;
MERGE INTO SYS_CONFIG SC1 USING (SELECT 'cas' AS APPLICATION, 'cas.authn.pac4j.oidc[0].azure.enabled' AS CONFIG_KEY) AS SC2 ON (SC1.APPLICATION = SC2.APPLICATION AND SC1.CONFIG_KEY = SC2.CONFIG_KEY) WHEN MATCHED THEN UPDATE SET VALUE = 'true', DEFAULT_VALUE = 'true', VALUE_FORMAT = '', MAIN_GROUP = 'idprovider', SUB_GROUP = 'oidc', MAIN_GROUP_ORDER = '99', SUB_GROUP_ORDER = '99', CONFIG_ORDER = '20', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = '', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1' WHEN NOT MATCHED AND EXISTS (SELECT 1 FROM SYS_CONFIG WHERE CONFIG_KEY = 'cas.authn.pac4j.oidc[0].azure.client-name') THEN INSERT (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES ('cas', 'cas.authn.pac4j.oidc[0].azure.enabled', 'true', 'true', '', 'idprovider', 'oidc', '99', '99', '20', '1', '1', '1', '0', '0', '1', 'text', 'text', '', '1', '', '', CURRENT_TIMESTAMP, '-1' )&semi;

MERGE INTO SYS_CONFIG SC1 USING (SELECT 'cas' AS APPLICATION, 'cas.authn.oauth.accessToken.crypto.encryption.key' AS CONFIG_KEY) AS SC2 ON (SC1.APPLICATION = SC2.APPLICATION AND SC1.CONFIG_KEY = SC2.CONFIG_KEY) WHEN MATCHED THEN UPDATE SET VALUE = '', DEFAULT_VALUE = '', VALUE_FORMAT = '', MAIN_GROUP = 'security', SUB_GROUP = 'cas', MAIN_GROUP_ORDER = '40', SUB_GROUP_ORDER = '5', CONFIG_ORDER = '0', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'Generated OAuth JWT Access Token encryption key of size 256.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1' WHEN NOT MATCHED THEN INSERT (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES ('cas', 'cas.authn.oauth.accessToken.crypto.encryption.key', '', '', '', 'security', 'cas', '40', '5', '0', '1', '1', '1', '0', '0', '1', 'text', 'text', '', '1', '', 'Generated OAuth JWT Access Token encryption key of size 256.', CURRENT_TIMESTAMP, '-1' )&semi;
MERGE INTO SYS_CONFIG SC1 USING (SELECT 'cas' AS APPLICATION, 'cas.authn.oauth.accessToken.crypto.signing.key' AS CONFIG_KEY) AS SC2 ON (SC1.APPLICATION = SC2.APPLICATION AND SC1.CONFIG_KEY = SC2.CONFIG_KEY) WHEN MATCHED THEN UPDATE SET VALUE = '', DEFAULT_VALUE = '', VALUE_FORMAT = '', MAIN_GROUP = 'security', SUB_GROUP = 'cas', MAIN_GROUP_ORDER = '40', SUB_GROUP_ORDER = '5', CONFIG_ORDER = '0', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'Generated OAuth JWT Access Token signing key of size 512.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1' WHEN NOT MATCHED THEN INSERT (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES ('cas', 'cas.authn.oauth.accessToken.crypto.signing.key', '', '', '', 'security', 'cas', '40', '5', '0', '1', '1', '1', '0', '0', '1', 'text', 'text', '', '1', '', 'Generated OAuth JWT Access Token signing key of size 512.', CURRENT_TIMESTAMP, '-1' )&semi;
MERGE INTO SYS_CONFIG SC1 USING (SELECT 'cas' AS APPLICATION, 'cas.authn.oauth.crypto.encryption.key' AS CONFIG_KEY) AS SC2 ON (SC1.APPLICATION = SC2.APPLICATION AND SC1.CONFIG_KEY = SC2.CONFIG_KEY) WHEN MATCHED THEN UPDATE SET VALUE = '', DEFAULT_VALUE = '', VALUE_FORMAT = '', MAIN_GROUP = 'security', SUB_GROUP = 'cas', MAIN_GROUP_ORDER = '40', SUB_GROUP_ORDER = '5', CONFIG_ORDER = '0', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'Generated OAuth encryption key of size 512.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1' WHEN NOT MATCHED THEN INSERT (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES ('cas', 'cas.authn.oauth.crypto.encryption.key', '', '', '', 'security', 'cas', '40', '5', '0', '1', '1', '1', '0', '0', '1', 'text', 'text', '', '1', '', 'Generated OAuth encryption key of size 512.', CURRENT_TIMESTAMP, '-1' )&semi;
MERGE INTO SYS_CONFIG SC1 USING (SELECT 'cas' AS APPLICATION, 'cas.authn.oauth.crypto.signing.key' AS CONFIG_KEY) AS SC2 ON (SC1.APPLICATION = SC2.APPLICATION AND SC1.CONFIG_KEY = SC2.CONFIG_KEY) WHEN MATCHED THEN UPDATE SET VALUE = '', DEFAULT_VALUE = '', VALUE_FORMAT = '', MAIN_GROUP = 'security', SUB_GROUP = 'cas', MAIN_GROUP_ORDER = '40', SUB_GROUP_ORDER = '5', CONFIG_ORDER = '0', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'Generated OAuth signing key of size 512.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1' WHEN NOT MATCHED THEN INSERT (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES ('cas', 'cas.authn.oauth.crypto.signing.key', '', '', '', 'security', 'cas', '40', '5', '0', '1', '1', '1', '0', '0', '1', 'text', 'text', '', '1', '', 'Generated OAuth signing key of size 512.', CURRENT_TIMESTAMP, '-1' )&semi;

UPDATE SYS_CONFIG SET VALUE_FORMAT = '{cipher}%s', OPTIONS = '', PATTERN = '' WHERE CONFIG_KEY LIKE 'cas.%.encryption.key' OR CONFIG_KEY LIKE 'cas.%.signing.key';

INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/auth/handlers/addWithAttachment', 'hasAnyAuthority(''MANAGE_USERS'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/auth/handlers/modifyWithAttachment', 'hasAnyAuthority(''MANAGE_USERS'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('GET', '/api/v1/auth/handlers/downloadFileResource/{resourceKey:.+}', 'hasAnyAuthority(''MANAGE_USERS'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('GET', '/exports/LoginConfig/*', 'hasAnyAuthority(''MANAGE_USERS'')');
INSERT INTO SECURE_STORE (NAME, HASH_ALGORITHM, CHECKSUM, MODIFIED_ON) VALUES ('saml2-keystore.jks', 'SHA1', '00', current_timestamp);
CREATE TABLE FILE_RESOURCE (
    [ID]                 [numeric] (18, 0) IDENTITY(1,1) NOT NULL,
    [APPLICATION]        [varchar] (255) NOT NULL,
    [MODULE]             [varchar] (25) NOT NULL,
	[FILE_KEY]           [varchar] (25) NOT NULL,
	[PATH]               [varchar] (260) NOT NULL,
    [CONTENT]            [varbinary] (MAX) NULL,
    [MODIFIED_ON]        [datetime] NOT NULL DEFAULT current_timestamp,
    [MODIFIED_BY]        [numeric] (10,0) DEFAULT -1 NOT NULL,
    CONSTRAINT FILE_RESOURCE_PK PRIMARY KEY ( [ID] ),
	CONSTRAINT FILE_RESOURCE_UK1 UNIQUE ( [APPLICATION], [MODULE], [FILE_KEY] )
);

UPDATE SYS_CONFIG SET CONFIG_KEY = 'cc-oidc-config.services[0].serviceId' WHERE CONFIG_KEY = 'cc-oidc-config.services[0].serviceUrl' AND application = 'application';

MERGE INTO SYS_CONFIG SC1 USING (SELECT 'application' AS APPLICATION, 'cc-oidc-config.services[0].encryptIdToken' AS CONFIG_KEY) AS SC2 ON (SC1.APPLICATION = SC2.APPLICATION AND SC1.CONFIG_KEY = SC2.CONFIG_KEY)
WHEN MATCHED THEN UPDATE SET VALUE = 'false', DEFAULT_VALUE = 'false', VALUE_FORMAT = '', MAIN_GROUP = 'security', SUB_GROUP = 'cas', MAIN_GROUP_ORDER = '40', SUB_GROUP_ORDER = '5', CONFIG_ORDER = '40', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '0', DATA_TYPE = 'boolean', FIELD_TYPE = 'checkbox' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'Encrypt OIDC id token.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES ('application', 'cc-oidc-config.services[0].encryptIdToken', 'false', 'false', '', 'security', 'cas', '40', '5', '40', '1', '1', '1', '0', '0', '0', 'boolean', 'checkbox', '', '1', '', 'Encrypt OIDC id token.', CURRENT_TIMESTAMP, '-1' )&semi;

MERGE INTO SYS_CONFIG SC1 USING (SELECT 'application' AS APPLICATION, 'cc-oidc-config.services[1].bypassApprovalPrompt' AS CONFIG_KEY) AS SC2 ON (SC1.APPLICATION = SC2.APPLICATION AND SC1.CONFIG_KEY = SC2.CONFIG_KEY)
WHEN MATCHED THEN UPDATE SET VALUE = 'true', DEFAULT_VALUE = 'ture', VALUE_FORMAT = '', MAIN_GROUP = 'security', SUB_GROUP = 'cas-oidc-policy-validator', MAIN_GROUP_ORDER = '40', SUB_GROUP_ORDER = '30', CONFIG_ORDER = '42', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '0', DATA_TYPE = 'boolean', FIELD_TYPE = 'checkbox' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'Bypass CAS OIDC approval prompt.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES ('application', 'cc-oidc-config.services[1].bypassApprovalPrompt', 'true', 'ture', '', 'security', 'cas-oidc-policy-validator', '40', '30', '42', '1', '1', '1', '0', '0', '0', 'boolean', 'checkbox', '', '1', '', 'Bypass CAS OIDC approval prompt.', CURRENT_TIMESTAMP, '-1' )&semi;

MERGE INTO SYS_CONFIG SC1 USING (SELECT 'application' AS APPLICATION, 'cc-oidc-config.services[1].clientId' AS CONFIG_KEY) AS SC2 ON (SC1.APPLICATION = SC2.APPLICATION AND SC1.CONFIG_KEY = SC2.CONFIG_KEY)
WHEN MATCHED THEN UPDATE SET VALUE = 'nextlabs-policy-validator', DEFAULT_VALUE = 'nextlabs-policy-validator', VALUE_FORMAT = '', MAIN_GROUP = 'security', SUB_GROUP = 'cas-oidc-policy-validator', MAIN_GROUP_ORDER = '40', SUB_GROUP_ORDER = '30', CONFIG_ORDER = '40', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '0', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'Client id for NextLabs Policy Validator OIDC authentication.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES ('application', 'cc-oidc-config.services[1].clientId', 'nextlabs-policy-validator', 'nextlabs-policy-validator', '', 'security', 'cas-oidc-policy-validator', '40', '30', '40', '1', '1', '1', '0', '0', '0', 'text', 'text', '', '1', '', 'Client id for NextLabs Policy Validator OIDC authentication.', CURRENT_TIMESTAMP, '-1' )&semi;

MERGE INTO SYS_CONFIG SC1 USING (SELECT 'application' AS APPLICATION, 'cc-oidc-config.services[1].clientSecret' AS CONFIG_KEY) AS SC2 ON (SC1.APPLICATION = SC2.APPLICATION AND SC1.CONFIG_KEY = SC2.CONFIG_KEY)
WHEN MATCHED THEN UPDATE SET VALUE = '', DEFAULT_VALUE = '', VALUE_FORMAT = '{cipher}%s', MAIN_GROUP = 'security', SUB_GROUP = 'cas-oidc-policy-validator', MAIN_GROUP_ORDER = '40', SUB_GROUP_ORDER = '30', CONFIG_ORDER = '44', HIDDEN = '0', READ_ONLY = '0', ADVANCED = '1', UI = '0', ENCRYPTED = '1', RESTART_REQUIRED = '0', DATA_TYPE = 'text', FIELD_TYPE = 'password' , OPTIONS = '', REQUIRED = '0', PATTERN = '^[a-zA-Z0-9]{16,32}$', DESCRIPTION = 'Client secret for NextLabs Policy Validator OIDC authentication. The client secret must be between 16 and 32 alphanumeric characters.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES ('application', 'cc-oidc-config.services[1].clientSecret', '', '', '{cipher}%s', 'security', 'cas-oidc-policy-validator', '40', '30', '44', '0', '0', '1', '0', '1', '0', 'text', 'password', '', '0', '^[a-zA-Z0-9]{16,32}$', 'Client secret for NextLabs Policy Validator OIDC authentication. The client secret must be between 16 and 32 alphanumeric characters.', CURRENT_TIMESTAMP, '-1' )&semi;

MERGE INTO SYS_CONFIG SC1 USING (SELECT 'application' AS APPLICATION, 'cc-oidc-config.services[1].encryptIdToken' AS CONFIG_KEY) AS SC2 ON (SC1.APPLICATION = SC2.APPLICATION AND SC1.CONFIG_KEY = SC2.CONFIG_KEY)
WHEN MATCHED THEN UPDATE SET VALUE = 'false', DEFAULT_VALUE = 'false', VALUE_FORMAT = '', MAIN_GROUP = 'security', SUB_GROUP = 'cas-oidc-policy-validator', MAIN_GROUP_ORDER = '40', SUB_GROUP_ORDER = '30', CONFIG_ORDER = '41', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '0', DATA_TYPE = 'boolean', FIELD_TYPE = 'checkbox' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'Encrypt OIDC id token.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES ('application', 'cc-oidc-config.services[1].encryptIdToken', 'false', 'false', '', 'security', 'cas-oidc-policy-validator', '40', '30', '41', '1', '1', '1', '0', '0', '0', 'boolean', 'checkbox', '', '1', '', 'Encrypt OIDC id token.', CURRENT_TIMESTAMP, '-1' )&semi;

MERGE INTO SYS_CONFIG SC1 USING (SELECT 'application' AS APPLICATION, 'cc-oidc-config.services[1].serviceId' AS CONFIG_KEY) AS SC2 ON (SC1.APPLICATION = SC2.APPLICATION AND SC1.CONFIG_KEY = SC2.CONFIG_KEY)
WHEN MATCHED THEN UPDATE SET VALUE = '${server.name}/policy-validator/authorization-code/callback', DEFAULT_VALUE = '${server.name}/policy-validator/authorization-code/callback', VALUE_FORMAT = '', MAIN_GROUP = 'security', SUB_GROUP = 'cas-oidc-policy-validator', MAIN_GROUP_ORDER = '40', SUB_GROUP_ORDER = '30', CONFIG_ORDER = '43', HIDDEN = '0', READ_ONLY = '0', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '0', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'Service id for NextLabs Policy Validator OIDC authentication.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES ('application', 'cc-oidc-config.services[1].serviceId', '${server.name}/policy-validator/authorization-code/callback', '${server.name}/policy-validator/authorization-code/callback', '', 'security', 'cas-oidc-policy-validator', '40', '30', '43', '0', '0', '1', '0', '0', '0', 'text', 'text', '', '1', '', 'Service id for NextLabs Policy Validator OIDC authentication.', CURRENT_TIMESTAMP, '-1' )&semi;

create table ENTITY_WORKFLOW_REQUEST
(
    ID numeric(19) identity(1,1) not null
        constraint ENTITY_WORKFLOW_REQUEST_PKEY
            primary key,
    DEVELOPMENT_ID numeric(19) null,
    STATUS nvarchar(255) not null,
    ENTITY_TYPE nvarchar(255) not null,
    OLD_PQL nvarchar(max),
    UPDATED_PQL nvarchar(max),
    CREATED_DATE datetime,
    LAST_UPDATED_BY numeric(19),
    LAST_UPDATED datetime,
    CREATED_BY numeric(19),
    VERSION numeric(10) not null,
    CONSTRAINT DEVELOPMENT_ID_FK FOREIGN KEY (DEVELOPMENT_ID) REFERENCES DEVELOPMENT_ENTITIES
);

create table WORKFLOW_LEVEL
(
    ID numeric(19) identity(1,1) not null
        constraint WORKFLOW_LEVEL_PKEY
            primary key,
    NAME nvarchar(255) not null,
    DESCRIPTION nvarchar(4000),
    LEVEL_ORDER int not null,
    CREATED_DATE datetime,
    LAST_UPDATED_BY numeric(19),
    LAST_UPDATED datetime,
    CREATED_BY numeric(19),
    VERSION numeric(10) not null
);

create table WORKFLOW_REQUEST_LEVEL
(
    ID numeric(19) identity(1,1) not null
        constraint WORKFLOW_REQUEST_LEVEL_PKEY
            primary key,
    LEVEL_ID numeric(19) not null,
    ENTITY_WORKFLOW_REQUEST_ID numeric(19) null,
    APPROVED_BY numeric(19),
    APPROVED_TIME DATE,
    STATUS nvarchar(255) not null,
    CREATED_DATE datetime,
    LAST_UPDATED_BY numeric(19),
    LAST_UPDATED datetime,
    CREATED_BY numeric(19),
    VERSION numeric(10) not null,
    CONSTRAINT WORKFLOW_LEVEL_FK FOREIGN KEY (LEVEL_ID) REFERENCES WORKFLOW_LEVEL,
    CONSTRAINT ENTITY_WORKFLOW_REQUEST_FK FOREIGN KEY (ENTITY_WORKFLOW_REQUEST_ID) REFERENCES ENTITY_WORKFLOW_REQUEST
);

create table WORKFLOW_REQUEST_COMMENT
(
    ID numeric(19) identity(1,1) not null
        constraint WORKFLOW_REQUEST_COMMENT_PKEY
            primary key,
    PARENT_COMMENT_ID numeric(19) null,
    ENTITY_WORKFLOW_REQUEST_ID numeric(19),
    CONTENT nvarchar(max),
    CREATED_DATE datetime,
    LAST_UPDATED_BY numeric(19),
    LAST_UPDATED datetime,
    CREATED_BY numeric(19),
    VERSION numeric(10) not null,
    CONSTRAINT WORKFLOW_PARENT_COMMENT_FK FOREIGN KEY (PARENT_COMMENT_ID) REFERENCES WORKFLOW_REQUEST_COMMENT,
    CONSTRAINT ENTITY_WORKFLOW_REQUEST_FK1 FOREIGN KEY (ENTITY_WORKFLOW_REQUEST_ID) REFERENCES ENTITY_WORKFLOW_REQUEST
);

create table NOTIFICATION
(
    ID numeric(19) identity(1,1) not null
        constraint NOTIFICATION_PK
            primary key,
    METADATA nvarchar(max),
    SUBJECT nvarchar(max),
    CONTENT nvarchar(max),
    ENTITY_ID numeric(19),
    ENTITY_TYPE nvarchar(255),
    NOTIFICATION_TYPE nvarchar(255),
    CREATED_DATE datetime,
    LAST_UPDATED_BY numeric(19),
    LAST_UPDATED datetime,
    CREATED_BY numeric(19),
    VERSION numeric(10) not null
);

create table APPLICATION_USER_NOTIFICATION
(
    USER_ID numeric(19)
        constraint APPLICATION_USER_NOTIFICATION_APPLICATION_USER_ID_FK
            references APPLICATION_USER,
    NOTIFICATION_ID numeric(19)
        constraint APPLICATION_USER_NOTIFICATION_NOTIFICATION_ID_FK
            references NOTIFICATION,
    NOTIFIED bit DEFAULT 0 NOT NULL,
    IS_ACTIVE bit DEFAULT 0 NOT NULL,
    constraint APPLICATION_USER_NOTIFICATION_PK
        primary key (NOTIFICATION_ID, USER_ID)
);

create table SUPER_APPLICATION_USER_NOTIFICATION
(
    USER_ID numeric(19)
        constraint SUPER_APPLICATION_USER_NOTIFICATION_APPLICATION_USER_ID_FK
            references SUPER_APPLICATION_USER,
    NOTIFICATION_ID numeric(19)
        constraint SUPER_APPLICATION_USER_NOTIFICATION_NOTIFICATION_ID_FK
            references NOTIFICATION,
    NOTIFIED bit DEFAULT 0 NOT NULL,
    IS_ACTIVE bit DEFAULT 0 NOT NULL,
    constraint SUPER_APPLICATION_USER_NOTIFICATION_PK
        primary key (NOTIFICATION_ID, USER_ID)
);

INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/policyWorkflow/submit/{id:[0-9]+}', 'hasAuthority(''CREATE_POLICY'') or hasAuthority(''EDIT_POLICY'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/policyWorkflowComment/search', 'hasAuthority(''VIEW_POLICY'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/notification/search', 'authenticated');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/notification/mgmt/markAsRead/{notificationId:[0-9]+}', 'authenticated');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/policyWorkflow/approve/{id:[0-9]+}', 'hasAuthority(''VIEW_POLICY'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/policyWorkflow/return/{id:[0-9]+}', 'hasAuthority(''VIEW_POLICY'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/policyWorkflow/addComment', 'hasAuthority(''VIEW_POLICY'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/secured/**/**', 'authenticated');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/secured/**/**/**', 'authenticated');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/secured/socket', 'authenticated');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/secured/success', 'authenticated');

INSERT INTO WORKFLOW_LEVEL (NAME, DESCRIPTION, LEVEL_ORDER, CREATED_DATE, LAST_UPDATED_BY, LAST_UPDATED, CREATED_BY, VERSION) VALUES ('Policy Workflow', '', 1, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 1);

MERGE INTO SYS_CONFIG SC1 USING (SELECT 'console' AS APPLICATION, 'policy.workflow.enable' AS CONFIG_KEY) AS SC2 ON (SC1.APPLICATION = SC2.APPLICATION AND SC1.CONFIG_KEY = SC2.CONFIG_KEY)
WHEN MATCHED THEN UPDATE SET VALUE = 'false', DEFAULT_VALUE = 'false', VALUE_FORMAT = '', MAIN_GROUP = 'general', SUB_GROUP = 'policy.workflow', MAIN_GROUP_ORDER = '0', SUB_GROUP_ORDER = '100', CONFIG_ORDER = '0', HIDDEN = '0', READ_ONLY = '0', ADVANCED = '0', UI = '1', ENCRYPTED = '0', RESTART_REQUIRED = '0', DATA_TYPE = 'boolean', FIELD_TYPE = 'checkbox' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'Turn the policy workflow on or off.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES ('console', 'policy.workflow.enable', 'false', 'false', '', 'general', 'policy.workflow', '0', '100', '0', '0', '0', '0', '1', '0', '0', 'boolean', 'checkbox', '', '1', '', 'Turn the policy workflow on or off.', CURRENT_TIMESTAMP, '-1' )&semi;

alter table DEVELOPMENT_ENTITIES
    add APPROVEDPQL nvarchar(max);

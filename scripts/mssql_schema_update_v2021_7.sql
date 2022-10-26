MERGE INTO SYS_CONFIG SC1 USING (SELECT 'console' AS APPLICATION, 'policyValidator.url' AS CONFIG_KEY) AS SC2 ON (SC1.APPLICATION = SC2.APPLICATION AND SC1.CONFIG_KEY = SC2.CONFIG_KEY)
WHEN MATCHED THEN UPDATE SET VALUE = 'https://${server.hostname}:6443/policy-validator', DEFAULT_VALUE = 'https://${server.hostname}:6443/policy-validator', VALUE_FORMAT = '', MAIN_GROUP = 'general', SUB_GROUP = 'url', MAIN_GROUP_ORDER = '0', SUB_GROUP_ORDER = '10', CONFIG_ORDER = '10', HIDDEN = '0', READ_ONLY = '0', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'Control Center Policy Validator URL.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES ('console', 'policyValidator.url', 'https://${server.hostname}:6443/policy-validator', 'https://${server.hostname}:6443/policy-validator', '', 'general', 'url', '0', '10', '10', '0', '0', '1', '0', '0', '1', 'text', 'text', '', '1', '', 'Control Center Policy Validator URL.', CURRENT_TIMESTAMP, '-1' )&semi;

INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('GET', '/policy-validator', 'authenticated');

UPDATE SYS_CONFIG SET VALUE = 'PKCS12', DEFAULT_VALUE = 'PKCS12' WHERE CONFIG_KEY = 'key.store.type';
UPDATE SYS_CONFIG SET VALUE = 'PKCS12', DEFAULT_VALUE = 'PKCS12' WHERE CONFIG_KEY = 'trust.store.type';
UPDATE SYS_CONFIG SET VALUE = '${cc.home}/server/certificates/saml2-keystore.p12', DEFAULT_VALUE = '${cc.home}/server/certificates/saml2-keystore.p12' WHERE CONFIG_KEY = 'cas.authn.pac4j.saml[0].keystore-path';
UPDATE SYS_CONFIG SET VALUE = '${cc.home}/server/configuration/idp-metadata.xml', DEFAULT_VALUE = '${cc.home}/server/configuration/idp-metadata.xml' WHERE CONFIG_KEY = 'cas.authn.pac4j.saml[0].identity-provider-metadata-path';
UPDATE SYS_CONFIG SET VALUE = '${cc.home}/server/configuration/sp-metadata.xml', DEFAULT_VALUE = '${cc.home}/server/configuration/sp-metadata.xml' WHERE CONFIG_KEY = 'cas.authn.pac4j.saml[0].service-provider-metadata-path';
UPDATE SYS_CONFIG SET CONFIG_KEY = 'logging.file.path' WHERE APPLICATION = 'application' AND CONFIG_KEY = 'logging.path';

UPDATE SECURE_STORE SET NAME = 'agent-keystore.p12' WHERE NAME = 'agent-keystore.jks';
UPDATE SECURE_STORE SET NAME = 'agent-truststore.p12' WHERE NAME = 'agent-truststore.jks';
UPDATE SECURE_STORE SET NAME = 'application-keystore.p12' WHERE NAME = 'application-keystore.jks';
UPDATE SECURE_STORE SET NAME = 'application-truststore.p12' WHERE NAME = 'application-truststore.jks';
UPDATE SECURE_STORE SET NAME = 'dcc-keystore.p12' WHERE NAME = 'dcc-keystore.jks';
UPDATE SECURE_STORE SET NAME = 'dcc-truststore.p12' WHERE NAME = 'dcc-truststore.jks';
UPDATE SECURE_STORE SET NAME = 'digital-signature-keystore.p12' WHERE NAME = 'digital-signature-keystore.jks';
UPDATE SECURE_STORE SET NAME = 'digital-signature-truststore.p12' WHERE NAME = 'digital-signature-truststore.jks';
UPDATE SECURE_STORE SET NAME = 'legacy-agent-keystore.p12' WHERE NAME = 'legacy-agent-keystore.jks';
UPDATE SECURE_STORE SET NAME = 'legacy-agent-truststore-kp.p12' WHERE NAME = 'legacy-agent-truststore-kp.jks';
UPDATE SECURE_STORE SET NAME = 'legacy-agent-truststore.p12' WHERE NAME = 'legacy-agent-truststore.jks';
UPDATE SECURE_STORE SET NAME = 'web-keystore.p12' WHERE NAME = 'web-keystore.jks';
UPDATE SECURE_STORE SET NAME = 'web-truststore.p12' WHERE NAME = 'web-truststore.jks';
UPDATE SECURE_STORE SET NAME = 'saml2-keystore.p12' WHERE NAME = 'saml2-keystore.jks';

MERGE INTO SYS_CONFIG SC1 USING (SELECT 'console' AS APPLICATION, 'data.transportation.keyStoreFile' AS CONFIG_KEY) AS SC2 ON (SC1.APPLICATION = SC2.APPLICATION AND SC1.CONFIG_KEY = SC2.CONFIG_KEY)
WHEN MATCHED THEN UPDATE SET VALUE = '${cc.home}/server/certificates/digital-signature-keystore.p12', DEFAULT_VALUE = '${cc.home}/server/certificates/digital-signature-keystore.p12', VALUE_FORMAT = '', MAIN_GROUP = 'policy', SUB_GROUP = 'data.transportation', MAIN_GROUP_ORDER = '10', SUB_GROUP_ORDER = '0', CONFIG_ORDER = '6', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '0', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '0', PATTERN = '', DESCRIPTION = '', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES ('console', 'data.transportation.keyStoreFile', '${cc.home}/server/certificates/digital-signature-keystore.p12', '${cc.home}/server/certificates/digital-signature-keystore.p12', '', 'policy', 'data.transportation', '10', '0', '6', '1', '1', '0', '0', '0', '1', 'text', 'text', '', '0', '', '', CURRENT_TIMESTAMP, '-1' )&semi;

MERGE INTO SYS_CONFIG SC1 USING (SELECT 'console' AS APPLICATION, 'data.transportation.trustStoreFile' AS CONFIG_KEY) AS SC2 ON (SC1.APPLICATION = SC2.APPLICATION AND SC1.CONFIG_KEY = SC2.CONFIG_KEY)
WHEN MATCHED THEN UPDATE SET VALUE = '${cc.home}/server/certificates/digital-signature-truststore.p12', DEFAULT_VALUE = '${cc.home}/server/certificates/digital-signature-truststore.p12', VALUE_FORMAT = '', MAIN_GROUP = 'policy', SUB_GROUP = 'data.transportation', MAIN_GROUP_ORDER = '10', SUB_GROUP_ORDER = '0', CONFIG_ORDER = '7', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '0', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '0', PATTERN = '', DESCRIPTION = '', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1'
WHEN NOT MATCHED THEN INSERT (APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES ('console', 'data.transportation.trustStoreFile', '${cc.home}/server/certificates/digital-signature-truststore.p12', '${cc.home}/server/certificates/digital-signature-truststore.p12', '', 'policy', 'data.transportation', '10', '0', '7', '1', '1', '0', '0', '0', '1', 'text', 'text', '', '0', '', '', CURRENT_TIMESTAMP, '-1' )&semi;

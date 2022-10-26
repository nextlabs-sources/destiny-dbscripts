UPDATE SYS_CONFIG SET RESTART_REQUIRED = '0' WHERE CONFIG_KEY LIKE 'data.transportation.%';
UPDATE SYS_CONFIG SET CONFIG_KEY = 'data.transportation.keyStoreFile' WHERE CONFIG_KEY = 'data.transportation.keystore.file';
UPDATE SYS_CONFIG SET CONFIG_KEY = 'data.transportation.allowPlainTextExport' WHERE CONFIG_KEY = 'data.transportation.allow.plain.text.export';
UPDATE SYS_CONFIG SET CONFIG_KEY = 'data.transportation.allowPlainTextImport' WHERE CONFIG_KEY = 'data.transportation.allow.plain.text.import';
UPDATE SYS_CONFIG SET CONFIG_KEY = 'data.transportation.sharedKey' WHERE CONFIG_KEY = 'data.transportation.shared.key';
UPDATE SYS_CONFIG SET VALUE = '', DEFAULT_VALUE = '' WHERE CONFIG_KEY = 'cas.authn.pac4j.cookie.crypto.encryption.key';
UPDATE SYS_CONFIG SET VALUE = '', DEFAULT_VALUE = '' WHERE CONFIG_KEY = 'cas.authn.pac4j.cookie.crypto.signing.key';
UPDATE SYS_CONFIG SET VALUE = '', DEFAULT_VALUE = '' WHERE CONFIG_KEY = 'cas.authn.pm.reset.crypto.encryption.key';
UPDATE SYS_CONFIG SET VALUE = '', DEFAULT_VALUE = '' WHERE CONFIG_KEY = 'cas.authn.pm.reset.crypto.signing.key';
UPDATE SYS_CONFIG SET VALUE = '', DEFAULT_VALUE = '' WHERE CONFIG_KEY = 'cas.tgc.crypto.encryption.key';
UPDATE SYS_CONFIG SET VALUE = '', DEFAULT_VALUE = '' WHERE CONFIG_KEY = 'cas.tgc.crypto.signing.key';
UPDATE SYS_CONFIG SET VALUE = '', DEFAULT_VALUE = '' WHERE CONFIG_KEY = 'cas.webflow.crypto.encryption.key';
UPDATE SYS_CONFIG SET VALUE = '', DEFAULT_VALUE = '' WHERE CONFIG_KEY = 'cas.webflow.crypto.signing.key';
UPDATE SYS_CONFIG SET VALUE = '', DEFAULT_VALUE = '' WHERE CONFIG_KEY = 'cas.authn.mfa.gauth.crypto.encryption.key' AND EXISTS (SELECT 1 FROM MFA_GOOGLE_AUTH_ACCOUNT HAVING COUNT(*) = 0);
UPDATE SYS_CONFIG SET VALUE = '', DEFAULT_VALUE = '' WHERE CONFIG_KEY = 'cas.authn.mfa.gauth.crypto.signing.key' AND EXISTS (SELECT 1 FROM MFA_GOOGLE_AUTH_ACCOUNT HAVING COUNT(*) = 0);
UPDATE SYS_CONFIG SET MAIN_GROUP = 'general', SUB_GROUP = 'url', MAIN_GROUP_ORDER = '0', SUB_GROUP_ORDER = '10', CONFIG_ORDER = '15', HIDDEN = '0'  WHERE CONFIG_KEY = 'activemq.broker.connector.bindAddress' AND APPLICATION = 'config-service';

DELETE FROM SYS_CONFIG WHERE CONFIG_KEY = 'configclient.config.file.output.enabled';
DELETE FROM SYS_CONFIG WHERE CONFIG_KEY = 'configclient.config.file.output.filePath';

UPDATE TOOL_PARAMETER SET DISPLAY_NAME = 'Enrollment Username' WHERE COMMAND_ID=(SELECT COMMAND_ID FROM TOOL_COMMAND_VIEW WHERE TOOL_COMMAND_NAME='propertymgr' AND COMMAND_NAME='-add') AND COMMAND_NAME = '-u';
ALTER TABLE TOOL_PARAMETER ALTER COLUMN PATTERN SET DATA TYPE VARCHAR(1024);

UPDATE SYS_CONFIG SET DESCRIPTION = 'Time of day to perform the archive operation. Time is based on a 24-hour system in HH: MM format. Old logs are copied to archive tables.', PATTERN = '^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$' WHERE CONFIG_KEY = 'dac.archive.time.of.day';
UPDATE SYS_CONFIG SET MAIN_GROUP = 'general', SUB_GROUP = 'url', MAIN_GROUP_ORDER = '0', SUB_GROUP_ORDER = '10', CONFIG_ORDER = '20', HIDDEN = '0', READ_ONLY = '0', ADVANCED = '1', DESCRIPTION = 'The URL of the ActiveMQ broker hosted on the Management Server. In a distributed setup, ICENET servers use the ActiveMQ broker to generate configuration update messages.' WHERE CONFIG_KEY = 'config.activeMQConnectionFactory.brokerURL';
UPDATE SYS_CONFIG SET PATTERN = '^[0-9]+$' WHERE CONFIG_KEY = 'dac.archive.days.to.keep';
UPDATE SYS_CONFIG SET PATTERN = '^[0-9]+$' WHERE CONFIG_KEY = 'dac.archive.timeout.minutes';
UPDATE SYS_CONFIG SET PATTERN = '^[0-9]+$' WHERE CONFIG_KEY = 'dac.index.rebuild.timeout.minutes';
UPDATE SYS_CONFIG SET PATTERN = '^[0-9]+$' WHERE CONFIG_KEY = 'dac.sync.time.interval';
UPDATE SYS_CONFIG SET PATTERN = '^[0-9]+$' WHERE CONFIG_KEY = 'dac.sync.timeout.minutes';
UPDATE SYS_CONFIG SET PATTERN = '^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$', DESCRIPTION = 'Time of day to rebuild indexes on reporter tables, expressed as 24-hour HH:MM. Rebuild will happen every day unless days of week are specified below' WHERE CONFIG_KEY = 'dac.index.rebuild.time.of.day';
UPDATE SYS_CONFIG SET PATTERN = '^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$', DESCRIPTION = 'Activity logs will be copied to reporter table at this time each day, making them available for search. Time should expressed in 24-hour format HH:MM' WHERE CONFIG_KEY = 'dac.sync.time.of.day';
UPDATE SYS_CONFIG SET DESCRIPTION = 'Enable/Disable Multi-factor Authentication (MFA) using a TOTP authenticator app such as Google Authenticator&#8482.' WHERE CONFIG_KEY = 'mfa.gauth.enabled';

UPDATE ACCESS_CONTROL SET EXPRESSION = 'hasAnyAuthority(''VIEW_POLICY_FOLDER'',''MANAGE_DELEGATION_POLICIES'')' WHERE REQUEST_METHOD = 'GET' AND URL_PATTERN = '/api/v1/folders/all/{type:(policy|POLICY)}';
UPDATE ACCESS_CONTROL SET EXPRESSION = 'hasAnyAuthority(''VIEW_COMPONENT_FOLDER'',''MANAGE_DELEGATION_POLICIES'')' WHERE REQUEST_METHOD = 'GET' AND URL_PATTERN = '/api/v1/folders/all/{type:(component|COMPONENT)}';
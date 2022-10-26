UPDATE SYS_CONFIG SET VALUE = 'https://docs.nextlabs.com/cc/2020.07' WHERE APPLICATION = 'application' AND CONFIG_KEY = 'help.url.base';
UPDATE SYS_CONFIG SET VALUE = 'unique_name', DEFAULT_VALUE = 'unique_name' WHERE CONFIG_KEY LIKE 'cas.authn.pac4j.oidc[%].principalAttributeId' AND VALUE = 'upn';
DELETE FROM SYS_CONFIG WHERE CONFIG_KEY = 'context.parameter.EnforcePasswordHistory';

INSERT INTO SYS_CONFIG (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY) VALUES (NEXTVAL('HIBERNATE_SEQUENCE'), 'console', 'dashboard.widget.refresh.interval', '30', '30', '', 'reporter', 'console.dashboard', '65', '10', '110', '0', '0', '1', '1', '0', '0', 'integer', 'number', '', '1', '^[0-9]+$', 'Refresh interval of Dashboard system configuration status and recent activities, in seconds.', CURRENT_TIMESTAMP, '-1');

INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (NEXTVAL('HIBERNATE_SEQUENCE'), 'POST', '/api/v1/secureStore/replaceStoreFile', 'hasAuthority(''MANAGE_SECURE_STORE'')');

UPDATE SYS_CONFIG SET VALUE = '9200', DEFAULT_VALUE = '9200' WHERE APPLICATION = 'console' AND CONFIG_KEY = 'search.engine.port';

INSERT INTO SYS_CONFIG (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY) VALUES (NEXTVAL('HIBERNATE_SEQUENCE'), 'dms', 'dac.index.rebuild.days.of.month', '', '', '', 'dac', 'index', '80', '0', '4', '0', '0', '0', '0', '0', '1', 'text', 'text', '', '0', '', 'Comma separated list of days of the month on which to run sync operations (e.g. 1,2,3)', CURRENT_TIMESTAMP, '-1');
UPDATE SYS_CONFIG SET CONFIG_ORDER = '5' WHERE CONFIG_KEY = 'dac.index.rebuild.timeout.minutes';

UPDATE SYS_CONFIG SET HIDDEN = '1' WHERE CONFIG_KEY = 'dac.index.rebuild.days.of.month';

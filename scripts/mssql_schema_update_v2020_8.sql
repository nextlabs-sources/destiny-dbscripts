UPDATE SYS_CONFIG SET VALUE = 'https://docs.nextlabs.com/cc/2020.08' WHERE APPLICATION = 'application' AND CONFIG_KEY = 'help.url.base';

INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/policy/mgmt/generateXACML', 'hasAuthority(''VIEW_POLICY'') and hasAuthority(''VIEW_COMPONENT'') and hasAuthority(''VIEW_POLICY_MODEL'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/secureStore/list/keyPair', 'hasAuthority(''MANAGE_SECURE_STORE'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/secureStore/importKeyPair', 'hasAuthority(''MANAGE_SECURE_STORE'')');

UPDATE SYS_CONFIG SET VALUE = '9200', DEFAULT_VALUE = '9200' WHERE CONFIG_KEY = 'search.engine.port';

create table REMOTE_ENV
(
    ID numeric(19) identity
        constraint REMOTE_ENV_PK
            primary key,
    NAME nvarchar(255) not null,
    HOST nvarchar(255) not null,
    PORT nvarchar(5) not null,
    CLIENT_ID nvarchar(4000) not null,
    USERNAME nvarchar(255) not null,
    PASSWORD nvarchar(4000) not null,
    IS_ACTIVE bit NOT NULL,
    CREATED_DATE datetime,
    LAST_UPDATED_BY numeric(19),
    LAST_UPDATED datetime,
    CREATED_BY numeric(19),
    VERSION int not null
);

INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/remoteEnvironment/mgmt/add', 'hasAuthority(''CREATE_ENVIRONMENT_CONFIGURATION'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/remoteEnvironment/mgmt/modify', 'hasAuthority(''EDIT_ENVIRONMENT_CONFIGURATION'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/remoteEnvironment/mgmt/remove/{id:[0-9]+}', 'hasAuthority(''DELETE_ENVIRONMENT_CONFIGURATION'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('DELETE', '/api/v1/remoteEnvironment/mgmt/bulkDelete', 'hasAuthority(''DELETE_ENVIRONMENT_CONFIGURATION'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/remoteEnvironment/search', 'hasAuthority(''VIEW_ENVIRONMENT_CONFIGURATION'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('GET', '/api/v1/remoteEnvironment/mgmt/active/{id:[0-9]+}', 'hasAuthority(''VIEW_ENVIRONMENT_CONFIGURATION'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('GET', '/api/v1/remoteEnvironment/mgmt/{id:[0-9]+}', 'hasAuthority(''VIEW_ENVIRONMENT_CONFIGURATION'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/remoteEnvironment/mgmt/validateConnection', 'hasAuthority(''CREATE_ENVIRONMENT_CONFIGURATION'') or hasAuthority(''EDIT_ENVIRONMENT_CONFIGURATION'')');

INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/migration/export', 'hasAuthority(''VIEW_POLICY'') and hasAuthority(''VIEW_COMPONENT'') and hasAuthority(''VIEW_POLICY_MODEL'') and hasAuthority(''VIEW_ENVIRONMENT_CONFIGURATION'') and hasAuthority(''MIGRATE_POLICY'')');
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/migration/import', 'hasAuthority(''CREATE_POLICY'') and hasAuthority(''EDIT_POLICY'') and hasAuthority(''VIEW_POLICY'') and hasAuthority(''CREATE_COMPONENT'') and hasAuthority(''EDIT_COMPONENT'') and hasAuthority(''VIEW_COMPONENT'') and hasAuthority(''CREATE_POLICY_MODEL'') and hasAuthority(''EDIT_POLICY_MODEL'') and hasAuthority(''DELETE_POLICY_MODEL'') and hasAuthority(''VIEW_POLICY_MODEL'')');

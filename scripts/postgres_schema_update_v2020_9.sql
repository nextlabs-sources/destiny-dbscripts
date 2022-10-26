INSERT INTO SYS_CONFIG (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (NEXTVAL('HIBERNATE_SEQUENCE'), 'application', 'db.driver', '', '', '', 'default', 'default', '0', '0', '0', '1', '1', '1', '0', '0', '1', 'text', 'text', '', '1', '', 'Control Center database driver class name', CURRENT_TIMESTAMP, '-1' )
ON CONFLICT (APPLICATION, CONFIG_KEY) DO UPDATE SET VALUE = '', DEFAULT_VALUE = '', VALUE_FORMAT = '', MAIN_GROUP = 'default', SUB_GROUP = 'default', MAIN_GROUP_ORDER = '0', SUB_GROUP_ORDER = '0', CONFIG_ORDER = '0', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'Control Center database driver class name', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1';

INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (NEXTVAL('HIBERNATE_SEQUENCE'), 'GET', '/status', 'permitAll');

UPDATE SYS_CONFIG SET HIDDEN = '0' WHERE CONFIG_KEY = 'dac.index.rebuild.days.of.month';

INSERT INTO SYS_CONFIG (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (NEXTVAL('HIBERNATE_SEQUENCE'), 'administrator', 'cas.service.login', '${server.name}/cas/login', '${server.name}/cas/login', '', 'security', 'cas', '40', '5', '10', '1', '1', '0', '0', '0', '1', 'text', 'text', '', '1', '', '', CURRENT_TIMESTAMP, '-1' )
ON CONFLICT (APPLICATION, CONFIG_KEY) DO UPDATE SET VALUE = '${server.name}/cas/login', DEFAULT_VALUE = '${server.name}/cas/login', VALUE_FORMAT = '', MAIN_GROUP = 'security', SUB_GROUP = 'cas', MAIN_GROUP_ORDER = '40', SUB_GROUP_ORDER = '5', CONFIG_ORDER = '10', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '0', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = '', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1';

INSERT INTO SYS_CONFIG (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (NEXTVAL('HIBERNATE_SEQUENCE'), 'administrator', 'cas.service.logout', '${server.name}/cas/logout', '${server.name}/cas/logout', '', 'security', 'cas', '40', '5', '15', '1', '1', '0', '0', '0', '1', 'text', 'text', '', '1', '', '', CURRENT_TIMESTAMP, '-1' )
ON CONFLICT (APPLICATION, CONFIG_KEY) DO UPDATE SET VALUE = '${server.name}/cas/logout', DEFAULT_VALUE = '${server.name}/cas/logout', VALUE_FORMAT = '', MAIN_GROUP = 'security', SUB_GROUP = 'cas', MAIN_GROUP_ORDER = '40', SUB_GROUP_ORDER = '5', CONFIG_ORDER = '15', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '0', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = '', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1';

INSERT INTO SYS_CONFIG (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (NEXTVAL('HIBERNATE_SEQUENCE'), 'administrator', 'cas.service.url', '${server.name}/cas/', '${server.name}/cas/', '', 'security', 'cas', '40', '5', '5', '1', '1', '0', '0', '0', '1', 'text', 'text', '', '1', '', '', CURRENT_TIMESTAMP, '-1' )
ON CONFLICT (APPLICATION, CONFIG_KEY) DO UPDATE SET VALUE = '${server.name}/cas/', DEFAULT_VALUE = '${server.name}/cas/', VALUE_FORMAT = '', MAIN_GROUP = 'security', SUB_GROUP = 'cas', MAIN_GROUP_ORDER = '40', SUB_GROUP_ORDER = '5', CONFIG_ORDER = '5', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '0', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = '', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1';

INSERT INTO SYS_CONFIG (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (NEXTVAL('HIBERNATE_SEQUENCE'), 'reporter', 'cas.service.login', '${server.name}/cas/login', '${server.name}/cas/login', '', 'security', 'cas', '40', '5', '25', '1', '1', '0', '0', '0', '1', 'text', 'text', '', '1', '', '', CURRENT_TIMESTAMP, '-1' )
ON CONFLICT (APPLICATION, CONFIG_KEY) DO UPDATE SET VALUE = '${server.name}/cas/login', DEFAULT_VALUE = '${server.name}/cas/login', VALUE_FORMAT = '', MAIN_GROUP = 'security', SUB_GROUP = 'cas', MAIN_GROUP_ORDER = '40', SUB_GROUP_ORDER = '5', CONFIG_ORDER = '25', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '0', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = '', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1';

INSERT INTO SYS_CONFIG (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (NEXTVAL('HIBERNATE_SEQUENCE'), 'reporter', 'cas.service.logout', '${server.name}/cas/logout', '${server.name}/cas/logout', '', 'security', 'cas', '40', '5', '30', '1', '1', '0', '0', '0', '1', 'text', 'text', '', '1', '', '', CURRENT_TIMESTAMP, '-1' )
ON CONFLICT (APPLICATION, CONFIG_KEY) DO UPDATE SET VALUE = '${server.name}/cas/logout', DEFAULT_VALUE = '${server.name}/cas/logout', VALUE_FORMAT = '', MAIN_GROUP = 'security', SUB_GROUP = 'cas', MAIN_GROUP_ORDER = '40', SUB_GROUP_ORDER = '5', CONFIG_ORDER = '30', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '0', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = '', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1';

INSERT INTO SYS_CONFIG (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (NEXTVAL('HIBERNATE_SEQUENCE'), 'reporter', 'cas.service.url', '${server.name}/cas/', '${server.name}/cas/', '', 'security', 'cas', '40', '5', '20', '1', '1', '0', '0', '0', '1', 'text', 'text', '', '1', '', '', CURRENT_TIMESTAMP, '-1' )
ON CONFLICT (APPLICATION, CONFIG_KEY) DO UPDATE SET VALUE = '${server.name}/cas/', DEFAULT_VALUE = '${server.name}/cas/', VALUE_FORMAT = '', MAIN_GROUP = 'security', SUB_GROUP = 'cas', MAIN_GROUP_ORDER = '40', SUB_GROUP_ORDER = '5', CONFIG_ORDER = '20', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '0', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = '', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1';

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
    </Loggers>
</Configuration>
'
WHERE TYPE = 'DEFAULT';

UPDATE SYS_CONFIG SET VALUE = 'false', DEFAULT_VALUE = 'false' WHERE APPLICATION = 'console' AND CONFIG_KEY = 'db.hibernate.show.sql';

INSERT INTO SYS_CONFIG (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (NEXTVAL('HIBERNATE_SEQUENCE'), 'application', 'service.url.dem', '', '', '', 'general', 'url', '0', '10', '30', '1', '1', '0', '0', '0', '1', 'text', 'text', '', '1', '', '', CURRENT_TIMESTAMP, '-1' )
ON CONFLICT (APPLICATION, CONFIG_KEY) DO UPDATE SET VALUE = '', DEFAULT_VALUE = '', VALUE_FORMAT = '', MAIN_GROUP = 'general', SUB_GROUP = 'url', MAIN_GROUP_ORDER = '0', SUB_GROUP_ORDER = '10', CONFIG_ORDER = '30', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '0', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = '', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1';

INSERT INTO SYS_CONFIG (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (NEXTVAL('HIBERNATE_SEQUENCE'), 'application', 'service.url.dps', '', '', '', 'general', 'url', '0', '10', '40', '1', '1', '0', '0', '0', '1', 'text', 'text', '', '1', '', '', CURRENT_TIMESTAMP, '-1' )
ON CONFLICT (APPLICATION, CONFIG_KEY) DO UPDATE SET VALUE = '', DEFAULT_VALUE = '', VALUE_FORMAT = '', MAIN_GROUP = 'general', SUB_GROUP = 'url', MAIN_GROUP_ORDER = '0', SUB_GROUP_ORDER = '10', CONFIG_ORDER = '40', HIDDEN = '1', READ_ONLY = '1', ADVANCED = '0', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '1', DATA_TYPE = 'text', FIELD_TYPE = 'text' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = '', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1';

INSERT INTO SYS_CONFIG (ID, APPLICATION, CONFIG_KEY, VALUE, DEFAULT_VALUE, VALUE_FORMAT, MAIN_GROUP, SUB_GROUP, MAIN_GROUP_ORDER, SUB_GROUP_ORDER, CONFIG_ORDER, HIDDEN, READ_ONLY, ADVANCED, UI, ENCRYPTED, RESTART_REQUIRED, DATA_TYPE, FIELD_TYPE, OPTIONS, REQUIRED, PATTERN, DESCRIPTION, MODIFIED_ON, MODIFIED_BY ) VALUES (NEXTVAL('HIBERNATE_SEQUENCE'), 'console', 'remote.env.timeout', '30', '30', '', 'general', 'remote.env', '0', '90', '0', '0', '0', '1', '0', '0', '0', 'integer', 'number', '', '1', '', 'The timeout value in seconds for connections to remote environment for policy migration.', CURRENT_TIMESTAMP, '-1' )
ON CONFLICT (APPLICATION, CONFIG_KEY) DO UPDATE SET VALUE = '30', DEFAULT_VALUE = '30', VALUE_FORMAT = '', MAIN_GROUP = 'general', SUB_GROUP = 'remote.env', MAIN_GROUP_ORDER = '0', SUB_GROUP_ORDER = '90', CONFIG_ORDER = '0', HIDDEN = '0', READ_ONLY = '0', ADVANCED = '1', UI = '0', ENCRYPTED = '0', RESTART_REQUIRED = '0', DATA_TYPE = 'integer', FIELD_TYPE = 'number' , OPTIONS = '', REQUIRED = '1', PATTERN = '', DESCRIPTION = 'The timeout value in seconds for connections to remote environment for policy migration.', MODIFIED_ON = CURRENT_TIMESTAMP, MODIFIED_BY = '-1';

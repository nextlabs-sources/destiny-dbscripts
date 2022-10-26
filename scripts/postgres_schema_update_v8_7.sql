INSERT INTO policy_model(id, discriminator, created_date, last_updated_by, last_updated, created_by, version, description, name, short_name, status, type, is_sample)
	SELECT NEXTVAL('HIBERNATE_SEQUENCE'),'POLICY', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 1, 'An actor whose attributes may be referenced in a component.', 'User', 'user', 'ACTIVE', 'SUBJECT', 'N'
WHERE NOT EXISTS (SELECT 1 from policy_model WHERE TYPE = 'SUBJECT' AND SHORT_NAME = 'user');

INSERT INTO policy_model(id,
	discriminator, created_date, last_updated_by, last_updated, created_by, version, description, name, short_name, status, type, is_sample)
	VALUES (NEXTVAL('HIBERNATE_SEQUENCE'), 'POLICY', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 1, 'A computer whose attributes may be referenced in a component', 'Host', 'host', 'ACTIVE', 'SUBJECT', 'N'), (NEXTVAL('HIBERNATE_SEQUENCE'), 'POLICY', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 1, 'A computer program whose attributes may be referenced in a component', 'Application', 'application', 'ACTIVE', 'SUBJECT', 'N');

INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (NEXTVAL('HIBERNATE_SEQUENCE'), 'GET', '/api/v1/agent/find', 'hasAnyAuthority(''CREATE_POLICY'',''EDIT_POLICY'')');

INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (NEXTVAL('HIBERNATE_SEQUENCE'), 'GET', '/api/v1/component/members/find', 'hasAnyAuthority(''VIEW_COMPONENT'',''CREATE_COMPONENT'',''EDIT_COMPONENT'')');

INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (NEXTVAL('HIBERNATE_SEQUENCE'), 'POST', '/api/v1/component/members/preview', 'hasAnyAuthority(''VIEW_COMPONENT'',''CREATE_COMPONENT'',''EDIT_COMPONENT'')');

INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (NEXTVAL('HIBERNATE_SEQUENCE'), 'POST', '/api/v1/component/members/preview/filter', 'hasAnyAuthority(''VIEW_COMPONENT'',''CREATE_COMPONENT'',''EDIT_COMPONENT'')');

INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (NEXTVAL('HIBERNATE_SEQUENCE'), 'POST', '/api/v1/component/mgmt/preview', 'hasAnyAuthority(''VIEW_COMPONENT'',''CREATE_COMPONENT'',''EDIT_COMPONENT'')');

INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (NEXTVAL('HIBERNATE_SEQUENCE'), 'POST', '/api/v1/component/mgmt/findDependencies', 'hasAuthority(''DEPLOY_COMPONENT'')');

INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (NEXTVAL('HIBERNATE_SEQUENCE'), 'POST', '/api/v1/policy/mgmt/findDependencies', 'hasAuthority(''DEPLOY_POLICY'')');

ALTER TABLE PM_ATTRIBUTE_CONFIG ALTER short_name type varchar(255);
ALTER TABLE PM_ACTION_CONFIG ALTER short_name type varchar(255);
ALTER TABLE POLICY_MODEL ALTER short_name type varchar(255);
ALTER TABLE PM_PARAMETER_CONFIG ALTER short_name type varchar(255);
ALTER TABLE PM_OBLIGATION_CONFIG ALTER short_name type varchar(255);

UPDATE ACCESS_CONTROL SET EXPRESSION = 'hasAnyAuthority(''VIEW_POLICY'',''VIEW_COMPONENT'')'WHERE REQUEST_METHOD = 'GET' AND URL_PATTERN = '/api/v1/component/search/listNames/{group:.+}';
UPDATE ACCESS_CONTROL SET EXPRESSION = 'hasAnyAuthority(''VIEW_POLICY'',''VIEW_COMPONENT'')' WHERE REQUEST_METHOD = 'GET' AND URL_PATTERN = '/api/v1/component/search/listNames/{group:.+}/{type:.+}';
UPDATE ACCESS_CONTROL SET EXPRESSION = 'hasAnyAuthority(''VIEW_POLICY'',''VIEW_COMPONENT'',''VIEW_POLICY_MODEL'',''MANAGE_POLICY_VALIDATOR'')' WHERE REQUEST_METHOD = 'GET' AND URL_PATTERN = '/api/v1/policyModel/search/listNames/{type:.+}';
UPDATE ACCESS_CONTROL SET EXPRESSION = 'hasAnyAuthority(''VIEW_POLICY'',''VIEW_COMPONENT'',''VIEW_POLICY_MODEL'',''MANAGE_POLICY_VALIDATOR'')' WHERE REQUEST_METHOD = 'GET' AND URL_PATTERN = '/api/v1/policyModel/mgmt/extraSubjectAttribs/{type:[A-Z]+}';
UPDATE ACCESS_CONTROL SET EXPRESSION = 'hasAuthority(''MANAGE_POLICY_VALIDATOR'')' WHERE REQUEST_METHOD = 'POST' AND URL_PATTERN = '/api/v1/policyvalidator/validate';
UPDATE ACCESS_CONTROL SET EXPRESSION = 'hasAnyAuthority(''VIEW_POLICY'',''VIEW_COMPONENT'',''VIEW_POLICY_MODEL'',''MANAGE_POLICY_VALIDATOR'',''MANAGE_DELEGATION_POLICIES'')' WHERE REQUEST_METHOD = 'GET' AND URL_PATTERN = '/api/v1/policyModel/search/listNames/{type:.+}';
UPDATE ACCESS_CONTROL SET EXPRESSION = 'hasAnyAuthority(''VIEW_POLICY'',''VIEW_COMPONENT'',''VIEW_POLICY_MODEL'',''MANAGE_DELEGATION_POLICIES'')' WHERE REQUEST_METHOD = 'POST' AND URL_PATTERN = '/api/v1/config/tags/list';
UPDATE ACCESS_CONTROL SET EXPRESSION = 'hasAnyAuthority(''VIEW_POLICY'',''VIEW_COMPONENT'',''VIEW_POLICY_MODEL'',''MANAGE_DELEGATION_POLICIES'')' WHERE REQUEST_METHOD = 'GET' AND URL_PATTERN = '/api/v1/config/tags/list/{type:[A-Z_]+}';
UPDATE ACCESS_CONTROL SET EXPRESSION = 'hasAnyAuthority(''VIEW_POLICY'',''VIEW_COMPONENT'',''VIEW_POLICY_MODEL'',''MANAGE_DELEGATION_POLICIES'')' WHERE REQUEST_METHOD = 'GET' AND URL_PATTERN = '/api/v1/config/tags/{id:[0-9]+}';
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (NEXTVAL('HIBERNATE_SEQUENCE'), 'GET', '/api/v1/policy/mgmt/exportOptions', 'hasAuthority(''VIEW_POLICY'') and hasAuthority(''VIEW_COMPONENT'') and hasAuthority(''VIEW_POLICY_MODEL'')');

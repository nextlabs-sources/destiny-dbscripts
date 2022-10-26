MERGE INTO POLICY_MODEL pm
USING (SELECT COUNT(*) AS REC FROM POLICY_MODEL WHERE TYPE = 'SUBJECT' AND SHORT_NAME = 'user') tmp
ON (tmp.REC > 0)
WHEN NOT MATCHED THEN
INSERT (discriminator, created_date, last_updated_by, last_updated, created_by, version, description, name, short_name, status, type, is_sample)
VALUES ('POLICY', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 1, 'An actor whose attributes may be referenced in a component', 'User', 'user', 'ACTIVE', 'SUBJECT', 'N')&semi;

INSERT INTO policy_model(
	discriminator, created_date, last_updated_by, last_updated, created_by, version, description, name, short_name, status, type, is_sample)
	VALUES ('POLICY', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 1, 'A computer whose attributes may be referenced in a component', 'Host', 'host', 'ACTIVE', 'SUBJECT', 'N'), ('POLICY', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 1, 'A computer program whose attributes may be referenced in a component', 'Application', 'application', 'ACTIVE', 'SUBJECT', 'N');

INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('GET', '/api/v1/agent/find', 'hasAnyAuthority(''CREATE_POLICY'',''EDIT_POLICY'')');

INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('GET', '/api/v1/component/members/find', 'hasAnyAuthority(''VIEW_COMPONENT'',''CREATE_COMPONENT'',''EDIT_COMPONENT'')');

INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/component/members/preview', 'hasAnyAuthority(''VIEW_COMPONENT'',''CREATE_COMPONENT'',''EDIT_COMPONENT'')');

INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/component/members/preview/filter', 'hasAnyAuthority(''VIEW_COMPONENT'',''CREATE_COMPONENT'',''EDIT_COMPONENT'')');

INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/component/mgmt/preview', 'hasAnyAuthority(''VIEW_COMPONENT'',''CREATE_COMPONENT'',''EDIT_COMPONENT'')');

INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/component/mgmt/findDependencies', 'hasAuthority(''DEPLOY_COMPONENT'')');

INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('POST', '/api/v1/policy/mgmt/findDependencies', 'hasAuthority(''DEPLOY_POLICY'')');

ALTER TABLE PM_ATTRIBUTE_CONFIG ALTER COLUMN short_name nvarchar(255);
ALTER TABLE PM_ACTION_CONFIG ALTER COLUMN short_name nvarchar(255);
ALTER TABLE POLICY_MODEL ALTER COLUMN short_name nvarchar(255);
ALTER TABLE PM_PARAMETER_CONFIG ALTER COLUMN short_name nvarchar(255);
ALTER TABLE PM_OBLIGATION_CONFIG ALTER COLUMN short_name nvarchar(255);

UPDATE ACCESS_CONTROL SET EXPRESSION = 'hasAnyAuthority(''VIEW_POLICY'',''VIEW_COMPONENT'')'WHERE REQUEST_METHOD = 'GET' AND URL_PATTERN = '/api/v1/component/search/listNames/{group:.+}';
UPDATE ACCESS_CONTROL SET EXPRESSION = 'hasAnyAuthority(''VIEW_POLICY'',''VIEW_COMPONENT'')' WHERE REQUEST_METHOD = 'GET' AND URL_PATTERN = '/api/v1/component/search/listNames/{group:.+}/{type:.+}';
UPDATE ACCESS_CONTROL SET EXPRESSION = 'hasAnyAuthority(''VIEW_POLICY'',''VIEW_COMPONENT'',''VIEW_POLICY_MODEL'',''MANAGE_POLICY_VALIDATOR'')' WHERE REQUEST_METHOD = 'GET' AND URL_PATTERN = '/api/v1/policyModel/search/listNames/{type:.+}';
UPDATE ACCESS_CONTROL SET EXPRESSION = 'hasAnyAuthority(''VIEW_POLICY'',''VIEW_COMPONENT'',''VIEW_POLICY_MODEL'',''MANAGE_POLICY_VALIDATOR'')' WHERE REQUEST_METHOD = 'GET' AND URL_PATTERN = '/api/v1/policyModel/mgmt/extraSubjectAttribs/{type:[A-Z]+}';
UPDATE ACCESS_CONTROL SET EXPRESSION = 'hasAuthority(''MANAGE_POLICY_VALIDATOR'')' WHERE REQUEST_METHOD = 'POST' AND URL_PATTERN = '/api/v1/policyvalidator/validate';
UPDATE ACCESS_CONTROL SET EXPRESSION = 'hasAnyAuthority(''VIEW_POLICY'',''VIEW_COMPONENT'',''VIEW_POLICY_MODEL'',''MANAGE_POLICY_VALIDATOR'',''MANAGE_DELEGATION_POLICIES'')' WHERE REQUEST_METHOD = 'GET' AND URL_PATTERN = '/api/v1/policyModel/search/listNames/{type:.+}';
UPDATE ACCESS_CONTROL SET EXPRESSION = 'hasAnyAuthority(''VIEW_POLICY'',''VIEW_COMPONENT'',''VIEW_POLICY_MODEL'',''MANAGE_DELEGATION_POLICIES'')' WHERE REQUEST_METHOD = 'POST' AND URL_PATTERN = '/api/v1/config/tags/list';
UPDATE ACCESS_CONTROL SET EXPRESSION = 'hasAnyAuthority(''VIEW_POLICY'',''VIEW_COMPONENT'',''VIEW_POLICY_MODEL'',''MANAGE_DELEGATION_POLICIES'')' WHERE REQUEST_METHOD = 'GET' AND URL_PATTERN = '/api/v1/config/tags/list/{type:[A-Z_]+}';
UPDATE ACCESS_CONTROL SET EXPRESSION = 'hasAnyAuthority(''VIEW_POLICY'',''VIEW_COMPONENT'',''VIEW_POLICY_MODEL'',''MANAGE_DELEGATION_POLICIES'')' WHERE REQUEST_METHOD = 'GET' AND URL_PATTERN = '/api/v1/config/tags/{id:[0-9]+}';
INSERT INTO ACCESS_CONTROL (REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES ('GET', '/api/v1/policy/mgmt/exportOptions', 'hasAuthority(''VIEW_POLICY'') and hasAuthority(''VIEW_COMPONENT'') and hasAuthority(''VIEW_POLICY_MODEL'')');

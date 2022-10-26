CREATE TABLE ACCESS_CONTROL(
  ID NUMBER(19,0) NOT NULL ENABLE,
  REQUEST_METHOD VARCHAR2(10) NOT NULL ENABLE,
  URL_PATTERN VARCHAR2(2048) NOT NULL ENABLE,
  EXPRESSION VARCHAR2(4000) NOT NULL ENABLE,
  CONSTRAINT ACCESS_CONTROL_PK PRIMARY KEY(
    ID
  ) ENABLE 
);

INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/index.html', 'authenticated');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/logout', 'authenticated');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/saas.ico', 'permitAll');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/favicon.ico', 'permitAll');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/exports/*', 'hasAuthority(''VIEW_POLICY'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/auth/handlers/{id:[0-9]+}', 'hasAuthority(''MANAGE_USERS'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/auth/handlers/add', 'hasAuthority(''MANAGE_USERS'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/auth/handlers/list', 'hasAuthority(''MANAGE_USERS'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/auth/handlers/list/{type:[a-zA-Z0-9_]+}', 'denyAll');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/auth/handlers/listExtUserProperties', 'hasAuthority(''MANAGE_USERS'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/auth/handlers/listExtUserProperties/{authHandlerId:[0-9]+}', 'hasAuthority(''MANAGE_USERS'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/auth/handlers/listExtUsers', 'hasAuthority(''MANAGE_USERS'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'PUT', '/api/v1/auth/handlers/modify', 'hasAuthority(''MANAGE_USERS'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'DELETE', '/api/v1/auth/handlers/remove/{id:[0-9]+}', 'hasAuthority(''MANAGE_USERS'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/auth/handlers/verify', 'hasAuthority(''MANAGE_USERS'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/component/mgmt/{id:[0-9]+}', 'hasAuthority(''VIEW_COMPONENT'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/component/mgmt/active/{id:[0-9]+}', 'hasAuthority(''VIEW_COMPONENT'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/component/mgmt/add', 'hasAuthority(''CREATE_COMPONENT'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/component/mgmt/addSubComponent', 'hasAuthority(''CREATE_COMPONENT'') and hasAuthority(''EDIT_COMPONENT'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'DELETE', '/api/v1/component/mgmt/bulkDelete', 'hasAuthority(''DELETE_COMPONENT'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/component/mgmt/clone/{id:[0-9]+}', 'hasAuthority(''CREATE_COMPONENT'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/component/mgmt/deploy', 'hasAuthority(''DEPLOY_COMPONENT'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/component/mgmt/hierarchy/{id:[0-9]+}', 'hasAuthority(''VIEW_COMPONENT'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/component/mgmt/history/{id:[0-9]+}', 'hasAuthority(''VIEW_COMPONENT'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'PUT', '/api/v1/component/mgmt/modify', 'hasAuthority(''EDIT_COMPONENT'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'DELETE', '/api/v1/component/mgmt/remove/{id:[0-9]+}', 'hasAuthority(''DELETE_COMPONENT'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/component/mgmt/revert/{componentId:[0-9]+}/{revisionId:[0-9]+}', 'hasAuthority(''DEPLOY_COMPONENT'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/component/mgmt/addAndDeploy', 'hasAuthority(''CREATE_COMPONENT'') and hasAuthority(''DEPLOY_COMPONENT'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'PUT', '/api/v1/component/mgmt/modifyAndDeploy', 'hasAuthority(''EDIT_COMPONENT'') and hasAuthority(''DEPLOY_COMPONENT'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/component/mgmt/unDeploy', 'hasAuthority(''DEPLOY_COMPONENT'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/component/mgmt/updateStatus', 'denyAll');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/component/mgmt/validate/{componentId:[0-9]+}', 'denyAll');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/component/mgmt/validateAndDeploy', 'hasAuthority(''DEPLOY_COMPONENT'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/component/mgmt/validateUndeploy', 'denyAll');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/component/mgmt/viewRevision/{revisionId:[0-9]+}/{revisionNo:[0-9]+}', 'hasAuthority(''VIEW_COMPONENT'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/component/search', 'hasAuthority(''VIEW_COMPONENT'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/component/search/add', 'hasAuthority(''VIEW_COMPONENT'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/component/search/facet', 'hasAuthority(''VIEW_COMPONENT'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/component/search/fields', 'hasAuthority(''VIEW_COMPONENT'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/component/search/ids', 'hasAuthority(''VIEW_COMPONENT'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/component/search/listNames/{group:.+}', 'hasAuthority(''VIEW_COMPONENT'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/component/search/listNames/{group:.+}/{type:.+}', 'hasAuthority(''VIEW_COMPONENT'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'PUT', '/api/v1/component/search/modify', 'denyAll');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'DELETE', '/api/v1/component/search/remove/{id:[0-9]+}', 'hasAuthority(''VIEW_COMPONENT'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/component/search/saved/{id:[0-9]+}', 'hasAuthority(''VIEW_COMPONENT'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/component/search/savedlist', 'hasAuthority(''VIEW_COMPONENT'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/component/search/savedlist/{name:.+}', 'hasAuthority(''VIEW_COMPONENT'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/config/dataType/add', 'denyAll');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/config/dataType/details/{id:[0-9]+}', 'denyAll');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/config/dataType/list', 'denyAll');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/config/dataType/list/{dataType:[A-Z]+}', 'hasAnyAuthority(''VIEW_POLICY_MODEL'',''VIEW_COMPONENT'',''VIEW_POLICY'',''MANAGE_USERS'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'PUT', '/api/v1/config/dataType/modify/{id:[0-9]+}', 'denyAll');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'DELETE', '/api/v1/config/dataType/remove/{id:[0-9]+}', 'denyAll');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/config/dataType/types', 'hasAnyAuthority(''VIEW_POLICY_MODEL'',''VIEW_COMPONENT'',''VIEW_POLICY'',''MANAGE_USERS'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/config/tags/{id:[0-9]+}', 'hasAnyAuthority(''VIEW_POLICY_MODEL'',''VIEW_COMPONENT'',''VIEW_POLICY'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/config/tags/add/POLICY_MODEL_TAG', 'hasAuthority(''CREATE_POLICY_MODEL_TAG'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/config/tags/add/COMPONENT_TAG', 'hasAuthority(''CREATE_COMPONENT_TAG'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/config/tags/add/POLICY_TAG', 'hasAuthority(''CREATE_POLICY_TAG'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/config/tags/list', 'hasAnyAuthority(''VIEW_POLICY_MODEL'',''VIEW_COMPONENT'',''VIEW_POLICY'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/config/tags/list/{type:[A-Z_]+}', 'hasAnyAuthority(''VIEW_POLICY_MODEL'',''VIEW_COMPONENT'',''VIEW_POLICY'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'PUT', '/api/v1/config/tags/modify', 'denyAll');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'DELETE', '/api/v1/config/tags/remove/{id:[0-9]+}', 'denyAll');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/dashboard/activityByPolicies/{fromDate:[0-9]+}/{toDate:[0-9]+}', 'authenticated');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/dashboard/activityByResources/{fromDate:[0-9]+}/{toDate:[0-9]+}', 'authenticated');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/dashboard/activityStream', 'authenticated');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/dashboard/alertsSummary/{fromDate:[0-9]+}/{toDate:[0-9]+}/{groupBy:.+}', 'authenticated');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/dashboard/enrollmentDetails', 'authenticated');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/dashboard/notMatchingPolicies/{fromDate:[0-9]+}/{toDate:[0-9]+}', 'authenticated');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/dashboard/pdpThroughput/{fromDate:[0-9]+}/{toDate:[0-9]+}/{groupBy:.+}', 'authenticated');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/dashboard/policySummaryByStatus', 'authenticated');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/dashboard/policySummaryByStatus/{fromDate:[0-9]+}/{toDate:[0-9]+}', 'authenticated');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/dashboard/policySummaryByTags', 'authenticated');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/dashboard/systemConfigStatus', 'authenticated');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/dashboard/systemDetails', 'authenticated');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/dashboard/userActivities/{fromDate:[0-9]+}/{toDate:[0-9]+}/{decision:(A|D)}', 'authenticated');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/delegationAdmin/component/mgmt/add', 'hasAuthority(''MANAGE_DELEGATION_POLICIES'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'PUT', '/api/v1/delegationAdmin/component/mgmt/modify', 'hasAuthority(''MANAGE_DELEGATION_POLICIES'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'PUT', '/api/v1/delegationAdmin/component/mgmt/updateStatus', 'hasAuthority(''MANAGE_DELEGATION_POLICIES'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/delegationAdmin/component/mgmt/{id:[0-9]+}', 'hasAuthority(''MANAGE_DELEGATION_POLICIES'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'DELETE', '/api/v1/delegationAdmin/component/mgmt/remove/{id:[0-9]+}', 'hasAuthority(''MANAGE_DELEGATION_POLICIES'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/delegationAdmin/component/search', 'hasAuthority(''MANAGE_DELEGATION_POLICIES'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/delegationAdmin/component/search/facet', 'hasAuthority(''MANAGE_DELEGATION_POLICIES'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/delegationAdmin/component/search/ids', 'hasAuthority(''MANAGE_DELEGATION_POLICIES'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/delegationAdmin/component/search/listNames/{group:.+}', 'hasAuthority(''MANAGE_DELEGATION_POLICIES'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/delegationAdmin/component/search/listNames/{group:.+}/{type:.+}', 'hasAuthority(''MANAGE_DELEGATION_POLICIES'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/delegationAdmin/model/mgmt/{id:[0-9]+}', 'hasAuthority(''MANAGE_DELEGATION_POLICIES'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'DELETE', '/api/v1/delegationAdmin/model/mgmt/remove/{id:[0-9]+}', 'hasAuthority(''MANAGE_DELEGATION_POLICIES'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/delegationAdmin/model/mgmt/add', 'hasAuthority(''MANAGE_DELEGATION_POLICIES'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/delegationAdmin/model/mgmt/details/{type:.+}', 'hasAnyAuthority(''MANAGE_DELEGATION_POLICIES'',''MANAGE_USERS'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/delegationAdmin/model/mgmt/listNames/{type:.+}', 'hasAuthority(''MANAGE_DELEGATION_POLICIES'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'PUT', '/api/v1/delegationAdmin/model/mgmt/modify', 'hasAuthority(''MANAGE_DELEGATION_POLICIES'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/delegationAdmin/rule/mgmt/{id:[0-9]+}', 'hasAuthority(''MANAGE_DELEGATION_POLICIES'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/delegationAdmin/rule/mgmt/add', 'hasAuthority(''MANAGE_DELEGATION_POLICIES'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'DELETE', '/api/v1/delegationAdmin/rule/mgmt/bulkDelete', 'hasAuthority(''MANAGE_DELEGATION_POLICIES'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/delegationAdmin/rule/mgmt/export', 'hasAuthority(''MANAGE_DELEGATION_POLICIES'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/delegationAdmin/rule/mgmt/exportAll', 'hasAuthority(''MANAGE_DELEGATION_POLICIES'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/delegationAdmin/rule/mgmt/import', 'hasAuthority(''MANAGE_DELEGATION_POLICIES'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'PUT', '/api/v1/delegationAdmin/rule/mgmt/modify', 'hasAuthority(''MANAGE_DELEGATION_POLICIES'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'DELETE', '/api/v1/delegationAdmin/rule/mgmt/remove/{id:[0-9]+}', 'hasAuthority(''MANAGE_DELEGATION_POLICIES'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/delegationAdmin/rule/search', 'hasAuthority(''MANAGE_DELEGATION_POLICIES'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/help/importExamplePolicy', 'hasAuthority(''DEPLOY_POLICY'') and hasAuthority(''CREATE_POLICY'') and hasAuthority(''EDIT_POLICY'') and hasAuthority(''VIEW_POLICY'') and hasAuthority(''DEPLOY_COMPONENT'') and hasAuthority(''CREATE_COMPONENT'') and hasAuthority(''EDIT_COMPONENT'') and hasAuthority(''VIEW_COMPONENT'') and hasAuthority(''CREATE_POLICY_MODEL'') and hasAuthority(''EDIT_POLICY_MODEL'') and hasAuthority(''DELETE_POLICY_MODEL'') and hasAuthority(''VIEW_POLICY_MODEL'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/help/search', 'authenticated');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/help/reload', 'denyAll');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/policy/mgmt/{id:[0-9]+}', 'hasAuthority(''VIEW_POLICY'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/policy/mgmt/active/{id:[0-9]+}', 'hasAuthority(''VIEW_POLICY'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/policy/mgmt/add', 'hasAuthority(''CREATE_POLICY'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/policy/mgmt/addSubPolicy', 'hasAuthority(''CREATE_POLICY'') and hasAuthority(''EDIT_POLICY'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'DELETE', '/api/v1/policy/mgmt/bulkDelete', 'hasAuthority(''DELETE_POLICY'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/policy/mgmt/clone/{id:[0-9]+}', 'hasAuthority(''CREATE_POLICY'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/policy/mgmt/deploy', 'hasAuthority(''DEPLOY_POLICY'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/policy/mgmt/effects/list', 'hasAuthority(''VIEW_POLICY'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/policy/mgmt/export', 'hasAuthority(''VIEW_POLICY'') and hasAuthority(''VIEW_COMPONENT'') and hasAuthority(''VIEW_POLICY_MODEL'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/policy/mgmt/exportAll', 'hasAuthority(''VIEW_POLICY'') and hasAuthority(''VIEW_COMPONENT'') and hasAuthority(''VIEW_POLICY_MODEL'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/policy/mgmt/expressionValidate', 'hasAuthority(''CREATE_POLICY'') or hasAuthority(''EDIT_POLICY'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/policy/mgmt/hierarchy/{id:[0-9]+}', 'hasAuthority(''VIEW_POLICY'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/policy/mgmt/history/{id:[0-9]+}', 'hasAuthority(''VIEW_POLICY'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/policy/mgmt/import', 'hasAuthority(''CREATE_POLICY'') and hasAuthority(''EDIT_POLICY'') and hasAuthority(''VIEW_POLICY'') and hasAuthority(''CREATE_COMPONENT'') and hasAuthority(''EDIT_COMPONENT'') and hasAuthority(''VIEW_COMPONENT'') and hasAuthority(''CREATE_POLICY_MODEL'') and hasAuthority(''EDIT_POLICY_MODEL'') and hasAuthority(''DELETE_POLICY_MODEL'') and hasAuthority(''VIEW_POLICY_MODEL'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'PUT', '/api/v1/policy/mgmt/modify', 'hasAuthority(''EDIT_POLICY'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'DELETE', '/api/v1/policy/mgmt/remove/{id:[0-9]+}', 'hasAuthority(''DELETE_POLICY'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/policy/mgmt/revert/{policyId:[0-9]+}/{revisionId:[0-9]+}', 'hasAuthority(''DEPLOY_POLICY'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/policy/mgmt/addAndDeploy', 'hasAuthority(''CREATE_POLICY'') and hasAuthority(''DEPLOY_POLICY'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'PUT', '/api/v1/policy/mgmt/modifyAndDeploy', 'hasAuthority(''EDIT_POLICY'') and hasAuthority(''DEPLOY_POLICY'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/policy/mgmt/addAndDeploySubPolicy', 'hasAuthority(''CREATE_POLICY'') and hasAuthority(''EDIT_POLICY'') and hasAuthority(''DEPLOY_POLICY'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'PUT', '/api/v1/policy/mgmt/modifyAndDeploySubPolicy', 'hasAuthority(''EDIT_POLICY'') and hasAuthority(''DEPLOY_POLICY'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/policy/mgmt/statusTypes/list', 'hasAuthority(''VIEW_POLICY'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/policy/mgmt/unDeploy', 'hasAuthority(''DEPLOY_POLICY'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/policy/mgmt/validate/{policyId:[0-9]+}', 'hasAuthority(''CREATE_POLICY'') or hasAuthority(''EDIT_POLICY'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/policy/mgmt/validateAndDeploy', 'hasAuthority(''DEPLOY_POLICY'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/policy/mgmt/viewRevision/{revisionId:[0-9]+}/{revisionNo:[0-9]+}', 'hasAuthority(''VIEW_POLICY'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/policy/search', 'hasAuthority(''VIEW_POLICY'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/policy/search/add', 'hasAuthority(''VIEW_POLICY'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/policy/search/facet', 'hasAuthority(''VIEW_POLICY'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/policy/search/fields', 'hasAuthority(''VIEW_POLICY'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/policy/search/ids', 'hasAuthority(''VIEW_POLICY'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'PUT', '/api/v1/policy/search/modify', 'hasAuthority(''VIEW_POLICY'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'DELETE', '/api/v1/policy/search/remove/{id:[0-9]+}', 'hasAuthority(''VIEW_POLICY'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/policy/search/saved/{id:[0-9]+}', 'hasAuthority(''VIEW_POLICY'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/policy/search/savedlist', 'hasAuthority(''VIEW_POLICY'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/policy/search/savedlist/{name:.+}', 'hasAuthority(''VIEW_POLICY'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/policyModel/mgmt/{id:[0-9]+}', 'hasAuthority(''VIEW_POLICY_MODEL'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'DELETE', '/api/v1/policyModel/mgmt/remove/{id:[0-9]+}', 'hasAuthority(''DELETE_POLICY_MODEL'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/policyModel/mgmt/active/{id:[0-9]+}', 'hasAuthority(''VIEW_POLICY_MODEL'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/policyModel/mgmt/add', 'hasAuthority(''CREATE_POLICY_MODEL'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'DELETE', '/api/v1/policyModel/mgmt/bulkDelete', 'hasAuthority(''DELETE_POLICY_MODEL'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/policyModel/mgmt/clone/{id:[0-9]+}', 'hasAuthority(''CREATE_POLICY_MODEL'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/policyModel/mgmt/extraSubjectAttribs/{type:[A-Z]+}', 'hasAuthority(''VIEW_POLICY_MODEL'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'PUT', '/api/v1/policyModel/mgmt/modify', 'hasAuthority(''EDIT_POLICY_MODEL'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/policyModel/search', 'hasAuthority(''VIEW_POLICY_MODEL'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/policyModel/search/add', 'hasAuthority(''VIEW_POLICY_MODEL'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/policyModel/search/facet', 'hasAuthority(''VIEW_POLICY_MODEL'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/policyModel/search/fields', 'hasAuthority(''VIEW_POLICY_MODEL'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/policyModel/search/ids', 'hasAuthority(''VIEW_POLICY_MODEL'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/policyModel/search/listDetails/{type:.+}', 'hasAuthority(''VIEW_POLICY_MODEL'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/policyModel/search/listNames/{type:.+}', 'hasAuthority(''VIEW_POLICY_MODEL'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'PUT', '/api/v1/policyModel/search/modify', 'hasAuthority(''VIEW_POLICY_MODEL'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'DELETE', '/api/v1/policyModel/search/remove/{id:[0-9]+}', 'hasAuthority(''VIEW_POLICY_MODEL'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/policyModel/search/saved/{id:[0-9]+}', 'hasAuthority(''VIEW_POLICY_MODEL'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/policyModel/search/savedlist/{type:.+}', 'hasAuthority(''VIEW_POLICY_MODEL'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/policyModel/search/savedlist/{type:.+}/{name:.+}', 'hasAuthority(''VIEW_POLICY_MODEL'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/policyvalidator/log/{logId:[0-9]+}', 'hasAuthority(''MANAGE_POLICY_VALIDATOR'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/policyvalidator/validate', 'hasAuthority(''MANAGE_POLICY_VALIDATOR'') and hasAuthority(''VIEW_POLICY'') and hasAuthority(''VIEW_POLICY_MODEL'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/profile/user/{id:[0-9]+}', 'hasAuthority(''MANAGE_USERS'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/profile/user/add', 'hasAuthority(''MANAGE_USERS'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'DELETE', '/api/v1/profile/user/bulkDelete', 'hasAuthority(''MANAGE_USERS'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'PUT', '/api/v1/profile/user/changePassword', 'authenticated');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/profile/user/currentUser', 'authenticated');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/profile/user/details/{username:^[a-zA-Z][a-zA-Z0-9_.]+$}', 'hasAuthority(''MANAGE_USERS'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/profile/user/importUsers', 'hasAuthority(''MANAGE_USERS'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/profile/user/list', 'hasAuthority(''MANAGE_USERS'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'PUT', '/api/v1/profile/user/modify', 'hasAuthority(''MANAGE_USERS'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'DELETE', '/api/v1/profile/user/remove/{id:[0-9]+}', 'hasAuthority(''MANAGE_USERS'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'PUT', '/api/v1/profile/user/splashDisplay/{hideSplash:((t|T)rue|(f|F)alse|TRUE|FALSE)}', 'authenticated');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/profile/user/unlockUser/{id:[0-9]+}', 'hasAuthority(''MANAGE_USERS'')');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/reIndexer', 'denyAll');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/reIndexer/{indexName:[a-z_]+}', 'denyAll');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/system/installMode', 'authenticated');
INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'GET', '/api/v1/system/version', 'authenticated');
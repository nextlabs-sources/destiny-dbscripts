DELETE FROM EVENT_REGISTRATION WHERE COMPONENT_ID IN (SELECT ID FROM COMPONENT WHERE TYPE IN ('DCSF', 'DKMS'));
DELETE FROM COMPONENT WHERE TYPE = 'DKMS';
DELETE FROM COMPONENT WHERE TYPE = 'DCSF';

UPDATE MENU_ITEM SET PERMISSIONS = 'MANAGE_REPORTER,VIEW_REPORTER' WHERE APPLICATION = 'Audit and Report';


ALTER TABLE MENU_ITEM ADD icon_url varchar(255) NULL;

UPDATE MENU_ITEM SET MENU_ITEM_NAME = 'Enviroment hosts' WHERE MENU_ITEM_NAME = 'Environment target hosts';
UPDATE MENU_ITEM SET MENU_ITEM_NAME = 'Key & certification' WHERE MENU_ITEM_NAME = 'TLS';
UPDATE MENU_ITEM SET MENU_ITEM_NAME = 'Authentication settings' WHERE MENU_ITEM_NAME = 'System';
UPDATE MENU_ITEM SET MAIN_GROUP = 'Analytics' WHERE MENU_ITEM_NAME = 'Dashboard';


UPDATE MENU_ITEM SET ICON_URL = './assets/img/component-types.svg' WHERE MENU_ITEM_NAME = 'Component types';
UPDATE MENU_ITEM SET ICON_URL = './assets/img/subject.svg' WHERE MENU_ITEM_NAME = 'Subjects';
UPDATE MENU_ITEM SET ICON_URL = './assets/img/resource.svg' WHERE MENU_ITEM_NAME = 'Resources';
UPDATE MENU_ITEM SET ICON_URL = './assets/img/action.svg' WHERE MENU_ITEM_NAME = 'Actions';
UPDATE MENU_ITEM SET ICON_URL = './assets/img/policies.svg' WHERE MENU_ITEM_NAME = 'Policies';
UPDATE MENU_ITEM SET ICON_URL = './assets/img/xacml_policy.svg' WHERE MENU_ITEM_NAME = 'XACML policies';
UPDATE MENU_ITEM SET ICON_URL = './assets/img/policy_validator.svg' WHERE MENU_ITEM_NAME = 'Policy validator';
UPDATE MENU_ITEM SET ICON_URL = './assets/img/properties.svg' WHERE MENU_ITEM_NAME = 'Properties';
UPDATE MENU_ITEM SET ICON_URL = './assets/img/data_source.svg' WHERE MENU_ITEM_NAME = 'Data sources';
UPDATE MENU_ITEM SET ICON_URL = './assets/img/data_viewer.svg' WHERE MENU_ITEM_NAME = 'Data viewer';
UPDATE MENU_ITEM SET ICON_URL = './assets/img/location.svg' WHERE MENU_ITEM_NAME = 'Locations';
UPDATE MENU_ITEM SET ICON_URL = './assets/img/status.svg' WHERE MENU_ITEM_NAME = 'Status';
UPDATE MENU_ITEM SET ICON_URL = './assets/img/profiles.svg' WHERE MENU_ITEM_NAME = 'Profiles';
UPDATE MENU_ITEM SET ICON_URL = './assets/img/plugins.svg' WHERE MENU_ITEM_NAME = 'Plugins';
UPDATE MENU_ITEM SET ICON_URL = './assets/img/user_sources.svg' WHERE MENU_ITEM_NAME = 'User sources';
UPDATE MENU_ITEM SET ICON_URL = './assets/img/user.svg' WHERE MENU_ITEM_NAME = 'Users';
UPDATE MENU_ITEM SET ICON_URL = './assets/img/groups.svg' WHERE MENU_ITEM_NAME = 'Groups';
UPDATE MENU_ITEM SET ICON_URL = './assets/img/delegation-policies.svg' WHERE MENU_ITEM_NAME = 'Delegation policies';
UPDATE MENU_ITEM SET ICON_URL = './assets/img/logging.svg' WHERE MENU_ITEM_NAME = 'Logging';
UPDATE MENU_ITEM SET ICON_URL = './assets/img/key-certification.svg' WHERE MENU_ITEM_NAME = 'Key & certification';
UPDATE MENU_ITEM SET ICON_URL = './assets/img/enviroment-host.svg' WHERE MENU_ITEM_NAME = 'Enviroment hosts';
UPDATE MENU_ITEM SET ICON_URL = './assets/img/setting.svg' WHERE MENU_ITEM_NAME = 'Authentication settings';
UPDATE MENU_ITEM SET ICON_URL = './assets/img/dashboard.svg' WHERE MENU_ITEM_NAME = 'Dashboard';
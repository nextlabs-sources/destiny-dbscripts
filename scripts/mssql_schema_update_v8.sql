IF NOT EXISTS (
  SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'APPLICATION_USER') AND name = 'created_date'
) BEGIN 
	ALTER TABLE APPLICATION_USER ADD created_date datetime
END;
IF NOT EXISTS (
  SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'APPLICATION_USER') AND name = 'last_updated_by'
) BEGIN 
	ALTER TABLE APPLICATION_USER ADD last_updated_by numeric(19,0)
END;
IF NOT EXISTS (
  SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'APPLICATION_USER') AND name = 'last_updated'
) BEGIN 
	ALTER TABLE APPLICATION_USER ADD last_updated datetime
END;
IF NOT EXISTS (
  SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'APPLICATION_USER') AND name = 'created_by'
) BEGIN 
	ALTER TABLE APPLICATION_USER ADD created_by numeric(19,0)
END;
IF NOT EXISTS (
  SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'APPLICATION_USER') AND name = 'displayname'
) BEGIN 
	ALTER TABLE APPLICATION_USER ADD displayname nvarchar(255)
END;
IF NOT EXISTS (
  SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'APPLICATION_USER') AND name = 'hide_splash'
) BEGIN 
	ALTER TABLE APPLICATION_USER ADD hide_splash bit
END;
IF NOT EXISTS (
  SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'APPLICATION_USER') AND name = 'last_logged_time'
) BEGIN 
	ALTER TABLE APPLICATION_USER ADD last_logged_time numeric(19,0)
END;
IF NOT EXISTS (
  SELECT * FROM sys.columns WHERE  object_id = OBJECT_ID(N'APPLICATION_USER') AND name = 'auth_handler_id'
) BEGIN 
	ALTER TABLE APPLICATION_USER ADD auth_handler_id numeric(19,0)
END;
IF NOT EXISTS (
  SELECT * FROM sys.columns WHERE  object_id = OBJECT_ID(N'APPLICATION_USER') AND name = 'email'
) BEGIN 
	ALTER TABLE APPLICATION_USER ADD email nvarchar(255)
END;
ALTER TABLE DEVELOPMENT_ENTITIES add extended_desc text;
IF NOT EXISTS (
  SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'SUPER_APPLICATION_USER') AND name = 'created_date'
) BEGIN 
	ALTER TABLE SUPER_APPLICATION_USER ADD created_date datetime
END;
IF NOT EXISTS (
  SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'SUPER_APPLICATION_USER') AND name = 'last_updated_by'
) BEGIN 
	ALTER TABLE SUPER_APPLICATION_USER ADD last_updated_by numeric(19,0)
END;
IF NOT EXISTS (
  SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'SUPER_APPLICATION_USER') AND name = 'last_updated'
) BEGIN 
	ALTER TABLE SUPER_APPLICATION_USER ADD last_updated DATETIME
END;
IF NOT EXISTS (
  SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'SUPER_APPLICATION_USER') AND name = 'created_by'
) BEGIN 
	ALTER TABLE SUPER_APPLICATION_USER ADD created_by numeric(19,0)
END;
IF NOT EXISTS (
  SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'SUPER_APPLICATION_USER') AND name = 'displayname'
) BEGIN 
	ALTER TABLE SUPER_APPLICATION_USER ADD displayname nvarchar(255)
END;
IF NOT EXISTS (
  SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'SUPER_APPLICATION_USER') AND name = 'hide_splash'
) BEGIN 
	ALTER TABLE SUPER_APPLICATION_USER ADD hide_splash bit
END;
IF NOT EXISTS (
  SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'SUPER_APPLICATION_USER') AND name = 'last_logged_time'
) BEGIN 
	ALTER TABLE SUPER_APPLICATION_USER ADD last_logged_time numeric(19,0)
END;
IF NOT EXISTS (
  SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'SUPER_APPLICATION_USER') AND name = 'email'
) BEGIN 
	ALTER TABLE SUPER_APPLICATION_USER ADD email nvarchar(255)
END;
create table APP_USER_PROPERTIES (id numeric(19,0) identity not null,created_date datetime,last_updated_by numeric(19,0),last_updated datetime,created_by numeric(19,0),version int not null,data_type nvarchar(255),prop_key nvarchar(255),super_user_id numeric(19,0),user_id numeric(19,0),prop_value nvarchar(255),primary key (id));
create table AUTH_HANDLER_REGISTRY (id numeric(19,0) identity not null,created_date datetime,last_updated_by numeric(19,0),last_updated datetime,created_by numeric(19,0),version int not null,account_id nvarchar(255),config_data_json text,name nvarchar(255),type nvarchar(255),user_attrs_json text,primary key (id));
create table AUDIT_LOGS (id numeric(19,0) identity not null,created_date datetime,last_updated_by numeric(19,0),last_updated datetime,created_by numeric(19,0),version int not null,component nvarchar(1000),hidden bit,msgCode nvarchar(255),msgParams nvarchar(1000),primary key (id));
create table DEVELOPMENT_ENTITIES_TAGS (dev_entity_id numeric(19,0) not null,tag_id numeric(19,0) not null,primary key (dev_entity_id, tag_id));
create table OPERATOR_CONFIG (id numeric(19,0) identity not null,created_date datetime,last_updated_by numeric(19,0),last_updated datetime,created_by numeric(19,0),version int not null,data_type nvarchar(255),operator_key nvarchar(255),label nvarchar(255),primary key (id));
create table PM_ACTION_CONFIG (id numeric(19,0) identity not null,created_date datetime,last_updated_by numeric(19,0),last_updated datetime,created_by numeric(19,0),version int not null,name nvarchar(255),short_code nvarchar(2),short_name nvarchar(50),plcy_model_id numeric(19,0),primary key (id));
create table PM_ATTRIBUTE_CONFIG (id numeric(19,0) identity not null,created_date datetime,last_updated_by numeric(19,0),last_updated datetime,created_by numeric(19,0),version int not null,data_type nvarchar(255),name nvarchar(255),reg_ex_pattern nvarchar(255),short_name nvarchar(50),policy_model_id numeric(19,0),plcy_model_id numeric(19,0),primary key (id));
create table PM_ATTRIB_CONFIG_OPER_CONFIG (attribute_id numeric(19,0) not null,operator_id numeric(19,0) not null,primary key (attribute_id, operator_id));
create table PM_OBLIGATION_CONFIG (id numeric(19,0) identity not null,created_date datetime,last_updated_by numeric(19,0),last_updated datetime,created_by numeric(19,0),version int not null,name nvarchar(255),run_at nvarchar(255),short_name nvarchar(50),plcy_model_id numeric(19,0),primary key (id));
create table PM_PARAMETER_CONFIG (id numeric(19,0) identity not null,created_date datetime,last_updated_by numeric(19,0),last_updated datetime,created_by numeric(19,0),version int not null,default_value nvarchar(1000),is_editable bit,is_hidden bit,list_values nvarchar(1000),is_mandatory bit,name nvarchar(255),short_name nvarchar(50),data_type nvarchar(255),obligation_id numeric(19,0),primary key (id));
create table POLICY_MODEL (discriminator nvarchar(31) not null,id numeric(19,0) identity not null,created_date datetime,last_updated_by numeric(19,0),last_updated datetime,created_by numeric(19,0),version int not null,description nvarchar(4000),name nvarchar(264),short_name nvarchar(50),status nvarchar(255),type nvarchar(255),primary key (id));
create table POLICY_MODEL_TAGS (plcy_model_id numeric(19,0) not null,tag_id numeric(19,0) not null,primary key (plcy_model_id, tag_id));
create table SAVED_SEARCH (id numeric(19,0) identity not null,created_date datetime,last_updated_by numeric(19,0),last_updated datetime,created_by numeric(19,0),version int not null,criteria_json nvarchar(4000),description nvarchar(255),lowercase_name nvarchar(255),name nvarchar(255),shared_mode nvarchar(255),status nvarchar(255),type nvarchar(255),primary key (id));
create table TAG_LABELS (id numeric(19,0) identity not null,created_date datetime,last_updated_by numeric(19,0),last_updated datetime,created_by numeric(19,0),version int not null,hidden bit,tag_key nvarchar(255),label nvarchar(255),status nvarchar(255),type nvarchar(255),primary key (id));
ALTER TABLE APP_USER_PROPERTIES add constraint FK87A05FE9B53FEACB foreign key (super_user_id) references SUPER_APPLICATION_USER;
ALTER TABLE APP_USER_PROPERTIES add constraint FK87A05FE9A759120A foreign key (user_id) references APPLICATION_USER;
ALTER TABLE DEVELOPMENT_ENTITIES_TAGS add constraint FKDB1ED5B379C3E7F9 foreign key (dev_entity_id) references DEVELOPMENT_ENTITIES;
ALTER TABLE DEVELOPMENT_ENTITIES_TAGS add constraint FKDB1ED5B3E3AB049A foreign key (tag_id) references TAG_LABELS;
ALTER TABLE PM_ACTION_CONFIG add constraint FKEC9D56A94476BBF5 foreign key (plcy_model_id) references POLICY_MODEL;
ALTER TABLE PM_ATTRIBUTE_CONFIG add constraint FK85828674476BBF5 foreign key (plcy_model_id) references POLICY_MODEL;
ALTER TABLE PM_ATTRIBUTE_CONFIG add constraint FK8582867B27E9A35 foreign key (policy_model_id) references POLICY_MODEL;
ALTER TABLE PM_ATTRIB_CONFIG_OPER_CONFIG add constraint FK2AB580A9FC12A4DC foreign key (operator_id) references OPERATOR_CONFIG;
ALTER TABLE PM_ATTRIB_CONFIG_OPER_CONFIG 
add constraint FK2AB580A965AE0D5C foreign key (attribute_id) references PM_ATTRIBUTE_CONFIG;
ALTER TABLE PM_OBLIGATION_CONFIG add constraint FK70C823614476BBF5 foreign key (plcy_model_id) references POLICY_MODEL;
ALTER TABLE PM_PARAMETER_CONFIG add constraint FK79C446BAFD78E31C foreign key (obligation_id) references PM_OBLIGATION_CONFIG;
ALTER TABLE POLICY_MODEL_TAGS add constraint FKDC8BC8BC4476BBF5 foreign key (plcy_model_id) references POLICY_MODEL;
ALTER TABLE POLICY_MODEL_TAGS add constraint FKDC8BC8BCE3AB049A foreign key (tag_id) references TAG_LABELS;
update OPERATOR_CONFIG set LABEL = '=' where DATA_TYPE= 'MULTIVAL' and OPERATOR_KEY = 'equals_unordered';
ALTER TABLE AUDIT_LOGS alter column component nvarchar(1000);
ALTER TABLE AUDIT_LOGS alter column msgParams nvarchar(3000);
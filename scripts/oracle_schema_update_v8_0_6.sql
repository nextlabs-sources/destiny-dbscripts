DECLARE
  l_cnt integer&semi
BEGIN
  SELECT COUNT(*)
    INTO l_cnt 
    FROM dba_tab_columns
   WHERE table_name = 'SUPER_APPLICATION_USER'
     AND column_name = 'INITLOGIN_DONE'&semi
  IF( l_cnt = 0 )
  THEN
    EXECUTE IMMEDIATE 'ALTER TABLE SUPER_APPLICATION_USER ADD INITLOGIN_DONE CHAR(1) DEFAULT ''N'''&semi
  END IF&semi
END&semi;
DECLARE
  l_cnt integer&semi
BEGIN
  SELECT COUNT(*)
    INTO l_cnt 
    FROM dba_tab_columns
   WHERE table_name = 'APPLICATION_USER'
     AND column_name = 'INITLOGIN_DONE'&semi
  IF( l_cnt = 0 )
  THEN
    EXECUTE IMMEDIATE 'ALTER TABLE APPLICATION_USER ADD INITLOGIN_DONE CHAR(1) DEFAULT ''N'''&semi
  END IF&semi
END&semi;

ALTER TABLE pm_parameter_config ADD ( list_values_copy CLOB);
UPDATE pm_parameter_config SET list_values_copy=list_values;
COMMIT;
ALTER TABLE pm_parameter_config DROP COLUMN list_values;
ALTER TABLE pm_parameter_config RENAME COLUMN list_values_copy TO list_values;
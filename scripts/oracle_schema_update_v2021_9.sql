UPDATE ACCESS_CONTROL SET URL_PATTERN = '/api/v1/secureStore/importPkcs12KeyPair' WHERE URL_PATTERN = '/api/v1/secureStore/importKeyPair';
UPDATE ACCESS_CONTROL SET URL_PATTERN = '/api/v1/secureStore/generateCsr' WHERE URL_PATTERN = '/api/v1/secureStore/generateCSR';

INSERT INTO ACCESS_CONTROL (ID, REQUEST_METHOD, URL_PATTERN, EXPRESSION) VALUES (HIBERNATE_SEQUENCE.NEXTVAL, 'POST', '/api/v1/secureStore/importPemKeyPair', 'hasAuthority(''MANAGE_SECURE_STORE'')');

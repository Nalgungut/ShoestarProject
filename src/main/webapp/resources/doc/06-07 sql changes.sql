ALTER TABLE qna
   ADD  qna_state varchar2(20) default '�亯���';

ALTER TABLE ORDERS_STATUS DROP CONSTRAINT ORDER_STATUS_PK;
ALTER TABLE ORDERS_STATUS DROP CONSTRAINT R_25;
ALTER TABLE ORDERS_INS DROP CONSTRAINT ORDERS_INS_PK;
ALTER TABLE ORDERS_INS ADD PS_SIZE NUMBER(3) NOT NULL;
ALTER TABLE ORDERS_INS ADD OI_NO NUMBER;
ALTER TABLE ORDERS_INS ADD CONSTRAINT ORDERS_INS_PK_NO PRIMARY KEY(OI_NO);
ALTER TABLE ORDERS_INS DROP CONSTRAINT R_30;
ALTER TABLE ORDERS_INS ADD CONSTRAINT ORDERS_INS_FK_PROD_STOCK FOREIGN KEY(PI_NO, PS_SIZE) REFERENCES PROD_STOCK(PI_NO, PS_SIZE);
ALTER TABLE ORDERS_STATUS DROP COLUMN PI_NO;
ALTER TABLE ORDERS_STATUS DROP COLUMN OD_NO;
ALTER TABLE ORDERS_STATUS ADD OI_NO NUMBER NOT NULL;
ALTER TABLE ORDERS_STATUS ADD CONSTRAINT ORDERS_STATUS_PK PRIMARY KEY(OS_NO);
ALTER TABLE ORDERS_STATUS ADD CONSTRAINT ORDERS_STATUS_FK_ORDER_INS FOREIGN KEY(OI_NO) REFERENCES ORDERS_INS(OI_NO);


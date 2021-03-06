ALTER TABLE PROD_WARE
DROP COLUMN PI_NO;
ALTER TABLE PROD_WARE
ADD PI_NO NUMBER NOT NULL;
ALTER TABLE PROD_WARE
ADD PS_SIZE NUMBER NOT NULL;
ALTER TABLE PROD_WARE
ADD CONSTRAINT PROD_WARE_SIZE_FK FOREIGN KEY(PI_NO, PS_SIZE) REFERENCES PROD_STOCK(PI_NO, PS_SIZE);

ALTER TABLE CART
DROP CONSTRAINT CART_PK;
ALTER TABLE CART
DROP CONSTRAINT R_46;
ALTER TABLE CART
ADD PS_SIZE NUMBER NOT NULL;
ALTER TABLE CART
ADD CONSTRAINT CART_PRODSTOCK_FK FOREIGN KEY(PI_NO, PS_SIZE) REFERENCES PROD_STOCK(PI_NO, PS_SIZE);
ALTER TABLE CART
ADD CONSTRAINT CART_PK_NEW PRIMARY KEY(MEM_NO, PI_NO, PS_SIZE);

ALTER TABLE RD_TYPE DROP CONSTRAINT RD_TYPE_PK;
ALTER TABLE RD_PRODUCT DROP CONSTRAINT RD_PRODUCT_PK;
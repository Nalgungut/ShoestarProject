DROP INDEX CART_PK;
DROP INDEX ORDERS_INS_PK;

create sequence delivery_seq
start with 1
increment by 1
minvalue 1
cache 2;
create sequence faq_seq
start with 1
increment by 1
minvalue 1
cache 2;
create sequence qna_seq
start with 1
increment by 1
minvalue 1
cache 2;

ALTER TABLE delivery MODIFY (dm_name NULL);
ALTER TABLE delivery MODIFY (dm_number NULL);
ALTER TABLE delivery MODIFY (dm_status default '배송준비중');
alter table delivery add dm_addr varchar2(200 char) not null;
alter table prod_stock
rename column PI_SIZE to PS_SIZE;
alter table prod_stock
rename column PI_QTY to PS_QTY;
alter table prod_stock
rename column PI_STATUS to PS_STATUS;

alter table prod_stock
drop constraint prod_stock_pk;
alter table prod_stock
drop constraint prod_stock_uq;
alter table prod_stock
drop column PS_NO;
alter table prod_stock
add constraint prod_stock_pk primary key(PI_NO, PS_SIZE);

alter table prod_image
rename column PIM_USE TO PIM_PRIORITY;
alter table prod_image
modify (PIM_PRIORITY char(1) null);
alter table prod_image
modify (PIM_PRIORITY number(2) default 99 not null);
alter table qna_reply
   drop column adm_no;

alter table orders
modify od_prog varchar2(20char) null;

create sequence orders_seq
cache 10;
create sequence orders_ins_seq
cache 100;
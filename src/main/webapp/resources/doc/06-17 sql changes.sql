-- �귣�� ������
create sequence brandNews_seq;

-- �������� �Խ��� ������ --
create sequence notice_seq;

-- ��� ������ ���
create sequence noticeReply2_seq;

create sequence orders_status_seq;

alter table prod_stock
add constraint prod_stock_fk foreign key (pi_no) references prod_ins(pi_no);
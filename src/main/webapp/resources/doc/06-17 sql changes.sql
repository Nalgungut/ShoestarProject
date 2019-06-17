-- 브랜드 시퀀스
create sequence brandNews_seq;

-- 공지사항 게시판 시퀀스 --
create sequence notice_seq;

-- 댓글 시퀀스 등록
create sequence noticeReply2_seq;

create sequence orders_status_seq;

alter table prod_stock
add constraint prod_stock_fk foreign key (pi_no) references prod_ins(pi_no);
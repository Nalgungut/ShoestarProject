package com.shoestar.client.brand.vo;



import java.util.Date;

import com.shoestar.client.notice.vo.NoticeVO;

import lombok.Data;
import lombok.EqualsAndHashCode;
import com.shoestar.client.member.vo.MemberVO;
@Data
@EqualsAndHashCode(callSuper=false)

public class NoticeReplyVO extends MemberVO{
	private int no_no;
	private int re_no; // 댓글 번호
	private int mem_no; // 회원번호(현석)
	private String re_content; // 댓글 내용
	private Date re_date; // 댓글 작성일
}

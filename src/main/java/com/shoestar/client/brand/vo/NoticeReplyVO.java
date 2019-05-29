package com.shoestar.client.brand.vo;

import java.sql.Date;

import com.shoestar.client.brand.vo.NoticeVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)

public class NoticeReplyVO {
	private int re_no; // 댓글 번호
	/*private int mem_no; // 회원번호(현석)
*/	private String re_content; // 댓글 내용
	private Date re_date; // 댓글 작성일
	private NoticeVO no_no; // 공지사항번호 - NoticeVO
}

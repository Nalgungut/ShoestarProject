package com.shoestar.client.event.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.shoestar.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class Range_DiscountVO extends CommonVO {
	private int rd_no; // ���� ���� ��ȣ
	private String rd_title; // ���� ���� ����
	private String rd_content; // ���� ���� ����
	private int rd_discount; // ���� ���� (100 ���ϴ� %, 1000�̻��� ��)
	@DateTimeFormat(pattern="yyyy-MM-dd") 
	private Date rd_date;
	@DateTimeFormat(pattern="yyyy-MM-dd") 
	private Date rd_edate;
	
}

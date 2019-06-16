package com.shoestar.client.event.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.shoestar.client.prod.vo.ProdVO;
import com.shoestar.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class Range_DiscountVO extends ProdVO/*extends Rd_ProductVO*/ {
	private int rd_no; // 범위 할인 번호
	private String rd_title; // 범위 할인 제목
	private String rd_content; // 범위 할인 내용
	private int rd_discount; // 범위 할인 (100 이하는 %, 1000이상은 원)
	@DateTimeFormat(pattern="yyyy-MM-dd") 
	private Date rd_date;
	@DateTimeFormat(pattern="yyyy-MM-dd") 
	private Date rd_edate;
	private List<Rd_ProductVO> list;
	
	public Range_DiscountVO() {
		list = new ArrayList<Rd_ProductVO>();
	}
	
	
	
}

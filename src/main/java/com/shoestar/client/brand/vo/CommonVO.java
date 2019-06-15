package com.shoestar.client.brand.vo;

import com.shoestar.admin.adminLogin.vo.AdminLoginVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*import lombok.Data;

@Data*/
@ToString
@Setter
@Getter

public class CommonVO extends AdminLoginVO{
	private int pageNum;
	private int amount; 
	
	
	private String search="";
	private String keyword="";
	
	public CommonVO(){
		this(1, 10);
	}
	public CommonVO(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

}
package com.shoestar.client.event.vo;

import com.shoestar.client.prod.vo.ProdVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class Rd_ProductVO extends ProdVO {
	  private int rd_no;
      private int pd_no;  
}

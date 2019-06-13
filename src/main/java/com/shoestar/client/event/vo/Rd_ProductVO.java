package com.shoestar.client.event.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class Rd_ProductVO extends Rd_TypeVO {
	  private int rd_no;
      private int pd_no;  
}

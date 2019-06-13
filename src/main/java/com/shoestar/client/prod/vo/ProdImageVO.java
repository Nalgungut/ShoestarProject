package com.shoestar.client.prod.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class ProdImageVO extends ProdImageFilterVO {
	private int pim_no;
	private int pi_no;
	private int pim_priority;
	private String pim_file;
}

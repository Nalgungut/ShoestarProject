package com.shoestar.admin.adminMember.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.shoestar.admin.adminLogin.vo.AdminLoginVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class AdminMemberVO extends AdminLoginVO{
	/*private String mem_id;
	private String mem_pwd;
	private String mem_name;*/
	@DateTimeFormat(pattern = "yyMMdd")
	private Date adm_birth;
	private Date adm_rdate;
	private String adm_sex;
	private String adm_addr1;
	private String adm_addr2;
	private String adm_addr3;
	private String adm_phone;
	private String adm_email;
	private String adm_status;
	private String adm_zip;
	
	private String adm_oldUserPwd;

}

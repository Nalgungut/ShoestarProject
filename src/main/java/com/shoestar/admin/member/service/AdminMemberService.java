package com.shoestar.admin.member.service;

import com.shoestar.admin.member.vo.AdminMemberVO;

public interface AdminMemberService {

	public int adminUserIdConfirm(String adm_id);

	public int adminMemberInsert(AdminMemberVO mvo);
	
	public AdminMemberVO adminMemberSelect(String adm_id);

	public int adminMemberDelete(String adm_id);

	public int adminMemberUpdate(AdminMemberVO mvo);


	

}

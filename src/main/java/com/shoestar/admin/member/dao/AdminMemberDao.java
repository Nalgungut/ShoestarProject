package com.shoestar.admin.member.dao;

import com.shoestar.admin.member.vo.AdminMemberVO;

public interface AdminMemberDao {

	public AdminMemberVO adminMemberSelect(String adm_id);

	public int adminMemberInsert(AdminMemberVO mvo);

	public int adminMemberUpdate(AdminMemberVO mvo);

	public int adminMemberDelete(String adm_id);

}

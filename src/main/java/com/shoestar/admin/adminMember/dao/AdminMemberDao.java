package com.shoestar.admin.adminMember.dao;

import com.shoestar.admin.adminMember.vo.AdminMemberVO;

public interface AdminMemberDao {

	public AdminMemberVO adminMemberSelect(String adm_id);

	public int adminMemberInsert(AdminMemberVO mvo);

	public int adminMemberUpdate(AdminMemberVO mvo);

	public int adminMemberDelete(String adm_id);

}

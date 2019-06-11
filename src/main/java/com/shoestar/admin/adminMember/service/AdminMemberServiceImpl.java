package com.shoestar.admin.adminMember.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shoestar.admin.adminMember.dao.AdminMemberDao;
import com.shoestar.admin.adminMember.vo.AdminMemberVO;


import lombok.Setter;

@Service
public class AdminMemberServiceImpl implements AdminMemberService{
	
	@Setter(onMethod_=@Autowired)
	private AdminMemberDao adminMemberDao;

	@Override
	public int adminUserIdConfirm(String adm_id){
		int result;
		if(adminMemberDao.adminMemberSelect(adm_id) != null){
			result = 1;
		}else{
			result = 2;
		}
		return result;
	}

	@Transactional
	@Override
	public int adminMemberInsert(AdminMemberVO mvo) {
		
		int sCode = 2;
		if(adminMemberDao.adminMemberSelect(mvo.getAdm_id()) != null){
			return 1;
		}else{
			try{
				sCode = adminMemberDao.adminMemberInsert(mvo);
				if(sCode == 1){
					return 3;
				}else{
					return 2;
				}
			}catch(RuntimeException e){
				e.printStackTrace();
				return 2;
			}
		}
	}

	@Override
	public AdminMemberVO adminMemberSelect(String adm_id) {
		AdminMemberVO vo = adminMemberDao.adminMemberSelect(adm_id);
		return vo;
	}
	
	
	@Transactional
	@Override
	public int adminMemberUpdate(AdminMemberVO mvo) {
		int result = adminMemberDao.adminMemberUpdate(mvo);
		return result;
	}

	@Transactional
	@Override
	public int adminMemberDelete(String adm_id) {
		int mCode, isSuccessCode=3;
		try{
			mCode = adminMemberDao.adminMemberDelete(adm_id);
			if(mCode==1){
				isSuccessCode = 2;
			}
		}catch(Exception e){
			e.printStackTrace();
			isSuccessCode = 3;
		}
		return isSuccessCode;
	}
	
	

}

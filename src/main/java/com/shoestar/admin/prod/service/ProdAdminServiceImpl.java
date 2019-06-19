package com.shoestar.admin.prod.service;

import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.shoestar.admin.prod.dao.ProdAdminDao;
import com.shoestar.client.prod.dao.ProdDao;
import com.shoestar.client.prod.dao.ProdInsDao;
import com.shoestar.client.prod.vo.ProdColorVO;
import com.shoestar.client.prod.vo.ProdImageVO;
import com.shoestar.client.prod.vo.ProdInsVO;
import com.shoestar.client.prod.vo.ProdStockVO;
import com.shoestar.client.prod.vo.ProdVO;
import com.shoestar.common.file.FileUploadForProd;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ProdAdminServiceImpl implements ProdAdminService {
	
	private ProdDao prodDao;
	private ProdAdminDao prodAdminDao;
	private ProdInsDao prodInsDao;
	
	@Override
	public List<ProdVO> prodlist(ProdVO pvo) {
		
		pvo.setIncludeItemless(true);
		if(pvo.getPd_age() == null) {
			pvo.setPd_age("all");
		}
		
		List<ProdVO> result = prodDao.prodList(pvo);
		
		return result;
	}

	@Override
	public int countRecords(ProdVO pvo) {
		
		pvo.setIncludeItemless(true);
		if(pvo.getPd_age() == null) {
			pvo.setPd_age("all");
		}
		
		int result = prodDao.countRecords(pvo);
		
		return result;
	}

	@Override
	public ProdVO prodDetail(Integer pd_no) {
		if(pd_no == null || pd_no == 0) {
			return null;
		}
		
		ProdVO pvo = new ProdVO();
		pvo.setPd_no(pd_no);
		
		ProdVO result = prodDao.prodDetail(pvo);
		
		return result;
	}

	@Override
	public int updateMultiple(List<Integer> pdnos, ProdVO pvo) {
		int result = prodAdminDao.updateMultiple(pdnos, pvo);
		return result;
	}

	@Override
	public int deleteMultiple(List<Integer> pdnos) {
		int result;
		try {
			result = prodAdminDao.deleteMultiple(pdnos);
		} catch (Exception e) {
			result = 0;
		}
		return result;
	}

	@Override
	public int updateProd(ProdVO pvo) {
		int result = prodAdminDao.updateProd(pvo);
		return result;
	}

	@Override
	public int insertProd(ProdVO pvo) {
		int result = prodAdminDao.insertProd(pvo);
		
		return result == 1 ? pvo.getPd_no() : result;
	}

	@Override
	public List<ProdInsVO> prodInsList(ProdVO pvo) {
		List<ProdInsVO> result = prodInsDao.pinsListByProd(pvo);
		return result;
	}

	@Override
	public int pimInsert(ProdImageVO pvo) {
		int result = 0;
		
		try {
			if(pvo.getFile() != null) {
				String fileName = FileUploadForProd.fileUpload(pvo.getFile());
				pvo.setPim_file(fileName);
				result = prodAdminDao.pimInsert(pvo);
				if(pvo.isUpdatePimMain()) {
					prodAdminDao.updateMainImage(pvo);
				} else {
					ProdVO prodVO = prodAdminDao.prodDetailByImage(pvo);
					if(prodVO.getPim_main() == null || prodVO.getPim_main().isEmpty()) {
						prodAdminDao.updateMainImage(pvo);
					}
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int pimUpdate(ProdImageVO pvo) {
		int result = 0;
		try {
			if(pvo.getFile() != null && !pvo.getFile().isEmpty()) {
				ProdImageVO oldPvo = prodAdminDao.pimSelect(pvo);
				FileUploadForProd.fileDelete(oldPvo.getPim_file());
				String fileName = FileUploadForProd.fileUpload(pvo.getFile());
				pvo.setPim_file(fileName);
			}
			
			result = prodAdminDao.pimUpdate(pvo);
			if(pvo.isUpdatePimMain()) {
				pvo = prodAdminDao.pimSelect(pvo);
				prodAdminDao.updateMainImage(pvo);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int pimDelete(ProdImageVO pvo) {
		int result = 0;
		
		try {
			ProdImageVO newPvo = prodAdminDao.pimSelect(pvo);
			ProdVO prod = prodAdminDao.prodDetailByImage(newPvo);
			
			FileUploadForProd.fileDelete(newPvo.getPim_file());
			result = prodAdminDao.pimDelete(newPvo);
			if(prod.getPim_main() != null && prod.getPim_main().equals(newPvo.getPim_file())) {
				newPvo.setPim_file(null);
				prodAdminDao.updateMainImage(newPvo);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	
	/* ------------------------------ prodins ------------------------------ */
	
	@Override
	public int insertProdins(ProdInsVO pivo) {
		prodAdminDao.insertProdins(pivo);
		return pivo.getPi_no();
	}

	@Override
	public int deleteProdins(ProdInsVO pivo) {
		prodAdminDao.deletePiMain(pivo);
		return prodAdminDao.deleteProdins(pivo);
	}

	@Override
	public boolean isProdinsDeletable(ProdInsVO pivo) {
		return prodAdminDao.isProdinsDeletable(pivo) == 0;
	}
	
	@Override
	public List<ProdColorVO> unoccupiedColors(ProdVO pvo) {
		return prodAdminDao.unoccupiedColors(pvo);
	}
	
	/* ------------------------------ prodstock ------------------------------ */
	
	@Override
	public int insertProdStock(ProdStockVO psvo) {
		return prodAdminDao.insertProdStock(psvo);
	}

	@Override
	public int updateProdStock(ProdStockVO psvo) {
		return prodAdminDao.updateProdStock(psvo);
	}

	@Override
	public int deleteProdStock(ProdStockVO psvo) {
		return prodAdminDao.deleteProdStock(psvo);
	}

	@Override
	public boolean isProdStockDeletable(ProdStockVO psvo) {
		return prodAdminDao.isProdStockDeletable(psvo) == 0;
	}

	@Override
	public boolean isSafeSize(ProdStockVO psvo) {
		return prodAdminDao.isSafeSize(psvo) == 0;
	}
}
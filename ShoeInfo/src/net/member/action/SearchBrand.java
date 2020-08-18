package net.member.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.action.Criteria;
import net.board.action.PageMaker;
import net.brand.db.BrandDAO;
import net.brand.db.BrandDTO;
import net.sneaker.db.SneakerDAO;
import net.sneaker.db.SneakerDTO;

public class SearchBrand implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		
		//넘어온 값 가져오기
		String model_stylecode = (String) request.getParameter("model_stylecode");
		if(model_stylecode == null){
			model_stylecode = "";
		}

		//BrandDB로부터 모든 브랜드 가져오는 함수
		BrandDAO bdao = new BrandDAO();
		
		List<BrandDTO> brandList = bdao.getAllBrandList();
		
		request.setAttribute("brandList", brandList);

		//신발 모델 정보 가져오기
		SneakerDAO sdao = new SneakerDAO();
		SneakerDTO sneakerDetail = sdao.getSneakerDetail(model_stylecode);
		
		request.setAttribute("sneakerDetail", sneakerDetail);
		
		forward.setPath("./member/memberAddReleaseInfo.jsp?model_stylecode="+model_stylecode);
		forward.setRedirect(false);
		return forward;
	}
	
}

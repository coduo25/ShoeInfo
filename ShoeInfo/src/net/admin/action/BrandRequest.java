package net.admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.brand.db.BrandDAO;
import net.brand.db.BrandReqDTO;

public class BrandRequest implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//로그인 정보 가져오기
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("email");
		String usr_position = (String) session.getAttribute("usr_position");
		ActionForward forward = new ActionForward();
		if(!usr_position.equals("admin")){
			forward.setPath("./Main.bo");
			forward.setRedirect(true);
			return forward;
		}
		
		//사용자 요청 DB로 가서 브랜드 리스트 가져오기
		BrandDAO bdao = new BrandDAO();
		
		List<BrandReqDTO> brandReqList = bdao.getBrandRequestList();
		
		request.setAttribute("brandReqList", brandReqList);
		
		
		forward.setPath("./admin/admin_brandReqList.jsp");
		forward.setRedirect(false);
		return forward;
	}

}

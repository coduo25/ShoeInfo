package net.admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.board.action.Criteria;
import net.board.action.PageMaker;
import net.brand.db.BrandDAO;
import net.brand.db.BrandDTO;

public class BrandListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//로그인 정보 가져오기
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("email");
		String usr_position = (String) session.getAttribute("usr_position");
		ActionForward forward = new ActionForward();
		if(user == null || !usr_position.equals("admin")){
			forward.setPath("./SneakerList.go");
			forward.setRedirect(true);
			return forward;
		}
		
		//total 게시판 글 수 
		int total = 0;
		
		BrandDAO bdao = new BrandDAO();
		
		List<BrandDTO> admin_brandList = bdao.getAllBrandList();
		
		request.setAttribute("admin_brandList", admin_brandList);
		
		forward.setPath("./admin/admin_brandList.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}

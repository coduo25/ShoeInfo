package net.admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.board.action.Criteria;
import net.board.action.PageMaker;
import net.sneaker.db.SneakerDAO;
import net.sneaker.db.SneakerDTO;

public class SneakerListAction implements Action{

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
		
		SneakerDAO sdao = new SneakerDAO();
		
		List<SneakerDTO> admin_sneakerList = sdao.getAllSneakerList();
		
		request.setAttribute("admin_sneakerList", admin_sneakerList);
		
		forward.setPath("./admin/admin_sneakerList.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}

package net.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.online.db.OnlineDAO;
import net.online.db.OnlineDTO;

public class UpdateDrawInfo implements Action{
	
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
		
		//넘어온 정보 가져오기(model_stylecode, brand_id)
		String model_stylecode = (String) request.getParameter("model_stylecode");
		String brand_id = (String) request.getParameter("brand_id");
		
		OnlineDAO odao = new OnlineDAO();
		OnlineDTO onlineDrawInfo = (OnlineDTO) odao.getOneOnlineInfo(model_stylecode, brand_id);
		
		//정보를 객체에 저장
		request.setAttribute("onlineDrawInfo", onlineDrawInfo);
		
		//페이지이동
		forward.setPath("./admin/adminUpdateDrawInfo.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}
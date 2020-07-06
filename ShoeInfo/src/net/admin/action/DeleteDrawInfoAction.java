package net.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.online.db.OnlineDAO;
import net.online.db.OnlineDTO;

public class DeleteDrawInfoAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html;charset=UTF-8");
		
		request.setCharacterEncoding("UTF-8");
		
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
		
		//넘어온 값 저장하기
		String model_stylecode = (String) request.getParameter("model_stylecode");
		String brand_id = (String) request.getParameter("brand_id");
		
		OnlineDAO odao = new OnlineDAO();
		odao.deleteOnlineInfo(model_stylecode, brand_id);
		
		//페이지이동
		forward.setPath("./SneakerDetail.go?model_stylecode=" + model_stylecode);
		forward.setRedirect(true);
		return forward;
	}
	
}

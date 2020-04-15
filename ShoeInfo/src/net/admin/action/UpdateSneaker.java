package net.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sneaker.db.SneakerDAO;
import net.sneaker.db.SneakerDTO;

public class UpdateSneaker implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//로그인 정보 가져오기
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("id");
		ActionForward forward = new ActionForward();
		if(!user.equals("admin")){
			forward.setPath("./Main.bo");
			forward.setRedirect(true);
			return forward;
		}
		
		//넘어온 model_stylecode의 값으로 해당 신발 정보 가져오기
		String model_stylecode = (String) request.getParameter("model_stylecode");
		SneakerDAO sdao = new SneakerDAO();
		SneakerDTO sneakerInfo = sdao.getSneakerDetail(model_stylecode);
		
		//정보를 객체에 저장
		request.setAttribute("sneakerInfo", sneakerInfo);
		
		//페이지이동
		forward.setPath("./admin/adminUpdateSneakerInfo.jsp");
		forward.setRedirect(false);
		return forward;
	}
}

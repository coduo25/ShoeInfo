package net.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sneaker.db.SneakerDAO;
import net.sneaker.db.SneakerDTO;

public class UpdateSneaker implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("email");
		String usr_position = (String) session.getAttribute("usr_position");
		ActionForward forward = new ActionForward();
		if(!usr_position.equals("admin")){
			forward.setPath("./Main.bo");
			forward.setRedirect(true);
			return forward;
		}
		
		String model_stylecode = (String) request.getParameter("model_stylecode");
		SneakerDAO sdao = new SneakerDAO();
		SneakerDTO sneakerInfo = sdao.getSneakerDetail(model_stylecode);
		
		request.setAttribute("sneakerInfo", sneakerInfo);
		
		forward.setPath("./admin/adminUpdateSneakerInfo.jsp");
		forward.setRedirect(false);
		return forward;
	}
}
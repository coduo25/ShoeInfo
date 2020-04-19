package net.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.online.db.OnlineDAO;
import net.online.db.OnlineDTO;

public class UpdateDrawInfo implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//�α��� ���� ��������
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("id");
		ActionForward forward = new ActionForward();
		if(!user.equals("admin")){
			forward.setPath("./Main.bo");
			forward.setRedirect(true);
			return forward;
		}
		
		//�Ѿ�� ���� ��������(model_stylecode, brand_id)
		String model_stylecode = (String) request.getParameter("model_stylecode");
		String brand_id = (String) request.getParameter("brand_id");
		
		OnlineDAO odao = new OnlineDAO();
		OnlineDTO onlineDrawInfo = (OnlineDTO) odao.getOneOnlineInfo(model_stylecode, brand_id);
		
		//������ ��ü�� ����
		request.setAttribute("onlineDrawInfo", onlineDrawInfo);
		
		//�������̵�
		forward.setPath("./admin/adminUpdateDrawInfo.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}

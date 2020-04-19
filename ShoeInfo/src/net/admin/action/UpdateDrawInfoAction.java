package net.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.online.db.OnlineDAO;
import net.online.db.OnlineDTO;

public class UpdateDrawInfoAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		//로그인 정보 가져오기
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("id");
		ActionForward forward = new ActionForward();
		if(!user.equals("admin")){
			forward.setPath("./Main.bo");
			forward.setRedirect(true);
			return forward;
		}
		
		//넘어온 값 저장하기
		OnlineDTO odto = new OnlineDTO();
		odto.setModel_stylecode(request.getParameter("model_stylecode"));
		odto.setCountry_region(request.getParameter("country_region"));
		odto.setCountry_name(request.getParameter("country_name"));
		odto.setBrand_id(request.getParameter("brand_id"));
		odto.setOnline_link(request.getParameter("online_link"));
		
		String online_start_time = request.getParameter("online_date_start") + request.getParameter("online_hour_start");
		odto.setOnline_start_time(online_start_time);
		
		String online_end_time = request.getParameter("online_date_end") + request.getParameter("online_hour_end");
		odto.setOnline_end_time(online_end_time);
		
		odto.setOnline_method(request.getParameter("online_method"));
		odto.setBuy_method(request.getParameter("buy_method"));
		odto.setDelivery_method(request.getParameter("delivery_method"));
		odto.setDescription(request.getParameter("description"));
		
		OnlineDAO odao = new OnlineDAO();
		
		System.out.print(odto.getBrand_id() + ", " + odto.getModel_stylecode());
		
		odao.updateOnlineinfo(odto);
		
		//페이지이동
		forward.setPath("./SneakerDetail.go?model_stylecode="+odto.getModel_stylecode());
		forward.setRedirect(true);
		return forward;
	}
	
}
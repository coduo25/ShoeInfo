package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.online.db.OnlineDAO;
import net.online.db.OnlineDTO;

public class UpdateDrawInfoAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		
		//넘어온 값 저장하기
		OnlineDTO odto = new OnlineDTO();
		odto.setOnline_num(Integer.parseInt(request.getParameter("online_num")));
		odto.setModel_num(Integer.parseInt(request.getParameter("model_num")));
		odto.setModel_stylecode(request.getParameter("model_stylecode"));
		odto.setCountry_region(request.getParameter("country_region"));
		odto.setCountry_name(request.getParameter("country_name"));
		odto.setBrand_id(request.getParameter("brand_id"));
		odto.setOnline_link(request.getParameter("online_link"));
		odto.setOnline_method(request.getParameter("online_method"));
		
		//온라인 시작 시간
		String online_date_start = request.getParameter("online_date_start");
		String online_hour_start = request.getParameter("online_hour_start");
		if(online_date_start.equals("")){
			online_date_start = "";
		}
		if(online_hour_start.equals("")){
			online_hour_start = "";
		}
		String online_start_date = online_date_start;
		String online_start_time = online_hour_start;
		
		//온라인 끝나는 시간
		String online_date_end = request.getParameter("online_date_end");
		String online_hour_end = request.getParameter("online_hour_end");
		if(online_date_end.equals("")){
			online_date_end = "";
		}
		if(online_hour_end.equals("")){
			online_hour_end = "";
		}
		if(odto.getOnline_method().equals("선착") || odto.getOnline_method().equals("-")){
			online_date_end = "";
			online_hour_end = "";
		}
		String online_end_date = online_date_end;
		String online_end_time = online_hour_end;
		
		odto.setOnline_start_date(online_start_date);
		odto.setOnline_start_time(online_start_time);
		
		odto.setOnline_end_date(online_end_date);
		odto.setOnline_end_time(online_end_time);
		
		odto.setBuy_method(request.getParameter("buy_method"));
		odto.setDelivery_method(request.getParameter("delivery_method"));
		odto.setOnline_writer(request.getParameter("online_writer"));
		
		OnlineDAO odao = new OnlineDAO();
		odao.updateOnlineinfo(odto);
		
		// 페이지이동
		forward.setPath("./SneakerDetail.go?model_stylecode="+odto.getModel_stylecode()+"&num="+odto.getModel_num());
		forward.setRedirect(true);
		return forward;
	}
	
}
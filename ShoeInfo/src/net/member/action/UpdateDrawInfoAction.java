package net.member.action;

import java.sql.Timestamp;

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
		String user = (String) session.getAttribute("email");
		ActionForward forward = new ActionForward();
		if(user == null){
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		//넘어온 값 저장하기
		OnlineDTO odto = new OnlineDTO();
		odto.setOnline_num(Integer.parseInt(request.getParameter("online_num")));
		odto.setModel_num(Integer.parseInt(request.getParameter("model_num")));
		odto.setModel_stylecode(request.getParameter("model_stylecode"));
		odto.setCountry_region(request.getParameter("country_region"));
		odto.setCountry_name(request.getParameter("country_name"));
		odto.setBrand_id(request.getParameter("brand_id"));
		
		String online_link = request.getParameter("online_link");
		//만약 온라인 링크 안에 < , >가 포함되어있으면 replace하기
		if(online_link.contains("<") || online_link.contains(">")){
			online_link = online_link.replaceAll("<", "&lt;").replaceAll(">", "&gt;").trim();
		}
		
		odto.setOnline_link(online_link);
		
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
		
		String delivery_method = request.getParameter("delivery_method");
		//만약 배송방식 안에 < , >가 포함되어있으면 replace하기
		if(delivery_method.contains("<") || delivery_method.contains(">")){
			delivery_method = delivery_method.replaceAll("<", "&lt;").replaceAll(">", "&gt;").trim();
		}
		
		odto.setDelivery_method(delivery_method);
		
		odto.setOnline_writer(request.getParameter("online_writer"));
		odto.setReg_date(new Timestamp(System.currentTimeMillis()));
		
		OnlineDAO odao = new OnlineDAO();
		odao.updateOnlineinfo(odto);
		
		// 페이지이동
		forward.setPath("./SneakerDetail.go?model_stylecode="+odto.getModel_stylecode()+"&num="+odto.getModel_num());
		forward.setRedirect(true);
		return forward;
	}
	
}
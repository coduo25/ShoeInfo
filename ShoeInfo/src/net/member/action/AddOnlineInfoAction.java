package net.member.action;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.brand.db.BrandDAO;
import net.country.db.CountryDAO;
import net.online.db.OnlineDAO;
import net.online.db.OnlineDTO;

public class AddOnlineInfoAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");

		//로그인 정보 가져오기
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("email");
		ActionForward forward = new ActionForward();
		if(user == null || user.length() == 0){
			forward.setPath("./Main.bo");
			forward.setRedirect(true);
			return forward;
		}
		
		//넘어온 정보들 값 
		int model_num = Integer.parseInt(request.getParameter("model_num"));
		String model_stylecode = request.getParameter("model_stylecode");
		String country_name = request.getParameter("country_name");
		String brand_name = request.getParameter("brand_name");
		
		String online_link = request.getParameter("online_link");
		//만약 온라인 링크 안에 < , >가 포함되어있으면 replace하기
		if(online_link.contains("<") || online_link.contains(">")){
			online_link = online_link.replaceAll("<", "&lt;").replaceAll(">", "&gt;").trim();
		}
		
		String online_method = request.getParameter("online_method");
		
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
		if(online_method.equals("선착")){
			online_date_end = "";
			online_hour_end = "";
		}
		
		String online_end_date = online_date_end;
		String online_end_time = online_hour_end;
		
		String buy_method = request.getParameter("buy_method");
		String delivery_method = request.getParameter("delivery_method");
		//만약 배송방식 안에 < , >가 포함되어있으면 replace하기
		if(delivery_method.contains("<") || delivery_method.contains(">")){
			delivery_method = delivery_method.replaceAll("<", "&lt;").replaceAll(">", "&gt;").trim();
		}

		String online_writer = request.getParameter("online_writer");
		
		String winner_time = request.getParameter("winner_time");
		if(winner_time.equals("") || winner_time == null){
			winner_time = "-";
		}
		
		//country_region 값 찾아오기
		CountryDAO cdao = new CountryDAO();
		String country_region = cdao.getCountry_region(country_name);
		
		//brand_id 값 저장하기
		BrandDAO bdao = new BrandDAO();
		String brand_id = bdao.searchBrand_id(country_name, brand_name);
		
		//넘어온 값 DrawDTO 객체에 담기
		OnlineDTO odto = new OnlineDTO();
		
		odto.setModel_num(model_num);
		odto.setModel_stylecode(model_stylecode);
		odto.setCountry_region(country_region);
		odto.setCountry_name(country_name);
		odto.setBrand_id(brand_id);
		odto.setOnline_link(online_link);
		odto.setOnline_start_date(online_start_date);
		odto.setOnline_start_time(online_start_time);
		odto.setOnline_end_date(online_end_date);
		odto.setOnline_end_time(online_end_time);
		odto.setOnline_method(online_method);
		odto.setBuy_method(buy_method);
		odto.setDelivery_method(delivery_method);
		odto.setOnline_writer(online_writer);
		odto.setReg_date(new Timestamp(System.currentTimeMillis()));
		odto.setWinner_time(winner_time);
		
		OnlineDAO odao = new OnlineDAO();
		int check = odao.insertOnlineInfo(odto);
		
		if(check == 0){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('이미 존재하는 발매정보입니다.');");
			out.print("location.href=history.back()");
			out.print("</script>");
			out.close();
			return null;
		}
		
		//페이지이동
		forward.setPath("./SneakerDetail.go?model_stylecode="+odto.getModel_stylecode()+"&num="+odto.getModel_num());
		forward.setRedirect(true);
		return forward;
	}
	
}

package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.brand.db.BrandDAO;
import net.country.db.CountryDAO;
import net.online.db.OnlineDAO;
import net.online.db.OnlineDTO;

public class AddOnlineInfoAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");

		ActionForward forward = new ActionForward();
		
		//넘어온 정보들 값 
		String model_stylecode = request.getParameter("model_stylecode");
		String country_name = request.getParameter("country_name");
		String brand_name = request.getParameter("brand_name");
		String online_link = request.getParameter("online_link");
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

		String online_writer = request.getParameter("online_writer");
		//@ 앞부분을 추출
		String writer = online_writer.substring(0, online_writer.indexOf("@"));
		
		//country_region 값 찾아오기
		CountryDAO cdao = new CountryDAO();
		String country_region = cdao.getCountry_region(country_name);
		
		//brand_id 값 저장하기
		BrandDAO bdao = new BrandDAO();
		String brand_id = bdao.searchBrand_id(country_name, brand_name);
		
		//넘어온 값 DrawDTO 객체에 담기
		OnlineDTO odto = new OnlineDTO();
		
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
		odto.setOnline_writer(writer);
		
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
		forward.setPath("./SneakerDetail.go?model_stylecode="+odto.getModel_stylecode());
		forward.setRedirect(true);
		return forward;
	}
	
}
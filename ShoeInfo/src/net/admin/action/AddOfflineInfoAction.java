package net.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.brand.db.BrandDAO;
import net.country.db.CountryDAO;
import net.offline.db.OfflineDAO;
import net.offline.db.OfflineDTO;

public class AddOfflineInfoAction implements Action{

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
		
		//넘어온 정보들 값 
		String model_stylecode = request.getParameter("model_stylecode");
		String country_name = request.getParameter("country_name");
		String brand_name = request.getParameter("brand_name");
		String offline_location = request.getParameter("offline_location");
		String offline_link = request.getParameter("offline_link");
		
		String offline_date_start = request.getParameter("offline_date_start");
		String offline_hour_start = request.getParameter("offline_hour_start");
		String offline_start_time = offline_date_start + " " + offline_hour_start;

		String offline_date_end = request.getParameter("offline_date_end");
		String offline_hour_end = request.getParameter("offline_hour_end");
		String offline_end_time = offline_date_end + " " + offline_hour_end;

		String offline_method = request.getParameter("offline_method");
		String description = request.getParameter("description");
		
		//brand_id 값 저장하기
		BrandDAO bdao = new BrandDAO();
		String brand_id = bdao.searchBrand_id(country_name, brand_name);
		
		//넘어온 값 DrawDTO 객체에 담기
		OfflineDTO odto = new OfflineDTO();
		
		odto.setModel_stylecode(model_stylecode);
		odto.setCountry_name(country_name);
		odto.setBrand_id(brand_id);
		odto.setOffline_location(offline_location);
		odto.setOffline_link(offline_link);
		odto.setOffline_start_time(offline_start_time);
		odto.setOffline_end_time(offline_end_time);
		odto.setOffline_method(offline_method);
		odto.setDescription(description);
		
		OfflineDAO odao = new OfflineDAO();
		odao.insertOfflineInfo(odto);

		//페이지이동
		forward.setPath("./Main.ad");
		forward.setRedirect(true);
		return forward;
	}
}
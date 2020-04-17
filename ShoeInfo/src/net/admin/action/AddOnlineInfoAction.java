package net.admin.action;

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
		
		//�α��� ���� ��������
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("id");
		ActionForward forward = new ActionForward();
		if(!user.equals("admin")){
			forward.setPath("./Main.bo");
			forward.setRedirect(true);
			return forward;
		}
		
		//�Ѿ�� ������ �� 
		String model_stylecode = request.getParameter("model_stylecode");
		String country_name = request.getParameter("country_name");
		String brand_name = request.getParameter("brand_name");
		String online_link = request.getParameter("online_link");
		
		String online_date_start = request.getParameter("online_date_start");
		String online_hour_start = request.getParameter("online_hour_start");
		String online_start_time = online_date_start + " " + online_hour_start;

		String online_date_end = request.getParameter("online_date_end");
		String online_hour_end = request.getParameter("online_hour_end");
		String online_end_time = online_date_end + " " + online_hour_end;

		String online_method = request.getParameter("online_method");
		String buy_method = request.getParameter("buy_method");
		String delivery_method = request.getParameter("delivery_method");
		
		String description = request.getParameter("description");
		
		//country_region �� ã�ƿ���
		CountryDAO cdao = new CountryDAO();
		String country_region = cdao.getCountry_region(country_name);
		
		//brand_id �� �����ϱ�
		BrandDAO bdao = new BrandDAO();
		String brand_id = bdao.searchBrand_id(country_name, brand_name);
		
		//�Ѿ�� �� DrawDTO ��ü�� ���
		OnlineDTO odto = new OnlineDTO();
		
		odto.setModel_stylecode(model_stylecode);
		odto.setCountry_region(country_region);
		odto.setCountry_name(country_name);
		odto.setBrand_id(brand_id);
		odto.setOnline_link(online_link);
		odto.setOnline_start_time(online_start_time);
		odto.setOnline_end_time(online_end_time);
		odto.setOnline_method(online_method);
		odto.setBuy_method(buy_method);
		odto.setDelivery_method(delivery_method);
		odto.setDescription(description);
		
		OnlineDAO odao = new OnlineDAO();
		odao.insertOnlineInfo(odto);

		//�������̵�
		forward.setPath("./Main.ad");
		forward.setRedirect(true);
		return forward;
	}
}

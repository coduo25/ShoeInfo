package net.admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.brand.db.BrandDAO;
import net.brand.db.BrandDTO;
import net.country.db.CountryDAO;
import net.country.db.CountryDTO;

public class UpdateBrandInfo implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("email");
		String usr_position = (String) session.getAttribute("usr_position");
		ActionForward forward = new ActionForward();
		if(user == null || !usr_position.equals("admin")){
			forward.setPath("./SneakerList.go");
			forward.setRedirect(true);
			return forward;
		}
		
		String brand_id = (String) request.getParameter("brand_id");
		BrandDAO bdao = new BrandDAO();
		BrandDTO brandInfo = bdao.getBrandDetail(brand_id);
		
		//CountryDB로부터 모든 국가 리스트 가져오는 함수
		CountryDAO cdao = new CountryDAO();
		List<CountryDTO> countryList_all = (List<CountryDTO>) cdao.countryList_all();
		
		request.setAttribute("brandInfo", brandInfo);
		request.setAttribute("countryList_all", countryList_all);		
		
		forward.setPath("./admin/adminUpdateBrandInfo.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}

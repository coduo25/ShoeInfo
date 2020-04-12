package net.admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.brand.db.BrandDAO;
import net.country.db.CountryDAO;
import net.country.db.CountryDTO;

public class searchBrandAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//로그인 정보 가져오기
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("id");
		ActionForward forward = new ActionForward();
		if(!user.equals("admin")){
			forward.setPath("./Main.bo");
			forward.setRedirect(true);
			return forward;
		}
		
		// ---------------------------------------------------------------------------------------------------------------------------
		// DB객체 만들기
		
		//모든 국가 리스트 가져오는 함수
		CountryDAO cdao = new CountryDAO();
		List<CountryDTO> countryAllList = (List<CountryDTO>) cdao.getCountryAllList();
		
		//브랜드별 국가 리스트 가져오는 함수
		BrandDAO bdao = new BrandDAO();
		List countryList = bdao.searchCountry();
		
		request.setAttribute("countryAllList", countryAllList);
		request.setAttribute("countryList", countryList);
		
		// ---------------------------------------------------------------------------------------------------------------------------
		// 3. 페이지이동
		forward.setPath("admin/adminAddReleaseInfo.jsp");
		forward.setRedirect(false);
		return forward;
	}
}

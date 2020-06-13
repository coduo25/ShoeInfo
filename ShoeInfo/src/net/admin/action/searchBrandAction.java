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
		String user = (String) session.getAttribute("email");
		String usr_position = (String) session.getAttribute("usr_position");
		ActionForward forward = new ActionForward();
		if(!usr_position.equals("admin")){
			forward.setPath("./Main.bo");
			forward.setRedirect(true);
			return forward;
		}
		
		// -------------------------------------------------
		// DB객체 만들기
		
		String model_stylecode = (String) request.getParameter("model_stylecode");
		if(model_stylecode == null){
			model_stylecode = "";
		}
		
		//CountryDB로부터 모든 국가 리스트 가져오는 함수
		CountryDAO cdao = new CountryDAO();
		List<CountryDTO> countryList_all = (List<CountryDTO>) cdao.countryList_all();
		
		System.out.println("여기까지 온다");
		
		//BrandDB로부터 브랜드별 국가 리스트 가져오는 함수
		BrandDAO bdao = new BrandDAO();
		List countryList_bybrand = bdao.searchCountryList_bybrand();
		
		request.setAttribute("countryList_all", countryList_all);
		request.setAttribute("countryList_bybrand", countryList_bybrand);
		
		// ------------------------------------------------
		// 3. 페이지이동
		forward.setPath("admin/adminAddReleaseInfo.jsp?model_stylecode="+model_stylecode);
		forward.setRedirect(false);
		return forward;
	}
}
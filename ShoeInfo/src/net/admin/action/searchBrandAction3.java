package net.admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.country.db.CountryDAO;
import net.country.db.CountryDTO;

public class searchBrandAction3 implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		//로그인 정보 가져오기
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("email");
		String usr_position = (String) session.getAttribute("usr_position");
		ActionForward forward = new ActionForward();
		if(user == null || !usr_position.equals("admin")){
			forward.setPath("./SneakerList.go");
			forward.setRedirect(true);
			return forward;
		}
		
		//넘어온 값
		int req_num = Integer.parseInt(request.getParameter("req_num"));
		
		request.setAttribute("req_num", req_num);
		
		//CountryDB로부터 모든 국가 리스트 가져오는 함수
		CountryDAO cdao = new CountryDAO();
		List<CountryDTO> countryList_all = (List<CountryDTO>) cdao.countryList_all();
	
		request.setAttribute("countryList_all", countryList_all);
		
		forward.setPath("./admin/adminAddReqBrand.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}

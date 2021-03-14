package net.sneaker.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Vector;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.brand.db.BrandDAO;
import net.brand.db.BrandDTO;
import net.member.db.MemberDAO;
import net.online.db.OnlineDAO;
import net.online.db.OnlineDTO;
import net.sneaker.db.SneakerDAO;
import net.sneaker.db.SneakerDTO;

public class SneakerDetailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//아이디값 저장
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("email");
		
		//넘어온 값 저장(model_stylecode)
		String model_stylecode = (String) request.getParameter("model_stylecode");
		int num = Integer.parseInt(request.getParameter("num")); 
				
		MemberDAO mdao = new MemberDAO();
		SneakerDAO sdao = new SneakerDAO();
		BrandDAO bdao = new BrandDAO();
		
		ArrayList<String> userDrawBrandList = mdao.searchDrawBrandInfo(user, model_stylecode);

		request.setAttribute("userDrawBrandList", userDrawBrandList);

		//저장된 쿠키 불러오기, https://drsggg.tistory.com/216
		Cookie[] cookieFromRequest = request.getCookies();
		if(cookieFromRequest == null){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("location.reload()");
			out.print("</script>");
			out.close();
			return null;
		}
		
		String cookieValue = null;
		for(int i=0; i<cookieFromRequest.length; i++){
			cookieValue = cookieFromRequest[0].getValue();
		}
		
		//쿠기 세션 입력
		if(session.getAttribute(num+":cookie") == null){
			session.setAttribute(num+":cookie", num + ":" + cookieValue);
		}else {
			session.setAttribute(num+":cookie ex", session.getAttribute(num+":cookie"));
			if(!session.getAttribute(num+":cookie").equals(num+":"+ cookieValue)){
				session.setAttribute(num+":cookie", num + ":" + cookieValue);
			}
		}
		
		if(!session.getAttribute(num+":cookie").equals(session.getAttribute(num+":cookie ex"))){
			//정보 가져오기 전에 조회수 1 올리기
			sdao.addViews(num, model_stylecode);
		}
		
		//현재 발매 중인 신발들 중에 진행중인 브랜드 갯수 가져오는 리스트
		int countReleasingBrand = bdao.getReleasingBrandNum(model_stylecode);
		request.setAttribute("countReleasingBrand", countReleasingBrand);
		
		SneakerDTO sdto = sdao.getSneakerDetail(num, model_stylecode);
		request.setAttribute("sneakerDetail", sdto);
		
		OnlineDAO odao = new OnlineDAO();
		
		//대한민국
		Vector vec_on_kr = odao.getOnlineInfo_kr(model_stylecode, num);
		ArrayList<OnlineDTO> onlineList_kr = (ArrayList<OnlineDTO>) vec_on_kr.get(0);
		ArrayList<BrandDTO> brandList_kr = (ArrayList<BrandDTO>) vec_on_kr.get(1);
		
		//아시아
		Vector vec_on_asia = odao.getOnlineInfo_asia(model_stylecode, num);
		ArrayList<OnlineDTO> onlineList_asia = (ArrayList<OnlineDTO>) vec_on_asia.get(0);
		ArrayList<BrandDTO> brandList_asia = (ArrayList<BrandDTO>) vec_on_asia.get(1);
		
		//아메리카
		String country_region_us = "아메리카";
		Vector vec_on_america = odao.getOnlineInfo(model_stylecode, country_region_us, num);
		ArrayList<OnlineDTO> onlineList_america = (ArrayList<OnlineDTO>) vec_on_america.get(0);
		ArrayList<BrandDTO> brandList_america = (ArrayList<BrandDTO>) vec_on_america.get(1);
		
		//유럽
		String country_region_eu = "유럽";
		Vector vec_on_europe = odao.getOnlineInfo(model_stylecode, country_region_eu, num);
		ArrayList<OnlineDTO> onlineList_europe = (ArrayList<OnlineDTO>) vec_on_europe.get(0);
		ArrayList<BrandDTO> brandList_europe = (ArrayList<BrandDTO>) vec_on_europe.get(1);
		
		//기타지역
		String country_region_etc = "기타";
		Vector vec_on_etc = odao.getOnlineInfo(model_stylecode, country_region_etc, num);
		ArrayList<OnlineDTO> onlineList_etc = (ArrayList<OnlineDTO>) vec_on_etc.get(0);
		ArrayList<BrandDTO> brandList_etc = (ArrayList<BrandDTO>) vec_on_etc.get(1);
		
		request.setAttribute("onlineList_kr", onlineList_kr);
		request.setAttribute("brandList_kr", brandList_kr);
		
		request.setAttribute("onlineList_asia", onlineList_asia);
		request.setAttribute("brandList_asia", brandList_asia);
		
		request.setAttribute("onlineList_america", onlineList_america);
		request.setAttribute("brandList_america", brandList_america);
		
		request.setAttribute("onlineList_europe", onlineList_europe);
		request.setAttribute("brandList_europe", brandList_europe);
		
		request.setAttribute("onlineList_etc", onlineList_etc);
		request.setAttribute("brandList_etc", brandList_etc);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./board/sneakerDetail.jsp");
		forward.setRedirect(false);
		return forward;
	}
}
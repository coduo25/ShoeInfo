package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.brand.db.BrandDAO;
import net.brand.db.BrandDTO;
import net.online.db.OnlineDAO;
import net.online.db.OnlineDTO;
import net.sneaker.db.SneakerDAO;
import net.sneaker.db.SneakerDTO;

public class UpdateDrawInfo implements Action{

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
		
		//넘어온 정보 가져오기(model_stylecode, brand_id)
		int model_num = Integer.parseInt(request.getParameter("num"));
		String model_stylecode = (String) request.getParameter("model_stylecode");
		String brand_id = (String) request.getParameter("brand_id");
		
		OnlineDAO odao = new OnlineDAO();
		OnlineDTO onlineDrawInfo = (OnlineDTO) odao.getOneOnlineInfo(model_stylecode, brand_id);
		
		request.setAttribute("onlineDrawInfo", onlineDrawInfo);
		
		//신발 모델 정보 가져오기
		SneakerDAO sdao = new SneakerDAO();
		SneakerDTO sneakerDetail = sdao.getSneakerDetail(model_num, model_stylecode);
		
		request.setAttribute("sneakerDetail", sneakerDetail);
		
		//선택된 브랜드 정보 가져오기
		BrandDAO bdao = new BrandDAO();
		BrandDTO brandDetail = bdao.getBrandDetail(brand_id);
		
		request.setAttribute("brandDetail", brandDetail);
		
		//페이지이동
		forward.setPath("./member/memberUpdateReleaseInfo.jsp");
		forward.setRedirect(false);
		return forward;
		
	}
	
}

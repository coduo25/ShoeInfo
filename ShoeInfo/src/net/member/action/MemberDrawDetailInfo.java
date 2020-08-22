package net.member.action;

import java.util.ArrayList;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.brand.db.BrandDTO;
import net.member.db.MemberDAO;
import net.member.db.MemberDrawDTO;
import net.sneaker.db.SneakerDAO;
import net.sneaker.db.SneakerDTO;

public class MemberDrawDetailInfo implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//로그인 정보 가져오기
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("email");
		ActionForward forward = new ActionForward();
		if(user == null){
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		//넘어온 값 받기
		String model_stylecode = (String) request.getParameter("model_stylecode");
		
		/******************************************************
		 * 신발 기본 정보 리스트 만들기
		 ******************************************************/
		SneakerDAO sdao = new SneakerDAO();
		SneakerDTO sdto = sdao.getSneakerDetail(model_stylecode);
		request.setAttribute("sneakerDetail", sdto);
		
		/******************************************************
		 * 응모한 신발 브랜드 정보 가져오기
		 ******************************************************/
		MemberDAO mdao = new MemberDAO();
		
		//국내 응모 한 곳
		Vector vec_draw_kr = mdao.getDrawInfo(model_stylecode, user, "대한민국");
		ArrayList<MemberDrawDTO> drawInfoList_kr = (ArrayList<MemberDrawDTO>) vec_draw_kr.get(0);
		ArrayList<BrandDTO> brandList_kr = (ArrayList<BrandDTO>) vec_draw_kr.get(1);
		ArrayList<BrandDTO> onlineinfoList_kr = (ArrayList<BrandDTO>) vec_draw_kr.get(2);
		
		request.setAttribute("drawInfoList_kr", drawInfoList_kr);
		request.setAttribute("brandList_kr", brandList_kr);
		request.setAttribute("onlineinfoList_kr", onlineinfoList_kr);
		
		//해외 응모 한곳
		Vector vec_draw_etc = mdao.getDrawInfo(model_stylecode, user, "해외");
		ArrayList<MemberDrawDTO> drawInfoList_etc = (ArrayList<MemberDrawDTO>) vec_draw_etc.get(0);
		ArrayList<BrandDTO> brandList_etc = (ArrayList<BrandDTO>) vec_draw_etc.get(1);
		ArrayList<BrandDTO> onlineinfoList_etc = (ArrayList<BrandDTO>) vec_draw_etc.get(2);
		
		request.setAttribute("drawInfoList_etc", drawInfoList_etc);
		request.setAttribute("brandList_etc", brandList_etc);
		request.setAttribute("onlineinfoList_etc", onlineinfoList_etc);
		
		forward.setPath("./member/memberDrawDetailList.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}

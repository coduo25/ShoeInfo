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
		String user = (String) session.getAttribute("id");
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
		//request에 저장
		request.setAttribute("sneakerDetail", sdto);
		
		/******************************************************
		 * 응모한 신발 브랜드 정보 가져오기
		 ******************************************************/
		MemberDAO mdao = new MemberDAO();
		Vector vec_draw_kr = mdao.getDrawInfo_kr(model_stylecode, user);
		
		ArrayList<MemberDrawDTO> drawInfoList_kr = (ArrayList<MemberDrawDTO>) vec_draw_kr.get(0);
		ArrayList<BrandDTO> brandList_kr = (ArrayList<BrandDTO>) vec_draw_kr.get(1);
		
		request.setAttribute("drawInfoList_kr", drawInfoList_kr);
		request.setAttribute("brandList_kr", brandList_kr);
		
		forward.setPath("./member/memberDrawDetailList.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}

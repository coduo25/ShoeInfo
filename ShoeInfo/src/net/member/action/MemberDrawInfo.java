package net.member.action;

import java.util.ArrayList;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;
import net.member.db.MemberDrawDTO;
import net.sneaker.db.SneakerDTO;

public class MemberDrawInfo implements Action{

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
		
		//디비가서 내가 응모한 브랜드 정보 가져오기
		MemberDAO mdao = new MemberDAO();
		Vector vec = (Vector) mdao.searchUserDrawStylecode_kr(user);
		
		ArrayList<MemberDrawDTO> userDrawStylecodeList = (ArrayList<MemberDrawDTO>) vec.get(0);
		ArrayList<SneakerDTO> sneakerInfoList = (ArrayList<SneakerDTO>) vec.get(1);
		
		request.setAttribute("userDrawStylecodeList", userDrawStylecodeList);
		request.setAttribute("sneakerInfoList", sneakerInfoList);
		
		//페이지이동
		forward.setPath("./member/memberDrawList.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}

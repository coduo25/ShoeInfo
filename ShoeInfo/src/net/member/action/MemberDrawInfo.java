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
		String user = (String) session.getAttribute("email");
		ActionForward forward = new ActionForward();
		if(user == null || user.length() == 0){
			forward.setPath("./Main.bo");
			forward.setRedirect(true);
			return forward;
		}
		
		//디비가서 내가 응모한 브랜드 정보 가져오기
		MemberDAO mdao = new MemberDAO();
		
		Vector vec1 = (Vector) mdao.searchUserDrawStylecode_kr(user,"2020-01");
		Vector vec2 = (Vector) mdao.searchUserDrawStylecode_kr(user,"2020-02");
		Vector vec3 = (Vector) mdao.searchUserDrawStylecode_kr(user,"2020-03");
		Vector vec4 = (Vector) mdao.searchUserDrawStylecode_kr(user,"2020-04");
		Vector vec5 = (Vector) mdao.searchUserDrawStylecode_kr(user,"2020-05");
		Vector vec6 = (Vector) mdao.searchUserDrawStylecode_kr(user,"2020-06");
		Vector vec7 = (Vector) mdao.searchUserDrawStylecode_kr(user,"2020-07");
		Vector vec8 = (Vector) mdao.searchUserDrawStylecode_kr(user,"2020-08");
		Vector vec9 = (Vector) mdao.searchUserDrawStylecode_kr(user,"2020-09");
		Vector vec10 = (Vector) mdao.searchUserDrawStylecode_kr(user,"2020-10");
		Vector vec11 = (Vector) mdao.searchUserDrawStylecode_kr(user,"2020-11");
		Vector vec12 = (Vector) mdao.searchUserDrawStylecode_kr(user,"2020-12");
		
		ArrayList<MemberDrawDTO> userDrawStylecodeList1 = (ArrayList<MemberDrawDTO>) vec1.get(0);
		ArrayList<SneakerDTO> sneakerInfoList1 = (ArrayList<SneakerDTO>) vec1.get(1);
		
		ArrayList<MemberDrawDTO> userDrawStylecodeList2 = (ArrayList<MemberDrawDTO>) vec2.get(0);
		ArrayList<SneakerDTO> sneakerInfoList2 = (ArrayList<SneakerDTO>) vec2.get(1);
		
		ArrayList<MemberDrawDTO> userDrawStylecodeList3 = (ArrayList<MemberDrawDTO>) vec3.get(0);
		ArrayList<SneakerDTO> sneakerInfoList3 = (ArrayList<SneakerDTO>) vec3.get(1);
		
		ArrayList<MemberDrawDTO> userDrawStylecodeList4 = (ArrayList<MemberDrawDTO>) vec4.get(0);
		ArrayList<SneakerDTO> sneakerInfoList4 = (ArrayList<SneakerDTO>) vec4.get(1);
		
		ArrayList<MemberDrawDTO> userDrawStylecodeList5 = (ArrayList<MemberDrawDTO>) vec5.get(0);
		ArrayList<SneakerDTO> sneakerInfoList5 = (ArrayList<SneakerDTO>) vec5.get(1);
		
		ArrayList<MemberDrawDTO> userDrawStylecodeList6 = (ArrayList<MemberDrawDTO>) vec6.get(0);
		ArrayList<SneakerDTO> sneakerInfoList6 = (ArrayList<SneakerDTO>) vec6.get(1);
		
		ArrayList<MemberDrawDTO> userDrawStylecodeList7 = (ArrayList<MemberDrawDTO>) vec7.get(0);
		ArrayList<SneakerDTO> sneakerInfoList7 = (ArrayList<SneakerDTO>) vec7.get(1);
		
		ArrayList<MemberDrawDTO> userDrawStylecodeList8 = (ArrayList<MemberDrawDTO>) vec8.get(0);
		ArrayList<SneakerDTO> sneakerInfoList8 = (ArrayList<SneakerDTO>) vec8.get(1);
		
		ArrayList<MemberDrawDTO> userDrawStylecodeList9 = (ArrayList<MemberDrawDTO>) vec9.get(0);
		ArrayList<SneakerDTO> sneakerInfoList9 = (ArrayList<SneakerDTO>) vec9.get(1);
		
		ArrayList<MemberDrawDTO> userDrawStylecodeList10 = (ArrayList<MemberDrawDTO>) vec10.get(0);
		ArrayList<SneakerDTO> sneakerInfoList10 = (ArrayList<SneakerDTO>) vec10.get(1);
		
		ArrayList<MemberDrawDTO> userDrawStylecodeList11 = (ArrayList<MemberDrawDTO>) vec11.get(0);
		ArrayList<SneakerDTO> sneakerInfoList11 = (ArrayList<SneakerDTO>) vec11.get(1);
		
		ArrayList<MemberDrawDTO> userDrawStylecodeList12 = (ArrayList<MemberDrawDTO>) vec12.get(0);
		ArrayList<SneakerDTO> sneakerInfoList12 = (ArrayList<SneakerDTO>) vec12.get(1);
		
		request.setAttribute("userDrawStylecodeList1", userDrawStylecodeList1);
		request.setAttribute("sneakerInfoList1", sneakerInfoList1);
		
		request.setAttribute("userDrawStylecodeList2", userDrawStylecodeList2);
		request.setAttribute("sneakerInfoList2", sneakerInfoList2);
		
		request.setAttribute("userDrawStylecodeList3", userDrawStylecodeList3);
		request.setAttribute("sneakerInfoList3", sneakerInfoList3);
		
		request.setAttribute("userDrawStylecodeList4", userDrawStylecodeList4);
		request.setAttribute("sneakerInfoList4", sneakerInfoList4);
		
		request.setAttribute("userDrawStylecodeList5", userDrawStylecodeList5);
		request.setAttribute("sneakerInfoList5", sneakerInfoList5);
		
		request.setAttribute("userDrawStylecodeList6", userDrawStylecodeList6);
		request.setAttribute("sneakerInfoList6", sneakerInfoList6);
		
		request.setAttribute("userDrawStylecodeList7", userDrawStylecodeList7);
		request.setAttribute("sneakerInfoList7", sneakerInfoList7);
		
		request.setAttribute("userDrawStylecodeList8", userDrawStylecodeList8);
		request.setAttribute("sneakerInfoList8", sneakerInfoList8);
		
		request.setAttribute("userDrawStylecodeList9", userDrawStylecodeList9);
		request.setAttribute("sneakerInfoList9", sneakerInfoList9);
		
		request.setAttribute("userDrawStylecodeList10", userDrawStylecodeList10);
		request.setAttribute("sneakerInfoList10", sneakerInfoList10);
		
		request.setAttribute("userDrawStylecodeList11", userDrawStylecodeList11);
		request.setAttribute("sneakerInfoList11", sneakerInfoList11);
		
		request.setAttribute("userDrawStylecodeList12", userDrawStylecodeList12);
		request.setAttribute("sneakerInfoList12", sneakerInfoList12);
		
		//페이지이동
		forward.setPath("./member/memberDrawList.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}

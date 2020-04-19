package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;
import net.member.db.MemberDrawDTO;

public class addUserDrawInfoAction implements Action{

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
		
		//넘어온값 받기(model_stylecode, brand_id)
		String model_stylecode = request.getParameter("model_stylecode");
		String brand_id = request.getParameter("brand_id");
		
		System.out.println(model_stylecode + ", " + brand_id);
			
		MemberDrawDTO mddto = new MemberDrawDTO();
		
		mddto.setBrand_id(brand_id);
		mddto.setMember_id(user);
		mddto.setModel_stylecode(model_stylecode);
		
		MemberDAO mdao = new MemberDAO();
		mdao.insertUserDrawInfo(mddto);
		
		//페이지이동
		forward.setPath("./SneakerDetail.go?model_stylecode="+model_stylecode);
		forward.setRedirect(true);
		return forward;
	}
}

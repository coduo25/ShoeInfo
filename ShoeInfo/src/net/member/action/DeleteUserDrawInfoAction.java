package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;
import net.member.db.MemberDrawDTO;

public class DeleteUserDrawInfoAction implements Action{

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
		
		//넘어온값 받기(model_stylecode, brand_id)
		int model_num = Integer.parseInt(request.getParameter("model_num"));
		String model_stylecode = request.getParameter("model_stylecode");
		String brand_id = request.getParameter("brand_id");
		String country_name = request.getParameter("country_name");
			
		MemberDrawDTO mddto = new MemberDrawDTO();
		
		mddto.setModel_num(model_num);
		mddto.setBrand_id(brand_id);
		mddto.setMember_email(user);
		mddto.setModel_stylecode(model_stylecode);
		mddto.setCountry_name(country_name);
		
		MemberDAO mdao = new MemberDAO();
		mdao.deleteUserDrawInfo(mddto);
		
		//페이지이동
		forward.setPath("./SneakerDetail.go?model_stylecode="+model_stylecode+"&num="+model_num);
		forward.setRedirect(true);
		return forward;
	}
}

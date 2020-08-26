package net.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.brand.db.BrandDAO;
import net.member.db.MemberDAO;
import net.sneaker.db.SneakerDAO;

public class GetAllInfoAction implements Action{

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
		
		MemberDAO mdao = new MemberDAO();
		int memberNum = mdao.countMember();
		
		BrandDAO bdao = new BrandDAO();
		int brandNum = bdao.countBrand();
		
		SneakerDAO sdao = new SneakerDAO();
		int sneakerNum = sdao.countSneaker();
		
		int memberDrawNum = mdao.countTotalDraw();
		
		int memberReqBrandNum = bdao.countMemberBrandReq();
		
		//전체 회원수, 브랜드, 신발, 응모한 수
		request.setAttribute("memberNum", memberNum);
		request.setAttribute("brandNum", brandNum);
		request.setAttribute("sneakerNum", sneakerNum);
		request.setAttribute("memberDrawNum", memberDrawNum);
		request.setAttribute("memberReqBrandNum", memberReqBrandNum);
		
		forward.setPath("./admin/adminMain.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}

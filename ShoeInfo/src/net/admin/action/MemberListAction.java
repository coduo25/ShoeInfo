package net.admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.board.action.Criteria;
import net.board.action.PageMaker;
import net.member.db.MemberDAO;
import net.member.db.MemberDTO;

public class MemberListAction implements Action{

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
		
		//total 게시판 글 수 
		int total = 0;
		
		// ------- 페이징 처리 ---------
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		
		int pageSize = 15;
		
		Criteria cri = new Criteria();
		
		cri.setPage(currentPage);
		cri.setPerpageNum(pageSize);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		MemberDAO mdao = new MemberDAO();
		
		List<MemberDTO> admin_memberList = mdao.getAllMemberList(cri);
		
		total = mdao.countMember();
		pageMaker.setTotalCount(total);
	
		request.setAttribute("admin_memberList", admin_memberList);
		request.setAttribute("cri", cri);
		request.setAttribute("pageMaker", pageMaker);
		request.setAttribute("pageNum", currentPage);
		
		forward.setPath("./admin/admin_memberList.jsp");
		forward.setRedirect(false);
		return forward;
	}

}

package net.sneaker.action;

import java.util.ArrayList;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sneaker.db.SneakerDAO;
import net.sneaker.db.SneakerDTO;

public class AllReleasedListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//아이디값 저장
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("email");
		
		SneakerDAO sdao = new SneakerDAO();
		
		//발매완료 신발들
		Vector vec_totalReleaseList = sdao.getTotalReleaseList("%" + "2021" + "%");
		ArrayList<SneakerDTO> releasedSneakerList = (ArrayList<SneakerDTO>) vec_totalReleaseList.get(2);
		
		request.setAttribute("releasedSneakerList", releasedSneakerList);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./board/allReleasedList.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}

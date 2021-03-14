package net.sneaker.action;

import java.util.ArrayList;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.online.db.OnlineDTO;
import net.sneaker.db.SneakerDAO;
import net.sneaker.db.SneakerDTO;

public class SnkrsKRListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//아이디값 저장
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("email");
		
		SneakerDAO sdao = new SneakerDAO();

		//이번주 snkrs 리스트 가져오는 함수
 		Vector vec_SnkrsWeek = sdao.getSnkrsWeekList();
 		ArrayList<OnlineDTO> onlineList_snkrs = (ArrayList<OnlineDTO>) vec_SnkrsWeek.get(0);
		ArrayList<SneakerDTO> sneakerList_snkrs = (ArrayList<SneakerDTO>) vec_SnkrsWeek.get(1);
 		
		request.setAttribute("onlineList_snkrs", onlineList_snkrs);
		request.setAttribute("sneakerList_snkrs", sneakerList_snkrs);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./board/snkrsKRList.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}

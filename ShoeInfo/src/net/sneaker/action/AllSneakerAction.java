package net.sneaker.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sneaker.db.SneakerDAO;
import net.sneaker.db.SneakerDTO;

public class AllSneakerAction  implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		SneakerDAO sdao = new SneakerDAO();
		
		List<SneakerDTO> allSneakerList = (List<SneakerDTO>) sdao.getAllSneakerList();
		
		request.setAttribute("allSneakerList", allSneakerList);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./board/allSneaker.jsp");
		forward.setRedirect(false);
		return forward;
	}
}

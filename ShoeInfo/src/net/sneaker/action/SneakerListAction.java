package net.sneaker.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sneaker.db.SneakerDAO;
import net.sneaker.db.SneakerDTO;

public class SneakerListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		SneakerDAO sdao = new SneakerDAO();
		
		List<SneakerDTO> sneakerList1 = (List<SneakerDTO>) sdao.getSneakerList("%" + "2020-01" + "%" , "planned");
		List<SneakerDTO> sneakerList2 = (List<SneakerDTO>) sdao.getSneakerList("%" + "2020-02" + "%" , "planned");
		List<SneakerDTO> sneakerList3 = (List<SneakerDTO>) sdao.getSneakerList("%" + "2020-03" + "%" , "planned");
		List<SneakerDTO> sneakerList4 = (List<SneakerDTO>) sdao.getSneakerList("%" + "2020-04" + "%" , "planned");
		List<SneakerDTO> sneakerList5 = (List<SneakerDTO>) sdao.getSneakerList("%" + "2020-05" + "%" , "planned");
		List<SneakerDTO> sneakerList6 = (List<SneakerDTO>) sdao.getSneakerList("%" + "2020-06" + "%" , "planned");
		List<SneakerDTO> sneakerList7 = (List<SneakerDTO>) sdao.getSneakerList("%" + "2020-07" + "%" , "planned");
		List<SneakerDTO> sneakerList8 = (List<SneakerDTO>) sdao.getSneakerList("%" + "2020-08" + "%" , "planned");
		List<SneakerDTO> sneakerList9 = (List<SneakerDTO>) sdao.getSneakerList("%" + "2020-09" + "%" , "planned");
		List<SneakerDTO> sneakerList10 = (List<SneakerDTO>) sdao.getSneakerList("%" + "2020-10" + "%" , "planned");
		List<SneakerDTO> sneakerList11 = (List<SneakerDTO>) sdao.getSneakerList("%" + "2020-11" + "%" , "planned");
		List<SneakerDTO> sneakerList12 = (List<SneakerDTO>) sdao.getSneakerList("%" + "2020-12" + "%" , "planned");

		request.setAttribute("sneakerList1", sneakerList1);
		request.setAttribute("sneakerList2", sneakerList2);
		request.setAttribute("sneakerList3", sneakerList3);
		request.setAttribute("sneakerList4", sneakerList4);
		request.setAttribute("sneakerList5", sneakerList5);
		request.setAttribute("sneakerList6", sneakerList6);
		request.setAttribute("sneakerList7", sneakerList7);
		request.setAttribute("sneakerList8", sneakerList8);
		request.setAttribute("sneakerList9", sneakerList9);
		request.setAttribute("sneakerList10", sneakerList10);
		request.setAttribute("sneakerList11", sneakerList11);
		request.setAttribute("sneakerList12", sneakerList12);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./board/main.jsp");
		forward.setRedirect(false);
		return forward;
	}
}
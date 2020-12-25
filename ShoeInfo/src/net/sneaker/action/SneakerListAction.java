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
		
		List<SneakerDTO> sneakerList2020 = (List<SneakerDTO>) sdao.getSneakerList("%" + "2020-99" + "%" , "planned");

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
		
		request.setAttribute("sneakerList2020", sneakerList2020);
		
		List<SneakerDTO> sneakerList21_1 = (List<SneakerDTO>) sdao.getSneakerList("%" + "2021-01" + "%" , "planned");
		List<SneakerDTO> sneakerList21_2 = (List<SneakerDTO>) sdao.getSneakerList("%" + "2021-02" + "%" , "planned");
		List<SneakerDTO> sneakerList21_3 = (List<SneakerDTO>) sdao.getSneakerList("%" + "2021-03" + "%" , "planned");
		List<SneakerDTO> sneakerList21_4 = (List<SneakerDTO>) sdao.getSneakerList("%" + "2021-04" + "%" , "planned");
		List<SneakerDTO> sneakerList21_5 = (List<SneakerDTO>) sdao.getSneakerList("%" + "2021-05" + "%" , "planned");
		List<SneakerDTO> sneakerList21_6 = (List<SneakerDTO>) sdao.getSneakerList("%" + "2021-06" + "%" , "planned");
		List<SneakerDTO> sneakerList21_7 = (List<SneakerDTO>) sdao.getSneakerList("%" + "2021-07" + "%" , "planned");
		List<SneakerDTO> sneakerList21_8 = (List<SneakerDTO>) sdao.getSneakerList("%" + "2021-08" + "%" , "planned");
		List<SneakerDTO> sneakerList21_9 = (List<SneakerDTO>) sdao.getSneakerList("%" + "2021-09" + "%" , "planned");
		List<SneakerDTO> sneakerList21_10 = (List<SneakerDTO>) sdao.getSneakerList("%" + "2021-10" + "%" , "planned");
		List<SneakerDTO> sneakerList21_11 = (List<SneakerDTO>) sdao.getSneakerList("%" + "2021-11" + "%" , "planned");
		List<SneakerDTO> sneakerList21_12 = (List<SneakerDTO>) sdao.getSneakerList("%" + "2021-12" + "%" , "planned");
		
		List<SneakerDTO> sneakerList2021 = (List<SneakerDTO>) sdao.getSneakerList("%" + "2021-99" + "%" , "planned");

		request.setAttribute("sneakerList21_1", sneakerList21_1);
		request.setAttribute("sneakerList21_2", sneakerList21_2);
		request.setAttribute("sneakerList21_3", sneakerList21_3);
		request.setAttribute("sneakerList21_4", sneakerList21_4);
		request.setAttribute("sneakerList21_5", sneakerList21_5);
		request.setAttribute("sneakerList21_6", sneakerList21_6);
		request.setAttribute("sneakerList21_7", sneakerList21_7);
		request.setAttribute("sneakerList21_8", sneakerList21_8);
		request.setAttribute("sneakerList21_9", sneakerList21_9);
		request.setAttribute("sneakerList21_10", sneakerList21_10);
		request.setAttribute("sneakerList21_11", sneakerList21_11);
		request.setAttribute("sneakerList21_12", sneakerList21_12);
		
		request.setAttribute("sneakerList2021", sneakerList2021);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./board/main.jsp");
		forward.setRedirect(false);
		return forward;
	}
}
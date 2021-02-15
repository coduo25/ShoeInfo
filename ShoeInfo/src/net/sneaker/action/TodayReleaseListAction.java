package net.sneaker.action;

import java.util.ArrayList;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.brand.db.BrandDTO;
import net.online.db.OnlineDAO;
import net.online.db.OnlineDTO;
import net.sneaker.db.SneakerDAO;
import net.sneaker.db.SneakerDTO;

public class TodayReleaseListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		OnlineDAO odao = new OnlineDAO();
		SneakerDAO sdao = new SneakerDAO();
		
		//오늘의 응모
		Vector vec_todaysRelease = odao.getTodaysReleaseAll();
		ArrayList<OnlineDTO> onlineList_todays = (ArrayList<OnlineDTO>) vec_todaysRelease.get(0);
		ArrayList<BrandDTO> brandList_todays = (ArrayList<BrandDTO>) vec_todaysRelease.get(1);
		ArrayList<SneakerDTO> sneakerList_todays = (ArrayList<SneakerDTO>) vec_todaysRelease.get(2);
		
		request.setAttribute("onlineList_todays", onlineList_todays);
		request.setAttribute("brandList_todays", brandList_todays);
		request.setAttribute("sneakerList_todays", sneakerList_todays);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./board/todaysReleaseList.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}

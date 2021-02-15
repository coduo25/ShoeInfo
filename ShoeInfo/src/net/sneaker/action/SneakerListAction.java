package net.sneaker.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.brand.db.BrandDTO;
import net.online.db.OnlineDAO;
import net.online.db.OnlineDTO;
import net.sneaker.db.SneakerDAO;
import net.sneaker.db.SneakerDTO;

public class SneakerListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		OnlineDAO odao = new OnlineDAO();
		SneakerDAO sdao = new SneakerDAO();
		
		//오늘의 응모
		Vector vec_todaysRelease = odao.getTodaysRelease();
		ArrayList<OnlineDTO> onlineList_todays = (ArrayList<OnlineDTO>) vec_todaysRelease.get(0);
		ArrayList<BrandDTO> brandList_todays = (ArrayList<BrandDTO>) vec_todaysRelease.get(1);
		ArrayList<SneakerDTO> sneakerList_todays = (ArrayList<SneakerDTO>) vec_todaysRelease.get(2);
		
		request.setAttribute("onlineList_todays", onlineList_todays);
		request.setAttribute("brandList_todays", brandList_todays);
		request.setAttribute("sneakerList_todays", sneakerList_todays);
		
		
		//이번주 snkrs 리스트 가져오는 함수
 		Vector vec_SnkrsWeek = sdao.getSnkrsWeekList();
 		ArrayList<OnlineDTO> onlineList_snkrs = (ArrayList<OnlineDTO>) vec_SnkrsWeek.get(0);
		ArrayList<SneakerDTO> sneakerList_snkrs = (ArrayList<SneakerDTO>) vec_SnkrsWeek.get(1);
 		
		request.setAttribute("onlineList_snkrs", onlineList_snkrs);
		request.setAttribute("sneakerList_snkrs", sneakerList_snkrs);
		
		
		//발매중 신발들, 발매예정 신발들, 발매완료 신발들
		Vector vec_totalReleaseList = sdao.getTotalReleaseList("%" + "2021" + "%");
		ArrayList<SneakerDTO> releaseSneakerList = (ArrayList<SneakerDTO>) vec_totalReleaseList.get(0);
		ArrayList<SneakerDTO> releasingSneakerList = (ArrayList<SneakerDTO>) vec_totalReleaseList.get(1);
		ArrayList<SneakerDTO> releasedSneakerList = (ArrayList<SneakerDTO>) vec_totalReleaseList.get(2);
		
		request.setAttribute("releaseSneakerList", releaseSneakerList);
		request.setAttribute("releasingSneakerList", releasingSneakerList);
		request.setAttribute("releasedSneakerList", releasedSneakerList);
 		
 		
 		
		
		
		
		
		
		
		//구버전
		List<SneakerDTO> sneakerList1 = (List<SneakerDTO>) sdao.getSneakerList("%" + "2021-01" + "%" , "planned");
		List<SneakerDTO> sneakerList2 = (List<SneakerDTO>) sdao.getSneakerList("%" + "2021-02" + "%" , "planned");
		List<SneakerDTO> sneakerList3 = (List<SneakerDTO>) sdao.getSneakerList("%" + "2021-03" + "%" , "planned");
		List<SneakerDTO> sneakerList4 = (List<SneakerDTO>) sdao.getSneakerList("%" + "2021-04" + "%" , "planned");
		List<SneakerDTO> sneakerList5 = (List<SneakerDTO>) sdao.getSneakerList("%" + "2021-05" + "%" , "planned");
		List<SneakerDTO> sneakerList6 = (List<SneakerDTO>) sdao.getSneakerList("%" + "2021-06" + "%" , "planned");
		List<SneakerDTO> sneakerList7 = (List<SneakerDTO>) sdao.getSneakerList("%" + "2021-07" + "%" , "planned");
		List<SneakerDTO> sneakerList8 = (List<SneakerDTO>) sdao.getSneakerList("%" + "2021-08" + "%" , "planned");
		List<SneakerDTO> sneakerList9 = (List<SneakerDTO>) sdao.getSneakerList("%" + "2021-09" + "%" , "planned");
		List<SneakerDTO> sneakerList10 = (List<SneakerDTO>) sdao.getSneakerList("%" + "2021-10" + "%" , "planned");
		List<SneakerDTO> sneakerList11 = (List<SneakerDTO>) sdao.getSneakerList("%" + "2021-11" + "%" , "planned");
		List<SneakerDTO> sneakerList12 = (List<SneakerDTO>) sdao.getSneakerList("%" + "2021-12" + "%" , "planned");
		
		List<SneakerDTO> sneakerList2021 = (List<SneakerDTO>) sdao.getSneakerList("%" + "2021-99" + "%" , "planned");

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
		
		request.setAttribute("sneakerList2021", sneakerList2021);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./board/main.jsp");
		forward.setRedirect(false);
		return forward;
	}
}
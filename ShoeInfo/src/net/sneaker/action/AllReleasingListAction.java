package net.sneaker.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sneaker.db.SneakerDAO;
import net.sneaker.db.SneakerDTO;

public class AllReleasingListAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		//아이디값 저장
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("email");
		
		SneakerDAO sdao = new SneakerDAO();
		
		//발매중 신발들, 발매예정 신발들
		Vector vec_totalReleaseList = sdao.getTotalReleaseList("%" + "2021" + "%");
		ArrayList<SneakerDTO> releaseSneakerList = (ArrayList<SneakerDTO>) vec_totalReleaseList.get(0);
		ArrayList<SneakerDTO> releasingSneakerList = (ArrayList<SneakerDTO>) vec_totalReleaseList.get(1);
		//현재 발매 중인 신발들 중에 진행중인 브랜드 갯수 가져오는 리스트
		ArrayList<Integer> countReleasingBrandList = (ArrayList<Integer>) vec_totalReleaseList.get(3);
		
		request.setAttribute("releaseSneakerList", releaseSneakerList);
		request.setAttribute("releasingSneakerList", releasingSneakerList);
		
		request.setAttribute("countReleasingBrandList", countReleasingBrandList);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./board/allReleasingList.jsp");
		forward.setRedirect(false);
		return forward;
	}

}

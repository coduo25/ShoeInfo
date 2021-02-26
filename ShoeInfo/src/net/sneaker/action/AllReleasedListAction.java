package net.sneaker.action;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
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
		
		//리스트 거꾸로 돌리기
		Collections.reverse(releasedSneakerList);
		
		//12개씩 잘라서 각 리스트에 담기
		List<List<SneakerDTO>> splitedList = split(releasedSneakerList, 12);
		
		request.setAttribute("splitedList", splitedList);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./board/allReleasedList.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
	public static <T> List<List<T>> split(List<T> resList, int count) {
		if (resList == null || count <1)
			return null;
		List<List<T>> ret = new ArrayList<List<T>>();
		int size = resList.size();
		if (size <= count) {
			// 데이터 부족 count 지정 크기
			ret.add(resList);
		} else {
			int pre = size / count;
			int last = size % count;
			// 앞 pre 개 집합, 모든 크기 다 count 가지 요소
			for (int i = 0; i <pre; i++) {
				List<T> itemList = new ArrayList<T>();
				for (int j = 0; j <count; j++) {
					itemList.add(resList.get(i * count + j));
				}
				ret.add(itemList);
			}
			// last 진행이 처리
			if (last > 0) {
				List<T> itemList = new ArrayList<T>();
				for (int i = 0; i <last; i++) {
					itemList.add(resList.get(pre * count + i));
				}
				ret.add(itemList);
			}
		}
		return ret;
	}
	
}

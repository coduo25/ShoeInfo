package net.member.action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.brand.db.BrandDTO;
import net.member.db.MemberDAO;
import net.member.db.MemberDrawDTO;
import net.sneaker.db.SneakerDAO;
import net.sneaker.db.SneakerDTO;

public class MemberDrawInfo implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//로그인 정보 가져오기
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("email");
		ActionForward forward = new ActionForward();
		if(user == null || user.length() == 0){
			forward.setPath("./Main.bo");
			forward.setRedirect(true);
			return forward;
		}
		
		//디비가서 내가 응모한 브랜드 정보 가져오기
		MemberDAO mdao = new MemberDAO();
		SneakerDAO sdao = new SneakerDAO();
		
		//인기상품 리스트
		ArrayList<SneakerDTO> popularList = sdao.getPopularList();
		request.setAttribute("popularList", popularList);
		
		//현재 년 + 월 구하기
		Calendar lastlast_month = Calendar.getInstance();
		Calendar last_month = Calendar.getInstance();
		Calendar cur_month = Calendar.getInstance();
		Calendar next_month = Calendar.getInstance();
		
		DateFormat date_format = new SimpleDateFormat("yyyy-MM");
		
		lastlast_month.add(lastlast_month.MONTH, - 2);
		last_month.add(last_month.MONTH, - 1);
		cur_month.add(cur_month.MONTH, + 0);
		next_month.add(next_month.MONTH, + 1);

		//2021-01
		//2021-02
		//2012-03
		String lastlast_month_Str = date_format.format(lastlast_month.getTime());
		String last_month_Str = date_format.format(last_month.getTime());
		String cur_month_Str = date_format.format(cur_month.getTime());
		String next_month_Str = date_format.format(next_month.getTime());
		
		Vector vec = (Vector) mdao.searchUserDrawStylecode_kr(user, lastlast_month_Str, last_month_Str, cur_month_Str, next_month_Str);
		
		ArrayList<MemberDrawDTO> userDrawStylecodeList = (ArrayList<MemberDrawDTO>) vec.get(0);
		ArrayList<SneakerDTO> sneakerInfoList = (ArrayList<SneakerDTO>) vec.get(1);
		request.setAttribute("userDrawStylecodeList", userDrawStylecodeList);
		request.setAttribute("sneakerInfoList", sneakerInfoList);
		
		ArrayList<Integer> countDrawKrList = (ArrayList<Integer>) vec.get(2);
		ArrayList<Integer> countDrawEtcList = (ArrayList<Integer>) vec.get(3);
		request.setAttribute("countDrawKrList", countDrawKrList);
		request.setAttribute("countDrawEtcList", countDrawEtcList);

		//총 응모수 더하기
		int totalcount= 0;
		for(int i=0; i<countDrawKrList.size(); i++){
			totalcount += countDrawKrList.get(i);
		}
		for(int j=0; j<countDrawEtcList.size(); j++){
			totalcount += countDrawEtcList.get(j);
		}
		request.setAttribute("totalcount", totalcount);
	
		//페이지이동
		forward.setPath("./member/memberDrawList.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}

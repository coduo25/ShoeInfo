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
		
		//현재 년 + 월 구하기
		Calendar last_month = Calendar.getInstance();
		Calendar cur_month = Calendar.getInstance();
		Calendar next_month = Calendar.getInstance();
		
		DateFormat date_format = new SimpleDateFormat("yyyy-MM");
		
		last_month.add(last_month.MONTH, - 1);
		cur_month.add(cur_month.MONTH, + 0);
		next_month.add(next_month.MONTH, + 1);

		//2021-01
		//2021-02
		//2012-03
		String last_month_Str = date_format.format(last_month.getTime());
		String cur_month_Str = date_format.format(cur_month.getTime());
		String next_month_Str = date_format.format(next_month.getTime());
		
		Vector vec = (Vector) mdao.searchUserDrawStylecode_kr(user, last_month_Str, cur_month_Str, next_month_Str);
		
		ArrayList<MemberDrawDTO> userDrawStylecodeList = (ArrayList<MemberDrawDTO>) vec.get(0);
		ArrayList<SneakerDTO> sneakerInfoList = (ArrayList<SneakerDTO>) vec.get(1);
		
		ArrayList<MemberDrawDTO> drawInfoList_kr = (ArrayList<MemberDrawDTO>) vec.get(2);
		ArrayList<BrandDTO> brandList_kr = (ArrayList<BrandDTO>) vec.get(3);
		ArrayList<BrandDTO> onlineinfoList_kr = (ArrayList<BrandDTO>) vec.get(4);
		
		ArrayList<MemberDrawDTO> drawInfoList_etc = (ArrayList<MemberDrawDTO>) vec.get(5);
		ArrayList<BrandDTO> brandList_etc = (ArrayList<BrandDTO>) vec.get(6);
		ArrayList<BrandDTO> onlineinfoList_etc = (ArrayList<BrandDTO>) vec.get(7);
		
		ArrayList<Integer> countDrawList = (ArrayList<Integer>) vec.get(8);
		
		request.setAttribute("userDrawStylecodeList", userDrawStylecodeList);
		request.setAttribute("sneakerInfoList", sneakerInfoList);
		
		request.setAttribute("drawInfoList_kr", drawInfoList_kr);
		request.setAttribute("brandList_kr", brandList_kr);
		request.setAttribute("onlineinfoList_kr", onlineinfoList_kr);
		
		request.setAttribute("drawInfoList_etc", drawInfoList_etc);
		request.setAttribute("brandList_etc", brandList_etc);
		request.setAttribute("onlineinfoList_etc", onlineinfoList_etc);
		
		request.setAttribute("countDrawList", countDrawList);
			
		//페이지이동
		forward.setPath("./member/memberDrawList.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}

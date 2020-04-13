package net.sneaker.action;

import java.util.ArrayList;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.brand.db.BrandDTO;
import net.offline.db.OfflineDAO;
import net.offline.db.OfflineDTO;
import net.online.db.OnlineDAO;
import net.online.db.OnlineDTO;
import net.sneaker.db.SneakerDAO;
import net.sneaker.db.SneakerDTO;

public class SneakerDetailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//넘어온 값 저장(model_stylecode)
		String model_stylecode = (String) request.getParameter("model_stylecode");
		
		/******************************************************
		 * 신발 기본 정보 리스트 만들기
		 ******************************************************/
		SneakerDAO sdao = new SneakerDAO();
		SneakerDTO sdto = sdao.getSneakerDetail(model_stylecode);
		
		//DB에서 가져온 값 request영역에 저장
		request.setAttribute("sneakerDetail", sdto);
		
		/******************************************************
		 * 신발 발매 정보 리스트 만들기
		 ******************************************************/
		
		//-----------오프라인---------
		OfflineDAO ofdao = new OfflineDAO();
		
		Vector vec_off_kr = ofdao.getOfflineInfo_kr(model_stylecode);
		
		//DAO에서 받은 Vector 형태를 리스트로 나누기
		ArrayList<OfflineDTO> offLineList_kr = (ArrayList<OfflineDTO>) vec_off_kr.get(0);
		ArrayList<OfflineDTO> brandList_off_kr = (ArrayList<OfflineDTO>) vec_off_kr.get(1);
		//request에 저장
		request.setAttribute("offLineList_kr", offLineList_kr);
		request.setAttribute("brandList_off_kr", brandList_off_kr);
		
		//-----------온라인-------------
		OnlineDAO odao = new OnlineDAO();
		
		//대한민국
		Vector vec_on_kr = odao.getOnlineInfo_kr(model_stylecode);
		ArrayList<OnlineDTO> onlineList_kr = (ArrayList<OnlineDTO>) vec_on_kr.get(0);
		ArrayList<BrandDTO> brandList_kr = (ArrayList<BrandDTO>) vec_on_kr.get(1);
		
		//아시아
		Vector vec_on_asia = odao.getOnlineInfo_asia(model_stylecode);
		ArrayList<OnlineDTO> onlineList_asia = (ArrayList<OnlineDTO>) vec_on_asia.get(0);
		ArrayList<BrandDTO> brandList_asia = (ArrayList<BrandDTO>) vec_on_asia.get(1);
		
		//아메리카
		String country_region_us = "아메리카";
		Vector vec_on_america = odao.getOnlineInfo(model_stylecode, country_region_us);
		ArrayList<OnlineDTO> onlineList_america = (ArrayList<OnlineDTO>) vec_on_america.get(0);
		ArrayList<BrandDTO> brandList_america = (ArrayList<BrandDTO>) vec_on_america.get(1);
		
		//유럽
		String country_region_eu = "유럽";
		Vector vec_on_europe = odao.getOnlineInfo(model_stylecode, country_region_eu);;
		ArrayList<OnlineDTO> onlineList_europe = (ArrayList<OnlineDTO>) vec_on_europe.get(0);
		ArrayList<BrandDTO> brandList_europe = (ArrayList<BrandDTO>) vec_on_europe.get(1);
		
		//기타지역
		String country_region_etc = "기타";
		Vector vec_on_etc = odao.getOnlineInfo(model_stylecode, country_region_etc);
		ArrayList<OnlineDTO> onlineList_etc = (ArrayList<OnlineDTO>) vec_on_etc.get(0);
		ArrayList<BrandDTO> brandList_etc = (ArrayList<BrandDTO>) vec_on_etc.get(1);
		
		//request에 저장
		request.setAttribute("onlineList_kr", onlineList_kr);
		request.setAttribute("brandList_kr", brandList_kr);
		
		request.setAttribute("onlineList_asia", onlineList_asia);
		request.setAttribute("brandList_asia", brandList_asia);
		
		request.setAttribute("onlineList_america", onlineList_america);
		request.setAttribute("brandList_america", brandList_america);
		
		request.setAttribute("onlineList_europe", onlineList_europe);
		request.setAttribute("brandList_europe", brandList_europe);
		
		request.setAttribute("onlineList_etc", onlineList_etc);
		request.setAttribute("brandList_etc", brandList_etc);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./board/sneakerDetail.jsp");
		forward.setRedirect(false);
		return forward;
	}
}

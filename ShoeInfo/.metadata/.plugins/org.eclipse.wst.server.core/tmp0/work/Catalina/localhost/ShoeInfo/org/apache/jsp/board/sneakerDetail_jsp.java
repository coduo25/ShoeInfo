/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.54
 * Generated at: 2020-04-12 23:58:19 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.board;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import net.offline.db.OfflineDTO;
import net.online.db.OnlineDTO;
import java.util.Date;
import javax.servlet.jsp.tagext.TryCatchFinally;
import java.text.SimpleDateFormat;
import net.brand.db.BrandDTO;
import java.util.ArrayList;
import net.sneaker.db.SneakerDTO;
import java.util.List;

public final class sneakerDetail_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("net.online.db.OnlineDTO");
    _jspx_imports_classes.add("java.util.List");
    _jspx_imports_classes.add("java.util.Date");
    _jspx_imports_classes.add("net.sneaker.db.SneakerDTO");
    _jspx_imports_classes.add("net.offline.db.OfflineDTO");
    _jspx_imports_classes.add("java.text.SimpleDateFormat");
    _jspx_imports_classes.add("net.brand.db.BrandDTO");
    _jspx_imports_classes.add("javax.servlet.jsp.tagext.TryCatchFinally");
    _jspx_imports_classes.add("java.util.ArrayList");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<link href=\"./css/board/main.css\" rel=\"stylesheet\">\r\n");
      out.write("<link href=\"https://fonts.googleapis.com/css?family=Anton|Noto+Sans+KR:600&display=swap\" rel=\"stylesheet\">\r\n");
      out.write("<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js\"></script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("\t<!-- Header -->\t\r\n");
      out.write("\t<header> ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/include/header.jsp", out, false);
      out.write(" </header>\r\n");
      out.write("\r\n");
      out.write("\t<!-- Main Content -->\r\n");
      out.write("\t");

		SneakerDTO sdto = (SneakerDTO) request.getAttribute("sneakerDetail");
	
		// ---------- 오프라인 정보 -----------
		List<OfflineDTO> offLineList_kr = (List<OfflineDTO>) request.getAttribute("offLineList_kr");
		List<BrandDTO> brandList_off_kr = (List<BrandDTO>) request.getAttribute("brandList_off_kr");
		
		// ---------- 온라인 정보 -----------
		//대한민국
		List<OnlineDTO> onlineList_kr = (List<OnlineDTO>) request.getAttribute("onlineList_kr");
		List<BrandDTO> brandList_kr = (List<BrandDTO>) request.getAttribute("brandList_kr");
		
		//아시아(대한민국빼고)
		List<OnlineDTO> onlineList_asia = (List<OnlineDTO>) request.getAttribute("onlineList_asia");
		List<BrandDTO> brandList_asia = (List<BrandDTO>) request.getAttribute("brandList_asia");
		
		//아메리카
		List<OnlineDTO> onlineList_america = (List<OnlineDTO>) request.getAttribute("onlineList_america");
		List<BrandDTO> brandList_america = (List<BrandDTO>) request.getAttribute("brandList_america");
		
		//유럽
		List<OnlineDTO> onlineList_europe = (List<OnlineDTO>) request.getAttribute("onlineList_europe");
		List<BrandDTO> brandList_europe = (List<BrandDTO>) request.getAttribute("brandList_europe");
		
		//기타
		List<OnlineDTO> onlineList_etc = (List<OnlineDTO>) request.getAttribute("onlineList_etc");
		List<BrandDTO> brandList_etc = (List<BrandDTO>) request.getAttribute("brandList_etc");
		
		SimpleDateFormat original_format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		SimpleDateFormat new_format = new SimpleDateFormat("MM/dd HH:mm");
		SimpleDateFormat count_format = new SimpleDateFormat("MM/dd/yyyy HH:mm");
	
      out.write("\r\n");
      out.write("\t<div id=\"wrapper\" class=\"container\">\r\n");
      out.write("\t\t<!-- side bar -->\r\n");
      out.write("\t\t<div id=\"main-nav\">\r\n");
      out.write("\t\t\t<a href=\"./SneakerList.go\" class=\"menu-link\">런칭 캘린더</a>\r\n");
      out.write("\t\t\t<a href=\"\" class=\"menu-link\">발매 정보</a>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<!-- content -->\r\n");
      out.write("\t\t<div id=\"content_sneakerDetail\">\r\n");
      out.write("\t\t\t<table id=\"sneaker_Detail\" border=\"0\">\r\n");
      out.write("\t\t\t\t<tr> \r\n");
      out.write("\t\t\t\t\t<td colspan=\"3\"> \r\n");
      out.write("\t\t\t\t\t\t<div class=\"sneaker_image\"> \r\n");
      out.write("\t\t\t\t\t\t\t<img src=\"./sneaker_img_upload/");
      out.print(sdto.getImage().split(",")[0]);
      out.write("\">\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"detail_table\">\r\n");
      out.write("\t\t\t\t\t\t<!-- 신발 이름 -->\r\n");
      out.write("\t\t\t\t\t\t<div class=\"sneaker_name\">\r\n");
      out.write("\t\t\t\t\t\t\t<span> ");
      out.print(sdto.getModel_name() );
      out.write("</span>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<!-- colorway -->\r\n");
      out.write("\t\t\t\t\t\t<div class=\"sneaker_colorway\">\r\n");
      out.write("\t\t\t\t\t\t\t<span> ");
      out.print(sdto.getModel_colorway() );
      out.write("</span>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<!-- stylecode -->\r\n");
      out.write("\t\t\t\t\t\t<div class=\"sneaker_stylecode\">\r\n");
      out.write("\t\t\t\t\t\t\t<span> ");
      out.print(sdto.getModel_stylecode() );
      out.write("</span>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<!-- price -->\r\n");
      out.write("\t\t\t\t\t\t<div class=\"sneaker_price\">\r\n");
      out.write("\t\t\t\t\t\t\t<span> $");
      out.print(sdto.getPrice() );
      out.write("</span>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<!-- relase_date -->\r\n");
      out.write("\t\t\t\t\t\t<div class=\"sneaker_release_date\">\r\n");
      out.write("\t\t\t\t\t\t\t<span> ");
      out.print(sdto.getRelease_date() );
      out.write("</span>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td> \r\n");
      out.write("\t\t\t\t\t\t<div class=\"sneaker_image2\"> \r\n");
      out.write("\t\t\t\t\t\t\t<img src=\"./sneaker_img_upload/");
      out.print(sdto.getImage().split(",")[0]);
      out.write("\">\r\n");
      out.write("\t\t\t\t\t\t</div> \r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td> \r\n");
      out.write("\t\t\t\t\t\t<div class=\"sneaker_image2\"> \r\n");
      out.write("\t\t\t\t\t\t\t<img src=\"./sneaker_img_upload/");
      out.print(sdto.getImage().split(",")[1]);
      out.write("\">\r\n");
      out.write("\t\t\t\t\t\t</div> \r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td> \r\n");
      out.write("\t\t\t\t\t\t<div class=\"sneaker_image2\"> \r\n");
      out.write("\t\t\t\t\t\t\t<img src=\"./sneaker_img_upload/");
      out.print(sdto.getImage().split(",")[2]);
      out.write("\">\r\n");
      out.write("\t\t\t\t\t\t</div> \r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t\t<!-- 신발 온라인/오프라인 정보 -->\r\n");
      out.write("\t\t\t<div id=\"content_sneakerOnlineInfo\">\r\n");
      out.write("\t\t\t\t<!-- 오프라인 테이블 -->\r\n");
      out.write("\t\t\t\t<table id=\"sneakerOfflineInfo_table\" border=\"0\">\r\n");
      out.write("\t\t\t\t\t\t<h4> [오프라인 발매처]</h4>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td style=\"width:50px;\"> </td>\r\n");
      out.write("\t\t\t\t\t\t\t<td style=\"width:150px;\"> </td>\r\n");
      out.write("\t\t\t\t\t\t\t<td style=\"width:200px;\"> 기간 </td>\r\n");
      out.write("\t\t\t\t\t\t\t<td style=\"width:200px;\"> 남은시간 </td>\r\n");
      out.write("\t\t\t\t\t\t\t<td style=\"width:160px;\"> 응모방식 </td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t");

						if(offLineList_kr.isEmpty()){
					
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<tr style=\"height: 70px;\">\r\n");
      out.write("\t\t\t\t\t\t\t<td colspan=\"7\"> 아직 오프라인 발매 정보가 없습니다. </td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\t \r\n");
      out.write("\t\t\t\t\t");
	} else {
						for(int i=0; i<offLineList_kr.size();i++){	
							OfflineDTO ofdto_kr = (OfflineDTO) offLineList_kr.get(i);
							BrandDTO bdto_kr = (BrandDTO) brandList_off_kr.get(i);
							
							Date original_Offline_start_time_date = original_format.parse(ofdto_kr.getOffline_start_time());
							String new_Offline_start_time_date = new_format.format(original_Offline_start_time_date);
							
							Date original_Offline_end_time_date = original_format.parse(ofdto_kr.getOffline_end_time());
							String new_Offline_end_time_date = new_format.format(original_Offline_end_time_date);
					
      out.write("\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td> <a href=\"");
      out.print(ofdto_kr.getOffline_link());
      out.write("\" target=\"_blank\"> <img id=\"brandlogo_img\" src=\"./brand_img_upload/");
      out.print(bdto_kr.getBrand_logo());
      out.write("\" width=\"50\" height=\"50\"> </a> </td>\r\n");
      out.write("\t\t\t\t\t\t<td style=\"text-align:left; padding-left: 15px;\"> <a href=\"");
      out.print(ofdto_kr.getOffline_link());
      out.write("\" target=\"_blank\"> ");
      out.print(ofdto_kr.getOffline_location());
      out.write(' ');
      out.print(bdto_kr.getBrand_name());
      out.write(" </a> </td>\r\n");
      out.write("\t\t\t\t\t\t<td> <span id=\"offline_start_time_date\"> ");
      out.print(new_Offline_start_time_date);
      out.write(" </span> ~ ");
      out.print(new_Offline_end_time_date);
      out.write(" </td>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<span id=\"new_count_start_time_date\" style=\"display:none;\"> - </span>\r\n");
      out.write("\t\t\t\t\t\t<td id=\"final_new_count_start_time_date\"> </td>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<td> ");
      out.print(ofdto_kr.getOffline_method());
      out.write(" </td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t");

							}
						}
					
      out.write("\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t<br>\r\n");
      out.write("\t\t\t\t<br>\r\n");
      out.write("\t\t\t\t<br>\r\n");
      out.write("\t\t\t\t<br>\r\n");
      out.write("\t\t\t\t<!-- 온라인 테이블 -->\r\n");
      out.write("\t\t\t\t<table id=\"sneakerOnlineInfo_table\" border=\"0\">\r\n");
      out.write("\t\t\t\t\t\t<h4> [한국 온라인 발매처] </h4>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td style=\"width:50px;\"> </td>\r\n");
      out.write("\t\t\t\t\t\t\t<td style=\"width:150px;\"> </td>\r\n");
      out.write("\t\t\t\t\t\t\t<td style=\"width:30px;\"> </td>\r\n");
      out.write("\t\t\t\t\t\t\t<td style=\"width:200px;\"> 기간 </td>\r\n");
      out.write("\t\t\t\t\t\t\t<td style=\"width:200px;\"> 남은시간 </td>\r\n");
      out.write("\t\t\t\t\t\t\t<td style=\"width:160px;\"> 응모방식 </td>\r\n");
      out.write("\t\t\t\t\t\t\t<td style=\"width:60px;\"> 응모여부 </td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t");

						if(onlineList_kr.isEmpty()){
					
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<tr style=\"height: 70px;\">\r\n");
      out.write("\t\t\t\t\t\t\t<td colspan=\"7\"> 아직 온라인 발매 정보가 없습니다. </td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\t \r\n");
      out.write("\t\t\t\t\t");
	} else {
						for(int i=0; i<onlineList_kr.size();i++){	
							OnlineDTO odto_kr = (OnlineDTO) onlineList_kr.get(i);
							BrandDTO bdto_kr = (BrandDTO) brandList_kr.get(i);
							
							Date original_Online_start_time_date = original_format.parse(odto_kr.getOnline_start_time());
							String new_Online_start_time_date = new_format.format(original_Online_start_time_date);
							
							Date original_Online_end_time_date = original_format.parse(odto_kr.getOnline_end_time());
							String new_Online_end_time_date = new_format.format(original_Online_end_time_date);
							
							//새로운 카운트 다운 값
							String new_count_start_time_date = count_format.format(original_Online_start_time_date);
					
      out.write("\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td> <a href=\"");
      out.print(odto_kr.getOnline_link());
      out.write("\" target=\"_blank\"> <img id=\"brandlogo_img\" src=\"./brand_img_upload/");
      out.print(bdto_kr.getBrand_logo());
      out.write("\" width=\"50\" height=\"50\"> </a> </td>\r\n");
      out.write("\t\t\t\t\t\t<td style=\"text-align:left; padding-left: 15px;\"> <a href=\"");
      out.print(odto_kr.getOnline_link());
      out.write("\" target=\"_blank\"> ");
      out.print(bdto_kr.getBrand_name());
      out.write(" </a> </td>\r\n");
      out.write("\t\t\t\t\t\t<td> <img id=\"country_flag_img\" src=\"./countryflag_img_upload/");
      out.print(bdto_kr.getCountry_flag());
      out.write("\" width=\"22\" height=\"15\"> </td>\r\n");
      out.write("\t\t\t\t\t\t<td> <span id=\"online_start_time_date\"> ");
      out.print(new_Online_start_time_date);
      out.write(" </span> ~ ");
      out.print(new_Online_end_time_date);
      out.write(" </td>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<span id=\"new_count_start_time_date\" style=\"display:none;\"> ");
      out.print( new_count_start_time_date );
      out.write(" </span>\r\n");
      out.write("\t\t\t\t\t\t<td id=\"final_new_count_start_time_date\"> </td>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<td> ");
      out.print(odto_kr.getOnline_method());
      out.write(" </td>\r\n");
      out.write("\t\t\t\t\t\t");

							if(odto_kr.getOnline_method().contains("드로우")){
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<form action=\"\" method=\"get\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<td> <input type=\"button\" value=\"응모하기\"> </td>\r\n");
      out.write("\t\t\t\t\t\t\t</form>\r\n");
      out.write("\t\t\t\t\t\t");

							}else{
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<td> - </td>\r\n");
      out.write("\t\t\t\t\t\t");

							}
						
      out.write("\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t");

							}
						}
					
      out.write("\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t<br>\r\n");
      out.write("\t\t\t\t<br>\r\n");
      out.write("\t\t\t\t<br>\r\n");
      out.write("\t\t\t\t<br>\r\n");
      out.write("\t\t\t\t<table id=\"sneakerOnlineInfo_table\" border=\"0\">\r\n");
      out.write("\t\t\t\t\t<h4> [아시아 지역 발매처] </h4>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td style=\"width:50px;\"> </td>\r\n");
      out.write("\t\t\t\t\t\t<td style=\"width:150px;\"> </td>\r\n");
      out.write("\t\t\t\t\t\t<td style=\"width:30px;\"> </td>\r\n");
      out.write("\t\t\t\t\t\t<td style=\"width:200px;\"> 기간 </td>\r\n");
      out.write("\t\t\t\t\t\t<td style=\"width:200px;\"> 남은시간 </td>\r\n");
      out.write("\t\t\t\t\t\t<td style=\"width:160px;\"> 응모방식 </td>\r\n");
      out.write("\t\t\t\t\t\t<td style=\"width:60px;\"> 응모여부 </td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t");

						if(onlineList_asia.isEmpty()){
					
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<tr style=\"height: 70px;\">\r\n");
      out.write("\t\t\t\t\t\t\t<td colspan=\"7\"> 아직 온라인 발매 정보가 없습니다. </td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\t \r\n");
      out.write("\t\t\t\t\t");
	} else {
						for(int i=0; i<onlineList_asia.size();i++){
							OnlineDTO odto_asia = (OnlineDTO) onlineList_asia.get(i);
							BrandDTO bdto_asia = (BrandDTO) brandList_asia.get(i);
							
							Date original_Online_start_time_date = original_format.parse(odto_asia.getOnline_start_time());
							String new_Online_start_time_date = new_format.format(original_Online_start_time_date);
							
							Date original_Online_end_time_date = original_format.parse(odto_asia.getOnline_end_time());
							String new_Online_end_time_date = new_format.format(original_Online_end_time_date);
					
      out.write("\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td> <a href=\"");
      out.print(odto_asia.getOnline_link());
      out.write("\" target=\"_blank\"> <img id=\"brandlogo_img\" src=\"./brand_img_upload/");
      out.print(bdto_asia.getBrand_logo());
      out.write("\" width=\"50\" height=\"50\"> </a> </td>\r\n");
      out.write("\t\t\t\t\t\t<td style=\"text-align:left; padding-left: 15px;\"> <a href=\"");
      out.print(odto_asia.getOnline_link());
      out.write("\" target=\"_blank\"> ");
      out.print(bdto_asia.getBrand_name());
      out.write(" </a> </td>\r\n");
      out.write("\t\t\t\t\t\t<td> <img id=\"country_flag_img\" src=\"./countryflag_img_upload/");
      out.print(bdto_asia.getCountry_flag());
      out.write("\" width=\"22\" height=\"15\"> </td>\r\n");
      out.write("\t\t\t\t\t\t<td> ");
      out.print(new_Online_start_time_date);
      out.write(' ');
      out.write('~');
      out.write(' ');
      out.print(new_Online_end_time_date);
      out.write(" </td>\r\n");
      out.write("\t\t\t\t\t\t<td> - </td>\r\n");
      out.write("\t\t\t\t\t\t<td> ");
      out.print(odto_asia.getOnline_method());
      out.write(' ');
      out.write('/');
      out.write(' ');
      out.print(odto_asia.getDelivery_method());
      out.write(" </td>\r\n");
      out.write("\t\t\t\t\t\t<td> - </td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t");

							}
						}
					
      out.write("\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t<br>\r\n");
      out.write("\t\t\t\t<br>\r\n");
      out.write("\t\t\t\t<br>\r\n");
      out.write("\t\t\t\t<br>\r\n");
      out.write("\t\t\t\t<table id=\"sneakerOnlineInfo_table\" border=\"0\">\r\n");
      out.write("\t\t\t\t\t<h4> [아메리카 지역 발매처] </h4>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td style=\"width:50px;\"> </td>\r\n");
      out.write("\t\t\t\t\t\t<td style=\"width:150px;\"> </td>\r\n");
      out.write("\t\t\t\t\t\t<td style=\"width:30px;\"> </td>\r\n");
      out.write("\t\t\t\t\t\t<td style=\"width:200px;\"> 기간 </td>\r\n");
      out.write("\t\t\t\t\t\t<td style=\"width:200px;\"> 남은시간 </td>\r\n");
      out.write("\t\t\t\t\t\t<td style=\"width:160px;\"> 응모방식 </td>\r\n");
      out.write("\t\t\t\t\t\t<td style=\"width:60px;\"> 응모여부 </td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t");

						if(onlineList_america.isEmpty()){
					
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<tr style=\"height: 70px;\">\r\n");
      out.write("\t\t\t\t\t\t\t<td colspan=\"7\"> 아직 온라인 발매 정보가 없습니다. </td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\t \r\n");
      out.write("\t\t\t\t\t");
	} else {
						for(int i=0; i<onlineList_america.size();i++){
							OnlineDTO odto_america = (OnlineDTO) onlineList_america.get(i);
							BrandDTO bdto_america = (BrandDTO) brandList_america.get(i);
							
							Date original_Online_start_time_date = original_format.parse(odto_america.getOnline_start_time());
							String new_Online_start_time_date = new_format.format(original_Online_start_time_date);
							
							Date original_Online_end_time_date = original_format.parse(odto_america.getOnline_end_time());
							String new_Online_end_time_date = new_format.format(original_Online_end_time_date);
					
      out.write("\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td> <a href=\"");
      out.print(odto_america.getOnline_link());
      out.write("\" target=\"_blank\"> <img id=\"brandlogo_img\" src=\"./brand_img_upload/");
      out.print(bdto_america.getBrand_logo());
      out.write("\" width=\"50\" height=\"50\"> </a> </td>\r\n");
      out.write("\t\t\t\t\t\t<td style=\"text-align:left; padding-left: 15px;\"> <a href=\"");
      out.print(odto_america.getOnline_link());
      out.write("\" target=\"_blank\"> ");
      out.print(bdto_america.getBrand_name());
      out.write(" </a> </td>\r\n");
      out.write("\t\t\t\t\t\t<td> <img id=\"country_flag_img\" src=\"./countryflag_img_upload/");
      out.print(bdto_america.getCountry_flag());
      out.write("\" width=\"22\" height=\"15\"> </td>\r\n");
      out.write("\t\t\t\t\t\t<td> ");
      out.print(new_Online_start_time_date);
      out.write(' ');
      out.write('~');
      out.write(' ');
      out.print(new_Online_end_time_date);
      out.write(" </td>\r\n");
      out.write("\t\t\t\t\t\t<td> - </td>\r\n");
      out.write("\t\t\t\t\t\t<td> ");
      out.print(odto_america.getOnline_method());
      out.write(' ');
      out.write('/');
      out.write(' ');
      out.print(odto_america.getDelivery_method());
      out.write(" </td>\r\n");
      out.write("\t\t\t\t\t\t<td> - </td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t");

							}
						}
					
      out.write("\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t<br>\r\n");
      out.write("\t\t\t\t<br>\r\n");
      out.write("\t\t\t\t<br>\r\n");
      out.write("\t\t\t\t<br>\r\n");
      out.write("\t\t\t\t<table id=\"sneakerOnlineInfo_table\" border=\"0\">\r\n");
      out.write("\t\t\t\t\t<h4> [유럽 \t지역 발매처] </h4>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td style=\"width:50px;\"> </td>\r\n");
      out.write("\t\t\t\t\t\t<td style=\"width:150px;\"> </td>\r\n");
      out.write("\t\t\t\t\t\t<td style=\"width:30px;\"> </td>\r\n");
      out.write("\t\t\t\t\t\t<td style=\"width:200px;\"> 기간 </td>\r\n");
      out.write("\t\t\t\t\t\t<td style=\"width:200px;\"> 남은시간 </td>\r\n");
      out.write("\t\t\t\t\t\t<td style=\"width:160px;\"> 응모방식 </td>\r\n");
      out.write("\t\t\t\t\t\t<td style=\"width:60px;\"> 응모여부 </td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t");

						if(onlineList_europe.isEmpty()){
					
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<tr style=\"height: 70px;\">\r\n");
      out.write("\t\t\t\t\t\t\t<td colspan=\"7\"> 아직 온라인 발매 정보가 없습니다. </td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\t \r\n");
      out.write("\t\t\t\t\t");
	} else {
						for(int j=0; j<onlineList_europe.size();j++){
							OnlineDTO odto_europe = (OnlineDTO) onlineList_europe.get(j);
							BrandDTO bdto_europe = (BrandDTO) brandList_europe.get(j);
							
							Date original_Online_start_time_date = original_format.parse(odto_europe.getOnline_start_time());
							String new_Online_start_time_date = new_format.format(original_Online_start_time_date);
							
							Date original_Online_end_time_date = original_format.parse(odto_europe.getOnline_end_time());
							String new_Online_end_time_date = new_format.format(original_Online_end_time_date);
					
      out.write("\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td> <a href=\"");
      out.print(odto_europe.getOnline_link());
      out.write("\" target=\"_blank\"> <img id=\"brandlogo_img\" src=\"./brand_img_upload/");
      out.print(bdto_europe.getBrand_logo());
      out.write("\" width=\"50\" height=\"50\"> </a> </td>\r\n");
      out.write("\t\t\t\t\t\t<td style=\"text-align:left; padding-left: 15px;\"> <a href=\"");
      out.print(odto_europe.getOnline_link());
      out.write("\" target=\"_blank\"> ");
      out.print(bdto_europe.getBrand_name());
      out.write(" </a> </td>\r\n");
      out.write("\t\t\t\t\t\t<td> <img id=\"country_flag_img\" src=\"./countryflag_img_upload/");
      out.print(bdto_europe.getCountry_flag());
      out.write("\" width=\"22\" height=\"15\"> </td>\r\n");
      out.write("\t\t\t\t\t\t<td> ");
      out.print(new_Online_start_time_date);
      out.write(' ');
      out.write('~');
      out.write(' ');
      out.print(new_Online_end_time_date);
      out.write(" </td>\r\n");
      out.write("\t\t\t\t\t\t<td> - </td>\r\n");
      out.write("\t\t\t\t\t\t<td> ");
      out.print(odto_europe.getOnline_method());
      out.write(' ');
      out.write('/');
      out.write(' ');
      out.print(odto_europe.getDelivery_method());
      out.write(" </td>\r\n");
      out.write("\t\t\t\t\t\t<td> - </td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t");

							}
						}	
					
      out.write("\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t<br>\r\n");
      out.write("\t\t\t\t<br>\r\n");
      out.write("\t\t\t\t<br>\r\n");
      out.write("\t\t\t\t<br>\r\n");
      out.write("\t\t\t\t<table id=\"sneakerOnlineInfo_table\" border=\"0\">\r\n");
      out.write("\t\t\t\t\t<h4> [기타 지역 발매처] </h4>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td style=\"width:50px;\"> </td>\r\n");
      out.write("\t\t\t\t\t\t<td style=\"width:150px;\"> </td>\r\n");
      out.write("\t\t\t\t\t\t<td style=\"width:30px;\"> </td>\r\n");
      out.write("\t\t\t\t\t\t<td style=\"width:200px;\"> 기간 </td>\r\n");
      out.write("\t\t\t\t\t\t<td style=\"width:200px;\"> 남은시간 </td>\r\n");
      out.write("\t\t\t\t\t\t<td style=\"width:160px;\"> 응모방식 </td>\r\n");
      out.write("\t\t\t\t\t\t<td style=\"width:60px;\"> 응모여부 </td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t");

						if(onlineList_etc.isEmpty()){
					
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<tr style=\"height: 70px;\">\r\n");
      out.write("\t\t\t\t\t\t\t<td colspan=\"7\"> 아직 온라인 발매 정보가 없습니다. </td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\t \r\n");
      out.write("\t\t\t\t\t");
	} else {
						for(int j=0; j<onlineList_etc.size();j++){
							OnlineDTO odto_etc = (OnlineDTO) onlineList_etc.get(j);
							BrandDTO bdto_etc = (BrandDTO) brandList_etc.get(j);
							
							Date original_Online_start_time_date = original_format.parse(odto_etc.getOnline_start_time());
							String new_Online_start_time_date = new_format.format(original_Online_start_time_date);
							
							Date original_Online_end_time_date = original_format.parse(odto_etc.getOnline_end_time());
							String new_Online_end_time_date = new_format.format(original_Online_end_time_date);	
					
      out.write("\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td> <a href=\"");
      out.print(odto_etc.getOnline_link());
      out.write("\" target=\"_blank\"> <img id=\"brandlogo_img\" src=\"./brand_img_upload/");
      out.print(bdto_etc.getBrand_logo());
      out.write("\" width=\"50\" height=\"50\"> </a> </td>\r\n");
      out.write("\t\t\t\t\t\t<td style=\"text-align:left; padding-left: 15px;\"> <a href=\"");
      out.print(odto_etc.getOnline_link());
      out.write("\" target=\"_blank\"> ");
      out.print(bdto_etc.getBrand_name());
      out.write(" </a> </td>\r\n");
      out.write("\t\t\t\t\t\t<td> <img id=\"country_flag_img\" src=\"./countryflag_img_upload/");
      out.print(bdto_etc.getCountry_flag());
      out.write("\" width=\"22\" height=\"15\"> </td>\r\n");
      out.write("\t\t\t\t\t\t<td> ");
      out.print(new_Online_start_time_date);
      out.write(' ');
      out.write('~');
      out.write(' ');
      out.print(new_Online_end_time_date);
      out.write(" </td>\r\n");
      out.write("\t\t\t\t\t\t<td>  </td>\r\n");
      out.write("\t\t\t\t\t\t<td> ");
      out.print(odto_etc.getOnline_method());
      out.write(' ');
      out.write('/');
      out.write(' ');
      out.print(odto_etc.getDelivery_method());
      out.write(" </td>\r\n");
      out.write("\t\t\t\t\t\t<td> - </td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t");

							}
						}
					
      out.write("\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\t\r\n");
      out.write("\t</div>\r\n");
      out.write("\r\n");
      out.write("\t<!-- FOOTER -->\r\n");
      out.write("\t<footer> ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/include/footer.jsp", out, false);
      out.write(" </footer>\r\n");
      out.write("</body>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\r\n");
      out.write("\t$(document).ready(function(){\r\n");
      out.write("\t\tconst countDownTimer = function (id, date) { \r\n");
      out.write("\t\t\tvar _vDate = new Date(date); // 전달 받은 일자 \r\n");
      out.write("\t\t\tvar _second = 1000; \r\n");
      out.write("\t\t\tvar _minute = _second * 60; \r\n");
      out.write("\t\t\tvar _hour = _minute * 60; \r\n");
      out.write("\t\t\tvar _day = _hour * 24; \r\n");
      out.write("\t\t\tvar timer; \r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tfunction showRemaining() { \r\n");
      out.write("\t\t\t\tvar now = new Date(); \r\n");
      out.write("\t\t\t\tvar distDt = _vDate - now; \r\n");
      out.write("\t\t\t\tif (distDt < 0) { \r\n");
      out.write("\t\t\t\t\tclearInterval(timer); \r\n");
      out.write("\t\t\t\t\tdocument.getElementById(id).textContent = '해당 응모가 종료 되었습니다!'; \r\n");
      out.write("\t\t\t\t\treturn; \r\n");
      out.write("\t\t\t\t} \r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\tvar days = Math.floor(distDt / _day); \r\n");
      out.write("\t\t\t\tvar hours = Math.floor((distDt % _day) / _hour); \r\n");
      out.write("\t\t\t\tvar minutes = Math.floor((distDt % _hour) / _minute); \r\n");
      out.write("\t\t\t\tvar seconds = Math.floor((distDt % _minute) / _second); \r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t//document.getElementById(id).textContent = date.toLocaleString() + \"까지 : \"; \r\n");
      out.write("\t\t\t\tdocument.getElementById(id).textContent = days + '일 '; \r\n");
      out.write("\t\t\t\tdocument.getElementById(id).textContent += hours + '시간 '; \r\n");
      out.write("\t\t\t\tdocument.getElementById(id).textContent += minutes + '분 '; \r\n");
      out.write("\t\t\t\tdocument.getElementById(id).textContent += seconds + '초'; \r\n");
      out.write("\t\t\t} \r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\ttimer = setInterval(showRemaining, 1000); \r\n");
      out.write("\t\t} \r\n");
      out.write("\t\t// 2024년 4월 1일까지, 시간을 표시하려면 01:00 AM과 같은 형식을 사용한다. \r\n");
      out.write("\t\t//countDownTimer('sample02', '04/01/2024 00:00 AM'); \r\n");
      out.write("\t\t//countDownTimer('sample03', '04/01/2024'); // 2024년 4월 1일까지 \r\n");
      out.write("\t\t\r\n");
      out.write("\t\t//var count_span = document.getElementById(\"new_count_start_time_date\").innerText;\r\n");
      out.write("\t\t//countDownTimer('final_new_count_start_time_date', count_span);\t\r\n");
      out.write("\t});\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

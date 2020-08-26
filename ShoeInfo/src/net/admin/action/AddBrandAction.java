package net.admin.action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import net.brand.db.BrandDAO;
import net.brand.db.BrandDTO;

public class AddBrandAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//로그인 정보 가져오기
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("email");
		String usr_position = (String) session.getAttribute("usr_position");
		ActionForward forward = new ActionForward();
		if(!usr_position.equals("admin")){
			forward.setPath("./Main.bo");
			forward.setRedirect(true);
			return forward;
		}
		
		// ---------------------------------------------------------------------------------------------------------------------------
		// 1. 파일 업로드 (이미지)
		ServletContext context = request.getServletContext();
		String realPath = context.getRealPath("/brand_img_upload");
		//System.out.println("파일이 저장되는곳 (서버의 HDD) :" + realPath);
		
		//파일 크기 지정
		int maxSize = 30 * 1024 * 1024; //30MB
		
		//파일 업로드(cos.jar)
		MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "UTF-8");
		
		// ---------------------------------------------------------------------------------------------------------------------------
		// 2. BrandDTO 객체 생성 (전달받은 정보를 저장)
		BrandDTO bdto = new BrandDTO();
		
		//넘어온 값 저장하기
		int req_num;
		if(multi.getParameter("req_num") == null){
			req_num = 0;
		}else {
			 req_num = Integer.parseInt(multi.getParameter("req_num"));
		}
		
		String country_name = multi.getParameter("country_name");
		String brand_logo = multi.getFilesystemName("brand_logo");
		String brand_name = multi.getParameter("brand_name");
		
		String brand_id = "";
		brand_id = country_name + "_" + brand_name;
		
		bdto.setCountry_name(country_name);
		bdto.setBrand_logo(brand_logo);
		bdto.setBrand_name(brand_name);
		bdto.setBrand_id(brand_id);
		
		//만약 브랜드 요청이 아닌 그냥 추가하는 거라면 = req_num == 0, 요청일시 req_num 값이 존재
		BrandDAO bdao = new BrandDAO();
		int check = -1;
		if(req_num == 0){
			check = bdao.insertNewBrand(bdto);
		}
		else {
			check = bdao.insertReqBrand(bdto, req_num);
		}
		
		if(check == 0){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('이미 존재하는 브랜드입니다.');");
			out.print("location.href=history.back()");
			out.print("</script>");
			out.close();
			return null;
		}
		
		forward.setPath("./Main.ad");
		forward.setRedirect(true);
		return forward;
	}
	
}
package net.admin.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import net.brand.db.BrandDAO;
import net.brand.db.BrandDTO;

public class UpdateBrandInfoAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//로그인 정보 가져오기
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("email");
		String usr_position = (String) session.getAttribute("usr_position");
		ActionForward forward = new ActionForward();
		if(user == null || !usr_position.equals("admin")){
			forward.setPath("./SneakerList.go");
			forward.setRedirect(true);
			return forward;
		}
		
		ServletContext context = request.getServletContext();
		String realPath = context.getRealPath("/brand_img_upload");
		//파일 크기 지정
		int maxSize = 30 * 1024 * 1024; //30MB
		
		MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "UTF-8");
		
		BrandDTO bdto = new BrandDTO();
		
		String country_name = multi.getParameter("country_name");
		String brand_logo = multi.getFilesystemName("brand_logo");
		String brand_name = multi.getParameter("brand_name");
		int brand_num = Integer.parseInt(multi.getParameter("brand_num"));
		
		//예전 brand_id
		String old_brand_id = multi.getParameter("brand_id");
		
		String brand_id = "";
		brand_id = country_name + "_" + brand_name;
		
		bdto.setCountry_name(country_name);
		bdto.setBrand_logo(brand_logo);
		bdto.setBrand_name(brand_name);
		bdto.setBrand_id(brand_id);
		bdto.setBrand_num(brand_num);
		
		BrandDAO bdao = new BrandDAO();
		bdao.updateBrandInfo(bdto, old_brand_id);
		
		forward.setPath("./BrandList.ad");
		forward.setRedirect(true);
		return forward;
	}
	
}

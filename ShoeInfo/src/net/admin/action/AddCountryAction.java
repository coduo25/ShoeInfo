package net.admin.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import net.country.db.CountryDAO;
import net.country.db.CountryDTO;

public class AddCountryAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//로그인 정보 가져오기
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("id");
		ActionForward forward = new ActionForward();
		if(!user.equals("admin")){
			forward.setPath("./Main.bo");
			forward.setRedirect(true);
			return forward;
		}
		
		// ---------------------------------------------------------------------------------------------------------------------------
		// 1. 파일 업로드 (이미지)
		ServletContext context = request.getServletContext();
		String realPath = context.getRealPath("/countryflag_img_upload");
		//System.out.println("파일이 저장되는곳 (서버의 HDD) :" + realPath);
		
		//파일 크기 지정
		int maxSize = 30 * 1024 * 1024; //30MB
		
		//파일 업로드(cos.jar)
		MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "UTF-8");
		System.out.println(multi.getParameter("country_flag"));
		// ---------------------------------------------------------------------------------------------------------------------------
		// 2. BrandDTO 객체 생성 (전달받은 정보를 저장)
		CountryDTO cdto = new CountryDTO();
		cdto.setCountry_region(multi.getParameter("country_region"));
		cdto.setCountry_name(multi.getParameter("country_name"));
		cdto.setCountry_code(multi.getParameter("country_code"));
		String image = multi.getFilesystemName("country_flag");
		cdto.setCountry_flag(image);
		
		CountryDAO cdao = new CountryDAO();
		cdao.insertNewCountry(cdto);
		
		// ---------------------------------------------------------------------------------------------------------------------------
		// 3. 페이지이동
		forward.setPath("./searchBrand.ad");
		forward.setRedirect(true);
		return forward;
	}
}

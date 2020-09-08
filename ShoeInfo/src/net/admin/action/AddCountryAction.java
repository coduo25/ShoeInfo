package net.admin.action;

import java.io.PrintWriter;

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
		String realPath = context.getRealPath("/countryflag_img_upload");
		
		int maxSize = 30 * 1024 * 1024; //30MB
		
		//파일 업로드(cos.jar)
		MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "UTF-8");

		CountryDTO cdto = new CountryDTO();
		cdto.setCountry_region(multi.getParameter("country_region"));
		cdto.setCountry_name(multi.getParameter("country_name").trim());
		cdto.setCountry_code(multi.getParameter("country_code").trim());
		String image = multi.getFilesystemName("country_flag");
		cdto.setCountry_flag(image);
		
		CountryDAO cdao = new CountryDAO();
		int check = -1;
		check = cdao.insertNewCountry(cdto);
		
		if(check == 0){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('이미 존재하는 국가입니다.');");
			out.print("location.href=history.back()");
			out.print("</script>");
			out.close();
			return null;
		} else if(check == -1){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('국가 추가 실패');");
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
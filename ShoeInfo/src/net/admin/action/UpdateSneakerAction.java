package net.admin.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.sneaker.db.SneakerDAO;
import net.sneaker.db.SneakerDTO;

public class UpdateSneakerAction implements Action{

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
		
		 request.setCharacterEncoding("UTF-8");
		
		//넘어온 새로운 정보 저장하기
		ServletContext context = request.getServletContext();
		String realPath = context.getRealPath("/sneaker_img_upload");
		//파일 크기 지정
		int maxSize = 30 * 1024 * 1024; //30MB
		
		//파일 업로드(cos.jar)
		MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "UTF-8");
		
		SneakerDTO sdto = new SneakerDTO();
		sdto.setNum(Integer.parseInt(multi.getParameter("num")));
		String old_model_stylecode = multi.getParameter("old_model_stylecode");
		
		sdto.setBrand(multi.getParameter("brand").trim());
		sdto.setSub_brand(multi.getParameter("sub_brand").trim());
		sdto.setBrand_index(multi.getParameter("brand_index").trim());
		String image1 = multi.getFilesystemName("file1");
		sdto.setImage(image1);
		
		//model_stylecode
		if(multi.getParameter("model_stylecode") == null || multi.getParameter("model_stylecode").isEmpty()){
			sdto.setModel_stylecode("UNKNOWN");
		}else {
			sdto.setModel_stylecode(multi.getParameter("model_stylecode").trim());
		}
		
		//model_name
		if(multi.getParameter("model_name") == null || multi.getParameter("model_name").isEmpty()){
			sdto.setModel_name("UNKNOWN");
		}else {
			sdto.setModel_name(multi.getParameter("model_name").trim());
		}
		
		//model_name_kr
		if(multi.getParameter("model_name_kr") == null || multi.getParameter("model_name_kr").isEmpty()){
			sdto.setModel_name_kr("UNKNOWN");
		}else {
			sdto.setModel_name_kr(multi.getParameter("model_name_kr").trim());
		}
		
		//model_colorway
		if(multi.getParameter("model_colorway") == null || multi.getParameter("model_colorway").isEmpty()){
			sdto.setModel_colorway("UNKNOWN");
		}else {
			sdto.setModel_colorway(multi.getParameter("model_colorway").trim());
		}
		
		//price
		if(multi.getParameter("price") == null || multi.getParameter("price").isEmpty()){
			sdto.setPrice(0);
		}else{
			sdto.setPrice(Integer.parseInt(multi.getParameter("price").trim()));
		}
		
		//출시일자
		String year = multi.getParameter("year");
		String month = multi.getParameter("month");
		String day = multi.getParameter("day");
		
		String release_date = year + "-" + month + "-" + day;
		sdto.setRelease_date(release_date);
		
		sdto.setRelease_status(multi.getParameter("release_status"));
		
		SneakerDAO asdao = new SneakerDAO();
		asdao.updateSneakerInfo(sdto, old_model_stylecode);
		
		//페이지이동
		forward.setPath("./SneakerDetail.go?model_stylecode="+sdto.getModel_stylecode()+"&num="+sdto.getNum());
		forward.setRedirect(true);
		return forward;
	}
}
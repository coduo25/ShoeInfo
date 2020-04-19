package net.admin.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.sneaker.db.SneakerDAO;
import net.sneaker.db.SneakerDTO;

public class AddSneakerAction implements Action {

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
		String realPath = context.getRealPath("/sneaker_img_upload");
		//System.out.println("파일이 저장되는곳 (서버의 HDD) :" + realPath);
		
		//파일 크기 지정
		int maxSize = 30 * 1024 * 1024; //30MB
		
		//파일 업로드(cos.jar)
		MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		// ---------------------------------------------------------------------------------------------------------------------------
		// 2. SneakerDTO 객체 생성 (전달받은 정보를 저장)
		SneakerDTO sdto = new SneakerDTO();
		
		sdto.setBrand(multi.getParameter("brand"));
		sdto.setSub_brand(multi.getParameter("sub_brand"));
		sdto.setBrand_index(multi.getParameter("brand_index"));
		String image = multi.getFilesystemName("file1");
		sdto.setImage(image);
		sdto.setModel_stylecode(multi.getParameter("model_stylecode"));
		sdto.setModel_name(multi.getParameter("model_name"));
		sdto.setModel_colorway(multi.getParameter("model_colorway"));
		sdto.setPrice(Integer.parseInt(multi.getParameter("price")));
		sdto.setRelease_date(multi.getParameter("release_date"));
		
		SneakerDAO asdao = new SneakerDAO();
		asdao.insertSneaker(sdto);

		// ---------------------------------------------------------------------------------------------------------------------------
		// 3. 페이지이동
		forward.setPath("./Main.ad");
		forward.setRedirect(true);
		return forward;
	}
}
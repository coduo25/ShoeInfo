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
		String user = (String) session.getAttribute("id");
		ActionForward forward = new ActionForward();
		if(!user.equals("admin")){
			forward.setPath("./Main.bo");
			forward.setRedirect(true);
			return forward;
		}
		
		//넘어온 새로운 정보 저장하기
		ServletContext context = request.getServletContext();
		String realPath = context.getRealPath("/sneaker_img_upload");
		//파일 크기 지정
		int maxSize = 30 * 1024 * 1024; //30MB
		
		//파일 업로드(cos.jar)
		MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "UTF-8");
		
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
		asdao.updateSneakerInfo(sdto);
		
		//페이지이동
		forward.setPath("./SneakerDetail.go?model_stylecode="+sdto.getModel_stylecode());
		forward.setRedirect(true);
		return forward;
	}
}

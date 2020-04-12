package net.admin.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.admin.db.AdminSneakerDAO;
import net.sneaker.db.SneakerDTO;

public class AddSneakerAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//�α��� ���� ��������
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("id");
		ActionForward forward = new ActionForward();
		if(!user.equals("admin")){
			forward.setPath("./Main.bo");
			forward.setRedirect(true);
			return forward;
		}

		// ---------------------------------------------------------------------------------------------------------------------------
		// 1. ���� ���ε� (�̹���)
		ServletContext context = request.getServletContext();
		String realPath = context.getRealPath("/sneaker_img_upload");
		//System.out.println("������ ����Ǵ°� (������ HDD) :" + realPath);
		
		//���� ũ�� ����
		int maxSize = 30 * 1024 * 1024; //30MB
		
		//���� ���ε�(cos.jar)
		MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		// ---------------------------------------------------------------------------------------------------------------------------
		// 2. SneakerDTO ��ü ���� (���޹��� ������ ����)
		SneakerDTO sdto = new SneakerDTO();
		
		sdto.setBrand(multi.getParameter("brand"));
		sdto.setSub_brand(multi.getParameter("sub_brand"));
		sdto.setBrand_index(multi.getParameter("brand_index"));
		String image = multi.getFilesystemName("file1") + "," + multi.getFilesystemName("file2") + "," + multi.getFilesystemName("file3");
		sdto.setImage(image);
		sdto.setModel_stylecode(multi.getParameter("model_stylecode"));
		sdto.setModel_name(multi.getParameter("model_name"));
		sdto.setModel_colorway(multi.getParameter("model_colorway"));
		sdto.setPrice(Integer.parseInt(multi.getParameter("price")));
		sdto.setRelease_date(multi.getParameter("release_date"));
		
		AdminSneakerDAO asdao = new AdminSneakerDAO();
		asdao.insertSneaker(sdto);

		// ---------------------------------------------------------------------------------------------------------------------------
		// 3. �������̵�
		forward.setPath("./Main.ad");
		forward.setRedirect(true);
		return forward;
	}
}

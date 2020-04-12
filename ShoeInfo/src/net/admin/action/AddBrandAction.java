package net.admin.action;

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
		String realPath = context.getRealPath("/brand_img_upload");
		//System.out.println("������ ����Ǵ°� (������ HDD) :" + realPath);
		
		//���� ũ�� ����
		int maxSize = 30 * 1024 * 1024; //30MB
		
		//���� ���ε�(cos.jar)
		MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "UTF-8");
		
		// ---------------------------------------------------------------------------------------------------------------------------
		// 2. BrandDTO ��ü ���� (���޹��� ������ ����)
		BrandDTO bdto = new BrandDTO();
		
		//�Ѿ�� �� �����ϱ�
		String country_name = multi.getParameter("country_name");
		String brand_logo = multi.getFilesystemName("brand_logo");
		String brand_name = multi.getParameter("brand_name");
		
		String brand_id = "";
		brand_id = country_name + "_" + brand_name;
		
		bdto.setCountry_name(country_name);
		bdto.setBrand_logo(brand_logo);
		bdto.setBrand_name(brand_name);
		bdto.setBrand_id(brand_id);
		
		BrandDAO bdao = new BrandDAO();
		bdao.insertNewBrand(bdto);
		
		// ---------------------------------------------------------------------------------------------------------------------------
		// 3. �������̵�
		forward.setPath("./searchBrand.ad");
		forward.setRedirect(true);
		return forward;
	}
	
}

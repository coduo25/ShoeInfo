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
		String realPath = context.getRealPath("/countryflag_img_upload");
		//System.out.println("������ ����Ǵ°� (������ HDD) :" + realPath);
		
		//���� ũ�� ����
		int maxSize = 30 * 1024 * 1024; //30MB
		
		//���� ���ε�(cos.jar)
		MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "UTF-8");
		System.out.println(multi.getParameter("country_flag"));
		// ---------------------------------------------------------------------------------------------------------------------------
		// 2. BrandDTO ��ü ���� (���޹��� ������ ����)
		CountryDTO cdto = new CountryDTO();
		cdto.setCountry_region(multi.getParameter("country_region"));
		cdto.setCountry_name(multi.getParameter("country_name"));
		cdto.setCountry_code(multi.getParameter("country_code"));
		String image = multi.getFilesystemName("country_flag");
		cdto.setCountry_flag(image);
		
		CountryDAO cdao = new CountryDAO();
		cdao.insertNewCountry(cdto);
		
		// ---------------------------------------------------------------------------------------------------------------------------
		// 3. �������̵�
		forward.setPath("./searchBrand.ad");
		forward.setRedirect(true);
		return forward;
	}
}

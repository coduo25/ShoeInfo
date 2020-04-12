package net.admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.brand.db.BrandDAO;
import net.country.db.CountryDAO;
import net.country.db.CountryDTO;

public class searchBrandAction implements Action{

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
		// DB��ü �����
		
		//��� ���� ����Ʈ �������� �Լ�
		CountryDAO cdao = new CountryDAO();
		List<CountryDTO> countryAllList = (List<CountryDTO>) cdao.getCountryAllList();
		
		//�귣�庰 ���� ����Ʈ �������� �Լ�
		BrandDAO bdao = new BrandDAO();
		List countryList = bdao.searchCountry();
		
		request.setAttribute("countryAllList", countryAllList);
		request.setAttribute("countryList", countryList);
		
		// ---------------------------------------------------------------------------------------------------------------------------
		// 3. �������̵�
		forward.setPath("admin/adminAddReleaseInfo.jsp");
		forward.setRedirect(false);
		return forward;
	}
}

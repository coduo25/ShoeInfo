package net.admin.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.SynthSeparatorUI;

import net.sneaker.db.SneakerDAO;
import net.sneaker.db.SneakerDTO;

/**
 * Servlet implementation class SneakerSearchServlet
 */
@WebServlet("/SneakerSearchServlet")
public class SneakerSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String model_name = request.getParameter("model_name");
		response.getWriter().write(getJSON(model_name));
	}

	public String getJSON(String model_name){
		if(model_name == null) {
			model_name = "";
		}
		
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		
		SneakerDAO sdao = new SneakerDAO();
		ArrayList<SneakerDTO> sneakerList = sdao.searchSneaker(model_name);
		for(int i=0; i<sneakerList.size(); i++){
			SneakerDTO sdto = sneakerList.get(i);
			result.append("[{\"value\": \"" + sdto.getImage() + "\"},");
			result.append("[{\"value\": \"" + sdto.getModel_name() + "\"},");
			result.append("[{\"value\": \"" + sdto.getModel_stylecode() + "\"},");
			result.append("[{\"value\": \"" + sdto.getPrice() + "\"},");
			result.append("[{\"value\": \"" + sdto.getRelease_date() + "\"},");
			result.append("[{\"value\": \"" + sdto.getRelease_status() + "\"}]");
		}
		result.append("]}");
		return result.toString();
	}
	
}

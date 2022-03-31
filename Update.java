package app;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.Dao;
import data.Ehdokkaat;

@WebServlet(
    name = "Update",
    urlPatterns = {"/update"}
)
public class Update extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Dao dao;
	public void init() {
		dao=new Dao("jdbc:mysql://localhost:3306/Ehdokkaatdatabase", "käyttunn", "ssana");
	}
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
	     throws IOException {
		response.sendRedirect("index.html");
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
	     throws IOException, ServletException {
		String id=request.getParameter("id");
		String vastaukset=request.getParameter("vastaukset");
		
		Ehdokkaat f=new Ehdokkaat(id, vastaukset);
		
		ArrayList<Ehdokkaat> list=null;
		if (dao.getConnection()) {
			list=dao.updateEhdokkaat(f);
		}
		
		request.setAttribute("Ehdokkaat", list);
		RequestDispatcher rd=request.getRequestDispatcher("/jsp/showehdokkaat.jsp");
		rd.forward(request, response);
	}
}
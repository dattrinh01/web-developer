package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.ContentObject;
import models.ContentDAO;

/**
 * Servlet implementation class AddContent
 */
public class AddContent extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ContentDAO contentDAO = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddContent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String title = request.getParameter("title");
		String brief = request.getParameter("brief");
		String content = request.getParameter("content");
		Integer id = (Integer) request.getSession().getAttribute("id");
		
		ContentObject addContent = new ContentObject(title, brief, content, id);
		
		contentDAO = new ContentDAO();
		try {
			contentDAO.createContent(addContent);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}

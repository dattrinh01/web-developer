package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.SearchDAO;

/**
 * Servlet implementation class Search
 */
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;
	SearchDAO searchDAO = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Search() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		searchDAO = new SearchDAO();
		String keyword = request.getParameter("search");
		System.out.println(keyword);
		try {
			int count = searchDAO.count(request.getParameter("search"));
			System.out.println(count);
			int pageSize = 10;
			int endPage = 0;
			endPage = count / pageSize;
			if (count % pageSize != 0) {
				endPage++;
			}
			request.getSession().setAttribute("end", endPage);
			request.getRequestDispatcher("searchResult.tiles?"+ "search="+ keyword + "&" +"page=1").forward(request, response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import beans.ContentObject;
import models.ContentDAO;

/**
 * Servlet implementation class EditContent
 */
public class EditContent extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ContentDAO contentDAO = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditContent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int contentID = Integer.parseInt(request.getParameter("contentID"));
			
		Gson gson = new Gson();
		contentDAO = new ContentDAO();
		try {
			ContentObject content = contentDAO.getContent(contentID);
			PrintWriter out = response.getWriter();
			out.print(gson.toJson(content));
			out.flush();
			out.close();
					
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
		String title = request.getParameter("title");
		String brief = request.getParameter("brief");
		String content = request.getParameter("content");
		int contentID = Integer.parseInt(request.getParameter("contentID"));
		
		ContentObject Content = new ContentObject(title, brief, content);
		
		contentDAO = new ContentDAO();
		try {
			contentDAO.updateContent(Content, contentID);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}

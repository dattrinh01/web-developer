package controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import beans.ProfileObject;
import models.UpdateProfileDAO;

/**
 * Servlet implementation class UpdateProfile
 */
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
    UpdateProfileDAO updateProfile = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Integer id = (Integer) request.getSession().getAttribute("id");
		Gson gson = new Gson();
		updateProfile = new UpdateProfileDAO();
		
		try {
			ProfileObject user = updateProfile.getUser(id);
			PrintWriter out = response.getWriter();
			out.print(gson.toJson(user));
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
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String phone = request.getParameter("phone");
		String description = request.getParameter("description");
		Integer id = (Integer) request.getSession().getAttribute("id");
		
			
		ProfileObject profile = new ProfileObject(fname, lname, phone, description, id);
		
		updateProfile = new UpdateProfileDAO();
		
		try {
			updateProfile.updateMember(profile);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}

}

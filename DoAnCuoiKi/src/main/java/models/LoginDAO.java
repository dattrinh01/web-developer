package models;

import java.sql.*;

import beans.LoginObject;

public class LoginDAO {
	public boolean validate(LoginObject login) throws ClassNotFoundException {
		boolean status = false;
		String SELECT_MEMBER =  "SELECT * FROM Member WHERE Email = ? AND Password = ?";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		// cau truy van + data
		// cau truy van tham chieu toi data
		try{
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DoAnCuoiKi?allowPublicKeyRetrieval=true&useSSL=false", "root", "root");
			PreparedStatement preparedStatement = conn.prepareStatement(SELECT_MEMBER);
			preparedStatement.setString(1, login.getEmail());
			preparedStatement.setString(2, login.getPassword());
			
			ResultSet rs = preparedStatement.executeQuery();
			status = rs.next();
		} catch(SQLException e)
		{
			System.out.println(e);
		}
		
		return status;
	}
	
	public int getID(LoginObject login) throws ClassNotFoundException {
		int id = Integer.valueOf(0);
		
		String SELECT_MEMBER =  "SELECT * FROM Member WHERE Email = ? AND Password = ?";
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		try{
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DoAnCuoiKi?allowPublicKeyRetrieval=true&useSSL=false", "root", "root");
			PreparedStatement preparedStatement = conn.prepareStatement(SELECT_MEMBER);
			preparedStatement.setString(1, login.getEmail());
			preparedStatement.setString(2, login.getPassword());
			
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()){
				id = rs.getInt(1);
				}
		} catch(SQLException e)
		{
			System.out.println(e);
		}
		
		return id;
	}
}

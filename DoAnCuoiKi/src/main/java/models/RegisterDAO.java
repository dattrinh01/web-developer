package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import beans.RegisterObject;

public class RegisterDAO {
	public boolean createMember(RegisterObject register) throws ClassNotFoundException {

		String CREATE_MEMBER = "INSERT INTO Member(Username, Password, Email) VALUES" + "(?, ?, ?)";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		try{
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DoAnCuoiKi?allowPublicKeyRetrieval=true&useSSL=false", "root", "root");
			PreparedStatement preparedStatement = conn.prepareStatement(CREATE_MEMBER);
			preparedStatement.setString(1, register.getUsername());
			preparedStatement.setString(2, register.getPassword());
			preparedStatement.setString(3, register.getEmail());
			
			preparedStatement.executeUpdate();
			return true;
		} catch(SQLException e)
		{
			System.out.println(e);
		}
		
		return false;
		
		
	}
}

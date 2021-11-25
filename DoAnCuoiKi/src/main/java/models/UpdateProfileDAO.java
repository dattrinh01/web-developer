package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import beans.ProfileObject;


public class UpdateProfileDAO {
public void updateMember(ProfileObject profile) throws ClassNotFoundException {
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		String UPDATE_MEMBER = "UPDATE Member SET Firstname = ?, Lastname = ?, Phone = ?, UpdateTime = ?, Description = ? WHERE id = ?";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		try{
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DoAnCuoiKi?allowPublicKeyRetrieval=true&useSSL=false", "root", "root");
			PreparedStatement preparedStatement = conn.prepareStatement(UPDATE_MEMBER);
			preparedStatement.setString(1, profile.getFname());
			preparedStatement.setString(2, profile.getLname());
			preparedStatement.setString(3, profile.getPhone());
			preparedStatement.setTimestamp(4, timestamp);
			preparedStatement.setString(5, profile.getDescription());
			preparedStatement.setInt(6, profile.getId());
			
			preparedStatement.executeUpdate();
		} catch(SQLException e)
		{
			System.out.println(e);
		}
		
	}

public ProfileObject getUser(Integer id) throws ClassNotFoundException{
		ProfileObject user = new ProfileObject();
		
		String GET_USER = "SELECT Firstname, Lastname, Email, Phone, Description FROM Member WHERE id = ?";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		try{
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DoAnCuoiKi?allowPublicKeyRetrieval=true&useSSL=false", "root", "root");
			PreparedStatement preparedStatement = conn.prepareStatement(GET_USER);
			preparedStatement.setInt(1, id);
			
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()) {
				user.setFname(rs.getString(1));
				user.setLname(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPhone(rs.getString(4));
				user.setDescription(rs.getString(5));
			}
		} catch(SQLException e)
		{
			System.out.println(e);
		}
		
		return user;
	
		
	}
}

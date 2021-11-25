package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.ContentObject;

public class SearchDAO {
	public int count(String txtSearch) throws ClassNotFoundException {
		String regex = "%" + txtSearch + "%";
		String CONTENT_QUANTITY =  "SELECT COUNT(*) FROM Content WHERE Title like ?";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		try {
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DoAnCuoiKi?allowPublicKeyRetrieval=true&useSSL=false", "root", "root");
			PreparedStatement preparedStatement = conn.prepareStatement(CONTENT_QUANTITY);
			preparedStatement.setString(1, regex);
			
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return 0;
	}
	
	public List<ContentObject> getContent(String txtSearch, int index, int size) throws ClassNotFoundException {
		List<ContentObject> List = new ArrayList<>();
		String query = "SELECT * FROM Content WHERE Title like ? LIMIT ?, ?";
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		try {
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DoAnCuoiKi?allowPublicKeyRetrieval=true&useSSL=false", "root", "root");
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			preparedStatement.setString(1, "%" + txtSearch + "%");
			preparedStatement.setInt(2, index-1);
			preparedStatement.setInt(3, (index - 1)*3 + 3);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				ContentObject content = new ContentObject();
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return List;
		
	}
}

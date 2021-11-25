package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import beans.ContentObject;

public class ContentDAO {
public void createContent(ContentObject content) throws ClassNotFoundException {
		
		String CREATE_CONTENT = "INSERT INTO Content(Title, Brief, Content, AuthorID) VALUES" + "(?, ?, ?, ?)";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		try{
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DoAnCuoiKi?allowPublicKeyRetrieval=true&useSSL=false", "root", "root");
			PreparedStatement preparedStatement = conn.prepareStatement(CREATE_CONTENT);
			preparedStatement.setString(1, content.getTitle() );
			preparedStatement.setString(2, content.getBrief());
			preparedStatement.setString(3, content.getContent());
			preparedStatement.setInt(4, content.getId());
			
			preparedStatement.executeUpdate();
		} catch(SQLException e)
		{
			System.out.println(e);
		}
		
	}

public void updateContent(ContentObject content, int contentID) throws ClassNotFoundException {
		String UPDATE_CONTENT = "UPDATE Content SET Title = ?, Brief = ?, Content = ?, UpdateTime = ? WHERE id = ?";
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		try{
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DoAnCuoiKi?allowPublicKeyRetrieval=true&useSSL=false", "root", "root");
			PreparedStatement preparedStatement = conn.prepareStatement(UPDATE_CONTENT);
			preparedStatement.setString(1, content.getTitle() );
			preparedStatement.setString(2, content.getBrief());
			preparedStatement.setString(3, content.getContent());
			preparedStatement.setTimestamp(4, timestamp);
			preparedStatement.setInt(5, contentID);
			
			preparedStatement.executeUpdate();
		} catch(SQLException e)
		{
			System.out.println(e);
		}
	}

public ContentObject getContent(Integer id)throws ClassNotFoundException {
	ContentObject content = new ContentObject();
	String GET_CONTENT = "SELECT Title, Brief, Content FROM Content WHERE id = ?";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	try{
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DoAnCuoiKi?allowPublicKeyRetrieval=true&useSSL=false", "root", "root");
		PreparedStatement preparedStatement = conn.prepareStatement(GET_CONTENT);
		preparedStatement.setInt(1, id);
		
		ResultSet rs = preparedStatement.executeQuery();
		if(rs.next()) {
			content.setTitle(rs.getString(1));
			content.setBrief(rs.getString(2));
			content.setContent(rs.getString(3));
		}
	} catch(SQLException e)
	{
		System.out.println(e);
	}
	
	return content;
 }
}

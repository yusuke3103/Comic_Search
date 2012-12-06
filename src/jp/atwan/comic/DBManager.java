package jp.atwan.comic;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.annotation.WebServlet;


@WebServlet("/DBManager")
public class DBManager {
	public static Connection getConnection() {
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/Comic_DB","root","root");
			return con;
		} catch (Exception e ){
			throw new IllegalStateException(e);
		}
	}
	
	public static void main (String[] args) throws Exception{
		Connection con = getConnection();
		System.out.println("con=" + con);
		con.close();
	}
}
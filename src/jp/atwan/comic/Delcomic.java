package jp.atwan.comic;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/Delcomic")
public class Delcomic extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public Delcomic(){
		super();
	}
	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		
		try{
			Connection con = DBManager.getConnection();
			Statement stm = con.createStatement();
			
			try{
				int res = stm.executeUpdate("delete from t_comic where id = \"" + id + "\"");
				System.out.println(res);
			}catch (Exception ex){
				ex.printStackTrace();
			}
			stm.close();
			}catch (SQLException e){
				e.printStackTrace();
		}
		
		response.sendRedirect("../admin/index.html");
	}
}
package jp.atwan.comic;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/Addcomic")
public class Addcomic extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Addcomic(){
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		String title = request.getParameter("title");
		String Phonetic = request.getParameter("phonetic");
		String author = request.getParameter("author");
		String publisher = request.getParameter("publisher");
		String latest = request.getParameter("latest");
		String shelf = request.getParameter("shelf");
		String completed = request.getParameter("completed");

		try{
			Connection con = DBManager.getConnection();
			Statement stm = con.createStatement();

			try{
				int res = stm.executeUpdate("insert into t_comic set " + "title = \"" + title + "\"" +"," + " phonetic = \"" + Phonetic +"\",author = \"" + author + "\"," +"publisher = \"" + publisher +"\",latest = \"" + latest + "\", shelf = \"" + shelf + "\",completed = \"" + completed + "\"");
			System.out.println(res);
			}catch (Exception ex){
				ex.printStackTrace();
			}
			stm.close();
		}catch (SQLException e){
			e.printStackTrace();
		}

		response.sendRedirect("./admin/index.html");
	}
}
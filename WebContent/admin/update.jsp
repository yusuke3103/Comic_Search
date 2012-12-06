<%@page import="java.sql.*"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="jp.atwan.comic.DBManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	String id = request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>編集</title>
</head>
<body>


<form action = "Update" method = "post" >
<table>
<tr>
<%
		try {
			Connection con = DBManager.getConnection();

			String sql = ("Select * from t_comic where id = " + id + ";");
			Statement stm = con.createStatement();


			ResultSet rs = stm.executeQuery(sql);
			while(rs.next()){
				out.println("<input type = hidden value = " + rs.getString(1));
				out.println("<td>ID:</td><td>" + rs.getString(1) + "</td>");
				out.println("</tr><tr>");
				out.println("<td>タイトル:</td><td>"+ rs.getString(2) + "</td>");
				out.println("</tr><tr>");
				out.println("<td>フリガナ:</td><td>" + rs.getString(3) + "</td>");
				out.println("</tr><tr>");
				out.println("<td>作者:</td><td>"+ rs.getString(4) + "</td>");
				out.println("</tr><tr>");
				out.println("<td>出版社:</td><td>" + rs.getString(5) + "\"</td>");
				out.println("</tr><tr>");
				out.println("<td>最新刊:</td><td><input type = number name = latest value = \"" + rs.getString(6) + "\"></td>");
				out.println("</tr><tr>");
				out.println("<td>場所:</td><td><input type = number name = shelf min=1 max=88　value = \"" + rs.getString(7) + "\"></td>");
				out.println("</tr><tr>");
				out.println("<td>完結:</td><td><select name= completed >");
				if(rs.getString(8) == ""){
					out.println("<option value = \"\" selected>未完</option>");
					out.println("<option value= \"完\" > 完 </option>");
				}else{
					out.println("<option value = \"\">未完</option>");
					out.println("<option value= \"完\" selected> 完 </option>");
				}
				out.println("</select>");
				out.println("</td></tr>");
			}
			stm.close();
			rs.close();
			con.close();
		} catch (SQLException e1) {
			out.println("SQLException	:" + e1.getMessage() + "<br>");
			out.println("SQLState	:" + e1.getSQLState() + "<br>");
			out.println("VendorError	:" + e1.getErrorCode() + "<br>");
			e1.printStackTrace(new PrintWriter(out));
		} catch (Exception e2) {
			e2.printStackTrace(new PrintWriter(out));
		}
	%>
	<tr>
	<td></td>
	<td><input type="submit" value="送信"><a href="top.html"><input type="submit" value = "キャンセル"></a></td>
	</tr>
	</table>
	</form>
</body>
</html>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.*"%>
<%@page import="jp.atwan.comic.DBManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String keyword = request.getParameter("keyword");
	keyword = new String(keyword.getBytes("8859_1"), "UTF-8");
	System.out.println(keyword);
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
</head>
<body>
<h1>検索結果</h1>
<hr>
<p>
<%
	try{
		// インスタンス作成	
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		
		//DBに接続
		Connection con =DBManager.getConnection();
		
		
		// SQLを実行
		String sql = "select title, author,publisher,latest,url,completed from t_comic,t_shelf where t_comic.shelf=t_shelf.no and Phonetic LIKE '%" + keyword + "%';"; 
		System.out.println(sql);
		Statement stm = con.createStatement();
		ResultSet rs = stm.executeQuery(sql);

		//結果を表示
		out.println("<table border=\"1\">");
		out.println("<tr><th>タイトル</th><th>作者</th><th>出版社</th><th>最新刊</th><th>場所</th><th>完結</th></tr>");
		while(rs.next()){
			out.println("<tr><td align = center>");
			out.println(rs.getString("title"));				//タイトル
			out.println("</td><td>");
			out.println(rs.getString("author"));				//作者
			out.println("</td><td align = center>");
			out.println(rs.getString("publisher"));				//出版社
			out.println("</td><td align = center>");
			out.println(rs.getString("latest"));				//最新刊
			out.println("</td><td align = center>");
			out.println("<a href = " + rs.getString("url") + ">こちら</a>");				//棚番号
			out.println("</td><td align = center>");
			out.println(rs.getString("completed"));				//完結
			out.println("</td></tr>");
		}
		out.println("</table>");
		
		//DBから切断
		stm.close();
		rs.close();
		con.close();

		}catch (SQLException e1){
			out.println("SQLException	:" + e1.getMessage() + "<br>");
			out.println("SQLState	:" + e1.getSQLState() + "<br>");
			out.println("VendorError	:" + e1.getErrorCode() + "<br>");
			e1.printStackTrace(new PrintWriter(out));
	}catch(Exception e2){
		e2.printStackTrace(new PrintWriter(out));
	}
%>
</p>
</body>
</html>
	
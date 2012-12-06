<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>コミック管理</title>
</head>

<%
HttpSession ses = request.getSession();
String flg = (String) ses.getAttribute("login");
if ("true".equals(flg)) {
	out.println("<Meta http-equiv=\"refresh\" content=\"1;url=/Comic_Search/admin/top.html\"> ");
}else{
	out.println("<center>");
	out.println("<font color=\"red\">");
	out.println("ログインに失敗しました。<br>");
	out.println("IDかPWに不備があります。</font><hr>");
	out.println("<h1>ログイン</h1>");
	out.println("<form name=\"login\" method=\"POST\" action=\"/Comic_Search/Login\">");
	out.println("<table>");
	out.println("<tr>");
	out.println("<td>ID:</td>");
	out.println("<td><input type=\"text\" name=id></td>");
	out.println("</tr><tr>");
	out.println("<td>PW:</td>");
	out.println("<td><input type=\"password\" name=passwd></td>");
	out.println("</tr><tr><td>");
	out.println("<td align = \"right\"><input type=\"submit\" value=\"ログイン\"></td></tr>");
	out.println("</table>");
	out.println("</form>");
	out.println("</center>");
}
%>
</body>
</html>
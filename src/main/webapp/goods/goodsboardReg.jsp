<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>이곳에 왔따</h3>
<%
String gname = request.getParameter("gname");
String gdescribe = request.getParameter("gdescribe");
String gprice = request.getParameter("gprice");


Connection conn = null;
PreparedStatement pstmt = null;
String str = "";

String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@172.16.4.16:1521:xe";
String user = "hr";
String pas = "123456";

try {
	Class.forName(driver);
	conn = DriverManager.getConnection(url, user, pas);

	//인서트 작업

	String sql = "insert into goodsinfo values((select max(nvl(gnum,0))+1 from goodsinfo),?,?,?,systimestamp)";
	
	  /*  String sql="insert into notices(seq,title,writer,content,regdate,hit)";
       sql +=" values((select max(to_number(seq))+1 from notices)";
       sql +=",?,'cj',?,systimestamp,0)"; */
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, gname);
	pstmt.setString(2, gdescribe);
	pstmt.setString(3, gprice);

	//실행
	int result = pstmt.executeUpdate();
	System.out.println("result : " + result);

} catch (Exception e) {
	e.printStackTrace();
} finally {
	if (pstmt != null)try { pstmt.close();} catch (Exception e) {}
	if (conn != null)try { conn.close();} catch (Exception e) {}
}

response.sendRedirect("goodsboard.jsp");
%>

</body>
</html>
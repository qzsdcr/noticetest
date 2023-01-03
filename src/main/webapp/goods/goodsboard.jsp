<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	String driver="oracle.jdbc.driver.OracleDriver";
    	String url="jdbc:oracle:thin:@172.16.4.16:1521:xe";
    	String user="hr";
    	String pw="123456";
    	
    	

    	Class.forName(driver);
    	Connection conn=DriverManager.getConnection(url,user,pw);
    	String sql="select * from goodsinfo order by gnum desc";
    	
    	Statement st=conn.createStatement();
    	ResultSet rs=st.executeQuery(sql);
 
    
    
    %>
    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>goodgoodgoods</title>

</head>
<body>

<h3>goods</h3>

<a href=goodsboardRegPro.jsp>등록</a> 
<a href="goodsborderdel.jsp">삭제</a>
<table width="800">
	<tr>
		<td>번호</td>
		<td>이름</td>
		<td>설명</td>
		<td>가격</td>
		<td>시간</td>
	</tr>
<%
	while(rs.next()){
%>
	<tr>
		<td><%=rs.getInt("gnum") %></td>
		<td><a href="goodsboardDetail.jsp?c=<%=rs.getString("gnum") %>"><%=rs.getString("gname") %></td></a>
		<td><%=rs.getString("gdescribe") %></td>
		<td><%=rs.getInt("gprice") %></td>
		<td><%=rs.getDate(5)%></td>
		
	
	</tr>

<%
	}

%>

</table>


</body>
</html>

<%
	rs.close();
	st.close();
	conn.close();

%>
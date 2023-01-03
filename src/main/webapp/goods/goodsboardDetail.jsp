<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%
    String num=request.getParameter("c");
    if(num==null){
    	num="1";
    }
    
    
   	
    String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@172.16.4.16:1521:xe";
	String user="hr";
	String pw="123456";

 	Class.forName(driver);
	Connection conn=DriverManager.getConnection(url,user,pw);
	String sql="select * from goodsinfo where gnum=?";
	PreparedStatement pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, num);

	ResultSet rs=pstmt.executeQuery();



		rs.next();
    %> 
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<h3>goodgoods.jsp</h3>
<link rel="stylesheet" href="../css/good.css" />
<table class="twidth" border="1">
	<colgroup style="margin: 0 auto;">
		<col width="15%"/>
		<col width="35%"/>
		<col width="15%"/>
		<col width="35%"/>
	</colgroup>
	<caption>Describe</caption>
	<tbody>
		<tr>
		 	<th class="left">글번호</th>
			<td><%=rs.getString("gnum") %></td>
			<th class="left">가격</th>
			<td><%=rs.getString("gprice") %></td> 
	
		</tr>	
		<tr>
			<th class="left">작성자</th>
			<td><%=rs.getString("gname") %></td>
			<th class="left">작성시간</th>
			<td><%=rs.getDate("gdate") %></td>
			
		
		</tr>	
		<tr>
			<th class="left">상품설명</th>
		<td colspan="3" id="gdescribe"><%=rs.getString("gdescribe") %></td>
		
		
		</tr>	
		
	</tbody>


</table>
<a href="goodsboard.jsp"><button>뒤로가기</button></a>

</body>
</html>

 <%

	rs.close();
	pstmt.close();
	conn.close();

%> 
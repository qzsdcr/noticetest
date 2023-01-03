<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  
    <%
    String num=request.getParameter("gnum");
    if(num==null){
    	num="1";
    }
    
    	String driver="oracle.jdbc.driver.OracleDriver";
    	String url="jdbc:oracle:thin:@172.16.4.16:1521:xe";
    	String user="hr";
    	String pw="123456";
    	
    	

    	Class.forName(driver);
    	Connection conn=DriverManager.getConnection(url,user,pw);
    	String sql="select * from goodsinfo where gnum="+num;
    	
    	Statement st=conn.createStatement();
    	ResultSet rs=st.executeQuery(sql);
    	
 
    	rs.next();
    
    %>
</head>
<body>
	

	<h3>글쓰기</h3>
	<form action="goodsboardReg.jsp" method="post">
	<dl>
		
		<dt>상품명</dt>
		<td>
			<input type="text" name="gname" />
					
		</td>
		<dt>가격</dt>
		<td>
			<input type="number" name="gprice" />
					
		</td>
	</dl>	

	<h5>상품명 간략소개</h5>
	<div>
		<textarea name="gdescribe" id="gdescribe" class="gdescribe">이곳에 상품의 설명을 쓰세요</textarea>
	</div>
	<input type="submit" value="save" />
	<input type="button" value="cancel" class="cancel"/>
	<a href="goodsboard.jsp"><input type="button" value="menu" class="menu" /></a>
	
	</form>
</body>
</html>
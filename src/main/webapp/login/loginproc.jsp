<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("utf-8");
%>
<%

String id=request.getParameter("id");
String pwd=request.getParameter("password");



String driver="oracle.jdbc.driver.OracleDriver";
String url="jdbc:oracle:thin:@172.16.4.16:1521:xe";
String user="hr";
String pw="123456";



Class.forName(driver);
Connection conn=DriverManager.getConnection(url,user,pw);
String sql="select id,pwd from nmember where id=?";
	
PreparedStatement pstmt=conn.prepareStatement(sql);
pstmt.setString(1, id);

ResultSet rs=pstmt.executeQuery();
/* rs.next();
System.out.println("id:"+rs.getString("id")+":: pwd"+rs.getString(2));
 */
 
 
 
 
// 아이디 일치판정
String ypass="";
 int x=-1;
 String msg="";
 



if(rs.next()){//아이디는 존재
	 ypass=rs.getString("pwd");
	if(ypass.equals(pwd))//패스워드 일치
		x=1;
	else //패스 불일치
		x=0;
 }else{//아이디 없다면 
	 /* System.out.println("아이디 없음"); */
	 x=-1;
 }	 
if(x==1){
	//로그인성공 세션에 저장 main으로 
	session.setAttribute("sessionID", id);
	msg="../index.jsp";
}else if(x==0){
	msg="loginform.jsp?msg=0";
	
}else{
	msg="loginform.jsp?msg=-1";
	
}
response.sendRedirect(msg);


 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
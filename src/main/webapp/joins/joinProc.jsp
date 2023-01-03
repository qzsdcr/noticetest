<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String id=request.getParameter("id");
String pwd=request.getParameter("pwd");
String pwd2=request.getParameter("pwd2");
String name=request.getParameter("name");
String gender=request.getParameter("gender");
String year=request.getParameter("year");
String month=request.getParameter("month");
String day=request.getParameter("day");
String birth=String.format("%s-%s-%s",year,month,day);


String islunar=request.getParameter("islunar");
String cphone=request.getParameter("cphone");
String email=request.getParameter("email");
/* String habit=request.getParameter("habit"); */
String[] habits=request.getParameterValues("habit");
String habit="";
if(habits!=null){
for(int i=0;i<habits.length;i++){
	habit+=habits[i];
	if(habits.length>i+1){
		habit+=",";
	}
}
}
//에러체크  id가 null , 패스워드 일치
List <String> errors=new ArrayList();

if(id==null || id.equals(""))//아이디 입력확인
	errors.add("아이디없음");
if(!pwd.equals(pwd2) || pwd==null || pwd.equals(""))//패스워드 불일치
	errors.add("패스워드 불일치");



if(errors.size()>0){//에러가 있다면
	//errors를 가지고 request에 담아서 join으로 가겠다.
	request.setAttribute("errors", errors);
	request.getRequestDispatcher("join.jsp").forward(request,response);
}else{
	

//회원가입후 index.jsp로 돌아가기 
	String driver="oracle.jdbc.driver.OracleDriver";
    	String url="jdbc:oracle:thin:@172.16.4.16:1521:xe";
    	String user="hr";
    	String pw="123456";
    	
    	

    	Class.forName(driver);
    	Connection conn=DriverManager.getConnection(url,user,pw);
    	String sql=" insert into nmember(id,pwd,name,gender,";
    		sql+=" birth,is_lunar,cphone,email,habit,regdate)";
    		sql+=" values(?,?,?,?,?,";
    		sql+="?,?,?,?,sysdate)";
    		
    	PreparedStatement pstmt=conn.prepareStatement(sql);
    	pstmt.setString(1, id);
    	pstmt.setString(2, pwd);
    	pstmt.setString(3, name);
    	pstmt.setString(4, gender);
    	pstmt.setString(5, birth);
    	pstmt.setString(6, islunar);
    	pstmt.setString(7, cphone);
    	pstmt.setString(8, email);
    	pstmt.setString(9, habit);
    	
    	pstmt.executeUpdate();

response.sendRedirect("../index.jsp");
}
%>

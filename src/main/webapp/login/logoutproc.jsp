<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("utf-8");
%>
<%
//세션제거 ,다시 로그인 폼으로 돌려보내기

session.invalidate();
response.sendRedirect("loginform.jsp");

%>





<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>로그아웃프락</h3>
</body>
</html>

<%@page import="notice.dao.NoticeDao"%>
<%@page import="notice.vo.Notice"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
request.setCharacterEncoding("utf-8");


String num=request.getParameter("c");

Notice no=new Notice();
no.setSeq(num);

NoticeDao dao=new NoticeDao();
//int cnt=dao.delete(no);
int cnt=dao.delete(num);


	 if(cnt>0){
		response.sendRedirect("notice.jsp");
	}



%>


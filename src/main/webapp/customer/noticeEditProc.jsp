
<%@page import="notice.dao.NoticeDao"%>
<%@page import="notice.vo.Notice"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
/* request.setCharacterEncoding("utf-8");


String num=request.getParameter("c");
String title=request.getParameter("title");
String content=request.getParameter("content");

Notice no=new Notice();
no.setTitle(title);
no.setContent(content);
no.setSeq(num);

NoticeDao dao=new NoticeDao();
int cnt=dao.update(no);




	 if(cnt>0){
		response.sendRedirect("noticeDetail.do?c="+num);
	}


 */
%>


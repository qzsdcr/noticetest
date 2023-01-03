
<%@page import="notice.dao.NoticeDao"%>
<%@page import="notice.vo.Notice"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
 /*    String num=request.getParameter("c");
    if(num==null){
    	num="1";
    } 
    
    NoticeDao dao=new NoticeDao();
    Notice n=dao.getNoice(num);
   	 */
/*     String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@172.16.4.16:1521:xe";
	String user="hr";
	String pw="123456";

 	Class.forName(driver);
	Connection conn=DriverManager.getConnection(url,user,pw);
	String sql="select * from notices where seq=?";
	PreparedStatement pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, num);

	ResultSet rs=pstmt.executeQuery();

	 while(rs.next()){ 

		rs.next(); */
    %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/nstyle.css" />
</head>
<body>
<h3>noticeEdit.jsp</h3>

<form action="noticeEditProc.do?c=${n.seq }" method="post">

<table class="twidth">
	<colgroup>
		<col width="15%"/>
		<col width="35%"/>
		<col width="5%"/>
		<col width="35%"/>
	</colgroup>
	<caption>Detail</caption>
	<tbody>
	<tr>
			<th class="left">글번호</th>
			<td>${n.seq }</td>
			<th class="left">조회수</th>
			<td>${n.hit }</td>
		
		</tr>	
		<tr>
			<th class="left">작성자</th>
			<td>${n.writer }</td>
			<th class="left">작성시간</th>
			<td>${n.regdate }</td>
		
		</tr>	
		<tr>
			<th class="left">제목</th>
			<td colspan="3" id="title">
				<input type="text" name="title" value="${n.title }" />		
			
			</td>
			
		
		</tr>	
		<tr>
			<th class="left">내용</th>
			<td colspan="3" id="content">
			<textarea class="txt" name="content">${n.content }</textarea>	
				</td>
		
		</tr>	
		<tr>
			<th class="left">첨부</th>
			<td colspan="3" id="addfile">첨부</td>
			
		
		</tr>	
	</tbody>

</table>
	<div>
		<input type="hidden" name="c" value="${n.seq }" />
		<input type="submit" value="수정" />
		<a href="noticeDetail.do?c=${n.seq }">취소</a>
	</div>


</form>

<!-- <a href="notice.jsp">목록</a> -->
</body>
</html>


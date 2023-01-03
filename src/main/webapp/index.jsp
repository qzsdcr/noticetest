<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



</head>
<body>

<script type="text/javascript">

	function logoutproc() {
		location.href="login/logoutproc.jsp";
		
	}

</script>
 <h1>인덱스란다 </h1>
 <b><font size="3">메인화면입니당.</font></b>
 <%
 if(session.getAttribute("sessionID")==null){//로그인이 안된상태
	 
 }else{ //로그인상태
%>
<h3>
	<font color="blue"><%=session.getAttribute("sessionID") %></font>
	님 로그인 성공 환영합니다.
</h3>
<br />
<input type="button" value="logout" onclick="logoutproc();"/>


<%	 
 }
 %>
<br />
<a href="customer/notice.jsp">목록창</a> 
 
 
</body>
</html>
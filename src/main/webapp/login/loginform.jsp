<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/join_style.css" />
</head>
<body>

<script>
function checkVal() {
		/* alert("check") */
		/* return false; */
		inputForm=eval("document.logininfo");
		if(!inputForm.id.value){
			alert("아이디없음");
			return false;
		}
		if(!inputForm.password.value){
			alert("비밀번호 없음");
			return false;
		}
	}

	function goJoinForm() {
		location.href="../joins/join.jsp";
	}


</script>



<div id="wrap">
	<form action="loginproc.jsp" method="post" name="logininfo" onsubmit="return checkVal();">
		<img src="../img/welcome.jpg" id="wel_img"alt="welcome" />
		<br /><br />
		<table>
			<tr>
			<td bgcolor="skyblue" colspan="2">LOGIN</td>				
			</tr>
			<tr>
			<td bgcolor="skyblue" >아이디</td>				
			<td>
				<input type="text" name="id" maxlength="50" />
			</td>
			</tr>
		<tr>
			<td bgcolor="skyblue" >비밀번호</td>				
			<td>
				<input type="password" name="password" maxlength="50" />
			</td>
			</tr>
		
		
		</table>
		<br />
		<input type="submit" value="login"/>
		<input type="button" value="join" onclick="goJoinForm();"/>
	
	
	
	</form>

	<%
	//msg를 받아서 구분
	String mymsg=request.getParameter("msg");
	if(mymsg!=null && mymsg.equals("0")){
		out.print("<br>");
		out.print("<font color='red' size='2'>비밀번호 확인</font>");
	}else if(mymsg!=null && mymsg.equals("-1")){
		out.print("<br>");
		out.print("<font color='red' size='2'>아이디 확인</font>");
	}
		
	%>


</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>글쓰기</h3>
	<form action="noticeRegPro.jsp" method="post">
	<dl>
		<dt>제목</dt>
		<td>
			<input type="text" name="title" />		
		</td>
	</dl>	
	<dl>
		<dt>첨부파일</dt>	
		<dt>
			<input type="file" name="txtFile" />
		</dt>
	</dl>
	<div>
		<textarea name="content" id="txtcontent" class="txtcontent">aaa</textarea>
	</div>
	<input type="submit" value="save" />
	<input type="button" value="cancel" class="cancel"/>
	<a href="notice.jsp"><input type="button" value="menu" class="menu" /></a>
	
	</form>
</body>
</html>
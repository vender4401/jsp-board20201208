<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<h1>회원 탈퇴</h1>
		<form action="removeMember.do" method="post">
		 암호 : <input type="password" name="password" /> <br />
		 <input type="submit" value="탈퇴하기" />
		</form>
</div>
</body>
</html>
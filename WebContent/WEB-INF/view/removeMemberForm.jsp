<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<title>Insert title here</title>
</head>
<body>
  <u:navbar />
  
  <div class="container">
  	<div class="row">
  		<div class="col-3"></div>
  		<div class="col-6">
          <h1>회원 탈퇴</h1>
          <form action="${root }/removeMember.do" method="post">
            <div class="form-group">
              <label for="input1-password">암호</label>
              <input type="password" class="form-control" id="input1-password" name="password" />
              <c:if test="${errors.password }">
                <small class="form-text text-muted">
                  패스워드를 입력해주세요.
                </small>
              </c:if>
              <c:if test="${errors.invalidPassword }">
                <small class="form-text text-muted">
                  패스워드가 일치하지 않습니다.
                </small>
              </c:if>
            </div>
            <button type="submit" class="btn btn-primary">회원 탈퇴</button>
            
          </form>
  		</div>
  	</div>
  </div>
  
</body>
</html>







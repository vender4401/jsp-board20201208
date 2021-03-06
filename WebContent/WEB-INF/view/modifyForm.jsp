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
<u:navbar></u:navbar>

<div class="container">
	<div class="row">
		<div class="col-3"></div>
		<div class="col-6">
          <h1>게시글 수정 <small><i class="fas fa-hashtag"></i> ${modReq.articleNumber }</small></h1>
          <form action="${root }/article/modify.do" method="post">
            <input type="text" name="no" value="${modReq.articleNumber }" hidden >
          
            <div class="form-group">
              <label for="input1-title">제목</label>
              <input id="input1-title" name="title" type="text" value="${modReq.title }" class="form-control"/>
            
              <c:if test="${errors.title }">
                <small class="form-text text-muted">
                  제목을 입력하세요.
                </small>
              </c:if>
            </div>
            <div class="form-group">
              <label for="textarea1-content">내용</label>
              <textarea class="form-control" name="content" id="textarea1-content" cols="30" rows="10" >${modReq.content }</textarea>
            </div>
            <button type="submit" class="btn btn-primary">글 수정</button>
          </form>    
        </div>
	</div>
</div>

</body>
</html>



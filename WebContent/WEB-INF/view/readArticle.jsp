<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<title>Insert title here</title>
<style>
.form-control[readonly] {
  background-color: #fff;
}
</style>
</head>
<body>
<u:navbar></u:navbar>

<div class="container">
  <div class="row">
    <div class="col-3"></div>
  	<div class="col-6">
      <h1>게시글 보기 <small><i class="fas fa-hashtag"></i> ${articleData.article.number }</small> </h1>
      
      <div class="content-container">
        <div class="form-group">
          <label for="input1-title">제목</label>
          <div class="input-group">
            <input id="input1-title" type="text" value="${articleData.article.title }" class="form-control" readonly />
            <div class="input-group-append">
              <span class="input-group-text"> ${articleData.article.writer.name }</span>
              <span class="input-group-text"><i class="fas fa-user-edit fa-fw"></i></span>
            </div>
          </div>
        </div>
        <div class="form-group">
          <label for="textarea1-content">내용</label>
          <textarea class="form-control" name="" id="textarea1-content" cols="30" rows="10" readonly >${articleData.content.content }</textarea>
        </div>
      </div>
      <c:if test="${authUser.id == articleData.article.writer.id}">
        <div class="button-container mt-3">
          <a class="btn btn-primary" href="${root }/article/modify.do?no=${articleData.article.number }"><i class="fas fa-edit"></i> 수정</a>
          <a class="btn btn-danger" href="${root }/article/delete.do?no=${articleData.article.number }"><i class="fas fa-trash-alt"></i> 삭제</a>
        </div>
      </c:if>
    </div>
  </div>
</div>

<hr />

  <div class="container">
    <div class="row">
      <div class="col-3"></div>
      <div class="col-6">

        <%-- 
    로그인 한 경우만
    댓글 폼 출력
    
    --%>
        <u:replyForm articleNo="${articleData.article.number }" />

        <u:listReply />
      </div>
    </div>
  </div>
</body>
</html>








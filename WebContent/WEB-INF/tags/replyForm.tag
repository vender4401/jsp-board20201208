<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="articleNo" type="java.lang.Integer" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${not empty sessionScope.authUser }">
  <div>
    <form action="${root }/reply/add.do" method="post">
      <input type="number" value="${ articleNo}" name="no" hidden />
      <input type="number" value="${ param.pageNo}" name="pageNo" hidden />
    
      <div class="input-group mb-3">
        <input type="text" name="body" class="form-control" placeholder="새로운 댓글을 입력해주세요.">
        <div class="input-group-append">
          <button class="btn btn-outline-secondary" type="submit"><i class="fas fa-fw fa-comment-dots"></i></button>
        </div>
      </div>
    </form>
  </div>
</c:if>
<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
  <c:forEach items="${replyList }" var="reply">
  <div class="input-group mb-3">
    <input type="text" readonly class="form-control" value="${reply.body }" >
    <div class="input-group-append">
      <span class="input-group-text">${reply.memberId }</span>
      <span class="input-group-text"><i class="far fa-fw fa-comment-dots"></i></span>
    </div>
  </div>
  
  </c:forEach>
</div>
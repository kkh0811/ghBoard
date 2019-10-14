<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update 페이지</title>
</head>
<body>
<h2 style="text-align:center; margin-bottom:20px;"> 게시글 수정 </h2>
 
<div class="container" style="width:30%;">
    <form action="/updateProc" method="post">
      <div class="form-group">
        <label for="subject">제목</label>
        <input type="text" class="form-control" id="title" name="title" value="${detail.title}">
      </div>
      <div class="form-group">
        <label for="content">내용</label>
        <textarea class="form-control" id="content" name="content" rows="3">${detail.content}</textarea>
      </div>
      <input type="hidden" name="id" value="${id}"/>
      <button type="submit" class="btn btn-primary">수정</button>
    </form>
</div>
<%@ include file="bootstrap.jsp" %>
</body>
</html>

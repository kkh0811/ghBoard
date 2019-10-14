<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2 style="text-align:center;"> 게시글 상세 </h2>
<div class="container" style="text-align:center;">
    <form action="/insertProc" method="post">
      <div class="form-group">
        <label>제목</label>
        <p>${detail.title}</p>
      </div>
      <div class="form-group">
        <label>작성자</label>
        <p>${detail.writer}</p>
      </div>
      <div class="form-group">
        <label>작성날짜</label>
        <p>${detail.createdDate}</p>
      </div>
      <div class="form-group">
        <label>내용</label>
        <p>${detail.content}</p>
      </div>
      <!-- <button type="submit" class="btn btn-primary">작성</button> -->
    </form>
    <button class="btn btn-primary" onclick="location.href='/update/${detail.id}'">수정</button> 
	<button class="btn btn-danger" onclick="location.href='/delete/${detail.id}'">삭제</button> 
</div>


<%@ include file="bootstrap.jsp" %>
</body>
</html>

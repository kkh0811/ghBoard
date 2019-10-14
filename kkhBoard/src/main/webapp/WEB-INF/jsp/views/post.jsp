<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>post-List</title>
</head>
<body>

<h2> 게시글 목록 </h2>
<button class="btn btn-primary" onclick="location.href='/insert'">글쓰기</button>
<div class="container">
<table class="table table-hover">
<tr>
<th>id</th>
<th>title</th>
<th>content</th>
<th>writer</th>
<th>createdDate</th>
<th>modifiedDate</th>
<th>statusT_F</th>
</tr>
		<c:forEach items="${list}" var="post">
		<tr onclick="location.href='/detail/${post.id}'">
			<th>${post.id }</th>
			<th>${post.title}</th>
			<th>${post.content }</th>
			<th>${post.writer }</th>
			<th>${post.createdDate }</th>
			<th>${post.modifiedDate }</th>
			<th>${post.statusT_F }</th>
		</tr>
		</c:forEach>
		</table>
		</div>
<%@ include file="bootstrap.jsp" %>
</body>
</html>
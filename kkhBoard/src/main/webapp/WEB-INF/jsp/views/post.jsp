<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>post-List 페이지</title>
</head>
<body>

<h2 style="text-align:center; margin-bottom:20px;"> 게시글 목록 </h2>
<div class="container">
<button class="btn btn-primary" onclick="location.href='/insert'">글쓰기</button>

<!-- 검색 기능 추가 시작 -->
<div style="float:right;">
<div style="width:30%; display:inline-block;">
<select class = "form-control form-control-sm" name="searchType" id="searchType">
<option value="title">제목</option>
<option value="content">내용</option>
<option value="titleContent">제목+내용</option>
<option value="writer">작성자</option>
</select>
</div>
<div style="display:inline-block;">
<input type="text" class="form-control form-control-sm" name="keyword" id="keyword">
</div>
<div style="display:inline-block;">
<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
</div>
</div>
<!-- 검색 기능 추가 끝 -->

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
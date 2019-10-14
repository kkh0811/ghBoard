<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Detail 페이지</title>
</head>
<body>
	<h2 style="text-align: center; margin-bottom: 20px;">게시글 상세</h2>
	<div class="container" style="text-align: center;">
		<form action="/insertProc" method="post">
			<table class="table table-hover"
				style="width: 30%; text-align: center; margin-left: auto; margin-right: auto;">
				<tr>
					<th style="background-color: #EAF2F8;">제목</th>
				</tr>
				<tr>
					<th>${detail.title}</th>
				</tr>
				<tr>
					<th style="background-color: #EAF2F8;">작성자</th>
				</tr>
				<tr>
					<th>${detail.writer}</th>
				</tr>
				<tr>
					<th style="background-color: #EAF2F8;">작성날짜</th>
				</tr>
				<tr>
					<th>${detail.createdDate}</th>
				</tr>
				<tr>
					<th style="background-color: #EAF2F8;">내용</th>
				</tr>
				<tr>
					<th>${detail.content}</th>
				</tr>
			</table>
		</form>
		<button class="btn btn-primary" onclick="location.href='/post'">목록</button>
		<button class="btn btn-primary"
			onclick="location.href='/update/${detail.id}'">수정</button>
		<button class="btn btn-danger"
			onclick="location.href='/delete/${detail.id}'">삭제</button>
	</div>


	<%@ include file="bootstrap.jsp"%>
</body>
</html>

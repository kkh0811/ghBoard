<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html>
<html>
<head>
<!-- 테스트용 버튼이벤트를 사용하기 위한 Jquery 라이브러리 추가-->
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<!-- Ajax 사용하기 위한 라이브러리 추가 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
	$("#btnSearch").click(function(){
		console.log("clicked!");
		$.ajax({
	        type:"GET",
	        url:"post",
	        success: function(){
		        var url = "post";
		    	url = url + "?searchType=" + $('#searchType').val();
		    	url = url + "&keyword=" + $('#keyword').val();
		    	location.href = url;
		    	console.log(url);
				alert("ajax 호출성공!"+url);
	        },
	        error: function(error) {
	            alert("오류발생! "+error);
	        }  
		});
	});
});
</script>
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
<th>게시판번호</th>
<th>제목</th>
<th>내용</th>
<th>작성자</th>
<th>만들날짜</th>
<th>수정날짜</th>
</tr>
		<c:forEach items="${list}" var="post">
		<tr onclick="location.href='/detail/${post.id}'">
			<th>${post.id }</th>
			<th>${post.title}</th>
			<th>${post.content }</th>
			<th>${post.writer }</th>
			<th>${post.createdDate }</th>
			<th>${post.modifiedDate }</th>
		</tr>
		</c:forEach>
		</table>
		</div>
<%@ include file="bootstrap.jsp" %>
</body>
</html>
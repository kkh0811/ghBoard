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
		searchType = $('#searchType').val();
    	keyword = $('#keyword').val();
    	console.log("클릭이벤트호출:"+searchType+""+keyword);
		
		$.ajax({
	        type:"GET",
	        data: {searchType: searchType, keyword: keyword}, // Controller로 변수를 넘겨줍니다
	        dataType:"json", // 데이터 타입이 json
	        url:"/post/search",
	        success: function(result){    
		    	console.log("Ajax호출됨!");
		    	console.log(result);
		    	var tr =""; // 변수 초기화
				for (var str in result){
					var rStr = result[str];
				if(result[str]['modifiedDate']==null) result[str]['modifiedDate'] = ""; // Null값 출력 방지!
				tr += "<tr><th>"+rStr.id+"</th>"
						+"<th>"+rStr['title']+"</th>"
						+"<th>"+result[str]['content']+"</th>"
						+"<th>"+result[str]['writer']+"</th>"
						+"<th>"+result[str]['createdDate']+"</th>"
						+"<th>"+result[str]['modifiedDate']+"</th></tr>";
					}
				//console.log(tr);	
				$("#tbody").html(tr); // 해당되는 필드에 tr값 html형식으로 넣어주기
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
<div style="width:31%; display:inline-block;">
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
<table style="margin-top:20px;" class="table table-hover">
<tr>
<th>게시판번호</th>
<th>제목</th>
<th>내용</th>
<th>작성자</th>
<th>만들날짜</th>
<th>수정날짜</th>
</tr>
<tbody id="tbody">
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
</tbody>
		</table>
		</div>
<%@ include file="bootstrap.jsp" %>
</body>
</html>
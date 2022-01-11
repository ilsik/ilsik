<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
var contextPath=window.location.pathname.substring(0,window.location.pathname.indexOf("/",2));

	$(document).ready(function(){
		$("#submit").click(function(){
		if(checkIt()){
			var query = {
				title : $("#title").val(),
				name : $("#name").val(),
				pw	: $("#pw").val(),
				type : $("#type").val(),
				content : $("#content").val()
			};
			$.ajax({
				type : "post",
				url : "${cp}/board/boardWritePro",
				data : query,
				success : function(data){
					var str='<p id="check">';
					var loc=data.indexOf(str);
					var len=str.length;
					var check=data.substr(loc+len,1);
					if(check == 1){
						alert('글쓰기 성공');
						location.href="${cp}/board/main";
					}else{
						alert('글쓰기 실패');
					}
				}
			})
		}
	});
	
});

	function checkIt(){
		if(!$("#title").val()){
			alert('제목을 입력하세요');
			$("#title").focus();
			return false;
		}if(!$("#name").val()){
			alert('이름을 입력하세요');
			$("#name").focus();
			return false;
		}if(!$("#pw").val()){
			alert('비밀번호를 입력하세요');
			$("#pw").focus();
			return false;
		}if(!$("#content").val()){
			alert('내용을 입력하세요');
			$("#content").focus();
			return false;
		}
		return true;
	}
</script>
	

</head>
<body>
<c:if test="${sessionScope.log eq null}">
	<script type="text/javascript">
		alert('로그인 후 이용해주세요');
		location.href="${cp}/board/login";
	</script>
</c:if>
<c:if test="${sessionScope.log ne null }">
	<div align="center">
	<h2>게시판 글쓰기</h2>
		<table border="1">
			<tr>
				<td colspan="2" align="right"><button onclick="window.location.href='${cp}/board/main'" id="main">메인게시판</button></td>
			</tr>
			<tr>
				<td>번호</td>
				<td width="200" id="num">${size}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td width="200"><input type="text"name="title" id="title"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td width="200"><input type="text"name="name" id="name"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td width="200"><input type="password"name="pw" id="pw"></td>
			</tr>
			<tr>
				<td>타입</td>
				<td width="250" >
				<input type="radio"name="type"value="일반"checked id="type">일반
				<input type="radio"name="type"value="Q&A"id="type">Q&A
				<input type="radio"name="type"value="익명"id="type">익명
				<input type="radio"name="type"value="자유"id="type">자유
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td width="200"><textarea rows="20" cols="30"name="content" id="content"></textarea></td>
			</tr>
			<tr>
				<td width="200" align="center"colspan="2"><input type="button"value="전송" id="submit"></td>
			</tr>
		</table>
</div>
</c:if>
</body>
</html>
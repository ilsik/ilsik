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
		$("#update").click(function(){
			if(checkIt()){
				var query ={
					pw : $("#pw").val(),
					num : $("#num").val()
				};
				$.ajax({
					type : "post",
					url : "${cp}/board/boardUpdateCheck",
					data : query,
					success : function(data){
						var str = '<p id="check">';
						var loc = data.indexOf(str);
						var len = str.length;
						var check=data.substr(loc+len,1);
						if(check == "1"){
							location.href="${cp}/board/boardUpdatePro?num=${board.num}";
						}else{
							alert('비밀번호가 맞지않습니다');
						}
					}
				});
			}
		});
	});
	function checkIt(){
		if(!$("#pw").val()){
			alert('비밀번호를 입력하세요');
			$("#pw").focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<div align="center">
	<h2>게시판 수정확인</h2>
		<table border="1">
			<tr>
				<td colspan="2" align="right"><button onclick="window.location.href='${cp}/board/main'">메인게시판</button></td>
			</tr>
			<tr>
				<td>번호</td>
				<td width="200">${board.num }</td>
			</tr>
			<tr>
				<td>제목</td>
				<td width="200"><input type="text"name="title"value="${board.title }" disabled="disabled"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td width="200"><input type="text"name="name"value="${board.name }" disabled="disabled"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td width="200"><input type="password"name="pw" id="pw" ></td>
			</tr>
			<tr>
				<td>타입</td>
				<td width="250">
				<input type="radio" name="type" value="일반" <c:if test="${board.type eq'일반'}">checked="checked"</c:if>disabled="disabled">일반
				<input type="radio" name="type" value="Q&A"<c:if test="${board.type eq'Q&A'}">checked="checked"</c:if>disabled="disabled">Q&A
				<input type="radio" name="type" value="익명"<c:if test="${board.type eq'익명'}">checked="checked"</c:if>disabled="disabled">익명
				<input type="radio" name="type" value="자유" <c:if test="${board.type eq'자유'}">checked="checked"</c:if>disabled="disabled">자유
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td width="200"><textarea rows="20" cols="30"name="content" disabled="disabled">${board.content }</textarea></td>
			</tr>
			<tr>
				<td width="200" align="center"colspan="2">
				<input type="hidden" value="${board.num }" id="num">
				<input type="button"value="수정하기" id="update">
				</td>
			</tr>
		</table>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE htm>
<html>
<head>
<title></title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
var contextPath=window.location.pathname.substring(0,window.location.pathname.indexOf("/",2));
	$(document).ready(function(){
		$("#update").click(function(){
			if(checkIt()){
				var query ={
					num : $("#num").val(),
					title : $("#title").val(),
					name : $("#name").val(),
					pw	: $("#pw").val(),
					type : $("#type").val(),
					content : $("#content").val()
				};
				$.ajax({
					type : "post",
					url : "${cp}/board/boardUpdatePro2",
					data : query,
					success : function(data){
						var str = '<p id="check">';
						var loc = data.indexOf(str);
						var len = str.length;
						var check=data.substr(loc+len,1);
						if(check == "1"){
							alert('수정이 완료되었습니다');
							location.href="${cp}/board/main";
						}else{
							alert('실패');
							location.href="${cp}/board/main";
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
		if(!$("#title").val()){
			alert('제목을 입력하세요');
			$("#title").focus();
			return false;
		}
		if(!$("#name").val()){
			alert('이름을 입력하세요');
			$("#name").focus();
			return false;
		}if(!$("#content").val()){
			alert('내용을 입력하세요');
			$("#content").focus();
			return false;
		}
		if(!$("#type").val()){
			alert('타입을 선택하세요');
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<div align="center">
	<h2>게시판 수정</h2>
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
				<td width="200"><input type="text" name="title" value="${board.title }" id="title"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td width="200"><input type="text" name="name" value="${board.name }" id="name"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td width="200"><input type="password" name="pw" id="pw"></td>
			</tr>
			<tr>
				<td>타입</td>
				<td width="250" >
				<input type="radio" name="type" value="일반" <c:if test="${board.type eq'일반'}">checked="checked"</c:if>id="type">일반
				<input type="radio" name="type" value="Q&A"<c:if test="${board.type eq'Q&A'}">checked="checked"</c:if>id="type">Q&A
				<input type="radio" name="type" value="익명"<c:if test="${board.type eq'익명'}">checked="checked"</c:if>id="type">익명
				<input type="radio" name="type" value="자유" <c:if test="${board.type eq'자유'}">checked="checked"</c:if>id="type">자유
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td width="200"><textarea rows="20" cols="30"name="content" id="content">${board.content }</textarea></td>
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

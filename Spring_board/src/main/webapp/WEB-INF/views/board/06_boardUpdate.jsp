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
			alert('수정하시려면 비밀번호를 입력하세요');
			$("#pw").focus();
			return false;
		}
		return true;
	}
	/* function addRe(){
		var addreply="<div class=reply>";
		addreply+="<br><tr>";
		addreply+="<td>${sessionScope.name}</td><br>";
		addreply+="</tr>";
		addreply+="<tr>";
		addreply+="<td colspan='2'><textarea rows='5' cols='100' id='replyContent'></textarea></td>";
		addreply+="</tr>";
		addreply+="<tr align='right'>";
		addreply+="<td colspan='2'><input type='button' id='replySubmit' value='답글 달기' onclick='replySubmit()'>";
		addreply+="<input type='hidden' id='replyName' value='${sessionScope.name}'>";
		addreply+="<input type='hidden' id='replyRef' value='${board.num}'>";
		addreply+="</td>";
		addreply+="</tr>";
			$("#addReply").append(addreply);
	} */
/* 	function addRere(){
		var addreply="<div class=rereply>";
		addreply+="<br><tr>";
		addreply+="<td>${sessionScope.name}</td><br>";
		addreply+="</tr>";
		addreply+="<tr>";
		addreply+="<td colspan='2'><textarea rows='5' cols='100' id='rereplyContent'></textarea></td>";
		addreply+="</tr>";
		addreply+="<tr align='right'>";
		addreply+="<td colspan='2'><input type='button' id='rereplySubmit' value='답글 달기' onclick='rereplySubmit()'>";
		addreply+="<input type='hidden' id='rereplyName' value='${sessionScope.name}'>";
		addreply+="<input type='hidden' id='rereplyRef' value='${board.num}'>";
		addreply+="<input type='hidden' id='rereplyReStep' value='${comment.reStep}'>";
		addreply+="<input type='hidden' id='rereplyReLevel' value='${comment.reLevel}'>";
		addreply+="</td>";
		addreply+="</tr>";
			$("#addRereply").append(addreply);
	} */
	
	function rereplySubmit(i){
		debugger;
		var reply=document.forms[i];
		if(reply.rereplyContent.value==""){
			alert('내용을 입력하세요');
			return false;	
		}else if(${sessionScope.name eq null}){
			alert('로그인 후 이용하세요');
			return false;
		}
		return true;
	}function commentSubmit(){
		if($("#comContent").val()){
			var query ={
					name : $("#commentName").val(),
					content : $("#comContent").val(),
					ref : $("#commentRef").val(),
					reStep: $("#commentReStep").val(),
				};
			$.ajax({
				type : "post",
				url : "${cp}/board/comment",
				data : query,
				success : function(data){
					var str = '<p id="check">';
					var loc = data.indexOf(str);
					var len = str.length;
					var check=data.substr(loc+len,1);
					if(check == 1){
						alert('댓글을 달았습니다');
						location.href="${cp}/board/boardUpdate?number=${board.num}";
					}
				}
			});
		}else{
			alert('내용을 입력하세요');
		}
	}function replySubmit(i){
		
		var reply=document.forms[i];
		if(reply.replyContent.value==""){
			alert('내용을 입력하세요');
			return false;	
		}else if(${sessionScope.name eq null}){
			alert('로그인 후 이용하세요');
			return false;
		}
		return true;
	}
	
	/* $("#replySubmit").click(function(){
		alert('눌림');
		if($("#replyContent").val()){
			var query ={
				name : $("#replyName").val(),
				content : $("#replyContent").val(),
				ref : $("#replyRef").val(),
				reStep: $("#replyReStep").val(),
				reLevel : $("#replyReLevel").val()
			};
			alert(query);
			$.ajax({
				type : "post",
				url : "${cp}/board/reply",
				data : query,
				success : function(data){
					var str = '<p id="check">';
					var loc = data.indexOf(str);
					var len = str.length;
					var check=data.substr(loc+len,1);
					if(check == 1){
						alert('답글을 달았습니다');
						location.href="${cp}/board/boardUpdate?number=${board.num}";
					}
				}
			});
		}else{
			alert('내용을 입력하세요');
		}
	}); */
	
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
				<td width="200"><textarea rows="20" cols="100"name="content" disabled="disabled">${board.content }</textarea></td>
			</tr>
			<tr>
				<td width="200" align="center"colspan="2">
				<input type="hidden" value="${board.num }" id="num">
				<input type="button"value="수정하기" id="update">
				</td>
			</tr>
			<tr>
				<td colspan="2">댓글 ${size}</td>			
			</tr>
			<c:forEach var="comment" items="${commentList}" varStatus="i">
			
			<c:if test="${comment.reStep == 2 }">
			
			<tr>
				<td colspan="2">
				${comment.name}<br>
				${comment.content}<br>
				<font size="2">${comment.regdate}</font>
				<br>
				<form action="${cp}/board/reply" method="post" name="reply${i.index}" onsubmit="return replySubmit(${i.index})">
				<input id="replyContent" type="text" name="replyContent">
				<input type="submit" value="답글쓰기" >
				<input type="hidden" id="replyReStep" value="${comment.reStep }" name="replyReStep">
				<input type="hidden" id="replyReLevel" value="${comment.reLevel }" name="replyReLevel">
				<input type='hidden' id='replyName' value='${sessionScope.name}' name="replyName">
				<input type='hidden' id='replyRef' value='${board.num}' name="replyRef">
				</form>
				</td>
			</tr>
			
			</c:if><c:if test="${comment.reStep > 2 }">
			
			<tr>
				<td colspan="2">
				<c:forEach var="j" begin="1" end="${comment.reStep-2 }">
				&nbsp;&nbsp;&nbsp;&nbsp;
				</c:forEach>
				ㄴ${comment.name}<br>
				<c:forEach var="j" begin="1" end="${comment.reStep-2 }">
				&nbsp;&nbsp;&nbsp;&nbsp;
				</c:forEach>
				${comment.content}<br>
				<c:forEach var="j" begin="1" end="${comment.reStep-2 }">
				&nbsp;&nbsp;&nbsp;&nbsp;
				</c:forEach>
				<font size="2">${comment.regdate}</font>
				<br>
				<form action="${cp}/board/rereply" method="post" name="rereply${i.index}" onsubmit="return rereplySubmit(${i.index})">
					<c:forEach var="j" begin="1" end="${comment.reStep-2 }">
					&nbsp;&nbsp;&nbsp;&nbsp;
					</c:forEach>
					<input id="rereplyContent" type="text" name="rereplyContent" >
					<input id="replySubmit" type="submit" value="답글쓰기">
					<input type="hidden" id="replyReStep" value="${comment.reStep }" name="rereplyReStep">
					<input type="hidden" id="replyReLevel" value="${comment.reLevel }" name="rereplyReLevel">
					<input type='hidden' id='replyName' value='${sessionScope.name}' name="rereplyName">
					<input type='hidden' id='replyRef' value='${board.num}' name="rereplyRef">
				</form>
				</td>
			</tr>
			
				
			</c:if>
			</c:forEach>
			<c:if test="${sessionScope.name eq null}">
			<tr>
				<td colspan="2"><textarea rows="5" cols="100" disabled="disabled">로그인 후 댓글을 달아보세요.</textarea></td>
			</tr>
			</c:if>
			<c:if test="${sessionScope.name ne null}">
			
			<tr>
				<td>${sessionScope.name}</td>
			</tr>
			<tr>
				<td colspan="2"><textarea rows="5" cols="100" id="comContent"></textarea></td>
			</tr>
			<tr align="right">
				<td colspan="2">
				<input type="button" id="commentSubmit" value="댓글달기" onclick="commentSubmit()">
				<input type="hidden" id="commentName" value="${sessionScope.name}">
				<input type="hidden" id="commentRef" value="${board.num}">
				<input type="hidden" id="commentReStep" value="2">
				</td>
			</tr>
			
			
			</c:if>
			
		</table>
		
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	var contextPath=window.location.pathname.substring(0,window.location.pathname.indexOf("/",2));
	
	$(document).ready(function(){
		var checkID=false;
		$("#idcheck").click(function(){
			if($("#id").val()){
				var query = {
					id : $("#id").val()
				};
				$.ajax({
					type : "post",
					url : "idcheck.do",
					data : query,
					success : function(data){
						var str = '<p id="check">';
						var loc = data.indexOf(str);
						var len = str.length;
						var check=data.substr(loc+len,1);
						if(check == "1"){
							alert('중복된 아이디');
							$("#id").val("");
						}else if(check == "0"){
							checkID=true;
							alert('사용가능 아이디');
						}
					}
				});
			}else{
				alert('아이디를 입력하세요');
				$("#id").focus();
			}
		});
		$("#join").click(function(){
			if(checkID==true){
				if(checkIt()){
					var query={
						id : $("#id").val(),
						pw : $("#pw").val(),
						name : $("#name").val(),
						gender : $("#gender").val(),
						age : $("#age").val()
					};
					$.ajax({
						type : "post",
						url : "joinPro.do",
						data : query,
						success : function(data){
							alert('회원가입 성공~');
							location.href="main.do";
						}
					});
				}
			}else{
				alert('아이디 중복체크');
			}
		});
		$("#cancel").click(function(){
			location.href="main.do";
		});
	});
	function checkIt(){
		if(!$("#id").val()){
			alert('아이디를 입력하세요');
			$("#id").focus();
			return false;
		}
		if(!$("#pw").val()){
			alert('비밀번호를 입력하세요');
			$("#pw").focus();
			return false;
		}
		if($("#pw").val() != $("#pw2").val()){
			alert('동일한 비밀번호를 입력하세요');
			$("#pw2").focus();
			return false;
		}
		if(!$("#name").val()){
			alert('이름을 입력하세요');
			$("#name").focus();
			return false;
		}
		if(!$("#age").val()){
			alert('생년월일을 입력하세요');
			$("#age").focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<div align="center">

<h1>회원가입</h1>
	<table border="1">
		<tr>
			<th>아이디</th>
			<td><input type="text" name="id" id="id"></td>
			<td><button id="idcheck">중복확인</button></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td colspan="2"><input type="password"name="pw" id="pw"></td>
		</tr>
		<tr>
			<th>비밀번호 재입력</th>
			<td colspan="2"><input type="password"name="pw" id="pw2"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td colspan="2"><input type="text"name="name" id="name"></td>
		</tr>
		<tr>
			<th>성별</th>
			<td colspan="2">
			<input type="radio"name="gender" id="gender" value="남자"checked >남성
			<input type="radio"name="gender" id="gender" value="여자">여성
			</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td colspan="2">
			<input type="date"name="date" id="age">
			</td>
		</tr>
		<tr>
			<td colspan="3" align="center">
			<button id="join">회원가입</button>
			<button id="cancel">취소</button>
			</td>
		</tr>
		
	</table>
</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	var contextPath=window.location.pathname.substring(0,window.location.pathname.indexOf("/",2));	
	$(document).ready(function(){
		$("#login").click(function(){
			if(checkIt()){
				var query={
					id : $("#id").val(),
					pw : $("#pw").val()
				};
				$.ajax({
					type : "post",
					url : "loginPro.do",
					data : query,
					success : function(data){
						var str ='<p loginCheck>';
						var loc=data.indexOf(str);
						var lon=str.length;
						var check=data.substr(loc+lon,1);
						if(check==1){
							alert('로그인 성공');
							location.href="main.do";
						}else{
							alert('로그인 실패');
						}
					}
				})
			}
		});
	});
	function checkIt(){
		if(!$("#id").val()){
			alert('아이디를 입력하세요');
			$("#id").focus();
			return false;
		}if(!$("#pw").val()){
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
<h2>로그인</h2>
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text"name="id" id="id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password"name="pw" id="pw"></td>
			</tr>
			<tr>
				<td align="center" colspan="2">
				<button id="login">로그인</button>
				<button id="join">회원가입</button>
				</td>
				
			</tr>
		</table>
</div>
</body>
</html>

  

	
	
    
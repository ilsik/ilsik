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
	
</script>

</head>
<body>
	<div align="center">
    	<a href="main.do"><img alt="메가박스" src="img/메가박스메인.png"></a>
    </div>
<table>
	<tr>
	<c:if test="${sessionScope.log ne 'admin'}">
		<c:if test="${sessionScope.log eq null}">
		<td align="right" width="1300"><a href="join.do">회원가입</a></td>
		<td align="right"><a href="login.do">로그인</a></td>
		</c:if>
		<c:if test="${sessionScope.log ne null }">
		<td align="right" width="1300"><a href="logout.do">로그아웃</a></td>
		<td align="right"><a href="myPage.do">마이페이지</a></td>
		</c:if>
	</c:if>
	<c:if test="${sessionScope.log eq 'admin'}">
		<td align="right" width="1300"><a href="logout.do">로그아웃</a></td>
		<td align="right"><a href="admin.do">관리자페이지</a></td>
	</c:if>
	</tr>
</table>
<!-- <div align="center">
<table>
	<tr>
		<td><h3>
		<input type="text" id="word" placeholder="검색어를 입력하세요" onkeyup="search(this);"></h3></td>
		<td><button id="result">검색</button></td>
		
	</tr>
</table>

</div> -->
</body>
</html>
    
     
    



	
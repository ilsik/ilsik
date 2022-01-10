<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
	<table border="1">
		<tr>
			<th>회원번호</th>
			<th>아이디</th>
			<th>비번</th>
			<th>이름</th>
			<th>성별</th>
			<th>포인트</th>
			<th>가입일자</th>
			<th>생년월일</th>
			<th>등급</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="mem" items="${memberList }">
		<tr>
			<td>${mem.member_no }</td>
			<td>${mem.member_id }</td>
			<td>${mem.member_pw }</td>
			<td>${mem.member_name }</td>
			<td>${mem.member_gender }</td>
			<td>${mem.member_point }</td>
			<td>${mem.member_regdate }</td>
			<td>${mem.member_age }</td>
			<td>${mem.member_grade }</td>
			<td><button onclick="window.location.href='memberDelete.do?id=${mem.member_id}'">삭제</button></td>
		</tr>
		</c:forEach>
	</table>
</div>
	
	
</body>
</html>
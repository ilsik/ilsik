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
			<th>영화이름</th>
			<th>상영시간</th>
			<th>상영타입</th>
			<th>상영관</th>
			<th>티켓가격</th>
		</tr>
		<c:forEach var="cinema" items="${cinemaList }">
		<tr>
			<td>${cinema.cinema_title }</td>
			<td>${cinema.cinema_time }</td>
			<td>${cinema.cinema_type }</td>
			<td>${cinema.cinema_theater }</td>
			<td>${cinema.cinema_price }</td>
			<td><button onclick="window.location.href='cinemaDelete.do?theater=${cinema.cinema_theater}&time=${cinema.cinema_time}'">삭제</button></td>
		</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>
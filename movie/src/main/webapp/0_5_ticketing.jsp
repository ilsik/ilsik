
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${sessionScope.log ne null}">
	<div align="center">
	<h1>�����Ͻ� ��ȭ : ${selMovie }</h1>
	<img alt="img/${selMovie }" src="img/${selMovie }.jpg">
	<hr>
	<h2>�� �ð� ����</h2>
	<h3>1��</h3>
	<c:forEach var="cinema" items="${ cinemaTimeList }" varStatus="status">
		<c:if test="${cinema.cinema_theater eq 1 }">
		<tr>
			<td><button onclick="window.location.href='ticketingPro.do?index=${status.index }&title=${titleNo}'">${cinema.cinema_time}</button></td>
		</tr>
		</c:if>
	</c:forEach>
	<hr>
	<h3>2��</h3>
	<c:forEach var="cinema" items="${ cinemaTimeList }" varStatus="status">
		<c:if test="${cinema.cinema_theater eq 2 }">
		<tr>
			<td><button onclick="window.location.href='ticketingPro.do?index=${status.index }&title=${titleNo }'">${cinema.cinema_time}</button></td>
		</tr>
		</c:if>
	</c:forEach>
	<hr>
	<h3>3��</h3>
	<c:forEach var="cinema" items="${ cinemaTimeList }" varStatus="status">
		<c:if test="${cinema.cinema_theater eq 3 }">
		<tr>
			<td><button onclick="window.location.href='ticketingPro.do?index=${status.index }&title=${selMovie }'">${cinema.cinema_time}</button></td>
		</tr>
		</c:if>
	</c:forEach>
</div>
	</c:if>
	<c:if test="${sessionScope.log eq null}">
		<script type="text/javascript">
			alert('�α��� �� �̿����ּ���');
			location.href="login.do";
		</script>
	</c:if>
	
</body>
</html>

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
<c:if test="${sessionScope.log eq 'admin' }">
	<div align="center">
		<table>
			<tr>
				<th><a href="memberList.do">회원목록</a></th>
				<th><a href="cinemaList.do">영화목록</a></th>
				<th><a href="cinemaAdd.do">상영추가</a></th>
			</tr>
		</table>
	</div>
</c:if>
</body>
</html>
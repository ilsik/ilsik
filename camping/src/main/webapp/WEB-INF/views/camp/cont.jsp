<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body style="color: white;">
	<div align="center" >
	<form action="${cp}/search.do" method="post">
		<h2 >캠핑장이름을 검색해보세요!</h2>
		<input type="text" name="search" >
		<input type="submit" value="검색">
	</form>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body {
		background-color: black;
		background-image: url("${cp}/resources/img/camping_main.jpg");
		height: 100vh;
		background-repeat: no-repeat;
	}
	a:link {color: white;text-decoration: none;}
	a:visited	 {color: white;text-decoration: none;}
}
</style>
</head>
<body style="color: white;">
<div align="left">
	<br><br><br><br><br><br><br><br>
	<h1 style="color: white;">&nbsp;&nbsp;&nbsp;지금 찾고있는 캠핑장<br> &nbsp;&nbsp;&nbsp;가자캠핑에서 찾아보세요!</h1>
</div>
	<br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br>
	<div align="center" >
	<form action="${cp}/search.do" method="post">
		<h2 >캠핑장이름을 검색해보세요!</h2>
		<input type="text" name="search" >
		<input type="submit" value="검색">
	</form>
	</div>
</body>
</html>
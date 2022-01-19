<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#img{
		background-color:white;
		background-repeat: no-repeat;
		width: 400px;
		height: 300px;
	}
	button {
		background-color: gray;
		color: white;
}
</style>
</head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
	function select(no){
		location.href="${cp}/select.do?no="+no;
	}
		
		
</script>
<body>
<div align="center" style="color: white;">
	<table border="1">
		<c:forEach var="camp" items="${campSearchList}">
			<tr>
				<td align="center" colspan="2"><a href="#" onclick="select(${camp.no})"><img id="img" src="${cp}/resources/img/${camp.img}" alt="${camp.img}"></a></td>
			</tr>
			<tr>
				<td>${camp.name }</td>
				<td rowspan="2" align="center"><button onclick="select(${camp.no})">상세보기</button></td>
			</tr>
			<tr>
				<td>${camp.address }</td>
			</tr>
			<tr>
			
				<td align="right" colspan="2">${df.format(camp.price) }원~</td>
			</tr>
		</c:forEach>
	</table>
</div>
	
</body>
</html>
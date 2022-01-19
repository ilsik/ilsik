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
</style>
</head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
var contextPath=window.location.pathname.substring(0,window.location.pathname.indexOf("/",2));
	$(document).ready(function(){
		var index=0;
		$("#prev").click(function(){
			var query = {
				index : $("#index").val()
			};
			
		});
		function nextImg(i,img){
			document.getElementById("img").src="${cp }/resources/img/${imgSearchList.get(1).img}";
		}
		
	});
</script>
<body>
<div align="center" style="color: white;">
	<table>
		<c:forEach var="camp" items="${campSearchList}">
			<tr>
				<td><div id="prev"><a href="#prev"><img src="${cp }/resources/img/prev.png"></a></div></td>
				<c:forEach var="img" items="${imgSearchList}" varStatus="i" begin="${index}" end="${index}">
					<c:if test="${camp.no eq img.no }">
						<td align="center"><img src="${cp }/resources/img/${img.img}" alt="${img.img}" id="img"></td>
						<input type="hidden" onclick="nextImg(${i.index+1},${img.img})" value="${i.index}">
					</c:if>
				</c:forEach>
				<td><div id="next"><a href="#next"><img src="${cp }/resources/img/next.png"></a></div></td>
			</tr>
			<tr>
				<td colspan="3">${camp.name }</td>
			</tr>
			<tr>
				<td colspan="3">${camp.address }</td>
			</tr>
			<tr>
				<td colspan="3" align="right">${df.format(camp.price) }원~</td>
			</tr>
		</c:forEach>
	</table>
</div>
	
</body>
</html>
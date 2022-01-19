<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
var count=0;
var imgList=new Array();
var size;
$(document).ready(function (){
	<c:forEach items="${imgSearchList }" var="img">
		imgList.push("${img.img}");
	</c:forEach>
	size=imgList.length;
});
	function nextImg(){
		count=count+1;
		document.getElementById("img").src="${cp}/resources/img/"+imgList[count];
		document.getElementById('page').innerHTML=count+1+" / "+size;
		console.log(count);
		console.log(size);
		if(count == size-1){
			document.getElementById('next').innerHTML="";
		}else if(count != 0 ){
			document.getElementById('prev').innerHTML="<a href='#' onclick='prevImg()'><img alt='prev.png' src='${cp}/resources/img/prev.png'></a>";
		}
	}
	function prevImg(){
		count=count-1;
		document.getElementById("img").src="${cp}/resources/img/"+imgList[count];
		document.getElementById('page').innerHTML=count+1+" / "+size;
		console.log(count);
		console.log(size);
		if(count == 0){
			document.getElementById('prev').innerHTML="";
		}else if(count != size-1){
			document.getElementById('next').innerHTML="<a href='#' onclick='nextImg()'><img alt='next.png' src='${cp}/resources/img/next.png'></a>";
		}
	}
</script>
</head>
<body>

<div align="center" style="color: white;">
	<table>
		<tr>
			<td id="prev"></td>
			<td><img alt="${imgSearchList.get(index).img}" src="${cp}/resources/img/${imgSearchList.get(index).img}" id="img"></td>
			<td id="next"><a href="#" onclick="nextImg()"><img alt="next.png" src="${cp}/resources/img/next.png"></a></td>
		</tr>
		<tr>
			<td id="page" colspan="3" align="center">
				${index+1} / ${fn:length(imgSearchList) }
			</td>
		</tr>
	</table>
	</div>
</body>
</html>
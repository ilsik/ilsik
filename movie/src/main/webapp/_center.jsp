<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h5>박스오피스</h5>
    	<table>
    		<tr>
    			<td colspan="3"align="center"><a href="movieList.do">더 많은 영화보기</a></td>
    		</tr>
    		<tr>
    			<td><a href="ticketing.do?titleno=<%=0%>"><img alt=${title[0] } src="img/${title[0]}.jpg"></a></td>
    			<td><a href="ticketing.do?titleno=<%=1%>"><img alt=${title[1] } src="img/${title[1] }.jpg"></a></td>
    			<td><a href="ticketing.do?titleno=<%=2%>"><img alt=${title[2] } src="img/${title[2] }.jpg"></a></td>
    		</tr>
    		<tr>
    			<td align="center"><button onclick="window.location.href='ticketing.do?titleno=<%=0%>'">예매하기</button></td>
    			<td align="center"><button onclick="window.location.href='ticketing.do?titleno=<%=1%>'">예매하기</button></td>
    			<td align="center"><button onclick="window.location.href='ticketing.do?titleno=<%=2%>'">예매하기</button></td>
    		</tr>
    	</table>
	</div>
</body>
</html>
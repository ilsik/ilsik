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
	<div align="center">
	<form action="ticketingPro2.do">
	<table border="1">
	<h2><c:out value="${ticketList[index].ticket_theater }관 "/></h2>
	<h2><c:out value="${ticketList[index].ticket_cinema_time } 영화"/></h2>
	<br>
	<img alt="screen" src="img/screen.png">
	
	<%char num1='A'; %>
	<c:forEach var="seat1" items="${seatCheck }" varStatus="status1"> 
		<tr>
		<% int num2=1;%>
		<c:forEach var="seat2" items="${seat1 }" varStatus="status2">
			<c:if test="${seat2 eq 0 }">
				<%String index1=num1+"-"+num2; %>
				<td width="40"><%=num1%>-<%=num2%><input type="checkbox" name="index1" value="<%=index1%>">
				<input type="hidden" name="index" value="${index }">
				<input type="hidden" name="titleNo" value="${no }"></td>
			</c:if>
			<c:if test="${seat2 ne 0 }">
				<td width="40"><%=num1%>-<%=num2%><br>X</td>
			</c:if>
			<% num2++; %>
		</c:forEach>
		</tr>
		<% int temp=(int)num1+1;
		num1=(char)temp;%>
	</c:forEach>
	<%-- <%=theater[index]%>관<%=time[index]%>영화
	<br>
	
	
	<br>
	
	<c:forEach var="i" items="${seatCheck }" varStatus="status">
		<tr >
		
		<c:forEach var="j"></c:forEach>
	</c:forEach>
	<%char num1='A';
	for(int i=0;i<seatCheck.length;i++){%>
		<tr >
		<% int num2=1;%>
		<%for(int j=0;j<seatCheck[i].length;j++){%>
			<%if(seatCheck[i][j]==0){%>
			
			<% }else{%>
			<td width="40"><%=num1%>-<%=num2%><br>X</td>
			<%} %>
		<%
		num2++;
		}%>
		</tr>
	<%
	
	}%> --%>
	</table>
	<input type="submit"value="예매하기">
	</form>
	
</div>
</body>
</html>
	
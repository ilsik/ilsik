<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE htm>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
	<tr>
	<c:if test="${sessionScope.log eq null }">
		<td align="left" width="50"><a href="${cp }/board/login">login</a></td>
		<td align="left" width="50"><a href="${cp }/board/join">join</a></td>
	</c:if>
	<c:if test="${sessionScope.log ne null }">
		<td align="left" width="50"><a href="logout.do">logout</a></td>
	</c:if>
		<%-- <%if(board_check==true){%>
			
		<%}else{%>
			<td align="right" width="600">search total : <%=size %></td>
		<%}%> --%>
		<td align="right" width="600">total : ${size }</td>
	</tr>
</table>
<div >
	<table border="1">
		<tr align="center">
			<td width="150">Type</td>
			<td width="50">No</td>
			<td width="500">Title</td>
		</tr>
		<c:forEach var="board" items="${boardList}" begin="${start }" end="${end }">
			<tr align="center">
				<td>${board.type}</td>
				<td>${board.num}</td>
				<td><a href="${cp }/board/boardUpdate?number=${board.num}">${board.title}</a></td>
			</tr>
		</c:forEach>
	
	</table>
	<table>
		<tr align="right">
			<td width="700"><a href="${cp }/board/boardWrite">글쓰기</a></td>
		</tr>
	</table>
	<table>
		<tr>
			<td>
				<form action="${cp }/board/boardType" method="post">
					<input type="checkbox" value="전체"name="type"checked>전체
					<input type="checkbox" value="일반"name="type">일반
					<input type="checkbox" value="Q&A"name="type">Q&A
					<input type="checkbox" value="익명"name="type">익명
					<input type="checkbox" value="자유"name="type">자유
					<input type="submit" value="조회">
				</form>
			</td>
		</tr>
	</table>
	<table border="1">
		<tr align="center" >
		<c:if test="${Previous ne 1}">
			<td width="50">
			<button onclick="window.location.href='${cp }/board/main?pagenum2=${index-10}'">이전</button>
			</td>
		</c:if>
		
		<td width="600">
		<c:forEach var="i" begin="${startP}" end="${endP}">
			<button onclick="window.location.href='${cp }/board/main?pagenum=${i}'">${i+1}</button>
		</c:forEach>
			</td>
			<c:if test="${next ne 1 }">
				<td width="50">
				<button onclick="window.location.href='${cp }/board/main?pagenum2=${index+10}'">다음</button>
				</td>
			</c:if>
		</tr>
		</table>
</div>
</body>
</html>
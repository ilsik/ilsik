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
<c:if test="${check eq 1 }">
	<script type="text/javascript">
		location.href="memberList.do";
	</script>
</c:if>
<c:if test="${check ne 1 }">
	<script type="text/javascript">
		alert('오류');
		location.href="memberList.do";
	</script>
</c:if>
	
</body>
</html>
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
<p loginCheck>${check }
<<%-- c:if test="${check eq 1 }">
	<script type="text/javascript">
		alert('로그인성공');
		location.href="main.do";
	</script>
</c:if>
<c:if test="${check ne 1 }">
	<script type="text/javascript">
		alert('아이디 혹은 비밀번호를 확인하세요');
		history.go(-1);
	</script>
</c:if> --%>
	
</body>
</html>
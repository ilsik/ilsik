<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div align="center">
	<c:if test="${check eq 0 }">
		<script type="text/javascript">
			alert('회원가입 성공');
			location.href="main.do";
		</script>
	</c:if>
	<c:if test="${check ne 0 }">
		<script type="text/javascript">
			alert('회원가입 실패');
			history.go(-1);
		</script>
	</c:if>
</div>
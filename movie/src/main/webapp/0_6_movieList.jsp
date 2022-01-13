<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    <div align="center">
    	<table border="1">
    	<tr>
    	<c:forEach var="i" items="${title}" varStatus="status">
    	<td align="center"><a><img alt="${i }" src="img/${i }.jpg"></a></td>
    		<c:if test="${(status.index+1)%3 eq 0}">
    			</tr>
    			<tr>	
    			<td align="center"><button onclick="window.location.href='ticketing.do?titleno=${status.index-2}'">예매하기</button></td>
    			<td align="center"><button onclick="window.location.href='ticketing.do?titleno=${status.index-1}'">예매하기</button></td>
    			<td align="center"><button onclick="window.location.href='ticketing.do?titleno=${status.index}'">예매하기</button></td>
    			</tr>
    			<tr>
    		</c:if>
    	</c:forEach>
    </table>
    </div>
    
   
    
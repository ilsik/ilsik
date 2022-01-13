<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

	<script type="text/javascript">
		var contextPath=window.location.pathname.substring(0,window.location.pathname.indexOf("/",2));
		
		$(document).ready(function(){
			$("#submit").click(function(){
				var query={
					selMovie : $("#selMovie").val(),
					index1 : $("#index1").val(),
					price : $("#price").val(),
					point : $("#point").val(),
					index : $("#index").val(),
					buy_type : $("#buy_type").val()
				};
				$.ajax({
					type : "post",
					url : "ticketingPro3.do",
					data : query,
					success : function(data){
						var str='<p id="check">';
						var loc=data.indexOf(str);
						var len=str.length;
						var check=data.substr(loc+len,1);
						if(check== '1'){
							alert('예매되었습니다');
							location.href="main.do";
						}else{
							alert('포인트가 부족합니다');
							location.href="main.do";
						}
					}
				});
			});
		});
		
	</script>
	<h2>주문서</h2>
	<div align="center">
			<table>
				<tr>
					<td><h3>구매상품 확인</h3></td>
				</tr>
				<tr>
					<th>선택한 영화</th>
					<td>
					${selMovie }
					<input type="hidden" name="selMovie" value="${selMovie }" id="selMovie">
					</td>
					
				</tr>
				<tr>
					<th>영화상영시간</th>
					<td>${time }</td>
				</tr>
				<tr>
					<th>선택한 좌석</th>
					<td>
						${seat }
						<input type="hidden" name="index1" value="${seat }" id="index1">
					</td>
				</tr>
				<tr>
					<th>상품가격</th>
					<td>
					<input type="hidden" name="price" value="${price }" id="price">
					${price }
					</td>
				</tr>
				<tr>
					<th>현재 포인트</th>
					<td>
					<input type="hidden" name="point" value="${point }" id="point">
					<input type="hidden" name="index" value="${index }" id="index">
					${point }
					</td>
				</tr>
				<tr>
					<th>구매방식 선택</th>
					<td>
					<input type="radio" name="buy_type" value="포인트" checked="checked" id="buy_type">포인트
					</td>
				</tr>
				<tr>
					<td>
					<button id="submit">결제하기</button>
					</td>
				</tr>
			</table>
	</div>
</body>
</html>
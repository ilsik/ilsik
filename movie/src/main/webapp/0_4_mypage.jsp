<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		$("#charge").click(function(){
			var chargePoint=prompt("충전할 금액을 입력하세요","");
			$.ajax({
				type : "post",
				url : "charge.do",
				data : 'chargePoint='+chargePoint,
				success : function(data){
					var str='<p id="check">';
					var loc=data.indexOf(str);
					var len=str.length;
					var check=data.substr(loc+len,1);
					if(check == '1'){
						alert('충전되었습니다');
						location.href="myPage.do";
					}
				}
			});
		});
	});
	
</script>

</head>
<body>
	<div align="center">
	<table>
		<tr align="center">
			<td width="1300" align="right">
			<button id="charge" >포인트충전</button>
			</td>
		</tr>
	</table>
	</div>
	<c:if test="${sessionScope.log ne null }">
	<h2>내정보</h2>
	<table border="1">
		<tr>
			<th>회원아이디</th>
			<th>이름</th>
			<th>성별</th>
			<th>보유포인트</th>
			<th>가입일자</th>
			<th>생년월일</th>
			<th>등급</th>
		</tr>
		<c:forEach var="mem" items="${memberList }" begin="${index }" end="${index }">
		<tr align="center">
			<td align="center">${mem.member_id }</td>
			<td align="center">${mem.member_name }</td>
			<td align="center">${mem.member_gender }</td>
			<td align="center">${mem.member_point }</td>
			<td align="center">${mem.member_regdate }</td>
			<td align="center">${mem.member_age }</td>
			<td align="center">${mem.member_grade }</td>
		</tr>
		</c:forEach>
	</table>
	<h2>예매내역</h2>
		<table border="1">
			<tr>
				<th>구매회원 아이디</th>
				<th>구매방법</th>
				<th>구매일시</th>
				<th>구입한 영화제목</th>
				<th>구매한 영화 상영시간</th>	
				<th>상영관</th>	
				<th>좌석번호1</th>	
				<th>좌석번호2</th>
			</tr>
			<c:forEach var="ticket" items="${ticketList }">
				<c:if test="${ticket.ticket_memberid eq log }">
				<tr>
					<td>${ticket.ticket_memberid }</td>
					<td>${ticket.ticket_buy_type }</td>
					<td>${ticket.ticket_date }</td>
					<td>${ticket.ticket_cinema_title }</td>
					<td>${ticket.ticket_cinema_time }</td>
					<td>${ticket.ticket_theater }</td>
					<td>${ticket.ticket_seat1 }</td>
					<td>${ticket.ticket_seat2 }</td>	
				</tr>
				</c:if>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>
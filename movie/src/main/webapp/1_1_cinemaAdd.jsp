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
	var contextPath=window.location.pathname.substring(0,window.location.pathname.indexOf("/",2));
	
	$(document).ready(function(){
		$("#add").click(function(){
			if(checkIt()){
				var query={
					title : $("#title").val(),
					time : $("#time").val(),
					type : $("#type").val(),
					theater : $("#theater").val(),
					price : $("#price").val()
				};
				$.ajax({
					type : "post",
					url : "cinemaAddPro.do",
					data : query,
					success : function(data){
						var str='<p id="check">';
						var loc=data.indexOf(str);
						var len=str.length;
						var check=data.substr(loc+len,1);
						if(check=='1'){
							alert('추가성공');
							location.href="cinemaList.do";
						}
					}
				});
			}
		});
		$("#cancel").click(function(){
			location.href="admin.do";
		});
	});
	
	
	function checkIt(){
		if(!$("#title").val()){
			alert('영화제목을 선택하세요');
			return false;
		}if(!$("#time").val()){
			alert('상영시간을 선택하세요');
			return false;
		}if(!$("#type").val()){
			alert('타입을 선택하세요');
			return false;
		}if(!$("#theater").val()){
			alert('상영관을 선택하세요');
			return false;
		}if(!$("#price").val()){
			alert('영화금액을 선택하세요');
			return false;
		}
		return true;
	}
</script>

</head>
<body>
	<div align="center">
		<table>
			<tr>
				<th>영화제목</th>
				<th>상영시간</th>
				<th>상영타입</th>
				<th>상영관</th>
				<th>영화금액</th>
			</tr>
			<tr>
				<th>
				<select id="title" name="title">
				<c:forEach var="title" items="${title }">
					<option value="${title }">${title }</option>
				</c:forEach>
				</select>
				</th>
				<th><input type="time" id="time" name="time"></th>
				<th>
				<select id="type" name="type">
					<option value="조조" selected="selected">조조</option>
					<option value="심야">심야</option>
					<option value="일반">일반</option>
				</select>
				</th>
				<th>
				<select id="theater" name="theater">
					<option value="1" selected="selected">1관</option>
					<option value="2">2관</option>
					<option value="3">3관</option>
				</select>
				</th>
				<th>
				<select id="price" name="price">
					<option value="8000" selected="selected">8000원</option>
					<option value="8000">8000원</option>
					<option value="12000">12000원</option>
				</select>
				</th>
			</tr>
			<tr>
				<td align="center" colspan="5">
				<button id="add">추가하기</button>
				<button id="cancel">취소</button>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
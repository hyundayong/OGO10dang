<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리 일자 선택 버튼들</title>
</head>
<style>
	.dayselectbuttons input{
		font-family:"배달의민족 도현";
	  	font-size:25px;
	    color: white;
		width:75px;
		height:75px;
		border:none;
		flex: 1 1 auto;
		margin: 2px;
	  	padding: 10px;
	  	text-align: center;
	  	text-transform: uppercase;
	  	transition: 0.5s;
	  	background-size: 200% auto;
		box-shadow: 0 0 20px #eee;
		border-radius: 10px;
		background-image: linear-gradient(to right, #ffecd2 0%, #fcb69f 51%, #ffecd2 100%);
		outline:none;
	}
	.dayselectbuttons input:hover {
		  background-position: right center;
		  color:#ff6464;
		  
	}
</style>
<script>
	function setTitle(number) {
		document.location.href="dailyForm.manage?number="+number;
	}

</script>
<body>	
		<table class="dayselectbuttons">
			<tr>
				<td colspan="6" style="padding-bottom:20px; text-align:center"><input type="button" value="OGO10DANG 30일완성 프로그램" id="diary_title" style="width:440px; color:black" ></td>
			</tr>
			<tr>
				<% for (int i = 1; i<=6; i++ ) {%>
					<td><input type="button" name="td" value="<%=i%>" onClick="setTitle(<%=i%>)"></td>
				<% }%>
				</tr>
				<tr>
				<% for (int i = 7; i<=12; i++ ) {%>
					<td><input type="button" value="<%=i%>" onClick="setTitle(<%=i%>)"></td>
				<% }%>
				</tr>
				<tr>
				<% for (int i = 13; i<=18; i++ ) {%>
					<td><input type="button" value="<%=i%>" onClick="setTitle(<%=i%>)"></td>
				<% }%>
				</tr>
				<tr>
				<% for (int i = 19; i<=24; i++ ) {%>
					<td><input type="button" value="<%=i%>" onClick="setTitle(<%=i%>)"></td>
				<% }%>
				</tr>
				<tr>
				<% for (int i = 25; i<=30; i++ ) {%>
					<td><input type="button" value="<%=i%>" onClick="setTitle(<%=i%>)"></td>
				<% }%>
				</tr>
		</table>
</body>
</html>
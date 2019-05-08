<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>   
<%@ page import="vo.management.DailyProgram" %>
<%
DecimalFormat df = new DecimalFormat("00");
Calendar c = Calendar.getInstance();

String Month = df.format(c.get(Calendar.MONTH) + 1);
String Day = df.format(c.get(Calendar.DATE));
String Date = Month +"월 "+ Day+"일";
// 시작날짜를 오늘로 가정한다. 실제로는 DB에서 받아와야할듯. 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	body{
	  font-family: 'Montserrat', sans-serif;
	  margin:0;
	}
	.content_left {
	  justify-content: center;
	  align-items: center;
	  align-content: center;
	  flex-wrap: wrap;
	  width: 80vw;
	  margin: 0 auto;
	  padding-top:20px;
	}
	.diary_content {
	
		width: 1000px;
		height:540px;
		margin:250px auto;
		border:5px solid red;
	}
	.content_left {
		width:500px;
		height:540px;
		border:2px solid black;
		float:left;
	}
	.content_right {
		width:450px;
		height:540px;
		border:4px dotted gray;
		float:right;
	}
	.content_right table{
		margin: 30px auto;
	}
	#dailyCheck {
		text-align:center;
		display:block;
		font-size:25px;
	}
	#dailyCheck input{
		width: 70px;
		font-size:25px;
		text-align:center;
	}
	#dailyCheck td{
		border:1px solid black;
	}


</style>
<body>
<jsp:include page="../menubar.jsp"></jsp:include>
	<table class="diary_content">
		<tr>
			<td><div class="content_left">	
				<jsp:include page="dailyProgramDays.jsp"></jsp:include>
			</div></td>
			<td>    
				<div class="content_right">
				<table id="dailyCheck" >
				<tr>
					<td colspan="4"><input type="text" id="selectDay" value="" style="width:300px" readonly ></td>
				</tr>
				
				<tr><td>관리 페이지를 시작합니다.</td></tr>
				</table>
				</div>
			</td>
		</tr>
	</table>
	
</body>
</html>
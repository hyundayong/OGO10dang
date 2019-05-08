<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>   
<%@ page import="vo.management.DailyProgram" %>
<%
DecimalFormat df = new DecimalFormat("00");
Calendar c = Calendar.getInstance();		// 오늘 날짜 = 시작 날짜
c.add(Calendar.DATE, Integer.parseInt(request.getParameter("number"))-1);

String Month = df.format(c.get(Calendar.MONTH) + 1);
String Day = df.format(c.get(Calendar.DATE));
String titleday = Month +"월 "+ Day+"일";
// 시작날짜를 오늘로 가정한다. 실제로는 DB에서 받아와야할듯. 

// Action에서 넘긴 것을 어떻게 받아와서 남녀 구분을 하지???
if(manCount) {
	DailyProgram dailyProgram = (DailyProgram)request.getAttribute("dailyprogram_m");
	String[] exercisename = dailyProgram.getExercisename();
	String[] exercisevolume = dailyProgram.getQuantity();
	String[] exerciselink = dailyProgram.getLink();
	String[] goodfoods = dailyProgram.getGoodfood();
	String[] badfoods = dailyProgram.getBadfood();
} else if(womanCount) {
	DailyProgram dailyProgram = (DailyProgram)request.getAttribute("dailyprogram");
	String[] exercisename = dailyProgram.getExercisename();
	String[] exercisevolume = dailyProgram.getQuantity();
	String[] exerciselink = dailyProgram.getLink();
	String[] goodfoods = dailyProgram.getGoodfood();
	String[] badfoods = dailyProgram.getBadfood();
}



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
	.content_left input{
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
	.content_left input:hover {
		  background-position: right center;
		  color:#ff6464;
		  
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
			<td>	
				<div class="content_left">
					<jsp:include page="dailyProgramDays.jsp"></jsp:include>
				</div>
			</td>
			<td>    
				<div class="content_right">
				<table id="dailyCheck" >
				<tr>
					<td colspan="4"><input type="text" id="selectDay" value="<%=titleday %>"style="width:300px" readonly ></td>
				</tr>
				
				<% for (int i = 0; i < exercisename.length; i++) {
					if (exercisename[i] != null) { %>
					<tr>
						<td><input type="text" value="<%=exercisename[i] %>" style="width:150px" readonly></td>
						<td><input type="text" value="<%=exercisevolume[i] %>" readonly></td>
						<td><a href="<%=exerciselink[i]%>" target="_blank">상세</a></td>
						<td><input type="checkbox"></td>
					</tr>
				<% 	} 
				} %>
				<% for (int i = 0; i < goodfoods.length; i++) {
					if (goodfoods[i] != null) { %>
					<tr>
						<td><input type="text" value="<%=goodfoods[i] %>" style="width:150px" readonly></td>
						<td><input type="checkbox"></td>
					</tr>
				<% 	} 
				} %>
				<% for (int i = 0; i < badfoods.length; i++) {
					if (badfoods[i] != null) { %>
					<tr>
						<td><input type="text" value="<%=badfoods[i] %>" style="width:150px" readonly></td>
						<td><input type="checkbox"></td>
					</tr>
				<% 	} 
				} %>
				</table>
				</div>
			</td>
		</tr>
	</table>
	
</body>
</html>
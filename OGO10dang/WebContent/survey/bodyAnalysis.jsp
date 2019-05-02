<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.survey.BodyInfo" %>
<%@ page import = "java.util.ArrayList" %>
<%
	BodyInfo bodyInfoList = (BodyInfo)request.getAttribute("bodyInfoList");
	ArrayList<String[]> exerciseList = (ArrayList<String[]>)request.getAttribute("exerciseList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<title>체형 분석 결과 페이지</title>
<link rel="stylesheet" href="../css/mainPageStyle.css">
<link rel="stylesheet" href="./css/bodyanalysisResultStyle.css">

<style>
	#foodResult {display:none;}
	#exerciseResult {display:none;}
	#bodytypeResult{ display: 'block'}
</style>

<script>
	function exerciseDisplay(){
	    var food = document.getElementById("foodResult");
	    var exer = document.getElementById("exerciseResult");
	    var body = document.getElementById("bodytypeResult");
	    exer.style.display = 'block';
        body.style.display = 'none';
        food.style.display = 'none';  
	}
	function bodytypeDisplay(){
	    var food = document.getElementById("foodResult");
	    var exer = document.getElementById("exerciseResult");
	    var body = document.getElementById("bodytypeResult");
	    exer.style.display = 'none';
        body.style.display = 'block';
        food.style.display = 'none';  
	}
	function foodDisplay(){
	    var food = document.getElementById("foodResult");
	    var exer = document.getElementById("exerciseResult");
	    var body = document.getElementById("bodytypeResult");
	    exer.style.display = 'none';
        body.style.display = 'none';
        food.style.display = 'block';
	}
</script>

</head>

<body>
	<jsp:include page="../menubar.jsp"></jsp:include>
	<jsp:include page="../survey/bodyanalysissubmenu.jsp"></jsp:include>
	<div class="contents">
	<%-- 
	<h1>체형 분석 결과 페이지</h1>
	<h1>성별 : <%=bodyInfoList.getGender() %></h1>
	<h1>이름 : <%=bodyInfoList.getName() %></h1>
	<h1>체형 : <%=bodyInfoList.getBodytype() %></h1>
	<% for(int i = 0; i < exerciseList.size(); i++) { %>
		<p>운동명<%=i+1 %> : <%=exerciseList.get(i)[0] %></p>
		<p>운동링크<%=i+1 %> : <a href="<%=exerciseList.get(i)[1] %>">링크</a></p>
		<p>운동사진명<%=i+1 %> : <%=exerciseList.get(i)[2] %></p><br><br>
	<% } %>
	--%>
	<table>
		<tr>
		<td><img class="icon1" src="./image/운동.png" alt="bodyLevel" onClick="bodytypeDisplay()" style="cursor:pointer">	</td>
		<td><img class="icon2" src="./image/음식.png" alt="음식"  onClick="foodDisplay()" style="cursor:pointer">	</td>
		<td><img class="icon3" src="./image/운동.png" alt="운동" onClick="exerciseDisplay()" style="cursor:pointer">	</td>
		</tr>
	</table>
	
	
	<div id="bodytypeResult">
	   		<jsp:include page="bodytypeResult.jsp"></jsp:include>
	</div>
	
	<div id="foodResult">
	   		<jsp:include page="foodResult.jsp"></jsp:include>
	</div>
	   	
	   	   	
	   	<div id="exerciseResult">
	   		<jsp:include page="exerciseResult.jsp"></jsp:include>
	   	</div>
	</div>
</body>
</html>
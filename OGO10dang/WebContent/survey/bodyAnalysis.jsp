<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	#bodytypeResult{ display: block;}
</style>

<script>
	function exerciseDisplay(){
	    var food = document.getElementById("foodResult");
	    var exer = document.getElementById("exerciseResult");
	    var body = document.getElementById("bodytypeResult");
	    exer.style.display = 'block';
        body.style.display = 'none';
        food.style.display = 'none';  
        document.getElementById('bodytypeicon').src = "./image/체형.png";
        document.getElementById('foodicon').src = "./image/음식.png";
        document.getElementById('exerciseicon').src = "./image/운동2.png";
	}
	function bodytypeDisplay(){
	    var food = document.getElementById("foodResult");
	    var exer = document.getElementById("exerciseResult");
	    var body = document.getElementById("bodytypeResult");
	    exer.style.display = 'none';
        body.style.display = 'block';
        food.style.display = 'none';  
        document.getElementById('bodytypeicon').src = "./image/체형2.png";
        document.getElementById('foodicon').src = "./image/음식.png";
        document.getElementById('exerciseicon').src = "./image/운동.png";
	}
	function foodDisplay(){
	    var food = document.getElementById("foodResult");
	    var exer = document.getElementById("exerciseResult");
	    var body = document.getElementById("bodytypeResult");
	    exer.style.display = 'none';
        body.style.display = 'none';
        food.style.display = 'block';
        document.getElementById('bodytypeicon').src = "./image/체형.png";
        document.getElementById('foodicon').src = "./image/음식2.png";
        document.getElementById('exerciseicon').src = "./image/운동.png";
	}
</script>

</head>

<body>
	<jsp:include page="../menubar.jsp"></jsp:include>
	<jsp:include page="../survey/bodyanalysissubmenu.jsp"></jsp:include>
	<div class="contents">
	<table class="icons">
		<tr>
		<td><img class="icon1" id="bodytypeicon" src="./image/체형2.png" alt="bodyType" onClick="bodytypeDisplay()" style="cursor:pointer">	</td>
		<td><img class="icon2" id="foodicon" src="./image/음식.png" alt="음식"  onClick="foodDisplay()" style="cursor:pointer">	</td>
		<td><img class="icon3" id="exerciseicon" src="./image/운동.png" alt="운동" onClick="exerciseDisplay()" style="cursor:pointer">	</td>
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
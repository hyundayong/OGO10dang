<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, intial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>

<!-- Bootstrap4 -->
<script src = './js/managementScript.js'></script>
<link rel="stylesheet" href="../css/mainPageStyle.css">
<link rel="stylesheet" href="../survey/css/surveyGenderSelectStyle.css">
<title>체형정보 이용안내</title>
<style>
	.managementintro{
		background-color: #DDDCC5;
		font-family: 나눔스퀘어;
		font-size: 20px;
		padding-left: 500px;
		padding-top: 20px;
		padding-bottom: 20px;
	}
	#introtitles {
		padding: 10px 30px;
		font-weight: bolder;
		font-size: 20px;
		width: 150px;
		background-color: #6A6A61;
		color: white;
		text-align: center;
	}
	.manageStart {
	display: inline-block;
    background-color: #1c1c1c;
    color: white;
    border: none;
    text-align: center;
    font-family: "Rix고딕 B";
    opacity: 1;
    transition: 0.3s;
    text-decoration: none;
    cursor: pointer;
    width: 250px;
    height: 70px;
    line-height: 70px;
    margin-bottom: 30px;
    margin-top: 20px;
    font-size: 25px;
    vertical-align: middle;
	}
	.manageStart:hover {
		color: #ccc;
		text-decoration: none;
	}
</style>
</head>
<body>
	<jsp:include page="../menubar.jsp"></jsp:include>
   
	<div class="contents"><div class="managementintro">
		<h1 style="font-family:Rix고딕 H;padding-left:300px;">INTRODUCTION</h1>
		<p id="introtitles">관리</p>
		<b>입력한 정보를 토대로 맞춤 운동, 식단 프로그램을 제공합니다.</b><br>
		<b>관리를 시작하면 각 항목별로 프로그램 진행상황을 직접 입력하고 확인할 수 있습니다.</b><br>
		<a href="#" class="manageStart" onclick="surveyFinishCheck('<%=(String)session.getAttribute("id") %>')">관리 시작</a>
	</div></div>
   <jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>
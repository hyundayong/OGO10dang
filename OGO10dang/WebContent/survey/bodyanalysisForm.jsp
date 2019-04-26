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

<link rel="stylesheet" href="../css/mainPageStyle.css">
<title>체형정보 이용안내</title>
<style>
	.bodyanalysisuseintro{
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
</style>
</head>
<body>
	<jsp:include page="../menubar.jsp"></jsp:include>
    <jsp:include page="bodyanalysissubmenu.jsp"></jsp:include>
   
	<div class="contents"><div class="bodyanalysisuseintro">
		<h1 style="font-family:Rix고딕 H;padding-left:300px;">INTRODUCTION</h1>
		<p id="introtitles">설문 조사</p>
		<b>회원으로 로그인 후 설문 조사를 통해 기본, 건강 & 운동, 체형 정보를 입력합니다.</b><br><br>
		<p id="introtitles">체형 분석</p>
		<b>설문 조사를 마친 후 입력된 정보를 토대로 체형 분석이 실시됩니다.</b>
		<b>분석 결과를 확인할 수 있습니다.</b>
	</div></div>
   <jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>
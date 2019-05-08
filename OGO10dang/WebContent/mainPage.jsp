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
<!-- Bootstrap4 -->

<link rel="stylesheet" href="./css/mainPageStyle.css">
<title>메인 페이지</title>
</head>
<body>
	<jsp:include page="menubar.jsp"></jsp:include>
   	<div class="container" >
   	<img class="imgwid1" src="image/mainPage2.png" alt="mainPage2"  />	
	<img class="imgwid2" src="image/mainPage4.png" alt="mainPage4"  />
	<img class="imgwid3" src="image/mainPage3.jpg" alt="mainPage3"  />
		<h2 class="headline1">
			OGO10dang
		</h2>
		<h3 class="headline1_1">
		<br>체형을 분석을 통해<br><br>
			운동 일정 및 식단 관리를 해드립니다. 
		</h3>
	</div>
    <div><jsp:include page="footer.jsp"></jsp:include></div>
</body>
</html>
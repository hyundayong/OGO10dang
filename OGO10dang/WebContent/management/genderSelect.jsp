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
<title>체형 정보 성별 선택 페이지</title>
<style>
	body {
	}
	.genderselect{
		margin-top: 100px;
		padding-top: 50px;
		margin: 0 auto;
		text-align: center;
		background-color: #DDDCC5;
	}
	
   #genderselectbutton {
      width:200px;
      height:300px;
      margin: 30px 10px;
      font-size: 27px;
      margin:50px;
      border: none;
      background-color: #6A6A61;
      color: white; 
   }

   #genderselectbutton:hover {
		background-color: #1D2326;
   }
   #genderselecttitle {
   	text-align:center;
   	font-size:40px;
   	padding-bottom:30px;
   	font-family: Rix고딕 H;
   }
</style>
</head>

<body>
	<jsp:include page="../menubar.jsp"></jsp:include>
    <div class="contents"><div class="genderselect">
    	  <h2 id="genderselecttitle">GENDER SELECTION</h2>
          <input type="button" name="gender" value="MAN" id="genderselectbutton" onClick="location.href='../survey/manSurveyForm.jsp';">
          <input type="button" name="gender" value="WOMAN" id="genderselectbutton" onClick="location.href='../survey/womanSurveyForm.jsp';">
    </div></div>
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
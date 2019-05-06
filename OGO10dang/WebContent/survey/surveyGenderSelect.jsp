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
<link rel="stylesheet" href="./css/surveyGenderSelectStyle.css">
<title>체형 정보 성별 선택 페이지</title>

</head>

<body>
	<jsp:include page="../menubar.jsp"></jsp:include>
	<jsp:include page="bodyanalysissubmenu.jsp"></jsp:include>
    <div class="contents"><div class="genderselect">
    	  <h2 id="genderselecttitle">GENDER SELECTION</h2>
          <input type="button" name="gender" value="MAN" id="genderselectbutton" onClick="location.href='manSurveyForm.jsp';">
          <input type="button" name="gender" value="WOMAN" id="genderselectbutton" onClick="location.href='womanSurveyForm.jsp';">
    </div></div>
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
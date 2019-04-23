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
<link rel="stylesheet" href="./css/mainPageStyle.css">
<link rel="stylesheet" href="./css/surveyForm.css">
<style type="text/css">
   .wid {
   position:fixed; top:75px; left: 700px;
   margin-left: auto;
    margin-right: auto;
   font-size: 20px;
   }
   .ul2 {
    
         background-color: white;
   }
     input {
      width:200px;
      height:300px;
      margin: 30px 10px;
      font-size: 27px;
      margin:auto;
   }
</style>


<title>체형 정보 성별 선택 페이지</title>

</head>
<body>
	<jsp:include page="menubar.jsp"></jsp:include>
	<div class="submenubar">
      <nav class="navbar navbar-expand-sm bg-white wid">
         <ul class="navbar-nav ul2 ">
            <li class="nav-item">
               <a class="nav-link " href="#" >이용안내</a>
            </li>
            <li class="nav-item">
               <a class="nav-link " href="#">설문조사</a>
            </li>
            <li class="nav-item">
               <a class="nav-link " href="#">결과보기</a>
            </li>
            
         </ul>   
      </nav>
      </div>
      <div class="contents">
      <fieldset>
               <input type="button" name="gender" value="MAN" onClick="location.href='manSurveyForm.jsp';">
               <input type="button" name="gender" value="WOMAN" onClick="location.href='womanSurveyForm.jsp';">
            </fieldset>
      </div>
   <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
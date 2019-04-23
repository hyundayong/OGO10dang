<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<mete name="viewport" content="width=device-width", intial-scale="1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<!-- Bootstrap4 -->
<style type="text/css">
   .ul1 {
   
      margin-left: auto;
      margin-right: auto;
      vertical-align: bottom;
      
   }
   .li1 {
      padding: 0px 30px;
      font-size: 30px;
   }
   
   .content {
      text-align: center;
      padding: 10px;
      min-height: calc(100vh - 20px);
      <!--background-color: skyblue;-->
   }
   body {
      width: auto;
      margin: 200px;
      
   }
   
   .footer {
    position:absolute;
    bottom:0;
    width:100%;
    height:70px;   
    text-align: center;

      
   }
   #inputposition {
      position: relative;
      left: 215px;
   }
   .imgwid {
   		position: fixed; left:0px; top:75px;
   } 
</style>
<title>로그인</title>
</head>
<body>
	<div>
      <nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
         <ul class="navbar-nav navbar-left">
            <img src="image/logoimage.png" alt="Logo"  onClick="location.href='mainPage.jsp';" style="width:150px; height: 60px; cursor:pointer;">
         </ul>
         <ul class="navbar-nav ul1">
            <li class="nav-item li1">
               <a class="nav-link" onClick="location.href='bodyanalysisForm.jsp';" href="#">체형분석</a>           
            </li>
            <li class="nav-item li1">
               <a class="nav-link" onClick="location.href='managementForm.jsp';" href="#"> 관리 </a>   
            </li>
            <li class="nav-item li1">
               <a class="nav-link" href="#"> 상세 </a>   
            </li>
            <li class="nav-item li1">
               <a class="nav-link" href="#"> 쇼핑 </a>   
            </li>
            <li class="nav-item li1">
               <a class="nav-link" href="#"> 문의 </a>   
            </li>
         </ul>
         <ul class="navbar-nav navbar-right">
            <li class="nav-item">
               <a class="nav-link" href="#" onClick="location.href='loginForm.jsp';">로그인</a>   
            </li>
            <li class="nav-item">
               <a class="nav-link" href="#" onClick="location.href='registForm.jsp';">회원가입</a>   
            </li>
         </ul>
      </nav>
   </div>
   <div >
   <img class="imgwid" src="image/메인이미지.png" alt="Logo" style="width:2000px; height:auto;"  >
   <br><br><br><br><br><br><br><br><br><br>

   </div>
      <div class="footer">
      
         <p>이용약관 | 개인정보처리방침 | 저작권 | 고객센터</p>
      </div>

<p>깃허브 사용해보기</p>
<p>깃허브 사용해보기2</p>
</body>
</html>
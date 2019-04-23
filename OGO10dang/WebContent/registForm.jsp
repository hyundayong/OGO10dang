<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<mete name="viewport" content="width=device-width", intial-scale="1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<style>
.ul1 {
   
      margin-left: auto;
      margin-right: auto;
      vertical-align: bottom;
      
   }
   .li1 {
      padding: 0px 30px;
      font-size: 30px;
   }
   h1 {text-align : center;}
   table {
      margin-left: auto; margin-right: auto   
   }
   #sy {
      width : 350px; height:35px;
   }
   #i {
      font-size : 15px;
   }

     div.content {
  
   width: auto;
   margin-left: auto;
   margin-right: auto;
   margin-bottom : 26.8px;
   margin: 150px;
   
   font-size : 20px;
   text-align: center;
     }
   div.footer {
   height: 50px;
   width: 1000px;
   margin-left: auto;
   margin-right: auto;
  
   font-size : 20px;
   text-align: center;
   }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="registForm.member" method="post"> 

   <div>
      <nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
         <ul class="navbar-nav navbar-left">
            <img src="image/로고이미지.PNG" alt="Logo"  onClick="location.href='mainPage.jsp';" style="width:150px; height: 60px;">
         </ul>
         <ul class="navbar-nav ul1">
            
            <li class="nav-item li1">
               <a class="nav-link" href="#" onClick="location.href='체형분석.jsp';">체형분석</a>   
            </li>
            <li class="nav-item li1">
               <a class="nav-link" href="#"> 관리 </a>   
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
               <a class="nav-link" href="#"  onClick="location.href='loginForm.jsp';">로그인</a>   
            </li>
            <li class="nav-item">
               <a class="nav-link" href="#" onClick="location.href='registForm.jsp';">회원가입</a>   
            </li>
         </ul>
      </nav>
   </div>


<div class="content">
<table>
   
   <img src="image/로고이미지.PNG" onClick="location.href='pageMain.jsp';">
   
   <tr>
      <td id="i" >아이디</td>
   </tr>
   
   <tr>
      <td ><input id="sy" type="text" name="id" minlength="4" maxlength="15" ></td>
   </tr>

   <tr>
      <td id="i" >비밀번호</td>
   </tr>
   
   <tr>
      <td><input id="sy" type="password" minlength="8" maxlength="20" name="pw1" ></td>
   </tr>
   
   <tr>
      <td id="i" >비밀번호 재확인 </td>
   </tr>
   
   <tr>
      <td><input id="sy" type="password" name="pw2" minlength="8" maxlength="20"></td>
   </tr>
   
   <tr>
      <td id="i" >이름</td>
   </tr>
   
   <tr>
      <td><input id="sy" type="text" name="name" ></td>
   </tr>

   <tr>
      <td id="i" >본인 확인 이메일(선택)</td> <!--  이메일인증--> 
   </tr>
   
   <tr>
      <td><input id="sy" type="text" name="email" ></td>
   </tr>
   
   <tr>
      <td id="i" >휴대전화</td>
   </tr>
   
   <tr>
      <td><input id="sy" type="text" name="tel"></td>
   </tr>
   
   <tr>
      <td><br><input id="sy" type="submit" value="가입 하기"></td>
   </tr>

</table>
</div>
<div class="footer">footer</div>
</form>

</body>
</html>
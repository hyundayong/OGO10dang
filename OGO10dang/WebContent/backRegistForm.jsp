<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<style>
   h1 {text-align : center;}
   table {
      margin-left: auto; margin-right: auto   
   }
   #sy {
      width : 350px; height:35px;
   }
   #i {
      font-size : 20px;
      
   }
   #emailbox {
      width: 270px; height:35px;
   }
   #emailButton{
   width:75px; height:40px;
   }
   div.header {
   height: 50px;
   width: 1000px;
   margin-left: auto;
   margin-right: auto;
   background-color : skyblue;
   font-size : 20px;
   text-align: center;
      }
     div.content {
  
   width: 1000px;
     margin-left: auto;
   margin-right: auto;
   margin-bottom : 16.8px;
   background-color : skyblue;
   font-size : 30px;
   text-align: left;
   font-family:"배달의민족 주아";
     }
   div.footer {
   height: 50px;
   width: 1000px;
   margin-left: auto;
   margin-right: auto;
   background-color : skyblue;
   font-size : 20px;
   text-align: center;
   }
   #joinB {
      width:350px;
      height:55px;
      margin-bottom:30px;
      margin-top:0;
      font-size:30px;
      font-family:"배달의민족 주아";
      
   }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
   function confirmId(){
      url="confirmId.jsp?id=" + document.registForm.id.value
    		  +"&idvalidation=" +document.registForm.idvalidation.value;
      open(url, "confirm",
            "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200");
   }
   function checkEmail() {
	   	url="emailSendAction.jsp?email=" + document.registForm.email.value;
 		open(url, "emailsend",
       "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200");
   }
   function checkEmailCode() {
	   	url="emailCodeCheck.jsp?usercode=" + document.registForm.usercode.value;
		open(url, "emailsend",
      "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200");
  }
</script>
<body>
<jsp:useBean class="vo.RegistInfoBean" id="userinfo" scope="session" />
<form action="userInfoStore.jsp" name="registForm" method="post"> 
<div class="header">logo</div>
<div class="content">
<table>
   
   <h1>회원가입</h1>
   
   <tr>
      <td colspan="2" id="i" >아이디</td>
   </tr>
   
   <tr>
   	  <td><input id="emailbox" type="text" name="id"  value="<%=userinfo.getId() %>"
   	  minlength="4" maxlength="15" required /></td>
   	  <td><input type="hidden" name="idvalidation" value="<%=userinfo.getIdvalidation() %>" />
   	  <input id ="emailButton" type="button" value="중복확인" onclick="confirmId()"/></td>
   </tr>
   <tr>
      <td colspan="2" id="i" >비밀번호</td>
   </tr>
   
   <tr>
      <td colspan="2"><input id="sy" type="password" minlength="8" maxlength="20" name="pw1" required /></td>
   </tr>
   
   <tr>
      <td colspan="2" id="i" >비밀번호 재확인 </td>
   </tr>
   
   <tr>
      <td colspan="2"><input id="sy" type="password" name="pw2" minlength="8" maxlength="20" required /></td>
   </tr>
   
   <tr>
      <td colspan="2" id="i" >이름</td>
   </tr>
   
   <tr>
      <td colspan="2"><input id="sy" type="text" name="name" value="<%=userinfo.getName() %>"
      required /></td>
   </tr>

   <tr>
      <td id="i" >이메일주소</td> <!--  이메일인증--> 
   </tr>
   
   <tr>
      <td  ><input id="emailbox" type="email" name="email" value="<%=userinfo.getEmail() %>"
      required /></td>
      <td  ><input id="emailButton" type="button" value="인증" onclick="checkEmail(this.form)"></td>
   </tr>
   
   <tr>
      <td  colspan="2"  id="i" >이메일 인증 코드</td> <!--  이메일인증--> 
   </tr>
   
   <tr>
      <td ><input id="emailbox" type="text" name="usercode" value="<%=userinfo.getUsercode() %>"
      required /></td>
      <td ><input id="emailButton" type="button" value="인증확인" onclick="checkEmailCode()">
      	<input type="hidden" name="emailvalidation" value="<%=userinfo.getEmailvalidation() %>" />
      </td>
   </tr>
   
   <tr>
      <td colspan="2"   id="i" >휴대전화</td>
   </tr>
   
   <tr>
      <td colspan="2"  ><input id="sy" type="text" name="tel" value="<%=userinfo.getTel() %>"
      required></td>
   </tr>
   <tr>
      <td colspan="2" ><br><input id="joinB" type="submit" value="가입 하기"></td>
   </tr>

</table>
</div>
<div class="footer">footer</div>
</form>

</body>
</html>
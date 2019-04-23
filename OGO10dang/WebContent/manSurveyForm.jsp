<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, intial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<!-- Bootstrap4 -->
<link rel="stylesheet" href="./css/surveyForm.css">
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
      background-color: white;
      text-align: center;
      padding: 10px;
      margin: 100px;
      height: 20px; 
      
   }
   #inputposition {
      position: relative;
      left: 215px;
   }
   .jumbotron {
      padding: 10px;
      margin: 0px;
   }
   .wid {
   position:fixed; top:75px; left: 610px;
   font-size: 20px;
   
   
   }
   ul2 {
      background-color: #ccc;
   }
   .mansurveyForm {
   }
   label {
      min-width: 100px;
   }
   fieldset{
    border: 1px groove #ddd !important;
    padding: 0 1.4em 1.4em 1.4em !important;
    margin: 0 0 1.5em 0 !important;
    -webkit-box-shadow:  0px 0px 0px 0px #000;
            box-shadow:  0px 0px 0px 0px #000;
   }
   legend {
    width:inherit; /* Or auto */
    padding:0 10px; /* To give a bit of padding on the left and right */
    border-bottom:none;
   }
</style>


<title>ü�� ���� �Է� ������</title>

</head>
<body>
   <div>
      <nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
         <ul class="navbar-nav navbar-left">
            <img src="image/�ΰ��̹���.PNG" alt="Logo"  onClick="location.href='mainPage.jsp';" style="width:150px; height: 60px;">
         </ul>
         <ul class="navbar-nav ul1">
            <li class="nav-item li1">
               <a class="nav-link" href="#">ü���м�</a>           
            </li>
            <li class="nav-item li1">
               <a class="nav-link" href="#"> ���� </a>   
            </li>
            <li class="nav-item li1">
               <a class="nav-link" href="#"> �� </a>   
            </li>
            <li class="nav-item li1">
               <a class="nav-link" href="#"> ���� </a>   
            </li>
            <li class="nav-item li1">
               <a class="nav-link" href="#"> ���� </a>   
            </li>
         </ul>
         <!-- �α��� �Ǿ������� �������� ������ ���� -->
      </nav>
      <nav class="navbar navbar-expand-sm bg-red navbar-red wid">
         <ul class="navbar-nav ul1 ">
            <li class="nav-item">
               <a class="nav-link " href="#" >�̿�ȳ�</a>
            </li>
            <li class="nav-item">
               <a class="nav-link " href="#">��������</a>
            </li>
            <li class="nav-item">
               <a class="nav-link " href="#">�̿�ȳ�</a>
            </li>
            
         </ul>   
      </nav>
   </div>
   <div class="mansurveyForm">
         <form action="manSurveyForm.pre" method="POST">
            <fieldset>
               <legend>�⺻ ����</legend>
               <label for="name">�̸�</label>
                  <input type="text" name="name" id="name" required /><br><br>
               <label for="gender">����</label>
                  <input type="radio" name="gender" value="man" checked> ���� 
                   <input type="radio" name="gender" value="woman" disabled> ����<br><br>
               <label for="age">����</label>
                  <input type="number" name="age" id="age" min="1" max="150" required/><br><br>
               <label for="height">Ű</label>
                  <input type="number" name="height" id="height" min="0" required /> ( cm )<br><br>
               <label for="weight">������</label>
                  <input type="number" name="weight" id="weight" min="0" required/> ( kg )<br><br>
            </fieldset>
            
            <fieldset>
               <legend>�ǰ� & � ����</legend>
            �� ���� : <input type="radio" name="smoke" value="y" checked/> ��
             <input type="radio" name="smoke" value="n" /> ����<br><br>
            ���� Ƚ�� : <input type="radio" name="drink" value="1" checked/> �Ѵ� 0 ~ 2ȸ
             <input type="radio" name="drink" value="2" /> �Ѵ� 3 ~ 5ȸ
             <input type="radio" name="drink" value="3" /> ������ 2 ~ 3ȸ
             <input type="radio" name="drink" value="4" /> ����<br><br>
            � �ɷ� : <input type="radio" name="exercise" value="1" checked/> Ȱ�� ����
             <input type="radio" name="exercise" value="2" /> �ణ Ȱ����
             <input type="radio" name="exercise" value="3" /> Ȱ����
             <input type="radio" name="exercise" value="4" /> �ſ� Ȱ����<br><br>
            � ���� : <input type="radio" name="purpose" value="diet" checked/> ���̾�Ʈ
             <input type="radio" name="purpose" value="health" /> ü������
             <input type="radio" name="purpose" value="muscle" /> �ٷ�����<br><br><br>
            
            </fieldset>
            
            <fieldset>
               <legend>ü�� ����</legend>
            �� : <input type="radio" name="arm" value="1" checked/> ����
             <input type="radio" name="arm" value="2" /> ����
             <input type="radio" name="arm" value="3" /> ������
             <input type="radio" name="arm" value="4" /> ������<br><br>
            ���� : <input type="radio" name="chest" value="1" checked/> ����
             <input type="radio" name="chest" value="2" /> ����
             <input type="radio" name="chest" value="3" /> ������
             <input type="radio" name="chest" value="4" /> ������<br><br>
            ��� : <input type="radio" name="shoulder" value="1" checked/> ������
             <input type="radio" name="shoulder" value="2" /> ����
             <input type="radio" name="shoulder" value="3" /> ������<br><br>
            ���� : <input type="radio" name="belly" value="1" checked/> ����
             <input type="radio" name="belly" value="2" /> ����
             <input type="radio" name="belly" value="3" /> ������
             <input type="radio" name="belly" value="4" /> ������<br><br>
            ��ü : <input type="radio" name="leg" value="1" checked/> ����
             <input type="radio" name="leg" value="2" /> ����
             <input type="radio" name="leg" value="3" /> ������
             <input type="radio" name="leg" value="4" /> ������<br><br>
             <input type="submit" value="����">&nbsp;&nbsp;
             <input type="reset" value="�ٽþ���"/>
             </fieldset>
         </form>
   </div>
   <div class="footer">
      
         <p>�̿��� | ��������ó����ħ | ���۱� | ������</p>
      </div>

</body>
</html>
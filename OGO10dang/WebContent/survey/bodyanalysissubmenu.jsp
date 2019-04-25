<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.submenubar {
		position:fixed; top:80px; 
		width: 100%;
		background-color: white;
		padding-left: 470px;
		margin 0;
	}
	.li_submenu {
      width: 230px;
      font-size: 25px;
      font-family: 나눔스퀘어;
      font-weight: bold;
   }
   .li_submenu a:link, .li_submenu a:visited {
   		color: black;
   }
   .li_submenu a:hover {
   		color: #611427;		/*#611427  #12406a*/
   }
</style>
<body>
	<div class="submenubar">
      <nav class="navbar navbar-expand-sm">
         <ul class="navbar-nav">
            <li class="nav-item li_submenu">
               <a class="nav-link " href="#">설문조사</a>
            </li>
            <li class="nav-item li_submenu">
               <a class="nav-link " href="#">결과보기</a>
            </li>
            
         </ul>   
      </nav>
      </div>
</body>
</html>
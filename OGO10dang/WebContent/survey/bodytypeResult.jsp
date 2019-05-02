<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.survey.BodyInfo" %>
<%@ page import = "java.util.ArrayList" %>
<%
	BodyInfo bodyInfoList = (BodyInfo)request.getAttribute("bodyInfoList");
	ArrayList<String[]> exerciseList = (ArrayList<String[]>)request.getAttribute("exerciseList");
%>
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
<title>체형 분석 결과보기 페이지</title>
</head>
<body>
	<div id="bodytypeResult">
	  		<table border="1">
			<tr>
				<td> <img src="./image/mainPage2.png" alt="bodyanalysis" style="align:center"/> </td>
			</tr>
			<tr>
				<td class="title"> 체형 분석 결과 페이지 </td>
				<td><%=bodyInfoList.getBodytype() %></td>
			</tr>
			<tr>
			<td>
			</td>
			</tr>
		</table>
	</div>
</body>
</html>
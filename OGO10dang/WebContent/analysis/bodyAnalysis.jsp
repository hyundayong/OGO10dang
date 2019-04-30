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
<title>체형 분석 결과 페이지</title>
<link rel="stylesheet" href="../css/mainPageStyle.css">
</head>
<body>
	<jsp:include page="../menubar.jsp"></jsp:include>
	<jsp:include page="../survey/bodyanalysissubmenu.jsp"></jsp:include>
	<div class="contents">
	<h1>체형 분석 결과 페이지</h1>
	<h1>성별 : <%=bodyInfoList.getGender() %></h1>
	<h1>이름 : <%=bodyInfoList.getName() %></h1>
	<h1>체형 : <%=bodyInfoList.getBodytype() %></h1>
	<% for(int i = 0; i < exerciseList.size(); i++) { %>
		<p>운동명<%=i+1 %> : <%=exerciseList.get(i)[0] %></p>
		<p>운동링크<%=i+1 %> : <%=exerciseList.get(i)[1] %></p><br>
	<% } %>
	</div>
</body>
</html>
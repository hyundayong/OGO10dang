<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.survey.BodyInfo" %>
<%@ page import = "java.util.ArrayList" %>
<%
	BodyInfo bodyInfoList = (BodyInfo)request.getAttribute("bodyInfoList");
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
<link rel="stylesheet" href="./css/bodytypeResultStyle.css">
<title>체형 분석 결과보기 페이지</title>
</head>
<body>
	<div class="bodytype_content">
		<table>
			<tr>
				<td>
					<h2> <%=bodyInfoList.getName()%> 님의 체형정보 </h2>
				</td>
				</tr>
				<tr>
				<td> 
					<a href="../mainPage.jsp" class="photo" ><img src="./image/보통2.png" alt ="BodyType"/></a>
				</td>
			</tr>
			<tr>
				<td class="title"><h2> <%=bodyInfoList.getBodytype()%> </h2></td>
			</tr>
			<tr>
				<td class="sub"><h5> Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
				Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer 
				took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, 
				but also the leap into electronic typesetting, remaining essentially unchanged. 
				It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, 
				and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. 
				</h5></td>
			</tr>
		</table>
	</div>
	 <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
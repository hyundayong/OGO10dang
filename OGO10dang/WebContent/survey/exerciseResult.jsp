<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.survey.BodyInfo" %>
<%@ page import = "java.util.ArrayList" %>
<%
	ArrayList<String[]> exerciseList = (ArrayList<String[]>)request.getAttribute("exerciseList");
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

<link rel="stylesheet" href="./css/exerciseResultStyle.css">


<title>Insert title here</title>
</head>
<body>
<%--
운동명<%=i+1 %> : <%=exerciseList.get(i)[0] %>
운동링크<%=i+1 %> : <%=exerciseList.get(i)[1] %>>
운동사진명<%=i+1 %> : <%=exerciseList.get(i)[2] %>

 --%>

	<div class="content">
		<table class="photoTable">
			<tr>
				<td colspan="4">
					<h2 class="exercisetitle"><span style="color:#12406a;font-size:40px;"><%=bodyInfoList.getName()%></span>님의 맞춤 운동</h2>
				</td>
			</tr>
			<tr>
				<td> 
					<a href="<%=exerciseList.get(0)[1] %>" class="photo" target="_blank"><img src="./image/exercise/<%=exerciseList.get(0)[2] %>" alt ="운동사진"/></a>		
				</td>
				<td> 
					<a href="<%=exerciseList.get(1)[1] %>" class="photo" target="_blank"><img src="./image/exercise/<%=exerciseList.get(1)[2] %>" alt ="운동사진"/></a>
				</td>
				<td> 
					<a href="<%=exerciseList.get(2)[1] %>" class="photo" target="_blank"><img src="./image/exercise/<%=exerciseList.get(2)[2] %>" alt ="운동사진"/></a>
				</td>
				<td> 
					<a href="<%=exerciseList.get(3)[1] %>" class="photo" target="_blank"><img src="./image/exercise/<%=exerciseList.get(3)[2] %>" alt ="운동사진"/></a>
				</td>
			</tr>
			<tr>
				<td class="exercisetitle"> <%=exerciseList.get(0)[0] %></td>
				<td class="exercisetitle"> <%=exerciseList.get(1)[0] %></td>
				<td class="exercisetitle"> <%=exerciseList.get(2)[0] %></td>
				<td class="exercisetitle"> <%=exerciseList.get(3)[0] %></td>
			</tr>
			<tr>
				<td class="exercisesub"><a href="<%=exerciseList.get(0)[1] %>">링크</a></td>
				<td class="exercisesub"> Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. </td>
				<td class="exercisesub"> Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. </td>
				<td class="exercisesub"> Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. </td>
			</tr>
		</table>
	</div>
	 <jsp:include page="../footer.jsp"></jsp:include>
	
 
</body>
</html>
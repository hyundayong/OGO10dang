<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.survey.BodyInfo" %>
<%@ page import = "java.util.ArrayList" %>
<%
	BodyInfo bodyInfoList = (BodyInfo)request.getAttribute("bodyInfoList");
	ArrayList<String[]> foodList = (ArrayList<String[]>)request.getAttribute("foodList");
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

<link rel="stylesheet" href="./css/foodResultStyle.css">

<title>Insert title here</title>
</head>


	<div class="content">
		<table class="photoTable">
			<tr><td colspan="4">
					<h2 class="foodtitle"><span style="color:#12406a;font-size:40px;"><%=bodyInfoList.getName()%></span>님의 맞춤 운동</h2>
			</td></tr>
			<tr>
				<td> 
					<p class="photo" ><img src="./image/food/<%=foodList.get(0)[1] %>" alt ="음식사진"/></p>
				</td>
				<td> 
					<p class="photo"><img src="./image/food/<%=foodList.get(1)[1] %>" alt ="음식사진"/></p>
				</td>
				<td> 
					<p class="photo"><img src="./image/food/<%=foodList.get(2)[1] %>" alt ="음식사진"/></p>
				</td>
				<td> 
					<p class="photo"><img src="./image/food/<%=foodList.get(3)[1] %>" alt ="음식사진"/></p>
				</td>
			</tr>
			<tr>
				<td class="foodtitle"> <%=foodList.get(0)[0] %></td>
				<td class="foodtitle"> <%=foodList.get(1)[0] %></td>
				<td class="foodtitle"> <%=foodList.get(2)[0] %></td>
				<td class="foodtitle"> <%=foodList.get(3)[0] %></td>
			</tr>
			<tr>
				<td class="foodsub"> Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. </td>
				<td class="foodsub"> Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. </td>
				<td class="foodsub"> Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. </td>
				<td class="foodsub"> Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. </td>
			</tr>
		</table>
	</div>
 <jsp:include page="../footer.jsp"></jsp:include>
	
 
</body>
</html>
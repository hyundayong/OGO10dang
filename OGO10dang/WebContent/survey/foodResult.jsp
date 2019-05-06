<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList" %>
<%
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

<link rel="stylesheet" href="./css/exerciseResultStyle.css">

<title>Insert title here</title>
</head>


	<div class="content">
		<table class="photoTable">
			<tr>
				<td> 
					<a href="../mainPage.jsp" class="photo" ><img src="./image/food/<%=foodList.get(0)[1] %>" alt ="음식사진"/></a>
				</td>
				<td> 
					<a href="../mainPage.jsp" class="photo"><img src="./image/food/<%=foodList.get(1)[1] %>" alt ="음식사진"/></a>
				</td>
				<td> 
					<a href="../mainPage.jsp" class="photo"><img src="./image/food/<%=foodList.get(2)[1] %>" alt ="음식사진"/></a>
				</td>
				<td> 
					<a href="../mainPage.jsp" class="photo"><img src="./image/food/<%=foodList.get(3)[1] %>" alt ="음식사진"/></a>
				</td>
			</tr>
			<tr>
				<td class="title"> <%=foodList.get(0)[0] %></td>
				<td class="title"> <%=foodList.get(1)[0] %></td>
				<td class="title"> <%=foodList.get(2)[0] %></td>
				<td class="title"> <%=foodList.get(3)[0] %></td>
			</tr>
			<tr>
				<td class="sub"> 사진명 : <%=foodList.get(0)[1] %></td>
				<td class="sub"> 사진명 : <%=foodList.get(1)[1] %></td>
				<td class="sub"> 사진명 : <%=foodList.get(2)[1] %></td>
				<td class="sub"> 사진명 : <%=foodList.get(3)[1] %></td>
			</tr>
		</table>
	</div>
 <jsp:include page="../footer.jsp"></jsp:include>
	
 
</body>
</html>
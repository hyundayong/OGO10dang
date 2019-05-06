<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.survey.BodyInfo" %>
<%
	BodyInfo bodyInfoList = (BodyInfo) request.getAttribute("bodyInfoList");
%>
<%!
	public String checkedShow(BodyInfo bodyInfoList, String var, String value) {
		String check = "";
		if(var.equals("smoke")) {
			if(bodyInfoList.getSmoke().equals(value)){
				check = "checked"; 
			}
		} else if(var.equals("purpose")) {
			if(bodyInfoList.getPurpose().equals(value)) {
				check = "checked";
			}
		}
	return check;
	}

	public String checkedShow(BodyInfo bodyInfoList, String var, int value) {
	String check = "";
	if(var.equals("drink")) {
		if(bodyInfoList.getDrink() == value){
			check = "checked";	
		}
	} else if(var.equals("exercise")) {
		if(bodyInfoList.getExercise() == value){
			check = "checked";
		}
	} else if(var.equals("arm")) {
		if(bodyInfoList.getArm() == value) {
			check = "checked";
		}
	} else if(var.equals("thigh")){
		if(bodyInfoList.getThigh() == value) {
			check = "checked";
		}
	} else if(var.equals("calf")){
		if(bodyInfoList.getCalf() == value) {
			check = "checked";
		}
	} else if(var.equals("hip")){
		if(bodyInfoList.getHip() == value) {
			check = "checked";
		}
	} else if(var.equals("belly")){
		if(bodyInfoList.getBelly() == value) {
			check = "checked";
		}
	}
	return check;
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, intial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<!-- Bootstrap4 -->
<link rel="stylesheet" href="../css/mainPageStyle.css">
<link rel="stylesheet" href="./css/surveyFormStyle.css">
<title>이미 입력한 체형 정보 페이지 - 여자</title>

</head>
<body>
   <jsp:include page="../menubar.jsp"></jsp:include>
   <jsp:include page="bodyanalysissubmenu.jsp"></jsp:include>
    <div class="contents" id="surveyFormBackColor">
         <form class="mansurveyForm" action="womanSurveyFormResult.pre" method="POST">
            <br><fieldset>
               <legend id="legendwid">기본 정보</legend>
               <table>
                  <tr><td class="labelwidth"><label for="name">이름</label></td>
                  <td><input type="text" name="name" id="name" value='<%=bodyInfoList.getName()%>' required /></td></tr>
                  <tr><td class="labelwidth"><label for="gender">성별</label></td>
                  <td><input type="radio" name="gender" value="man" disabled> 남자&nbsp;&nbsp;
                  <input type="radio" name="gender" value="woman" checked> 여자</td></tr>
                  <tr><td class="labelwidth"><label for="age">나이</label></td>
                  <td><input type="number" name="age" id="age" min="1" max="150" value='<%=bodyInfoList.getAge()%>' required/></td></tr>
                  <tr><td class="labelwidth"><label for="height">키</label></td>
                  <td><input type="number" name="height" id="height" min="0" style="display: inline;" value='<%=bodyInfoList.getHeight()%>' required /></td>
                  <td>&nbsp;( cm )</td></tr>
                  <tr><td class="labelwidth"><label for="weight">몸무게</label></td>
                  <td><input type="number" name="weight" id="weight" min="0" value='<%=bodyInfoList.getWeight()%>' required/></td>
                  <td>&nbsp;( kg )</td></tr>
               </table>
            </fieldset><br>
            
            <fieldset>
               <legend id="legendwid">건강 & 운동 정보</legend>
                  <table>
                  <tr><td class="labelwidth"><label for="smoke">흡연 유무</label></td>
                     <td><input type="radio" name="smoke" value="y" <%=checkedShow(bodyInfoList, "smoke", "y") %>/> 흡연</td>
                     <td><input type="radio" name="smoke" value="n" <%=checkedShow(bodyInfoList, "smoke", "n") %>/> 비흡연</td></tr>
                  <tr><td class="labelwidth"><label for="drink">음주 횟수</label></td>
                     <td><input type="radio" name="drink" value="1" <%=checkedShow(bodyInfoList, "drink", 1) %>/> 한달 0 ~ 2회</td>
                     <td><input type="radio" name="drink" value="2" <%=checkedShow(bodyInfoList, "drink", 2) %>/> 한달 3 ~ 5회</td>
                     <td><input type="radio" name="drink" value="3" <%=checkedShow(bodyInfoList, "drink", 3) %>/> 일주일 2 ~ 3회</td>
                     <td><input type="radio" name="drink" value="4" <%=checkedShow(bodyInfoList, "drink", 4) %>/> 매일</td></tr>
                  <tr><td rowspan="4" class="labelwidth"><label for="exercise">운동 능력</label></td>
                     <td><input type="radio" name="exercise" value="1" <%=checkedShow(bodyInfoList, "exercise", 1) %>/> 활동 적음 </td>
                     <td>(일반적인 하루 활동)</td></tr>
                  <tr><td><input type="radio" name="exercise" value="2" <%=checkedShow(bodyInfoList, "exercise", 2) %>/> 약간 활동적 </td>
                     <td colspan="3">(적당한 운동 하루 30~60분)</td></tr>
                  <tr><td><input type="radio" name="exercise" value="3" <%=checkedShow(bodyInfoList, "exercise", 3) %>/> 활동적 </td>
                     <td colspan="3">(적당한 운동 60분 이상)</td></tr>
                  <tr><td><input type="radio" name="exercise" value="4" <%=checkedShow(bodyInfoList, "exercise", 4) %>/> 매우 활동적</td>
                     <td colspan="3">(고강도 운동 60분 이상)</td></tr>
                  <tr><td class="labelwidth"><label for="purpose">운동 목적</label></td>
                     <td><input type="radio" name="purpose" value="diet" <%=checkedShow(bodyInfoList, "purpose", "diet") %>/> 다이어트</td>
                     <td><input type="radio" name="purpose" value="health" <%=checkedShow(bodyInfoList, "purpose", "health") %>/> 체력증진</td>
                     <td><input type="radio" name="purpose" value="muscle" <%=checkedShow(bodyInfoList, "purpose", "muscle") %>/> 근력증가</td>
                  </tr>
 				</table>
            </fieldset><br>
            
            <fieldset>
               <legend id="legendwid">체형 정보</legend>
               <table>
                  <tr><td class="labelwidth"><label for="arm">팔</label></td>
                     <td><input type="radio" name="arm" value="1" <%=checkedShow(bodyInfoList, "arm", 1) %>/> 마름</td>
                     <td><input type="radio" name="arm" value="2" <%=checkedShow(bodyInfoList, "arm", 2) %>/> 보통</td>
                     <td><input type="radio" name="arm" value="3" <%=checkedShow(bodyInfoList, "arm", 3) %>/> 지방형</td>
                     <td><input type="radio" name="arm" value="4" <%=checkedShow(bodyInfoList, "arm", 4) %>/> 근육형</td></tr>
                  <tr><td class="labelwidth"><label for="belly">복부</label></td>
                     <td><input type="radio" name="belly" value="1" <%=checkedShow(bodyInfoList, "belly", 1) %>/> 마름</td>
                     <td><input type="radio" name="belly" value="2" <%=checkedShow(bodyInfoList, "belly", 2) %>/> 보통</td>
                     <td><input type="radio" name="belly" value="3" <%=checkedShow(bodyInfoList, "belly", 3) %>/> 지방형</td>
                     <td><input type="radio" name="belly" value="4" <%=checkedShow(bodyInfoList, "belly", 4) %>/> 근육형</td></tr>
                  <tr><td class="labelwidth"><label for="thigh">허벅지</label></td>
                     <td><input type="radio" name="thigh" value="1" <%=checkedShow(bodyInfoList, "thigh", 1) %>/> 마름</td>
                     <td><input type="radio" name="thigh" value="2" <%=checkedShow(bodyInfoList, "thigh", 2) %>/> 보통</td>
                     <td><input type="radio" name="thigh" value="3" <%=checkedShow(bodyInfoList, "thigh", 3) %>/> 지방형</td>
                     <td><input type="radio" name="thigh" value="4" <%=checkedShow(bodyInfoList, "thigh", 4) %>/> 근육형</td></tr>
                  <tr><td class="labelwidth"><label for="calf">종아리</label></td>
                     <td><input type="radio" name="calf" value="1" <%=checkedShow(bodyInfoList, "calf", 1) %>/> 마름</td>
                     <td><input type="radio" name="calf" value="2" <%=checkedShow(bodyInfoList, "calf", 2) %>/> 보통</td>
                     <td><input type="radio" name="calf" value="3" <%=checkedShow(bodyInfoList, "calf", 3) %>/> 지방형</td>
                     <td><input type="radio" name="calf" value="4" <%=checkedShow(bodyInfoList, "calf", 4) %>/> 근육형</td></tr>
                  <tr><td class="labelwidth"><label for="hip">엉덩이</label></td>
                     <td><input type="radio" name="hip" value="1" <%=checkedShow(bodyInfoList, "hip", 1) %>/> 마름</td>
                     <td><input type="radio" name="hip" value="2" <%=checkedShow(bodyInfoList, "hip", 2) %>/> 보통</td>
                     <td><input type="radio" name="hip" value="3" <%=checkedShow(bodyInfoList, "hip", 3) %>/> 지방형</td>
                     <td><input type="radio" name="hip" value="4" <%=checkedShow(bodyInfoList, "hip", 4) %>/> 근육형</td></tr>
               </table>
             </fieldset><br>
             <div class="buttons">
                <input id="submitButton" type="submit" value="수정">&nbsp;&nbsp;
                <input id="resetButton" type="reset" value="다시쓰기"/>
             </div><br>
         </form>
   </div>
  <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
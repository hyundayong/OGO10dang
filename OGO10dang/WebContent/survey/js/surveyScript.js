// 설문조사를 했는지 확인하는 function 
function loginCheck(idCheck) {
	if (idCheck == 'null') {
		alert("먼저 로그인을 해주세요.");
		document.location.href='http://localhost:8088/ogo10dang_yk/loginForm.jsp';
	} else {
		// 로그인 한 상태에서는 설문조사를 했는지 확인.
		document.location.href='surveyCompleteCheck.pre';
		// SurveyCompleteCheckAction 에서 남자인지 여자인지 확인함.
	}
}

// 체형 분석 결과 확인 시 로그인 여부, 체형분석 여부 검사
function loginSurveyCheck(idCheck) {
	if(idCheck == 'null') {
		alert("먼저 로그인을 해주세요.");
		document.location.href="http://localhost:8088/ogo10dang_yk/loginForm.jsp";
	} else {
		document.location.href="bodyAnalysis.pre";
	}
}

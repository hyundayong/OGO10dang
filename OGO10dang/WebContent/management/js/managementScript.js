function surveyFinishCheck(idCheck) {
	if (idCheck == 'null') {
		alert("먼저 로그인을 해주세요.");
		document.location.href='http://localhost:8088/ogo0507_1217/loginForm.jsp';
	} else {
		// 로그인 한 상태에서는 설문조사를 했는지 확인.
		document.location.href='surveyFinishCheck.manage';
		// SurveyCompleteCheckAction 에서 남자인지 여자인지 확인함.
	}
}
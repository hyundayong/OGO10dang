<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style>

form { 
        margin: 0 auto; 
        width:250px;
    } 
   #textarea {
      margin-top : 10px;
      border:1px solid black;
      padding: 10px 0px;
      font-family:"Rix도쿄감성";
     font-size:17px;
   }
    .header {
      background-color: white;

      padding: 20px;
      margin: 50px;
      }
      .contents {

     margin-left: auto;
   margin-right: auto;
   margin-bottom : 26.8px;
   
   background-color :white;
     }
       .footer {
      background-color: white;
      text-align: center;
      padding: 10px;
      
   }
   .checkbox-circle {
     }
   
/* The container */
.container {
  display: block;
  position: relative;
  padding-left: 30px;
  margin-bottom: 5px;
  margin-top:12px;
  cursor: pointer;
  font-size: 20px;
  font-family:"배달의민족 주아";
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* Hide the browser's default checkbox */
.container input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
  height: 0;
  width: 0;
}

/* Create a custom checkbox */
.checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 20px;
  width: 20px;
  background-color: #ffeae5;
  margin-bottom:15px;
}

/* Create a custom checkbox */
.checkmarkLarge {
  position: absolute;
  top: 0;
  left: 0;
  height: 30px;
  width: 30px;
  background-color: #ffeae5;
  margin-top:3px;
  margin-bottom:5px;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
  background-color: #fff6f4;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmarkLarge {
  background-color: #fff6f4;
}

/* When the checkbox is checked, add a blue background */
.container input:checked ~ .checkmark {
  background-color: #fff6f4;
}
/* When the checkbox is checked, add a blue background */
.container input:checked ~ .checkmarkLarge {
  background-color: #fff6f4;
}


/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}
/* Create the checkmark/indicator (hidden when not checked) */
.checkmarkLarge:after {
  content: "";
  position: absolute;
  display: none;
}

/* Show the checkmark when checked */
.container input:checked ~ .checkmark:after {
  display: block;
}
.container input:checked ~ .checkmarkLarge:after {
  display: block;
}

/* Style the checkmark/indicator */
.container .checkmark:after {
  left: 7px;
  top: 3px;
  width: 5px;
  height: 10px;
  border: solid #38618F;
  border-width: 0 3px 3px 0;
  -webkit-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  transform: rotate(45deg);
}
/* Style the checkmark/indicator */
.container .checkmarkLarge:after {
  left: 9px;
  top: 4px;
  width: 8px;
  height: 14px;
  border: solid #38618F;
  border-width: 0 5px 5px 0;
  -webkit-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  transform: rotate(45deg);
}

#cancleButton {
  background-color: #C7C5B8;
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  font-size: 25px;
  font-family:"배달의민족 도현";
  margin: 4px 2px;
  opacity: 1;
  transition: 0.3s;
  display: inline-block;
  text-decoration: none;
  cursor: pointer;
}

#nextButton {
  background-color: #FF6745;
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  font-size: 25px;
  font-family:"배달의민족 도현";
  margin: 4px 2px;
  opacity: 1;
  transition: 0.3s;
  display: inline-block;
  text-decoration: none;
  cursor: pointer;
}

#nextButton:hover {
color:black;
}
#cancleButton:hover {
color:black;

}
.bottomButton {
	text-align:center;
	margin-top:15px;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>

<script>
   function backToMain(){
      document.location.href='mainPage.jsp';
   }
	function checkAll() {
		var inputs = document.getElementsByTagName("input");
		for (var i = 0; i < inputs.length; i++) {
			if (inputs[i].type == "checkbox") {
				if (inputs[0].checked == true) {
					inputs[i].checked = true;
				} else if (inputs[0].checked == false) {
					inputs[i].checked = false;
				}
			}
		}
	}

</script>

<body >
<form style="width: 500px;" action="terms.member" method="post"> 
   <div class="header"> <img src="image/logoimage.png" alt="Logo"  onClick="location.href='mainPage.jsp'"/></div>
   
   <div class="contents">
   
   <label class="container">
      <input type="checkbox" onClick="checkAll()" /><h4 style="padding-left:7px">이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택),<br/>프로모션 안내 메일 수신(선택)에 모두 동의합니다.</h2>
	  <span class="checkmarkLarge"></span>
   </label>
	
	<label class="container">
		<input type="checkbox" name="requiredTerms1" value="1">이용약관 동의(필수)<br>
		<span class="checkmark"></span>
	</label>
	
    <div id="textarea" style="overflow:auto; width:500px; height:100px;">
   <b>제1조(목적)</b><br>
이 약관은 힐링메뉴(전자상거래 사업자)가 운영하는 힐링메뉴사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리?의무 및 책임사항을 규정함을 목적으로 합니다.<br>

※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다」<br>

<b>제2조(정의)</b><br>
①“몰” 이란 OO 회사가 재화 또는 용역(이하 “재화등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터등 정보통신설비를 이용하여 재화등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.<br>

②“이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.<br>

③ ‘회원’이라 함은 “몰”에 개인정보를 제공하여 회원등록을 한 자로서, “몰”의 정보를 지속적으로 제공받으며, “몰”이 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.<br>

④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.<br>


<b>제3조 (약관등의 명시와 설명 및 개정) </b><br>
① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호?모사전송번호?전자우편주소, 사업자등록번호, 통신판매업신고번호, <br>개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 00 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.<br>

② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회?배송책임?환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.<br>

③ “몰”은 전자상거래등에서의소비자보호에관한법률, 약관의규제에관한법률, 전자거래기본법, 전자서명법, 정보통신망이용촉진등에관한법률, 방문판매등에관한법률, 소비자보호법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.<br>

④ “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일이전부터 적용일자 전일까지 공지합니다.<br>
다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 "몰“은 개정전 내용과 개정후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다. <br>

⑤ “몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간내에 ‘몰“에 송신하여 ”몰“의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.<br>

⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래등에서의소비자보호에관한법률, 약관의규제등에관한법률, 공정거래위원회가 정하는 전자상거래등에서의소비자보호지침 및 관계법령 또는 상관례에 따릅니다.<br>

    </div>
   <label class="container">
    	<input  type="checkbox" name="requiredTerms2" value="2">개인정보 수집 및 이용 동의(필수)<br>
   		<span class="checkmark"></span>
   </label>
   
    <div id="textarea" style="overflow:auto; width:500px; height:100px;">
    <b>개인정보 수집 및 이용 동의 </b><br>  수집하는 개인정보 항목<br>
회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다. <br> 
ο 수집항목 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 비밀번호 질문과 답변 , 자택 전화번호 , 자택 주소 , 휴대전화번호 , 이메일 , 직업 , 회사명 , 부서 , 직책 , 회사전화번호 , 취미 , 결혼여부 , 기념일 , 법정대리인정보 , 주민등록번호 , 서비스 이용기록 , 접속 로그 , 접속 IP 정보 , 결제기록
ο 개인정보 수집방법 : 홈페이지(회원가입) , 서면양식 <br> 

<b>개인정보의 수집 및 이용목적</b>  <br>

회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.  <br>

ο 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송 <br>
ο 회원 관리 <br>
회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인 , 고지사항 전달 ο 마케팅 및 광고에 활용 <br>
접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계  <br>

<b>개인정보의 보유 및 이용기간</b>  <br>

회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외 없이 해당 정보를 지체 없이 파기합니다. <br>
 
    </div>
    <label class="container">
      <input type="checkbox" name="terms3" value="3">개인정보 취급 위탁 동의(선택)<br>
    	<span class="checkmark"></span>
    </label>
  
    <div id="textarea" style="overflow:auto; width:500px; height:100px;">
    <b>아래 내용의 동의 여부는 회원가입에 영향을 미치지 않습니다. 단, 동의 거부시 서비스 이용에 제한이 있을 수 있습니다.</b><br>
    수집한 개인정보의 위탁<br>
 회사는 서비스 이행을 위해 아래와 같이 외부 전문업체에 위탁하여 운영하고 있습니다.<br>
o 위탁 대상자 : [우체국택배, (주)팀프레시]<br>
o 위탁업무 내용 : [고객 이름 / 주소 / 연락처 / 특이사항 배송정보]<br>
- 위탁업무의 내용: 고객영양상담 및 배송 기록 관리<br>

</div>
 	
 	<label class="container">
 	 <input type="checkbox" name="terms4" value="4">이벤트 등 프로모션 알림 수신(선택)<br>
 	<span class="checkmark"></span>
 	</label>
    
     <div class="bottomButton">
     <input id="cancleButton" type="button" value="동의안함" onclick="backToMain()";>&nbsp;&nbsp;&nbsp;<input id="nextButton"  type="submit" value="가입하기">
	</div>
    
    
   </div>
     <div class="footer">
    <p>이용약관 | 개인정보처리방침 | 저작권 | 고객센터</p>
     </div>
</form>

</body>
</html>
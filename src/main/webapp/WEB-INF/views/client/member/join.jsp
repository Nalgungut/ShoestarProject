<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
   <html>
      <head>
         <meta charset="UTF-8">
         
         <!-- 브라우저의 호환성 보기 모드를 막고, 해당 브라우저에서 지원하는 가장 최신버전의 방식으로 HTML보여주도록 설정하는법 -->
         <meta name="viewport" content="width=device-width initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
         <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
         
         <title>Insert title here</title>
         
          <!--모바일 웹 페이지 설정-->
         <link rel="shortcut icon" href="../image/icon.png"/>
         <link rel="apple-touch-icon" href="../image/icon.png"/>
      <!--    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"> -->
         <!--모바일 웹 페이지 설정 끝-->
         <!--<link rel="stylesheet" type="text/css" href=""/>-->
         
         <!-- 인터넷익스8 이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다. -->
         <!-- [if it IE 9] > <script src="js/html5shiv.js"></script><![endif] -->
         <!-- <link rel="stylesheet" type="text/css" href="../js/jquery-1.12.4.min.js">
         <!-- jQuery프레임워크 참조 -->         
           <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
           <script type="text/javascript" src="/resources/include/js/jquery.form.min.js"></script>
           <script type="text/javascript" src="/resources/include/js/join.js"></script>
           <script type="text/javascript" src="/resources/include/js/login.js"></script>
           <script type="text/javascript" src="/resources/include/js/pwdPattern.js"></script>
           <script type="text/javascript" src="/resources/include/js/html5shiv.js"></script>
           
           <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
           <!-- <script type="text/javascript" src="/resources/include/js/modify.js"></script> -->
            <!-- <link rel="stylesheet" type="text/css" href="/resources/include/css/bootstrap.css"/> -->
           <!--  <link rel="stylesheet" href="/resources/include/css/default.css"/> -->
          
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
           <!--  <script type="text/javascript" src="resources/include/css/ec-base-box.css"></script> -->
            <link rel="stylesheet" type="text/css" href="/resources/include/css/ec-base-box.css">
            
            <style>
            /* .agree{
            height:120px;} */
            </style>
            
            
            <!-- lightbox 라이브러리 -->
           <!--  <link rel="stylesheet" href="/resources/include/css/lightbox.css"/>
            <script type="text/javascript" src="/resources/include/js/lightbox.min.js"></script> -->
            
            <style>
            	.agree {
					width: 100%;
					height: 170px;
					overflow: scroll;
					}
            </style>
           <script type="text/javascript">
           
        
           function codeCheck(){
        	   var codeNumber = '<c:out value="${codeNumber}"/>';
        	   if(codeNumber !=''){
        		   switch(parseInt(codeNumber)){
        		   
        		   case 1:
        			   		alert("이미 가입된 회원입니다");
        			   		break;
        		   case 2:
        			   		alert("회원 가입처리가 실패하였습니다. \n다시 시도해 주세요.");
        			   		break;
        		   }
        	   }
           }
           
           function sample4_execDaumPostcode() {
               new daum.Postcode({
                   oncomplete: function(data) {
                       // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                       // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                       // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                       var roadAddr = data.roadAddress; // 도로명 주소 변수
                       var extraRoadAddr = ''; // 참고 항목 변수

                       // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                       // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                       if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                           extraRoadAddr += data.bname;
                       }
                       // 건물명이 있고, 공동주택일 경우 추가한다.
                       if(data.buildingName !== '' && data.apartment === 'Y'){
                          extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                       }
                       // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                       if(extraRoadAddr !== ''){
                           extraRoadAddr = ' (' + extraRoadAddr + ')';
                       }

                       // 우편번호와 주소 정보를 해당 필드에 넣는다.
                       document.getElementById('mem_zip').value = data.zonecode;
                       document.getElementById("mem_addr1").value = roadAddr;
                       document.getElementById("mem_addr2").value = data.jibunAddress;
                       
                       // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                       if(roadAddr !== ''){
                           document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                       } else {
                           document.getElementById("sample4_extraAddress").value = '';
                       }

                       var guideTextBox = document.getElementById("guide");
                       // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                       if(data.autoRoadAddress) {
                           var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                           guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                           guideTextBox.style.display = 'block';

                       } else if(data.autoJibunAddress) {
                           var expJibunAddr = data.autoJibunAddress;
                           guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                           guideTextBox.style.display = 'block';
                       } else {
                           guideTextBox.innerHTML = '';
                           guideTextBox.style.display = 'none';
                       }
                   }
               }).open();
           }
     
           </script>
			
		</head>
	<body>
	
		<div class="contentContainer" >
			<div class="well"> 
				<form id="memberForm" class="form-horizontal">
				
				
					<!-- <input type="hidden" name="mem_email" id="mem_email">
					<input type="hidden" name="mem_birth" id="mem_birth"> -->
					
					<div class="form-group form-group-sm">
						<label for="mem_id" class="col-sm-2 control-label">아이디</label>
							<div class="col-sm-3">
								<input type="text" id="mem_id" name="mem_id" maxlength="12" class="form-conrtrol" placeholder="아이디입력"/>
							</div>
							
							<div class="col-sm-2">
								<input type="button" id="idConfirmBtn" name="idConfirmBtn" value="아이디 중복체크" class="form-control btn-primary">
							</div>
							
							<div class="col-sm-5">
								<p class="form-control-static error"></p>
							</div>
					</div>
					
					<div class="form-group form-group-sm">
						<label for="mem_pwd" class="col-sm-2 control-label">비밀번호</label>
							<div class="col-sm-3">
								<input type="password" id="mem_pwd" name="mem_pwd" maxlength="15" 
								class="form-control" placeholder="비밀번호입력">
							</div>
							
							<div class="col-sm-5">
								<p class="form-control-static error"></p>
							</div>
					</div>
					
					<div class="form-group form-group-sm">
						<label for="userPwdCheck" class="col-sm-2 control-label">비밀번호 확인</label>
							<div class="col-sm-3">
								<input type="password" id="userPwdCheck" name="userPwdCheck" 
								class="form-control" maxlength="15" placeholder="비밀번호확인">
							</div>
							
							<div class="col-sm-5">
								<p class="form-control-static error"></p>
							</div>
					</div>
					
					<div class="form-group form-group-sm">
						<label for="mem_phone" class="col-sm-2 control-label">휴대폰번호</label>
							<div class="col-sm-3">
								<input type="text" id="mem_phone" name="mem_phone" maxlength="15" 
								class="form-control" placeholder="휴대폰 번호">
							</div>	
							
							<div class="col-sm-5">
								<p class="form-control-static error"></p>
							</div>
					</div>
					
					<div class="form-group form-group-sm">
						<label for="mem_birth" class="col-sm-2 control-label">생년월일</label>
							<div class="col-sm-3">
								<input type="text" id="mem_birth" name="mem_birth" maxlength="6" 
								class="form-control" placeholder="주민등록번호 앞 6자리">
							</div>	
							
							<div class="col-sm-1">
								<input type="text" id="mem_sex" name="mem_sex" maxlength="1"
								class="form-control" placeholder="앞1자리"/>
							</div>	
							
							<div class="col-sm-5">
								<p class="form-control-static error"></p>
							</div>
					</div>
					
					<div class="form-group form-group-sm">
						<label for="mem_name" class="col-sm-2 control-label">회원이름</label>
							<div class="col-sm-3">
								<input type="text" id="mem_name" name="mem_name" maxlength="10" 
								class="form-control" placeholder="이름입력">
							</div>	
							
							<div class="col-sm-5">
								<p class="form-control-static error"></p>
							</div>
					</div>
					
					<div class="form-group form-group-sm">
						<label for="mem_email" class="col-sm-2 control-label">이메일</label>
							<div class="col-sm-3">
								<input type="text" id="mem_email" name="mem_email" maxlength="60"
								class="form-control" placeholder="이메일주소">
							</div>	
						
							
							<div class="col-sm-2">
								<select id="emailDomain" class="form-control">
									<option value="">직접입력</option>
									<option value="naver.com">네이버</option>
									<option value="hanmail.net">다음</option>
									<option value="nate.com">네이트</option>
									<option value="google.com">구글</option>
									<option value="gmail.com">Gmail</option>
								</select>
							</div>
							
							<div class="col-sm-5">
								<p class="form-control-static error"></p>
							</div>
					</div>
					
						
					
					
					
					<div class="form-group form-group-sm">
						<label for="phone" class="col-sm-2 control-label">주소</label>
							<div class="col-sm-6">
								<input type="text" id="mem_zip" name="mem_zip" placeholder="우편번호">
								<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
								<input type="text" id="mem_addr1" name="mem_addr1" placeholder="도로명주소">
								<input type="text" id="mem_addr2" name="mem_addr2" placeholder="지번주소"><br>
								<span id="guide" style="color:#999;display:none"></span>
								<input type="text" id="mem_addr3" name="mem_addr3" placeholder="상세주소">
								<input type="text" id="sample4_extraAddress" placeholder="참고항목">
							</div>
					</div>	
							
					
					
					<div class="ec-base-box typeThinBg agreeArea">
					<h5>[필수] 이용약관 동의</h5>
				    <div class="agree">
				    
				    <p>
				    제1조(목적) 이 약관은 OO 회사(전자상거래 사업자)가 운영하는 OO 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다.

  ※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」<br/>

제2조(정의)

  ① “몰”이란 OO 회사가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.

  ② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.

  ③ ‘회원’이라 함은 “몰”에 회원등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.

  ④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.

제3조 (약관 등의 명시와 설명 및 개정) 

  ① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호․모사전송번호․전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 00 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.

  ② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회․배송책임․환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.

  ③ “몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.

  ④ “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다.  이 경우 "몰“은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다. 

  ⑤ “몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “몰”에 송신하여 “몰”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.

  ⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.

제4조(서비스의 제공 및 변경) 

  ① “몰”은 다음과 같은 업무를 수행합니다.

    1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결
    2. 구매계약이 체결된 재화 또는 용역의 배송
    3. 기타 “몰”이 정하는 업무

  ② “몰”은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.

  ③ “몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.

  ④ 전항의 경우 “몰”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.

제5조(서비스의 중단) 

  ① “몰”은 컴퓨터 등 정보통신설비의 보수점검․교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.

  ② “몰”은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.

  ③ 사업종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “몰”은 제8조에 정한 방법으로 이용자에게 통지하고 당초 “몰”에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, “몰”이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 “몰”에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.

제6조(회원가입) 

  ① 이용자는 “몰”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.

  ② “몰”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.

    1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 “몰”의 회원재가입 승낙을 얻은 경우에는 예외로 한다.
    2. 등록 내용에 허위, 기재누락, 오기가 있는 경우
    3. 기타 회원으로 등록하는 것이 “몰”의 기술상 현저히 지장이 있다고 판단되는 경우

  ③ 회원가입계약의 성립 시기는 “몰”의 승낙이 회원에게 도달한 시점으로 합니다.

  ④ 회원은 회원가입 시 등록한 사항에 변경이 있는 경우, 상당한 기간 이내에 “몰”에 대하여 회원정보 수정 등의 방법으로 그 변경사항을 알려야 합니다.

제7조(회원 탈퇴 및 자격 상실 등) 

  ① 회원은 “몰”에 언제든지 탈퇴를 요청할 수 있으며 “몰”은 즉시 회원탈퇴를 처리합니다.

  ② 회원이 다음 각 호의 사유에 해당하는 경우, “몰”은 회원자격을 제한 및 정지시킬 수 있습니다.

    1. 가입 신청 시에 허위 내용을 등록한 경우
    2. “몰”을 이용하여 구입한 재화 등의 대금, 기타 “몰”이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우
    3. 다른 사람의 “몰” 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우
    4. “몰”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우

  ③ “몰”이 회원 자격을 제한․정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 “몰”은 회원자격을 상실시킬 수 있습니다.

  ④ “몰”이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.

제8조(회원에 대한 통지)

  ① “몰”이 회원에 대한 통지를 하는 경우, 회원이 “몰”과 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.

  ② “몰”은 불특정다수 회원에 대한 통지의 경우 1주일이상 “몰” 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.

제9조(구매신청 및 개인정보 제공 동의 등) 

  ① “몰”이용자는 “몰”상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, “몰”은 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다. 
      1. 재화 등의 검색 및 선택
      2. 받는 사람의 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력
      3. 약관내용, 청약철회권이 제한되는 서비스, 배송료․설치비 등의 비용부담과 관련한 내용에 대한 확인
      4. 이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표시
         (예, 마우스 클릭)
      5. 재화등의 구매신청 및 이에 관한 확인 또는 “몰”의 확인에 대한 동의
      6. 결제방법의 선택

  ② “몰”이 제3자에게 구매자 개인정보를 제공할 필요가 있는 경우 1) 개인정보를 제공받는 자, 2)개인정보를 제공받는 자의 개인정보 이용목적, 3) 제공하는 개인정보의 항목, 4) 개인정보를 제공받는 자의 개인정보 보유 및 이용기간을 구매자에게 알리고 동의를 받아야 합니다. (동의를 받은 사항이 변경되는 경우에도 같습니다.)


  ③ “몰”이 제3자에게 구매자의 개인정보를 취급할 수 있도록 업무를 위탁하는 경우에는 1) 개인정보 취급위탁을 받는 자, 2) 개인정보 취급위탁을 하는 업무의 내용을 구매자에게 알리고 동의를 받아야 합니다. (동의를 받은 사항이 변경되는 경우에도 같습니다.) 다만, 서비스제공에 관한 계약이행을 위해 필요하고 구매자의 편의증진과 관련된 경우에는 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」에서 정하고 있는 방법으로 개인정보 취급방침을 통해 알림으로써 고지절차와 동의절차를 거치지 않아도 됩니다.


제10조 (계약의 성립)

  ①  “몰”은 제9조와 같은 구매신청에 대하여 다음 각 호에 해당하면 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.

    1. 신청 내용에 허위, 기재누락, 오기가 있는 경우
    2. 미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우
    3. 기타 구매신청에 승낙하는 것이 “몰” 기술상 현저히 지장이 있다고 판단하는 경우

  ② “몰”의 승낙이 제12조제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.

  ③ “몰”의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소 등에 관한 정보 등을 포함하여야 합니다.

제11조(지급방법) “몰”에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각 호의 방법중 가용한 방법으로 할 수 있습니다. 단, “몰”은 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도  추가하여 징수할 수 없습니다.

    1. 폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체 
    2. 선불카드, 직불카드, 신용카드 등의 각종 카드 결제
    3. 온라인무통장입금
    4. 전자화폐에 의한 결제
    5. 수령 시 대금지급
    6. 마일리지 등 “몰”이 지급한 포인트에 의한 결제
    7. “몰”과 계약을 맺었거나 “몰”이 인정한 상품권에 의한 결제  
    8. 기타 전자적 지급 방법에 의한 대금 지급 등

제12조(수신확인통지․구매신청 변경 및 취소)

  ① “몰”은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.

  ② 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고 “몰”은 배송 전에 이용자의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제15조의 청약철회 등에 관한 규정에 따릅니다.

제13조(재화 등의 공급)

  ① “몰”은 이용자와 재화 등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만, “몰”이 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 3영업일 이내에 조치를 취합니다.  이때 “몰”은 이용자가 재화 등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다.

  ② “몰”은 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 “몰”이 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만 “몰”이 고의․과실이 없음을 입증한 경우에는 그러하지 아니합니다.

제14조(환급) “몰”은 이용자가 구매신청한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 3영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.

제15조(청약철회 등)

  ① “몰”과 재화등의 구매에 관한 계약을 체결한 이용자는 「전자상거래 등에서의 소비자보호에 관한 법률」 제13조 제2항에 따른 계약내용에 관한 서면을 받은 날(그 서면을 받은 때보다 재화 등의 공급이 늦게 이루어진 경우에는 재화 등을 공급받거나 재화 등의 공급이 시작된 날을 말합니다)부터 7일 이내에는 청약의 철회를 할 수 있습니다. 다만, 청약철회에 관하여 「전자상거래 등에서의 소비자보호에 관한 법률」에 달리 정함이 있는 경우에는 동 법 규정에 따릅니다. 

  ② 이용자는 재화 등을 배송 받은 경우 다음 각 호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.

    1. 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)
    2. 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우
    3. 시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의 가치가 현저히 감소한 경우
    4. 같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우

  ③ 제2항제2호 내지 제4호의 경우에 “몰”이 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회 등이 제한되지 않습니다.

  ④ 이용자는 제1항 및 제2항의 규정에 불구하고 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화 등을 공급받은 날부터 3월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.

제16조(청약철회 등의 효과)

  ① “몰”은 이용자로부터 재화 등을 반환받은 경우 3영업일 이내에 이미 지급받은 재화 등의 대금을 환급합니다. 이 경우 “몰”이 이용자에게 재화등의 환급을 지연한때에는 그 지연기간에 대하여 「전자상거래 등에서의 소비자보호에 관한 법률 시행령」제21조의2에서 정하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다.

  ② “몰”은 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화 등의 대금을 지급한 때에는 지체 없이 당해 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록 요청합니다.

  ③ 청약철회 등의 경우 공급받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다. “몰”은 이용자에게 청약철회 등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회 등을 하는 경우 재화 등의 반환에 필요한 비용은 “몰”이 부담합니다.

  ④ 이용자가 재화 등을 제공받을 때 발송비를 부담한 경우에 “몰”은 청약철회 시 그 비용을  누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다.

제17조(개인정보보호)

  ① “몰”은 이용자의 개인정보 수집시 서비스제공을 위하여 필요한 범위에서 최소한의 개인정보를 수집합니다. 

  ② “몰”은 회원가입시 구매계약이행에 필요한 정보를 미리 수집하지 않습니다. 다만, 관련 법령상 의무이행을 위하여 구매계약 이전에 본인확인이 필요한 경우로서 최소한의 특정 개인정보를 수집하는 경우에는 그러하지 아니합니다.

  ③ “몰”은 이용자의 개인정보를 수집·이용하는 때에는 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. 

  ④ “몰”은 수집된 개인정보를 목적외의 용도로 이용할 수 없으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는 이용·제공단계에서 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다.

  ⑤ “몰”이 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 제22조제2항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.

  ⑥ 이용자는 언제든지 “몰”이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 “몰”은 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 “몰”은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.
 
  ⑦ “몰”은 개인정보 보호를 위하여 이용자의 개인정보를 취급하는 자를  최소한으로 제한하여야 하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 동의 없는 제3자 제공, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.

  ⑧ “몰” 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.

  ⑨ “몰”은 개인정보의 수집·이용·제공에 관한 동의 란을 미리 선택한 것으로 설정해두지 않습니다. 또한 개인정보의 수집·이용·제공에 관한 이용자의 동의거절시 제한되는 서비스를 구체적으로 명시하고, 필수수집항목이 아닌 개인정보의 수집·이용·제공에 관한 이용자의 동의 거절을 이유로 회원가입 등 서비스 제공을 제한하거나 거절하지 않습니다.

제18조(“몰“의 의무)

  ① “몰”은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화․용역을 제공하는데 최선을 다하여야 합니다.

  ② “몰”은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.

  ③ “몰”이 상품이나 용역에 대하여 「표시․광고의 공정화에 관한 법률」 제3조 소정의 부당한 표시․광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.

  ④ “몰”은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.

제19조(회원의 ID 및 비밀번호에 대한 의무)

  ① 제17조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.

  ② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.

  ③ 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 “몰”에 통보하고 “몰”의 안내가 있는 경우에는 그에 따라야 합니다.

제20조(이용자의 의무) 이용자는 다음 행위를 하여서는 안 됩니다.

    1. 신청 또는 변경시 허위 내용의 등록
    2. 타인의 정보 도용
    3. “몰”에 게시된 정보의 변경
    4. “몰”이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시
    5. “몰” 기타 제3자의 저작권 등 지적재산권에 대한 침해
    6. “몰” 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
    7. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하는 행위

제21조(연결“몰”과 피연결“몰” 간의 관계)

  ① 상위 “몰”과 하위 “몰”이 하이퍼링크(예: 하이퍼링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 “몰”(웹 사이트)이라고 하고 후자를 피연결 “몰”(웹사이트)이라고 합니다.

  ② 연결“몰”은 피연결“몰”이 독자적으로 제공하는 재화 등에 의하여 이용자와 행하는 거래에 대해서 보증 책임을 지지 않는다는 뜻을 연결“몰”의 초기화면 또는 연결되는 시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증 책임을 지지 않습니다.

제22조(저작권의 귀속 및 이용제한)

  ① “몰“이 작성한 저작물에 대한 저작권 기타 지적재산권은 ”몰“에 귀속합니다.

  ② 이용자는 “몰”을 이용함으로써 얻은 정보 중 “몰”에게 지적재산권이 귀속된 정보를 “몰”의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.

  ③ “몰”은 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.

제23조(분쟁해결)

  ① “몰”은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치․운영합니다.

  ② “몰”은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.

  ③ “몰”과 이용자 간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시·도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.

제24조(재판권 및 준거법)

  ① “몰”과 이용자 간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.

  ② “몰”과 이용자 간에 제기된 전자상거래 소송에는 한국법을 적용합니다.

				    </p>
				    </div><br/>
				    <p class="check"><span>이용약관에 동의하십니까?</span> <input id="agreeCheck" name="agreeCheck" fw-filter="/1/" fw-label="개인정보 수집 및 이용 방침" fw-msg="개인정보 수집 및 이용 방침에 동의하세요" value="1" type="checkbox"><label for="agree_privacy_check0">동의함</label></p>
				    </div>
				    
	<div class="ec-base-box typeThinBg agreeArea">
					<h5>[필수] 개인정보처리방침 동의</h5>
				    <div class="agree">
				    
				    <p>슈즈스타(ShoeStar)('ShoeStar.co.kr'이하 'ShoeStar')은(는) 개인정보보호법에 따라 이용자의 개인정보 보호 및 권익을 보호하고 개인정보와 관련한 이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다.

슈즈스타(ShoeStar)('ShoeStar') 은(는) 회사는 개인정보처리방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.

○ 본 방침은부터 2019년 1월 1일부터 시행됩니다.<br/>


1. 개인정보의 처리 목적 슈즈스타(ShoeStar)('ShoeStar.co.kr'이하 'ShoeStar')은(는) 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적이외의 용도로는 사용되지 않으며 이용 목적이 변경될 시에는 사전동의를 구할 예정입니다.

<br/>가. 홈페이지 회원가입 및 관리

회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증 등을 목적으로 개인정보를 처리합니다.


<br/>나. 재화 또는 서비스 제공

물품배송, 서비스 제공, 맞춤 서비스 제공, 본인인증, 연령인증, 요금결제·정산 등을 목적으로 개인정보를 처리합니다.


다. 마케팅 및 광고에의 활용

이벤트 및 광고성 정보 제공 및 참여기회 제공 등을 목적으로 개인정보를 처리합니다.




2. 개인정보 파일 현황
('ShoeStar.co.kr'이하 'ShoeStar')가 개인정보 보호법 제32조에 따라 등록․공개하는 개인정보파일의 처리목적은 다음과 같습니다.

1. 개인정보 파일명 : ShoeStar
- 개인정보 항목 : 이메일, 휴대전화번호, 자택주소, 자택전화번호, 비밀번호, 로그인ID, 성별, 생년월일, 이름, 주민등록번호, 서비스 이용 기록, 결제기록
- 수집방법 : 홈페이지
- 보유근거 : 쇼핑몰이용
- 보유기간 : 3년
- 관련법령 : 신용정보의 수집/처리 및 이용 등에 관한 기록 : 3년



※ 기타('ShoeStar.co.kr'이하 'ShoeStar')의 개인정보파일 등록사항 공개는 행정안전부 개인정보보호 종합지원 포털(www.privacy.go.kr) → 개인정보민원 → 개인정보열람등 요구 → 개인정보파일 목록검색 메뉴를 활용해주시기 바랍니다.

3. 개인정보의 처리 및 보유 기간

① 슈즈스타(ShoeStar)('ShoeStar')은(는) 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집시에 동의 받은 개인정보 보유,이용기간 내에서 개인정보를 처리,보유합니다.

② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.

1.홈페이지 회원가입 및 관리
홈페이지 회원가입 및 관리와 관련한 개인정보는 수집.이용에 관한 동의일로부터3년까지 위 이용목적을 위하여 보유.이용됩니다.
-보유근거 : 쇼핑몰이용
-관련법령 : 신용정보의 수집/처리 및 이용 등에 관한 기록 : 3년
-예외사유 : 



4. 개인정보의 제3자 제공에 관한 사항

① 슈즈스타(ShoeStar)('ShoeStar.co.kr'이하 'ShoeStar')은(는) 정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.

② 슈즈스타(ShoeStar)('ShoeStar.co.kr')은(는) 다음과 같이 개인정보를 제3자에게 제공하고 있습니다.


1. 슈즈스타 대표
- 개인정보를 제공받는 자 : 슈즈스타 대표
- 제공받는 자의 개인정보 이용목적 : 이메일, 휴대전화번호, 자택주소, 비밀번호, 로그인ID, 성별, 생년월일, 이름
- 제공받는 자의 보유.이용기간: 3년



5. 개인정보처리 위탁

① 슈즈스타(ShoeStar)('ShoeStar')은(는) 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.

1. <>
- 위탁받는 자 (수탁자) : 
- 위탁하는 업무의 내용 : 
- 위탁기간 :



② 슈즈스타(ShoeStar)('ShoeStar.co.kr'이하 'ShoeStar')은(는) 위탁계약 체결시 개인정보 보호법 제25조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.

③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.
6. 정보주체와 법정대리인의 권리·의무 및 그 행사방법 이용자는 개인정보주체로써 다음과 같은 권리를 행사할 수 있습니다.

① 정보주체는 슈즈스타(ShoeStar)에 대해 언제든지 개인정보 열람,정정,삭제,처리정지 요구 등의 권리를 행사할 수 있습니다.
② 제1항에 따른 권리 행사는슈즈스타(ShoeStar)에 대해 개인정보 보호법 시행령 제41조제1항에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 슈즈스타(ShoeStar)은(는) 이에 대해 지체 없이 조치하겠습니다.
③ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.
④ 개인정보 열람 및 처리정지 요구는 개인정보보호법 제35조 제5항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다.
⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.
⑥ 슈즈스타(ShoeStar)은(는) 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.



7. 처리하는 개인정보의 항목 작성 

① 슈즈스타(ShoeStar)('ShoeStar.co.kr'이하 'ShoeStar')은(는) 다음의 개인정보 항목을 처리하고 있습니다.

1홈페이지 회원가입 및 관리
- 필수항목 : 이메일, 휴대전화번호, 자택주소, 비밀번호 질문과 답, 비밀번호, 로그인ID, 성별, 생년월일, 이름
- 선택항목 :




8. 개인정보의 파기슈즈스타(ShoeStar)('ShoeStar')은(는) 원칙적으로 개인정보 처리목적이 달성된 경우에는 지체없이 해당 개인정보를 파기합니다. 파기의 절차, 기한 및 방법은 다음과 같습니다.

-파기절차
이용자가 입력한 정보는 목적 달성 후 별도의 DB에 옮겨져(종이의 경우 별도의 서류) 내부 방침 및 기타 관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다. 이 때, DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다.

-파기기한
이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는 보유기간의 종료일로부터 5일 이내에, 개인정보의 처리 목적 달성, 해당 서비스의 폐지, 사업의 종료 등 그 개인정보가 불필요하게 되었을 때에는 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 5일 이내에 그 개인정보를 파기합니다.



9. 개인정보 자동 수집 장치의 설치•운영 및 거부에 관한 사항

슈즈스타(ShoeStar) 은 정보주체의 이용정보를 저장하고 수시로 불러오는 ‘쿠키’를 사용하지 않습니다.


10. 개인정보 보호책임자 작성


① 슈즈스타(ShoeStar)(‘ShoeStar.co.kr’이하 ‘ShoeStar) 은(는) 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.

▶ 개인정보 보호책임자 
성명 :박운석
직책 :서버관리
직급 :서버관리
연락처 :01092865325, parkseok138@gmail.com, 
※ 개인정보 보호 담당부서로 연결됩니다.

▶ 개인정보 보호 담당부서
부서명 :
담당자 :
연락처 :, , 
② 정보주체께서는 슈즈스타(ShoeStar)(‘ShoeStar.co.kr’이하 ‘ShoeStar) 의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. 슈즈스타(ShoeStar)(‘ShoeStar.co.kr’이하 ‘ShoeStar) 은(는) 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.



11. 개인정보 처리방침 변경

①이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.



12. 개인정보의 안전성 확보 조치 슈즈스타(ShoeStar)('ShoeStar')은(는) 개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.

1. 개인정보 취급 직원의 최소화 및 교육
개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화 하여 개인정보를 관리하는 대책을 시행하고 있습니다.

2. 해킹 등에 대비한 기술적 대책
슈즈스타(ShoeStar)('ShoeStar')은 해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고 주기적인 갱신·점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적/물리적으로 감시 및 차단하고 있습니다.

3. 개인정보의 암호화
이용자의 개인정보는 비밀번호는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.
				    
		</p></div><br/>
		<p class="check"><span>개인정보 수집 및 이용에 동의하십니까?</span> <input id="agreeCheck" name="agreeCheck" fw-filter="/1/" fw-label="개인정보 수집 및 이용 방침" fw-msg="개인정보 수집 및 이용 방침에 동의하세요" value="1" type="checkbox"><label for="agree_privacy_check0">동의함</label></p>
		</div>	<br/><br/>	   

				    
		<div class="form-group">
						<div class="col-sm-offset-2 col-sm-6">
								<input type="button" value="가입하기" id="joinInsert" class="btn btn-default"/>
								<input type="button" value="재작성" id="joinReset" class="btn btn-default"/>
								<input type="button" value="취소" id="joinCancel" class="btn btn-default"/>
						</div>
		</div>			
					
				 
				</form>
			</div>
		</div> 
	</body>
</html>
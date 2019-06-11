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
         
         <title>관리자 계정 생성</title>
         
          <!--모바일 웹 페이지 설정-->
         <link rel="shortcut icon" href="../image/icon.png"/>
         <link rel="apple-touch-icon" href="../image/icon.png"/>
      <!--    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"> -->
         <!--모바일 웹 페이지 설정 끝-->
         <!--<link rel="stylesheet" type="text/css" href=""/>-->
         
         <!-- 인터넷익스8 이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다. -->
         <!-- [if it IE 9] > <script src="js/html5shiv.js"></script><![endif] -->
         <!-- <link rel="stylesheet" type="text/css" href="../js/jquery-1.12.4.min.js">adminJoin
         <!-- jQuery프레임워크 참조 -->         
           <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
           <script type="text/javascript" src="/resources/include/js/jquery.form.min.js"></script>
           <script type="text/javascript" src="/resources/include/js/adminLogin.js"></script>
           <script type="text/javascript" src="/resources/include/js/adminJoin.js"></script>
           <script type="text/javascript" src="/resources/include/js/pwdPattern.js"></script>
           <script type="text/javascript" src="/resources/include/js/html5shiv.js"></script>
           
           <!-- <script type="text/javascript" src="/resources/include/js/modify.js"></script> -->
            <!-- <link rel="stylesheet" type="text/css" href="/resources/include/css/bootstrap.css"/> -->
           <!--  <link rel="stylesheet" href="/resources/include/css/default.css"/> -->
          
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
           <!--  <script type="text/javascript" src="resources/include/css/ec-base-box.css"></script> -->
            <link rel="stylesheet" type="text/css" href="/resources/include/css/ec-base-box.css">
            
           
            
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
           
     
           </script>
			
		</head>
	<body>
	
		<div class="contentContainer" >
			<div class="well"> 
				<form id="adminMemberForm" class="form-horizontal">
				
				
					<!-- <input type="hidden" name="mem_email" id="mem_email">
					<input type="hidden" name="mem_birth" id="mem_birth"> -->
					
					<div class="form-group form-group-sm">
						<label for="adm_id" class="col-sm-2 control-label">관리자 ID</label>
							<div class="col-sm-3">
								<input type="text" id="adm_id" name="adm_id" maxlength="12" class="form-conrtrol" placeholder="아이디입력"/>
							</div>
							
							<div class="col-sm-2">
								<input type="button" id="adminIdConfirmBtn" name="adminIdConfirmBtn" value="아이디 중복체크" class="form-control btn-primary">
							</div>
							
							<div class="col-sm-5">
								<p class="form-control-static error"></p>
							</div>
					</div>
					
					<div class="form-group form-group-sm">
						<label for="adm_pwd" class="col-sm-2 control-label">비밀번호</label>
							<div class="col-sm-3">
								<input type="password" id="adm_pwd" name="adm_pwd" maxlength="15" 
								class="form-control" placeholder="비밀번호입력">
							</div>
							
							<div class="col-sm-5">
								<p class="form-control-static error"></p>
							</div>
					</div>
					
					<div class="form-group form-group-sm">
						<label for="adminUserPwdCheck" class="col-sm-2 control-label">비밀번호 확인</label>
							<div class="col-sm-3">
								<input type="password" id="adminUserPwdCheck" name="adminUserPwdCheck" 
								class="form-control" maxlength="15" placeholder="비밀번호확인">
							</div>
							
							<div class="col-sm-5">
								<p class="form-control-static error"></p>
							</div>
					</div>
					
					<div class="form-group form-group-sm">
						<label for="adm_phone" class="col-sm-2 control-label">휴대폰번호</label>
							<div class="col-sm-3">
								<input type="text" id="adm_phone" name="adm_phone" maxlength="15" 
								class="form-control" placeholder="휴대폰 번호">
							</div>	
							
							<div class="col-sm-5">
								<p class="form-control-static error"></p>
							</div>
					</div>
					
					<!-- <div class="form-group form-group-sm">
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
					</div> -->
					
					<div class="form-group form-group-sm">
						<label for="adm_name" class="col-sm-2 control-label">관리자이름</label>
							<div class="col-sm-3">
								<input type="text" id="adm_name" name="adm_name" maxlength="10" 
								class="form-control" placeholder="이름입력">
							</div>	
							
							<div class="col-sm-5">
								<p class="form-control-static error"></p>
							</div>
					</div>
					
					<div class="form-group form-group-sm">
						<label for="adm_email" class="col-sm-2 control-label">이메일</label>
							<div class="col-sm-3">
								<input type="text" id="adm_email" name="adm_email" maxlength="60"
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
					
						
					
					
					
					<!-- <div class="form-group form-group-sm">
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
					</div>	 -->
  

				    
		<div class="form-group">
						<div class="col-sm-offset-2 col-sm-6">
								<input type="button" value="가입하기" id="adminJoinInsert" class="btn btn-default"/>
								<input type="button" value="재작성" id="adminJoinReset" class="btn btn-default"/>
								<input type="button" value="취소" id="adminJoinCancel" class="btn btn-default"/>
						</div>
		</div>			
					
				 
				</form>
			</div>
		</div> 
	</body>
</html>
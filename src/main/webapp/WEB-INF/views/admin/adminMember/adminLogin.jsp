<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
   <html>
      <head>
         <meta charset="UTF-8">
         
         <!-- 브라우저의 호환성 보기 모드를 막고, 해당 브라우저에서 지원하는 가장 최신버전의 방식으로 HTML보여주도록 설정하는법 -->
         <meta name="viewport" content="width=device-width initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
         <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
         
         <title>관리자로그인</title>
         
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
           <script type="text/javascript" src="/resources/include/js/adminLogin.js"></script>
           <script type="text/javascript" src="/resources/include/js/pwdPattern.js"></script>
           
            <!-- <link rel="stylesheet" type="text/css" href="/resources/include/css/bootstrap.css"/> -->
            <!-- <link rel="stylesheet" href="/resources/include/css/default.css"/> -->
           <!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
            
            <!--===============================================================================================-->	

<!--===============================================================================================-->
	<!-- <link rel="stylesheet" type="text/css" href="/resources/include/css/login/vendor/bootstrap/css/bootstrap.min.css"> -->
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/include/css/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/include/css/login/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/include/css/login/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/resources/include/css/login/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/include/css/login/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/include/css/login/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/resources/include/css/login/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/include/css/login/css/util.css">
	<link rel="stylesheet" type="text/css" href="/resources/include/css/login/css/main.css">
<!--===============================================================================================-->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


            
           
            
            <style>
            	#loginAfter{
            	font-size:14px;}
            	
            	.tac{float:right;
            		text-color:blue;}
            	
            </style>
            <!-- lightbox 라이브러리 -->
            <!-- <link rel="stylesheet" href="/resources/include/css/lightbox.css"/>
            <script type="text/javascript" src="/resources/include/js/lightbox.min.js"></script> -->
           <script type="text/javascript">
           $(function(){
        	   $("#find_admId_btn").click(function(){
        		   location.href="/adminMember/find_id_form";
        	   });
        	   
        	   $("#find_admPwd_btn").click(function(){
        		   location.href="/adminMember/find_admPwd_form";
        	   });
           });
         
           //에러코드체크
           function adminCodeCheck(){
        	   var codeNumber = '<c:out value = "${codeNumber}"/>';
        	   if(codeNumber != ""){
        		   //명확한 자료형 명시를 위해 codeNumber의 타입을 정수형으로 변환
        		   switch(parseInt(codeNumber)){
        		   case 1:
        			   alert("아이디 또는 비밀번호가 일치하지 않거나, 존재하지 않는 회원입니다. \n다시 로그인을 시도해주세요.");
        			   break;
        		   }
        	   }
           }
			</script>
		</head>
	<body>
	
		<%-- <c:if test="${adminLogin.adm_id != null and adminLogin.adm_id != ''}">
		  	<fieldset id="loginAfter">
		  		<legend>[${adminLogin.adm_name}]님, 관리자로 로그인 되었습니다</legend>
			  		<span id="memberMenu" class="tac">
			  			<a href="/adminMember/adminLogout">로그아웃</a>
			  			<a href="/adminMember/adminModify">정보수정</a>
			  			<a href="/adminMember/adminDelete">회원탈퇴</a>
			  		</span>
		  	</fieldset>
		  </c:if>  --%>
		<div class="container-login100">
			<div class="wrap-login100">
			<c:if test="${adminLogin.adm_id == null or adminLogin.adm_id == ''}"> 
				<form id="adminLoginForm" class="form-horizontal">
					<span class="login100-form-title p-b-26">
						ShoeStar<br>관리자로그인
					</span>
					<!-- <span class="login100-form-title p-b-48">
						<i class="zmdi zmdi-font"></i>
					</span> -->
					<div class="spinner-border text-primary" role="status">
					  <span class="sr-only">Loading...</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Valid email is: a@b.c">
						<input class="input100" id="adm_id" name="adm_id" type="text">
						<span class="focus-input100" data-placeholder="아이디"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<span class="btn-show-pass">
							<i class="zmdi zmdi-eye"></i>
						</span>
						<input class="input100" type="password" id="adm_pwd" name="adm_pwd">
						<span class="focus-input100" data-placeholder="비밀번호"></span>
					</div>
					
					<!-- <input type="button" id="find_adminId_btn" name="find_adminId_btn" class="btn btn-default" value="관리자ID찾기">
					<input type="button" id="find_adminPwd_btn" name="find_adminPwd_btn" class="btn btn-default" value="관리자PWD찾기"> -->

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button id="adminLoginBtn" class="login100-form-btn">
								로그인
							</button>
						</div>
					</div>	

					<!-- <div class="text-center p-t-115">
						<span class="txt1">
							관리자계정생성 &nbsp;
						</span>

						<a class="txt2" id="adminJoinBtn">
							클릭
						</a>
					</div> -->
					
				</form>
				</c:if> 
				
			</div>
		</div>
	
	</body>
</html>
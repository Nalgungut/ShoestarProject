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
         
         <title>로그인</title>
         
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
           <script type="text/javascript" src="/resources/include/js/login.js"></script>
           <script type="text/javascript" src="/resources/include/js/pwdPattern.js"></script>
           <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
 		   <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
           
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
            .mm{font-size:10px;}
            .hi{
            text-align:center;}
            #naver_id_login{
            
		   
		    margin-left:90px; 
		    width:200px; }
            	
            </style>
            <!-- lightbox 라이브러리 -->
            <!-- <link rel="stylesheet" href="/resources/include/css/lightbox.css"/>
            <script type="text/javascript" src="/resources/include/js/lightbox.min.js"></script> -->
           <script type="text/javascript">
           $(function(){
        	   $("#find_id_btn").click(function(){
        		   location.href="/member/find_id_form";
        	   });
        	   
        	   $("#find_pwd_btn").click(function(){
        		   location.href="/member/find_pwd_form";
        	   });
           });
         
           //에러코드체크
           function codeCheck(){
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
	
		<%-- <c:if test="${login.mem_id != null and login.mem_id != ''}">
		  	<fieldset id="loginAfter">
		  		<legend>[${login.mem_name}]님 어서오세요. <br>슈즈스타에 오신것을 환영합니다!</legend>
			  		<span id="memberMenu" class="tac">
			  			<a href="/member/logout">로그아웃</a>
			  			<a href="/member/modify">정보수정</a>
			  			<a href="/member/delete">회원탈퇴</a>
			  		</span>
		  	</fieldset>
		  </c:if>  --%>
		<div class="container-login100">
			<div class="wrap-login100">
			<c:if test="${login.mem_id == null or login.mem_id == ''}"> 
				<form id="loginForm" class="form-horizontal">
					<span class="login100-form-title p-b-26">
						ShoeStar<br>슈즈스타
					</span>
					<!-- <span class="login100-form-title p-b-48">
						<i class="zmdi zmdi-font"></i>
					</span> -->
					<div class="spinner-border text-primary" role="status">
					  <span class="sr-only">Loading...</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Valid email is: a@b.c">
						<input class="input100" id="mem_id" name="mem_id" type="text">
						<span class="focus-input100" data-placeholder="아이디"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<span class="btn-show-pass">
							<i class="zmdi zmdi-eye"></i>
						</span>
						<input class="input100" type="password" id="mem_pwd" name="mem_pwd">
						<span class="focus-input100" data-placeholder="비밀번호"></span>
					</div>
					
					<div class="hi">
					<input type="button" id="find_id_btn" name="find_id_btn" class="btn btn-default" value="아이디찾기">
					<input type="button" id="find_pwd_btn" name="find_pwd_btn" class="btn btn-default" value="비밀번호 찾기">
					</div>

		
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button id="loginBtn" class="login100-form-btn">
								로그인
							</button>
						</div>
					</div>
					
					<!-- 네이버아이디로로그인 버튼 노출 영역 -->
					  <div><span class="mm">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;네이버 아이디로 편하게 <strong>로그인</strong>하세요</span><div id="naver_id_login"></div></div>
					  <!-- //네이버아이디로로그인 버튼 노출 영역 -->
					  <script type="text/javascript">
					  	var naver_id_login = new naver_id_login("kiw9Q4mYKld8rhFWzGRr", "http://localhost:8080/");
					  	var state = naver_id_login.getUniqState();
					  	naver_id_login.setButton("white", 2,40);
					  	naver_id_login.setDomain("http://localhost:8080/member/login");
					  	naver_id_login.setState(state);
					  	naver_id_login.setPopup();
					  	naver_id_login.init_naver_id_login();
					  </script>

					<div class="text-center p-t-115">
						<span class="txt1">
							계정이 없으시다면? &nbsp;
						</span>

						<a class="txt2" id="joinBtn">
							회원가입
						</a>
					</div>
					
				</form>
				</c:if> 
				
			</div>
		</div>
	
	</body>
</html>
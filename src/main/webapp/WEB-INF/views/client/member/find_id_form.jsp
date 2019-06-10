<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
   <html>
      <head>
         <meta charset="UTF-8">
         
         <!-- 브라우저의 호환성 보기 모드를 막고, 해당 브라우저에서 지원하는 가장 최신버전의 방식으로 HTML보여주도록 설정하는법 -->
         <meta name="viewport" content="width=device-width initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
         <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
         
         <title>아이디찾기</title>
         
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
           
            <!-- <link rel="stylesheet" type="text/css" href="/resources/include/css/bootstrap.css"/> -->
            <!-- <link rel="stylesheet" href="/resources/include/css/default.css"/> -->
           <!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
            

	<link rel="stylesheet" type="text/css" href="/resources/include/css/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">

	<link rel="stylesheet" type="text/css" href="/resources/include/css/login/css/main.css">
	
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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

<!--===============================================================================================-->
           <script type="text/javascript">
          		
           
			</script>
		</head>
	<body>
	<div class="contentContainer">
		<div class="limiter">
		<fieldset id="loginAfter">
			<form action="/member/find_id" method="post">
				<div class="w3-center w3-large w3-margin-top">
					<h3>아이디 찾기</h3>
				</div>
				<div>
					<p>
						<label>이메일입력</label>
						<input class="w3-input" type="text" id="email" name="email" required>
					</p>
					<p class="w3-center">
						<button type="submit" id=findBtn class="btn btn-default">아이디찾기</button>
						<button type="button" onclick="history.go(-1);" class="btn btn-default">로그인</button>
					</p>
				</div>
			</form>
			</fieldset>
		</div>
	</div>
	
	</body>
</html>
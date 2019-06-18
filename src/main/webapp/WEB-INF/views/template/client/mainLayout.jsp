<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
   <head>
		<title>슈즈 스타</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		
		<link rel="shortcut icon" type="image⁄x-icon" href="/resources/images/icon.png" />
		<link rel="apple-touch-icon" type="image⁄x-icon" href="/resources/images/icon.png" />
		
		<!-- Bootstrap core CSS -->
		<link rel="stylesheet" href="/resources/include/dist/css/bootstrap-theme.min.css">
		<link rel="stylesheet" href="/resources/include/dist/css/bootstrap.min.css">
		
		<!-- Custom styles for this template -->
		<link href="/resources/include/css/sticky-footer-navbar.css" rel="stylesheet">
		
		<!-- jQuery & Bootstrap JavaScript -->
		<script src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script src="/resources/include/dist/js/bootstrap.min.js"></script>
		
		<!-- 메인 테마 -->
		<link rel="stylesheet" href="/resources/include/css/mainTheme.css">
		
		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
		
		<link rel="stylesheet" href="/resources/include/css/prodctg.css" />
		<link rel="stylesheet" href="/resources/include/css/product.css" />
		<script type="text/javascript" src="/resources/include/js/productCommon.js"></script>
		<script type="text/javascript" src="/resources/include/js/product.js"></script>
		<script type="text/javascript" src="/resources/include/js/prodctg.js"></script>
		<script src="/resources/include/js/mainscript.js"></script>
		<style type="text/css">
			.jumbotron {
				background-image: linear-gradient(to right, white 8%, black 10%, black 90%, white 92%);
				color: white;
			}
			
			.jumbotron > .container {
				text-align: center;
			}
			
			.highlight {
				-webkit-transform:rotateY(180deg);
				-moz-transform:rotateY(180deg);
				-o-transform:rotateY(180deg);
				-ms-transform:rotateY(180deg);
				unicode-bidi:bidi-override;
				direction:rtl;
				font-size: 1.2em;
				display: inline-block;
			}
			
			.prodTitle {
				border-top: 10px double #fff;
				border-bottom: 10px double #fff;
				padding: 10px 0;
				margin-top: 50px;
				background-color: black;
				color: white;
			}
			
			#itemList {
				border: 1px dashed black;
			}
		</style>
		<script type="text/javascript">
			$(function() {
				showProductList("?age=all&amount=10");
			});
		</script>
      
   </head>
	
	<body>
	
	<!-- Fixed navbar -->
	<nav class="navbar navbar-default navbar-fixed-top">
      <tiles:insertAttribute name="header" />
   </nav>
	
	<!-- Begin page content -->
	<%-- <div class="container">
		<div class="page-header">
			<h1><tiles:getAsString name="title" /></h1>
		</div>
		<tiles:insertAttribute name="body" />
	</div> --%>
	
	<div class="container mainBody">
		<div class="jumbotron">
			<div class="container">
				<h1>SHOE<span class="highlight">S</span>TAR</h1>
				<p>PUSH. YOUR. LIMIT.</p>
			</div>
		</div>
		
		<div class="container">
			<h3 class="text-center prodTitle">신규 상품</h3>
			<div class="row text-center" id="itemList"></div>
			<hr>
		</div>
	</div>
	
	<footer class="bg3 p-t-75 p-b-32 foot">
		<tiles:insertAttribute name="footer" />
	</footer>
	
	</body>
</html>

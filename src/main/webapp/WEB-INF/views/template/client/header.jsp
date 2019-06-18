<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<link rel="shortcut icon" type="image⁄x-icon" href="/resources/images/icon.png" />
		<link rel="apple-touch-icon" type="image⁄x-icon" href="/resources/images/icon.png" />

		<!-- Bootstrap core CSS -->
		<!-- <link rel="stylesheet" href="/resources/include/dist/css/bootstrap-theme.min.css">
		<link rel="stylesheet" href="/resources/include/dist/css/bootstrap.min.css"> -->
		
		<!-- Custom styles for this template -->
		<!-- <link href="/resources/include/css/sticky-footer-navbar.css" rel="stylesheet"> -->
		
		<!-- jQuery & Bootstrap JavaScript -->
		
		
		<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="/resources/include/test/images/icons/favicon.png"/>

<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/include/test/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/include/test/fonts/iconic/css/material-design-iconic-font.min.css">

<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/include/test/fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/include/test/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/resources/include/test/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/include/test/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/include/test/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/resources/include/test/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/include/test/vendor/slick/slick.css">
	
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/include/test/vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/include/test/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/include/test/css/util.css">
	<link rel="stylesheet" type="text/css" href="/resources/include/test/css/main.css">

<style>
	#head_link{
	float:right;
	vertical-align:middle;}
	#ss{
	font-color:black;}
	
	.emptyInput {
		max-width: 200px;
		background-color: rgba(0,0,0,0);
		border-bottom: 1px solid black;
	}
</style>
<body>

<header>
		<!-- Header desktop -->
		<div class="container-menu-desktop">
			<!-- Topbar -->
			<div class="top-bar">
				<div class="content-topbar flex-sb-m h-full container">
					<div class="left-top-bar">
						여름맞이 창고 방출, 최대 70%할인중!
					</div>

					<div class="right-top-bar flex-w h-full">
						<a href="#" class="flex-c-m trans-04 p-lr-25">
							할인품목
						</a>
								<!-- 
						<a href="#" class="flex-c-m trans-04 p-lr-25">
							
						</a> -->

						<a href="/myPage/main" class="flex-c-m trans-04 p-lr-25">
							마이페이지
						</a>

						<a href="/cscenter/" class="flex-c-m trans-04 p-lr-25">
							고객지원
						</a>
					</div>
					
				<div id="head_link">
		<ul>
		   <c:choose>
		   
		     <c:when test="${not empty login && login.mem_no != 0}">
		     <%-- <c:when test="${login==true and not empty adminLogin}"> --%>
			   <a href="${contextPath}/member/logout"><mark>로그아웃</mark></a>
			   <a href="${contextPath}/myPage/main"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>마이페이지</a>
			   <a href="${contextPath}/orders/cart"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>장바구니</a>
			   <a href="#"><span class="glyphicon glyphicon-plane" aria-hidden="true"></span>주문배송</a>
			 </c:when>
			 <c:otherwise>
			   <p style="color:white"><a href="${contextPath}/member/login"><strong>로그인</strong></a>
			   &nbsp;<a href="${contextPath}/member/join"><strong>회원가입</strong></a></p>
			 </c:otherwise>
			</c:choose>
			  
		</ul>
	</div>
				</div>
				
			</div>

			<div class="wrap-menu-desktop">
				<nav class="limiter-menu-desktop container">
					
					<!-- Logo desktop -->		
					<a href="/" class="logo">
						<img src="/resources/include/test/images/icons/shoestar5.png" alt="IMG-LOGO">
					</a>

					<!-- Menu desktop -->
					<div class="menu-desktop">
						<ul class="main-menu">
							<li><a href="/product/showList?pd_sex=m">남자</a></li>
							<li><a href="/product/showList?pd_sex=f">여자</a></li>
							<li><a href="/product/showList?pd_age=k">어린이</a></li>
							<li><a href="/brand/brandMain">브랜드</a></li>
							<li><a href="/event/list">이벤트</a></li>
							<!-- <li><a href="/adminMember/adminLogin">관리T</a></li> -->
						</ul>
					</div>	
					
					

					<!-- Icon header -->
					<div class="wrap-icon-header flex-w flex-r-m">
						<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
							<input type="text" class="emptyInput" name="keyword" id="searchKeyword">
						</div>
						
						<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
							<i class="zmdi zmdi-search"></i>
						</div>

						<a href="/orders/cart" class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11"><!-- data-notify="1" -->
							<i class="zmdi zmdi-shopping-cart"></i>
						</a>

						<a href="#" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 " ><!-- data-notify="3" -->
							<i class="zmdi zmdi-favorite-outline"></i>
						</a>
					</div>
				</nav>
			</div>	
		</div>

		<!-- Header Mobile -->
		<div class="wrap-header-mobile">
			<!-- Logo moblie -->		
			<div class="logo-mobile">
				<a href="index.html"><img src="/resources/include/test/images/icons/logo-01.png" alt="IMG-LOGO"></a>
			</div>

			<!-- Icon header -->
			
			
			<div class="wrap-icon-header flex-w flex-r-m m-r-15">
				<div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search">
					<input type="text"  id="search" name="search" class="zmdi zmdi-search"/>
				</div>

				<div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart" data-notify="2">
					<i class="zmdi zmdi-shopping-cart"></i>
				</div>

				<a href="#" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti" data-notify="0">
					<i class="zmdi zmdi-favorite-outline"></i>
				</a>
			</div>

			<!-- Button show menu -->
			<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
				<span class="hamburger-box">
					<span class="hamburger-inner"></span>
				</span>
			</div>
		</div>


		<!-- Menu Mobile -->
		<!-- <div class="menu-mobile">
			<ul class="topbar-mobile">
				<li>
					<div class="left-top-bar">
						Free shipping for standard order over $100
					</div>
				</li>

				<li>
					<div class="right-top-bar flex-w h-full">
						<a href="#" class="flex-c-m p-lr-10 trans-04">
							Help FAQs
						</a>

						<a href="#" class="flex-c-m p-lr-10 trans-04">
							My Account
						</a>

						<a href="#" class="flex-c-m p-lr-10 trans-04">
							EN
						</a>

						<a href="#" class="flex-c-m p-lr-10 trans-04">
							USD
						</a>
					</div>
				</li>
			</ul>

			<ul class="main-menu-m">
				<li>
					<a href="index.html">Home</a>
					<ul class="sub-menu-m">
						<li><a href="index.html">Homepage 1</a></li>
						<li><a href="home-02.html">Homepage 2</a></li>
						<li><a href="home-03.html">Homepage 3</a></li>
					</ul>
					<span class="arrow-main-menu-m">
						<i class="fa fa-angle-right" aria-hidden="true"></i>
					</span>
				</li>

				<li>
					<a href="product.html">Shop</a>
				</li>

				<li>
					<a href="shoping-cart.html" class="label1 rs1" data-label1="hot">Features</a>
				</li>

				<li>
					<a href="blog.html">Blog</a>
				</li>

				<li>
					<a href="about.html">About</a>
				</li>

				<li>
					<a href="contact.html">Contact</a>
				</li>
			</ul>
		</div> -->

		<!-- Modal Search -->
		<div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
			<div class="container-search-header">
				<button class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
					<img src="/resources/include/test/images/icons/icon-close2.png" alt="CLOSE">
				</button>

				<form class="wrap-search-header flex-w p-l-15">
					<button class="flex-c-m trans-04">
						<i class="zmdi zmdi-search"></i>
					</button>
					<input class="plh3" type="text" name="search" placeholder="Search...">
				</form>
			</div>
	
		</div>
		
		
	</header>

<%-- <div class="container">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="/">슈즈스타</a>
	</div>
	<div id="navbar" class="collapse navbar-collapse">
		<ul class="nav navbar-nav">
			<li><a href="/product/showList?pd_sex=m">남자</a></li>
			<li><a href="/product/showList?pd_sex=f">여자</a></li>
			<li><a href="/product/showList?pd_age=k">어린이</a></li>
			<li><a href="/brand/brandMain">브랜드</a></li>
			<li><a href="/event/list">이벤트</a></li>
			<li><a href="/cscenter/">문의</a></li>   
			<li><a href="/myPage/main">마이페이지</a></li>
			<li><a href="/adminMember/adminLogin">관리T</a></li>
			
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
				<ul class="dropdown-menu" role="menu">
					<li><a href="#">Action</a></li>
					<li><a href="#">Another action</a></li>
					<li><a href="#">Something else here</a></li>
					<li class="divider"></li>
					<li class="dropdown-header">Nav header</li>
					<li><a href="#">Separated link</a></li>
					<li><a href="#">One more separated link</a></li>
				</ul>
			</li>
			
			
			
			
		</ul>
	<div id="head_link">
		<ul>
		   <c:choose>
		   
		     <c:when test="${not empty login && login.mem_no != 0}">
		     <c:when test="${login==true and not empty adminLogin}">
			   <a href="${contextPath}/member/logout"><mark>로그아웃</mark></a>
			   <a href="${contextPath}/myPage/main"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>마이페이지</a>
			   <a href="${contextPath}/orders/cart"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>장바구니</a>
			   <a href="#"><span class="glyphicon glyphicon-plane" aria-hidden="true"></span>주문배송</a>
			 </c:when>
			 <c:otherwise>
			   <a href="${contextPath}/member/login"><mark>로그인</mark></a>
			   <a href="${contextPath}/member/join" id="ss"><strong>회원가입</strong></a>
			 </c:otherwise>
			</c:choose>
			  
		</ul>
	</div>
	</div><!--/.nav-collapse -->
</div> --%>
</body>
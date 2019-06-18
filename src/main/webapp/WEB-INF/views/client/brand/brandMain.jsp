<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		
		<title>브랜드 페이지에 오신것을 환영합니다.</title>
		<!-- 헤더에서 브랜드 클릭시 첫 메인 페이지 -->
		
		<link rel="shortcut icon" type="image⁄x-icon" href="/resources/images/icon.png" />
		<link rel="apple-touch-icon" type="image⁄x-icon" href="/resources/images/icon.png" />
		<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Mitr&display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Anton&display=swap" rel="stylesheet">
		<!-- [if lt IE 9]>
			<script src="/resources/include/js/html5shiv.js"></script>
		<![endif] -->
		
		<style type="text/css">
			.bb {
			  margin: 0;
			  font-family: "Lato", sans-serif;
			}
			
			
			/*사이드바 */
			.bb {
			  margin: 0;
			  font-family: "Lato", sans-serif;
			}
			
			.sidebar {
			  margin-left: -30px;
			  margin-top: 125px;
			  padding: 0px;
			  background-color: black; 
			  position: absolute;
			  overflow: auto; 
			  left: 30px;
			  float: left;
			}
			
			.sidebar a {
			  display: block;
			  color: black;
			  padding: 16px;
			  text-decoration: none;
			}
			 
			.sidebar a.active {
			  background-color: #505050;
			  color: white;
			}
			
			.sidebar a:hover:not(.active) {
			  background-color: #555;
			  color: white;
			}
			
		
			
			div.content {
			  margin-left: 200px;
			  padding: 1px 16px;
			  height: 1000px;
			}
			
			 @media screen and (max-width: 700px) {
			  .sidebar {
			    width: 100%;
			    height: auto;
			    position: relative;
			  }
			  .sidebar a {float: left;}
			  div.content {margin-left: 0;}
			}
			
			@media screen and (max-width: 400px) {
			  .sidebar a {
			    text-align: center;
			    float: none;
			  }
			} 
			/* 사이드 바 종료 */
			
			
			
			
			.pp{
				text-align: center;
			}
			
			.text{
				color: #A748FF;
			}
			
			/*메인 사진 */
			
			.ii{
				height: 500px;
				width: 100%;
			}
			
			* {box-sizing: border-box}
			.bb {font-family: Verdana, sans-serif; margin:0}
			
			.mySlides {display: none}
			
			.ii {vertical-align: middle;}
			
			/* Slideshow container */
			.slideshow-container {
			  max-width: 1000px;
			  position: relative;
			  margin: auto;
			}
			
			/* Next & previous buttons */
			.prev, .next {
			  cursor: pointer;
			  position: absolute;
			  top: 50%;
			  width: auto;
			  padding: 16px;
			  margin-top: -22px;
			  color: white;
			  font-weight: bold;
			  font-size: 18px;
			  transition: 0.6s ease;
			  border-radius: 0 3px 3px 0;
			  user-select: none;
			}
			
			/* Position the "next button" to the right */
			.next {
			  right: 0;
			  border-radius: 3px 0 0 3px;
			}
			
			/* On hover, add a black background color with a little bit see-through */
			.prev:hover, .next:hover {
			  background-color: pink;
			}
			
			/* Caption text */
			.text {
			  color: #f2f2f2;
			  font-size: 15px;
			  padding: 8px 12px;
			  position: absolute;
			  bottom: 8px;
			  width: 100%;
			  text-align: center;
			}
			
			/* Number text (1/3 etc) */
			.numbertext {
			  color: #f2f2f2;
			  font-size: 12px;
			  padding: 8px 12px;
			  position: absolute;
			  top: 0;
			}
			
			/*제목 */
			.h1{
				font-family: 'Anton', sans-serif;
				
			}
			
			.shoes{
				color: #BD2BA6;
				text-align: center;
			}
			
			/* The dots/bullets/indicators */
			.dot {
			  cursor: pointer;
			  height: 15px;
			  width: 15px;
			  margin: 0 2px;
			  background-color: #bbb;
			  border-radius: 50%;
			  display: inline-block;
			  transition: background-color 0.6s ease;
			}
			
			/* .active, .dot:hover {
			  background-color: #717171;
			} */
			
			/* Fading animation */
			.fade {
			  -webkit-animation-name: fade;
			  -webkit-animation-duration: 5s;
			  animation-name: fade;
			  animation-duration: 5s;
			}
			
			@-webkit-keyframes fade {
			  from {opacity: .4} 
			  to {opacity: 1}
			}
			
			@keyframes fade {
			  from {opacity: .4} 
			  to {opacity: 1}
			}
			
			/* On smaller screens, decrease text size */
			@media only screen and (max-width: 300px) {
			  .prev, .next,.text {font-size: 11px}
			}
			
			li{
				list-style: none;
			}
			
			.content{
				margin-left: -300px;
			}
			.h1{
				text-align: center;
				font-family: 'Noto Sans KR', sans-serif;
			}
			.pp{
				font-family: 'Mitr', sans-serif;
			}
			#explain{
				font-family: 'Mitr', sans-serif;
				text-align: center;
			}
			/* 목록 보여주기 css dropdown */
			.a{
				color: red;
			}
			.b{
				color: orange;
			}
			.c{
				color: yellow;
			}
			.d{
				color: purple;
			}
			
		</style>
		
		<script type="text/javascript">
			
		</script>
		
	</head>
	
	<body class="bb">
		<div class="brand">
			<!-- 사이드 바  -->
			<div class="sidebar" style="width:10%; background-color:#222;" >
			  <a class="active" href="/brand/brandMain">브랜드 소개</a>
			  <!-- <a href="/brand/brandNewslist" style="color: white;">브랜드 뉴스</a> -->
			  <a href="/brand/noticeList" style="color: white;">공지사항</a>
			</div>
			
			<!-- 메인설명 시작 -->
			<div class="content">
			<h2 class="h1">☆<a class="a">슈</a>즈<a class="b"></a><a class="c">스</a><a class="d">타</a> 브랜드 페이지에 오신것을 환영합니다.☆</h2><br />
			
			<p class="pp">슈즈스타는 1993년 부터 시작되어왔습니다.<p>
			<p class="pp">저희는 단순히 신발을 판매하는 회사가 아닌 인체의 한 중요한 발을 다룬다는 생각으로 인체공학적인 기술과 생활노하우로 인한</p>
			<p class="pp">실용성, 편의성은 물론 스타일 까지 겸비한 브랜드 입니다.</p>
			<p class="pp">한 번 그 맛을 아는사람이 더 끊기는 힘든것처럼 저희 브랜드 신발을 한 번도 안 신어본 고객은 있을 수 있어도</p>
			<p class="pp">한 번만 신어본 사람은 없을 것 입니다.</p>
			
			<br /><br /><br />
			  			<!-- 슈즈스타 메인사진 첨부공간 -->
						<!-- Slideshow container -->
				<div class="slideshow-container">
					<div class="mySlides fade">
					  <div class="numbertext">1 / 3</div>
					  <img src="/resources/images/brand/main1.jpg" class="ii">
					  <div class="text">Fasion Collection</div>
					</div>
				
					<div class="mySlides fade">
					  <div class="numbertext">2 / 3</div>
					  <img src="/resources/images/brand/main2.jpg" class="ii" >
					  <div class="text">kids Super Star Collection</div>
					</div>
				
					<div class="mySlides fade">
					  <div class="numbertext">3 / 3</div>
					  <img src="/resources/images/brand/main3.jpg" class="ii" >
					  <div class="text">아이들 운동화 컬렉션</div>
					</div>
				
					<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
					<a class="next" onclick="plusSlides(1)">&#10095;</a>
				
				</div>
				<!-- 사진아래 설명 -->
				
			
			<br>
				<div style="text-align:center">
				  <span class="dot" onclick="currentSlide(1)"></span> 
				  <span class="dot" onclick="currentSlide(2)"></span> 
				  <span class="dot" onclick="currentSlide(3)"></span> 
				</div>
				<hr />
				<p class="pp"> since : 1993 ShoesStar</p>
			</div>
			<!-- 사진에 대한 설명  -->
			
			<script>
			var slideIndex = 1;
			showSlides(slideIndex);
			
			function plusSlides(n) {
			  showSlides(slideIndex += n);
			}
			
			function currentSlide(n) {
			  showSlides(slideIndex = n);
			}
			
			function showSlides(n) {
			  var i;
			  var slides = document.getElementsByClassName("mySlides");
			  var dots = document.getElementsByClassName("dot");
			  if (n > slides.length) {slideIndex = 1}    
			  if (n < 1) {slideIndex = slides.length}
			  for (i = 0; i < slides.length; i++) {
			      slides[i].style.display = "none";  
			  }
			  /*  for (i = 0; i < dots.length; i++) {
			      dots[i].className = dots[i].className.replace(" active", "");
			  }  */
			  slides[slideIndex-1].style.display = "block";  
			  /*  dots[slideIndex-1].className += " active";  */
			}
			
			// 자동으로 사진 변환 함수
			
			var slideIndex = 0;
			showSlides();

			function showSlides() {
			  var i;
			  var slides = document.getElementsByClassName("mySlides");
			  for (i = 0; i < slides.length; i++) {
			    slides[i].style.display = "none"; 
			  }
			  slideIndex++;
			  if (slideIndex > slides.length) {slideIndex = 1} 
			  slides[slideIndex-1].style.display = "block"; 
			  setTimeout(showSlides, 5000); // Change image every 2 seconds
			}
			</script>
			
		</div>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
           <script type="text/javascript" src="/resources/include/js/common.js"></script>
            <!-- <link rel="stylesheet" type="text/css" href="/resources/include/css/bootstrap.css"/> -->
            <link rel="stylesheet" href="/resources/include/css/default.css"/>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
            <!-- lightbox 라이브러리 -->
            <link rel="stylesheet" href="/resources/include/css/lightbox.css"/>
            <script type="text/javascript" src="/resources/include/js/lightbox.min.js"></script>
           <script type="text/javascript">
				
			</script>
		</head>
	<body>
		<div id="aside">
		    <div class="lnb-wrap">
		        <h2 class="txt"><span>쇼핑정보</span></h2>
		        <ul class="lnb">
		                        <li class="first"><a href="/shop/mypage.html?mypage_type=myorder">주문내역</a></li>
		                                    <li><a href="/shop/mypage.html?mypage_type=mycoupon">쿠폰내역</a></li>
		                                    <li><a href="/shop/mypage.html?mypage_type=myreserve">적립금내역</a></li>
		                                    <li><a href="/shop/mypage.html?mypage_type=myemoney">예치금내역</a></li>
		                                                <li><a href="/shop/todaygoods.html">오늘본상품</a></li>
		                                    <li><a href="/shop/mypage.html?mypage_type=mywishlist">상품 보관함</a></li>
		                    </ul>
		        <h2 class="txt"><span>쇼핑문의</span></h2>
		        <ul class="lnb">
		                        <li class="first"><a href="/shop/mypage.html?mypage_type=myarticle">내 게시글 보기</a></li>
		                                    <li><a href="/shop/mypage.html?mypage_type=myemail">E-mail 문의</a></li>
		                                            </ul>
		        <h2 class="txt"><span>회원정보</span></h2>
		        <ul class="lnb">
		                        <li class="first"><a href="/member/modify">회원정보변경</a></li>
		                                    <li><a href="/member/delete">회원정보탈퇴신청</a></li>
		                    </ul>
		    </div><!-- .lnb-wrap -->
		</div>
	</body>
</html>
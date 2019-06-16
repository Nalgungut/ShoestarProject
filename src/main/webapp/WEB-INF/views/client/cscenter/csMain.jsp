<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>고객센터</title>

    <!-- 스타일 -->
    <link href="/resources/include/dist/css/bootstrap-ko.css" rel="stylesheet">
     <link href="/resources/include/dist/css/bootstrap-responsive.css" rel="stylesheet">
    
    <script ></script>
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
      .sidebar-nav {
        padding: 9px 0;
        background: white;
        border: none;
      }
      	a{
      		color: black; text-decoration: none;
      	}		

      @media (max-width: 980px) {
        /* Enable use of floated navbar text */
        .navbar-text.pull-right {
          float: none;
          padding-left: 5px;
          padding-right: 5px;
        }
      }
     
     
      figure{
      			display: block;
      			width:190px; height:170px;
      			margin:0px; padding: 10px;
      			background-color: white;
      			text-align: center;
      		}
      		figure img{
      			width:140px; height:140px;
      			border: 1px solid #d6d6d6;
      		}
      		figcaption{
      			background:url("images/icon.png") left center no-repeat;
      			padding-left:18px;
      		}
      		.entry{
      			
      			float:left;
      			margin:10px;
      		}
      	a{
      		color: black; text-decoration: none;
      	}
		
			
    </style>
    <link href="/resources/include/dist/css/bootstrap-responsive.css" rel="stylesheet">

    <!-- IE6~8에서 HTML5 태그를 지원하기위한 HTML5 shim -->
    <!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->
  </head>

  <body>
 
    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span3">
          <div class="well sidebar-nav">
            <ul class="nav nav-list">
              <li class="nav-header" style="color:black;">자주묻는질문</li>
              <li class="active"><a href="/cscenter/faqList?fc_no=1">-주문/결제</a></li>
              <li><a href="/cscenter/faqList?fc_no=2">-취소/반품</a></li>
              <li><a href="/cscenter/faqList?fc_no=3">-상품/배송</a></li>
              <li><a href="/cscenter/faqList?fc_no=4">-이벤트</a></li>
              <li><a href="/cscenter/faqList?fc_no=5">-기타</a><hr></li>
              <li class="nav-header"><a href="/cscenter/qnaBoard">1:1 게시판</a><hr></li>
              <li class="nav-header"><a href="/cscenter/provision?p_no=2">개인정보처리지침</a><hr></li>
              <li class="nav-header"><a href="/cscenter/provision?p_no=1">이용약관</a></li>
            </ul>
          </div><!--/.well -->
        </div><!--/span-->
        <div class="span9">
         <!--  <div class="hero-unit"> -->
          	<div class="entry">
	           	<figure>
	           		<a href="/client/notice/noticeList"><img src="/resources/images/cscenter/notice.png" class="img-polaroid"/></a>
	           		<figcaption><a href="/client/notice/noticeList" style="color:black;">공지사항</a></figcaption>
	           	</figure>
	          	
	         </div>
     
	          <div class="entry">
	          	<figure>	
	          		<a href="/event/list"><img src="/resources/images/cscenter/event.png" class="img-polaroid"></a>
	          		<figcaption><a href="/event/list" style="color:black;">이벤트</a></figcaption>
	          	</figure>
	          </div>
	          
	          <div class="entry">	
		         <figure>  	
		           	<a href="/myPage/main"><img src="/resources/images/cscenter/delivery.png" class="img-polaroid"></a>
		          	<figcaption><a href="/myPage/main" style="color:black;">주문/배송현황</a></figcaption>
	         	</figure>
	          </div>
	          
	          <div class="entry">
	          	<figure>	
	           		<a href="/cscenter/qnaBoard"><img src="/resources/images/cscenter/one_one.png" class="img-polaroid"></a>
	          		<figcaption><a href="/cscenter/qnaBoard" style="color:black;">1:1문의</a></figcaption>
	          	</figure>
	          </div> 	
           	
          </div>
          
   </div>
        </div><!--/span-->
    <!--   </div>/row -->
	
  </body>
</html>

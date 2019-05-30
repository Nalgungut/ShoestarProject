<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>자주묻는질문</title>

    <!-- 스타일 -->
    <link href="/resources/include/dist/css/bootstrap-ko.css" rel="stylesheet">
    
    
    <script ></script>
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
      .sidebar-nav {
        padding: 9px 0;
      }

      @media (max-width: 980px) {
        /* Enable use of floated navbar text */
        .navbar-text.pull-right {
          float: none;
          padding-left: 5px;
          padding-right: 5px;
        }
      }
    </style>
    <link href="/resources/include/dist/css/bootstrap-responsive.css" rel="stylesheet">
	<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
    <script>
    	$(function(){
    		$(".detailGo").click(function(){
    			
    			var faq_no = $(this).parents("div").attr("data-num");
    			console.log(faq_no);
    			$("#faq_no").val(faq_no);
    			
    			$("#faqList").attr({
    				"method" : "get",
    				"action" : "/cscenter/faqDetail+faq_no="+faq_no
    			});
    			$("#faqList").submit();
    		});
    	});
    	
    </script>
  </head>

  <body>
    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span3">
          <div class="well sidebar-nav">
            <ul class="nav nav-list">
              <li class="nav-header">자주묻는질문</li>
              <li class="active"><a href="#">-주문/결제</a></li>
              <li><a href="#">-취소/반품</a></li>
              <li><a href="#">-상품/배송</a></li>
              <li><a href="#">-이벤트</a></li>
              <li><a href="#">-기타</a><hr></li>
              <li class="nav-header">1:1 게시판<hr></li>
              <li class="nav-header">개인정보처리지침<hr></li>
              <li class="nav-header">이용약관</li>
            </ul>
          </div><!--/.well -->
        </div><!--/span-->
       <!-- faq리스트 -->
      <div class="container-fluid">
      <div class="row-fluid">
      	<div class="buttonForm">
	        <button class="">주문/결제</button>
	        <button class="">취소/반품</button>
	        <button class="">상품/배송</button>
	        <button class="">이벤트</button>
	        <button class="">기타</button>
        </div>
        <div class="span9">
          <!-- 리스트시작 -->
          <div id="faqList"> 	
	          <div class="row-fluid">
	          <c:choose>
	          	<c:when test="${not empty faqList}">
	          		<c:forEach var="faq" items="${faqList}" varStatus="status">
	          			<div class="span4" data-num="${faq.faq_no}">
	          				<h2>${faq.faq_title}</h2>
	          				<p>${faq.faq_content}</p>
	          				<p><button class="detailGo" >자세히보기</button></p>
	          			</div>
	          		</c:forEach>
	          	</c:when>
	          	<c:otherwise>
	        		<div class="span4">
	        			<h2>게시글이 존재하지 않습니다</h2>
	        		</div>
	          	</c:otherwise>
	          </c:choose>
	            
	          </div><!--/row-->
	        </div><!--/span-->
	      </div><!--/row-->
		</div><!--/faqList  -->
      <hr>
    </div><!--/.fluid-container-->
	</div>
	</div>
    
  </body>
</html>

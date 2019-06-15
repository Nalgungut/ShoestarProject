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
      .sidebar-nav {
        padding: 9px 0;
        background: white;  border: none;
      }
      	a{
      		color: black; text-decoration: none;
      	}
      	#order, #cancel, #exc, #goods, #event{
      		margin-left : 10px;
      	}		
    </style>
    <script type="text/javascript">
	    var fc_no = $(".span4").attr("data-value")
		$("#order").click(function(){
			//console.log(fc_no);
			location.href = "/cscenter/faqList?fc_no=1";
		});
		$("#cancel").click(function(){
			location.href= "/cscenter/faqList?fc_no=2";
		});
		$("#goods").click(function(){
			location.href= "/cscenter/faqList?fc_no=3";
		});
		$("#event").click(function(){
			location.href= "/cscenter/faqList?fc_no=4";
		});
		$("#exc").click(function(){
			location.href= "/cscenter/faqList?fc_no=5";
		});
    </script>
    <link href="/resources/include/dist/css/bootstrap-responsive.css" rel="stylesheet">
	<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
      
	</head>
   
	<body>
    <div class="container-fluid">
    	<form name="faq_data" id="faq_data" method="post">
    		<input type="hidden" name="faq_no" value="${detail.faq_no}">
    	</form>
      <div class="row-fluid">
        <div class="span3">
          <div class="well sidebar-nav">
            <ul class="nav nav-list">
              <li class="nav-header">자주묻는질문</li>
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
       <!-- faq리스트 -->
      <div class="container-fluid">
      <div class="row-fluid">
      	
        <div class="span9">
          <div id="faqList"> 	
	          <!-- 디테일 정보 -->
	          <div>
	          	<table class="table">
					<colgroup>
						<col width="17%" />
						<col width="33%" />
						<col width="17%" />
						<col width="33%" />
					</colgroup>
					<tbody>
						<tr>
							<td>작성자</td>
							<td class="text-left">관리자</td>
							<td>작성일</td>
							<td class="text-left">${detail.faq_date}</td>
						</tr>
						<tr>
							<td>제목</td>
							<td colspan="3" class="text-left">${detail.faq_title}</td>
						</tr>
						<tr class="table-height">
							<td>내용</td>
							<td colspan="3" class="text-left">${detail.faq_content}</td>
						</tr>
					</tbody>
				</table>
	          </div>
	        </div><!--/span-->
	      </div><!--/row-->
		</div><!--/faqList  -->
      <hr>
    </div><!--/.fluid-container-->
	</div>
	</div>
    
  </body>
</html>
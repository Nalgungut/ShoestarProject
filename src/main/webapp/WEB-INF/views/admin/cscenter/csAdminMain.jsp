<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>고객센터 관리자 홈</title>
		<link rel="stylesheet" href="/resources/include/dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="/resources/include/dist/css/bootstrap-theme.min.css">
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
		$(function(){	
    		
    		var fc_no = $(".span4").attr("data-value")
    		
    	});
		</script>
	</head>
   
	<body>
		<div class="t">
			<table class="table table-bordered">
				<tr>
					<td rowspan="2" class="text-center">배송준비중</td>
					<td rowspan="2" class="text-center">배송중</td>
					<td class="text-center">취소</td>
					<td class="text-center">교환</td>
					<td class="text-center">반품</td>
					<td rowspan="2" class="text-center">1:1문의</td> 
				</tr>
				<tr>
					<td class="text-center">신청/처리</td>
					<td class="text-center">신청/처리</td>
					<td class="text-center">신청/처리</td>
				</tr>
				<tr>
					<td class="text-center"><!-- 배송준비중인상품갯수 --><a href="#">1/2</a></td>
					<td class="text-center"><!-- 배송중관리 --><a href="#">3/4</a></td>
					<td class="text-center"><!-- 1:1문의취소 --><a href="#">5/8</a></td>
					<td class="text-center"><!-- 1:1문의교환 --><a href="#">1/10</a></td>
					<td class="text-center"><!-- 1:1문의반품 --><a href="#">12/30</a></td>
					<td class="text-center"><!-- 1:1문의 기타 --><a href="#">10/25</a></td>
				</tr>
			</table>
			
			<ul class="nav nav-tabs">
				<li role="presentation" class="active" id="chk"><a href="#">게시물현황</a></li>
				<li role="presentation"><a href="#" id="chk2">주문처리현황</a></li>
			</ul>
			
			<table class="table table-bordered" id="productTotal">
				<tr>
					<th>날짜</th>
					<th>배송준비중</th>
					<th>배송중</th>
					<th>배송완료</th>
					<th>취소</th>
					<th>교환</th>
					<th>반품</th>
					<th>주문합계</th>
				</tr>
				<tr>
					<td><!-- 날짜 -->2019-05-04</td>
					<td><!-- 배송준비중건수 -->1</td>
					<td><!-- 배송중건수 -->3</td>
					<td><!-- 배송완료건수 -->4</td>
					<td><!-- 취소건수 -->2</td>
					<td><!-- 교환건수 -->3</td>
					<td><!-- 반품건수 -->4</td>
					<td><!-- 주문총합건수 -->17</td>
				</tr>
			</table>
			
			<table class="table table-bordered" id="boardTotal">
				<tr>
					<th>날짜</th>
					<th>이벤트</th>
					<th>1:1게시판</th>
					<th>게시물합계</th>
				</tr>
				<tr>
					<td><!--  -->2019-05-04</td>
					<td><!--  -->1</td>
					<td><!--  -->12</td>
					<td><!--  -->13</td>
				</tr>
			</table>
		</div>
		
			<h3>게시물 등록</h3>
			<button type="button"  class="btn btn-primary">자주 묻는 질문 등록하기</button>
			<!-- <button type="button"  class="btn btn-primary">자주 묻는 질문 수정하기</button>
			<button type="button"  class="btn btn-primary">자주 묻는 질문 삭제하기</button> -->
			
			<div class="modal fade" id="faqModal" tabindex="-1" role="dialog" aria-labelledby="galleryModalLabel" aria-hidden="true">
	           <div class="modal-dialog">
	             <div class="modal-content">
	               <div class="modal-header">
	                 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	                 <h4 class="modal-title" id="replyModalLabel">자주묻는질문 등록</h4>
	               </div>
	               <div class="modal-body">
	                 <form id="f_writeForm" name="f_writeForm">
	                   <div class="form-group">
	                     <select id="fc_no">
	                     	<option value=1>주문/결제</option>
	                     	<option value=2>취소/반품</option>
	                     	<option value=3>상품/배송</option>
	                     	<option value=4>이벤트</option>
	                     	<option value=5>기타</option>
	                     </select>
	                   </div>
	                   <div class="form-group">
	                     <label for="g_subject" class="control-label">글제목</label>
	                     <input type="text" class="form-control" id="faq_subject" name="faq_title" maxlength="5">
	                   </div>
	                   <div class="form-group">
	                      <label for="g_content" class="control-label">글내용</label>
	                      <textarea class="form-control" name="faq_content" id="faq_content" rows="4"></textarea>
	                   </div>
	                 </form>
	               </div>
	               <div class="modal-footer">
	                 <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	                 <button type="button" class="btn btn-primary" id="faqInsertBtn">등록</button>
	               </div>
	             </div>
	           </div>
	         </div>	
	         
	         <div class="container-fluid">
      <div class="row-fluid">
      	<div class="buttonForm">
	        <a id="order" class="btn btn-default">주문/결제</a>
	        <a id="cancel" class="btn btn-default">취소/반품</a>
	        <a id="goods" class="btn btn-default">상품/배송</a>
	        <a id="event" class="btn btn-default">이벤트</a>
	        <a id="exc" class="btn btn-default">기타</a>
        </div>
        <div class="span9">
          <!-- 리스트시작 -->
          <div id="provisionList"> 	
	          <div class="row-fluid">     
			         <table summary="FAQ리스트" class="table">
					 	<colgroup>
					 		<col width="10%"/>
					 		<col width="20%"/>
					 		<col width="50%"/>
					 		<col width="20%"/>
					 	</colgroup>        	
					 	<thead>
					 		<tr>
					 			<th data-value="fc_name">분류유형</th>
					 			<th data-value="faq_title">제목</th>
					 			<th data-value="faq_content">내용</th>
					 			<th data-value="faq_date">작성일</th>
					 		</tr>
					 	</thead>
					          <c:choose>
					          	<c:when test="${not empty faqList}">
					          		<c:forEach var="faq" items="${faqList}" varStatus="status">
					          			<div class="span4" data-num="${faq.faq_no}" data-value="${faq.fc_no}">
					          				<div id="form-control">
					          					<p>${faq.fc_name}</p>
					          				</div>
											<div id="form-control">
					          					<p>${faq.faq_title}</p>
					          				</div>
					          				<div id="form-control">
					          					<p>${faq.faq_content}</p>
					          				</div>
					          			</div>
					          		</c:forEach>
					          	</c:when>
					          	<c:otherwise>
					        		<div class="span4">
					        			<h2>게시글이 존재하지 않습니다</h2>
					        		</div>
					          	</c:otherwise>
					          </c:choose>
	            	</table>
	          </div><!--/row-->
	        </div><!--/span-->
	      </div><!--/row-->
		</div><!--/faqList  -->
      <hr>
    </div><!--/.fluid-container-->
	</body>
</html>
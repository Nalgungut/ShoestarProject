<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<title>관리자 1:1게시판 관리</title>
		
		<link rel="stylesheet" href="/resources/include/dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="/resources/include/dist/css/bootstrap-theme.min.css">
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/qna.js"></script>
		<script src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			
		</script>
	</head>
	
	<body>
	  <div class="contentContainer container-fluid">
	  <div class="contentTit page-header"><h3 class="text-center">1:1게시판 문의 관리</h3></div> 
		<div class="form-group">
			<form id="search_form">
				<p>문의유형 검색</p>
				<select id="qna_ctgr" name="qna_ctgr">
					<option value="취소">취소</option>
					<option value="반품">반품</option>
					<option value="교환">교환</option>
					<option value="이벤트">이벤트</option>
					<option value="기타">기타</option>
				</select>	
				<button type="button" class="btn btn-default" id="qna_ctgr_btn">검색</button>
			</form>
		</div>
			<br>
			<div class="modal fade" id="faqModal" tabindex="-1" role="dialog" aria-labelledby="galleryModalLabel" aria-hidden="true">
	           <div class="modal-dialog">
	             <div class="modal-content">
	               <div class="modal-header">
	                 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	                 <h4 class="modal-title" id="faqModalLabel">자주묻는질문 등록</h4>
	               </div>
	               <div class="modal-body">
	                 <form id="faq_writeForm" name="faq_writeForm">
	                 	<input type="hidden" name="faq_no" id="faqno">
	                   <div class="form-group">
	                     <select id="fc_no" name="fc_no">
	                     	<option value="1">주문/결제</option>
	                     	<option value="2">취소/반품</option>
	                     	<option value="3">상품/배송</option>
	                     	<option value="4">이벤트</option>
	                     	<option value="5">기타</option>
	                     </select>
	                   </div>
	                   <div class="form-group">
	                     <label for="faq_title" class="control-label">글제목</label>
	                     <input type="text" class="form-control" id="qna_title" name="faq_title" >
	                   </div>
	                   <div class="form-group">
	                      <label for="faq_content" class="control-label">글내용</label>
	                      <textarea class="form-control" name="qna_content" id="faq_content" rows="4"></textarea>
	                   </div>
	                 </form>
	               </div>
	               <div class="modal-footer">
	                 <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	                 <button type="button" class="btn btn-primary" id="faqInsertBtn" data-button="qnaReplyInsert">답글등록</button>
	               </div>
	             </div>
	           </div>
	         </div>	
	         <br>
	         <div class="container-fluid">
      <div class="row-fluid">
      	
        <div class="span9">
          <!-- 리스트시작 -->
          <div id="qnaList"> 	
	          <div class="row-fluid">     
			         <table summary="1:1문의 리스트" class="table">
					 	<colgroup>
					 		<col width="10%"/>
					 		<col width="20%"/>
					 		<col width="50%"/>
					 		<col width="10%"/>
					 		<col width="5%"/>
					 		<col width="5%"/>
					 	</colgroup>        	
					 	<thead>
					 		<tr>
					 			<th data-value="qna_ctgr">분류유형</th>
					 			<th data-value="qna_title">제목</th>
					 			<th data-value="qna_content">내용</th>
					 			<th data-value="mem_name">고객명</th>
					 			<th data-value="od_no">주문번호</th>
					 		</tr>
					 	</thead>
					          <c:choose>
					          	<c:when test="${not empty qnaList}">
					          		<c:forEach var="qna" items="${qnaList}" varStatus="status">
					          			<tr class="span4" data-num="${qna.qna_no}">
					          				<td>${qna.qna_ctgr}</td>
											<td>${qna.qna_title}</td>
					          				<td>${qna.qna_content}</td>
					          				<td>${qna.mem_name}</td>
					          				<td>${qna.od_no}</td>
					          				<td><input type="button" class="btn btn-default qnaDetailBtn" value="상세보기"/>&nbsp;<input type="button" class="btn btn-default qnaReplyBtn" value="답글달기"/></td>
					          			</tr>
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
    </div>
   	</div>
	</body>
</html>
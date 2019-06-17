<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<title>관리자 1:1게시판 관리</title>
		<script type="text/javascript" src="/resources/include/js/qna.js"></script>
	
		<script type="text/javascript">
			$(function(){
				$(".qnaDetailBtn").click(function(){
					var qna_no = $(this).parents(".span4").attr("data-num");
					var mem_no = $(this).parents(".span4").attr("data-num2");
					
					$.ajax({
						 url : "/admin/cscenter/qnaDetail",
						 type : "post",
						 data : "qna_no="+qna_no+"&mem_no="+mem_no,
						 dataType : "json",
						 error : function(){
							alert("오류입니다 제작사에게 문의해주세요."); 
						 },
						 success : function(data){
							var qna_title = data.qna_title;
							var mem_name = data.mem_name;
							var qna_content = data.qna_content;
							
							$("#qna_title").val(qna_title);
							$("#mem_name").val(mem_name);
							$("#qna_content").val(qna_content);
					
						 }
					}); 
					$("#qnaDetailModal").modal();
				});
				
				$(".qnaReplyBtn").click(function(){
					var qna_no = $(this).parents(".span4").attr("data-num");
					var mem_no = $(this).parents(".span4").attr("data-num2");
					console.log(qna_no);
					console.log(mem_no);
					$("#qna_no").val(qna_no);
					$("#mem_no").val(mem_no);
					
					$("#qnaReplyModal").modal();
				});
				$("#replyInsertBtn").click(function(){
					
					$("#reply_writeForm").attr({
						"method" : "post",
						"action" : "/admin/cscenter/replyInsert"
					});
					$("#reply_writeForm").submit();
					alert("답변 등록 완료");
					
				});
				
				$("#qna_ctgr_btn").click(function(){
					$("#search_form").attr({
						"method" : "post",
						"action" : "/admin/cscenter/qnaSearch"
					});
					$("#search_form").submit();
				});
				
				$("#allBtn").click(function(){
					location.href="/admin/cscenter/csAdminQna";
				});
			});
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
				<button type="button" class="btn btn-default" id="allBtn">전체조회</button>
			</form>
		</div>
			<br>
			<div class="modal fade" id="qnaDetailModal" tabindex="-1" role="dialog" aria-labelledby="qnaDetailModalLabel" aria-hidden="true">
	           <div class="modal-dialog">
	             <div class="modal-content">
	               <div class="modal-header">
	                 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	                 <h4 class="modal-title" id="qnaDetailModalLabel">1:1문의 상세</h4>
	               </div>
	               <div class="modal-body">
	                 	<input type="hidden" name="qna_no" >
	                   <div class="form-group">
	                     <label for="qna_title">1:1문의 제목</label>
	                     <input type="text" class="form-control" id="qna_title" name="qna_title" readonly="readonly">
	                   </div>
	                   <div class="form-group">
	                     <label for="mem_name" class="control-label">1:1문의 고객</label>
	                     <input type="text" class="form-control" id="mem_name" name="mem_name" readonly="readonly">
	                   </div>
	                   <div class="form-group">
	                      <label for="qna_content" class="control-label">1:1문의 글내용</label>
	                      <textarea class="form-control" name="qna_content" id="qna_content" rows="15" readonly="readonly"></textarea>
	                   </div>
	               </div>
	               <div class="modal-footer">
	                 <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	               </div>
	             </div>
	           </div>
	         </div>
	         <div class="modal fade" id="qnaReplyModal" tabindex="-1" role="dialog" aria-labelledby="qnaReplyModalLabel" aria-hidden="true">
	           <div class="modal-dialog">
	             <div class="modal-content">
	               <div class="modal-header">
	                 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	                 <h4 class="modal-title" id="qnaReplyModalLabel">1:1문의 답글</h4>
	               </div>
	               <form id="reply_writeForm" name="reply_writeForm">
	               <div class="modal-body">
	                 	<input type="hidden" name="qna_no" id="qna_no">
	                   	<input type="hidden" name="mem_no" id="mem_no">
	                   <div class="form-group">
	                     <label for="mem_name" class="control-label">답글 제목</label>
	                     <input type="text" class="form-control" id="qr_title" name="qr_title">
	                   </div>
	                   <div class="form-group">
	                      <label for="qna_content" class="control-label">답글 내용</label>
	                      <textarea class="form-control" name="qr_content" id="qr_content" rows="15"></textarea>
	                   </div>
	               </div>
	               </form>
	               <div class="modal-footer">
	                 <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	                 <button type="button" class="btn btn_default replyInsertBtn" id="replyInsertBtn">답글등록</button> 
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
					          			<tr class="span4" data-num="${qna.qna_no}" data-num2="${qna.mem_no}">
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
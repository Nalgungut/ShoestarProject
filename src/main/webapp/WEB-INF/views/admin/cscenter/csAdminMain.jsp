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
		<script type="text/javascript" src="/resources/include/js/qna.js"></script>
		<script src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
		$(function(){	
    		
			//자주묻는질문등록 버튼 모달창 키기
    		$("#insertBtn").click(function(){
    			$("#faqno").val("0");
    			$("#faqInsertBtn").html("등록");
    			$("#faqModalLabel").html("자주 묻는 질문 등록");
    			$("#faqInsertBtn").attr("data-button","faqInsertBtn");
    			$("#faqModal").modal();
    		});
   
    		$("#faqInsertBtn").click(function(){
    			
     			if(!chkSubmit($("#faq_title"), "자주묻는질문 제목을")) return;
     			else if(!chkSubmit($("#faq_content"), "자주묻는질문 내용을")) return;
     			else if($("#faqInsertBtn").attr("data-button") == "faqInsertBtn"){
     				$("#faq_writeForm").attr({
     					"method" : "post",
     					"action" : "/admin/cscenter/faqInsert"
     				});
     				$("#faq_writeForm").submit();
     				alert('등록되었습니다.');
     				dataReset();
     				
     			}
     			else if($("#faqInsertBtn").attr("data-button") == "upBtn"){
     				$("#faq_writeForm").attr({
    					"method" : "post",
    					"action" : "/admin/cscenter/faqUpdate"
    				});
     				$("#faq_writeForm").submit();
     				alert("수정되었습니다.");
    				dataReset();
    				
     			}
     		}); 
    		
    		$(".faqUpdateBtn").click(function(){
    			
    			$("#faqno").val($(this).closest("tr").attr("data-num"));
    			$("#faqModalLabel").html("자주 묻는 질문 수정");
				$("#faqInsertBtn").html("수정");
				$("#faqInsertBtn").attr("data-button","upBtn");
				$("#faqModal").modal();
				
    		});
    		
    		
    		$(".faqDeleteBtn").click(function(){
    			var faq_no = $(this).parents("tr").attr("data-num");
    			console.log(faq_no);
    			$.ajax({
    				url : "/admin/cscenter/faqDelete",
    				type : "post",
    				data : "faq_no="+faq_no,
    				dataType : "text",
    				error : function(){
    					alert("에러입니다 웹 제작자에게 문의해주세요");    					
    				},
    				success : function(){
    					alert('삭제성공');
    					location.href="/admin/cscenter/";
    				}
    			});
    		});
    	});
		
		
		function dataReset(){
			$("#faq_writeForm").each(function(){
				this.reset();
			});
		} 
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
		
			<h3>자주묻는 질문 리스트</h3>
			<button type="button" id="insertBtn" class="btn btn-primary">자주 묻는 질문 등록하기</button>
			<!-- <button type="button"  class="btn btn-primary">자주 묻는 질문 수정하기</button>
			<button type="button"  class="btn btn-primary">자주 묻는 질문 삭제하기</button> -->
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
	                     <input type="text" class="form-control" id="faq_title" name="faq_title" >
	                   </div>
	                   <div class="form-group">
	                      <label for="faq_content" class="control-label">글내용</label>
	                      <textarea class="form-control" name="faq_content" id="faq_content" rows="4"></textarea>
	                   </div>
	                 </form>
	               </div>
	               <div class="modal-footer">
	                 <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	                 <button type="button" class="btn btn-primary" id="faqInsertBtn" data-button="faqInsertBtn">등록</button>
	               </div>
	             </div>
	           </div>
	         </div>	
	         <br>
	         <div class="container-fluid">
      <div class="row-fluid">
      	
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
					          			<tr class="span4" data-num="${faq.faq_no}" data-value="${faq.fc_no}">
					          				<td id="fc_no">${faq.fc_name}</td>
											<td id="title">${faq.faq_title}</td>
					          				<td id="content">${faq.faq_content}</td>
					          				<td><input type="button" class="btn btn-default faqDeleteBtn" data-num="${faq.faq_no}"  value="삭제하기"/>&nbsp;<input type="button" class="btn btn-default faqUpdateBtn" value="수정하기"/></td>
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
    </div><!--/.fluid-container-->
	</body>
</html>
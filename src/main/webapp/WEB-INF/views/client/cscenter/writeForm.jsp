<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>1:1게시판 문의</title>
      
      	<script type="text/javascript" src="/resources/include/js/common.js"></script>
      	<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script src="/resources/include/dist/js/bootstrap.min.js"></script>
      	<script type="text/javascript" src="/resources/include/js/qna.js"></script>
 
	</head>
	
   	<script type="text/javascript">
   		$(function(){
   			$("#qnaListBtn").click(function(){
   				location.href="/cscenter/qnaBoard";
   			});
   			
   			$("#qnaInsertBtn").click(function(){
   				if(!chkSubmit($('#qna_title'), '질문제목을')) return;
   				else if(!chkSubmit($("#qna_content"), '질문 내용을')) return;
   				else{ 
   					$("#f_writeForm").attr({
   						"method" : "post",
   						"action" : "/cscenter/qnaInsert"
   					});
   					//$("#f_writeForm").submit();
   					
   					var oi_no = $("#od_no > option:selected").attr("data-num");
   					var oi_qty = $("#od_no > option:selected").attr("data-qty");
   					
   					console.log(oi_no);
   					console.log(oi_qty);
   					
   					$("#oi_no").val(oi_no);
   					$("#oi_qty").val(oi_qty);
   					
   					/* $("#os_insertForm").attr({
   						"method" : "post",
   						"action" : "/cscenter/qnaInsert"
   					}); */
   					//$("#os_insertForm").submit();
   					$("#f_writeForm").submit();
   					alert("정상적으로 등록되었습니다."); 
   					
   				}
   			});
   			
   			$("#qnaCancelBtn").click(function(){
   				$("#f_writeForm").each(function(){
   					this.reset();
   				});
   			});
   		});
   	</script>
	<body>
		<!-- <form id="os_insertForm"name = "os_insertForm">
			<input type="hidden" name="oi_no" id="oi_no"/>
			<input type="hidden" name="oi_qty" id="oi_qty" />			
		</form> -->
		<div class="contentContainer container-fluid">
			<div class="contentTit page-header"><h3 class="text-center">1:1게시판 문의</h3></div>
			<div class="contentTB ">
				<form id="f_writeForm">
				<input type="hidden" name="oi_no" id="oi_no"/>
				<input type="hidden" name="oi_qty" id="oi_qty" />	
					<input type="hidden" name="mem_no" id="mem_no" value="${login.mem_no}"/>
					<div class="form-group form-inline">
						<label for="mem_name">작성자</label>
						<input type="text" id="mem_name" name="mem_name" class="form-control" readonly="readonly" value="${login.mem_name}"/>
					</div>
					<div class="form-group">	
						<label for="qna_ctgr">질문유형</label>
						<select id="qna_ctgr" name="qna_ctgr">
							<option value="취소">취소</option>
							<option value="교환">교환</option>
							<option value="반품">반품</option>
							<option value="이벤트">이벤트</option>
							<option value="기타">기타</option>
						</select>
					</div>
					
					<div class="form-group">
						<label for="od_no">주문번호</label>
						<select id="od_no" name="od_no" class="form-control">
							<c:if test="${not empty orders}">
								<c:forEach var="odata" items="${orders}" varStatus="status">
									<option value=""> </option>
									<option value="${odata.od_no}" data-num="${odata.oi_no}" data-qty="${odata.oi_qty}">
										${odata.od_no}번 주문 / 주문자 : ${odata.mem_name} / 구입상품명 : ${odata.pd_name} / 구입수량 : ${odata.oi_qty} 
									</option>
								</c:forEach>
							</c:if>
						</select>
					</div>
					<div class="form-group">
						<label for="qna_title">제목</label>
						<input type="text" id="qna_title" name="qna_title" class="form-control"/>
					</div>
					<div class="form-group">		
						<label for="qna_content">내용</label>
						<textarea id="qna_content" name="qna_content" class="form-control" rows="8"></textarea>
					</div>
					
					<div class="text-right">
						<input type="button" value="저장" id="qnaInsertBtn" class="btn btn-success">
						<input type="button" value="취소" id="qnaCancelBtn" class="btn btn-default"> 
						<input type="button" value="목록" id="qnaListBtn" class="btn btn-default">
					</div>
				</form>
			</div>
			
		</div>
	</body>
</html>
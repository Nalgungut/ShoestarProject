<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Title</title>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
      	<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script src="/resources/include/dist/js/bootstrap.min.js"></script>
      	<script type="text/javascript" src="/resources/include/js/qna.js"></script>
      	<script type="text/javascript">
      		$(function(){
      			$("#qnaUpdateBtn").click(function(){
      				if(!chkSubmit($('#qna_title'), '질문제목을')) return;
       				else if(!chkSubmit($("#qna_content"), '질문 내용을')) return;
       				else{
       					$("#f_updateForm").attr({
       						"method" : "post",
       						"action" : "/cscenter/qnaUpdate"
       					});
       					$("#f_updateForm").submit();
       				}
      			});
      			
      			$("#qnaCancelBtn").click(function(){
       				$("#f_writeForm").each(function(){
       					this.reset();
       				});
       			});
      			
      			$("#qnaListBtn").click(function(){
       				location.href="/cscenter/qnaBoard";
       			});
      		});
      	</script>
	</head>
   
	<body>
		<div class="contentContainer container-fluid">
			<div class="contentTit page-header"><h3 class="text-center">1:1게시판 수정</h3></div>
			<div class="contentTB">
				<form id="f_updateForm">
					<input type="hidden" name="qna_no" id="qna_no" value= />
					<input type="hidden" name="mem_no" id="mem_no" value="${login.mem_no}"/>
					<div class="form-group">
						<label for="mem_name">작성자</label>
						<input type="text" id="mem_name" name="mem_name" class="form-control" readonly="readonly" value="${login.mem_name}"/>
					</div>
					<div class="form-group">	
						<label for="qna_ctgr">질문유형</label>
						<select id="qna_ctgr" name="qna_ctgr">
							<option value="배송/환불">상품/배송</option>
							<option value="취소/반품">취소/반품</option>
							<option value="이벤트">이벤트</option>
							<option value="기타">기타</option>
						</select>
					</div>
					<div class="form-group">
						<label for="od_no">주문번호</label>
						<select id="od_no" name="od_no">
							<c:if test="${not empty orders}">
								<c:forEach var="odata" items="${orders}" varStatus="status">
									<option value="${odata.od_no}">
										${odata.od_no}번 주문 (<fmt:formatDate value="${odata.od_date}" pattern="yyyy-MM-dd" />일)
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
						<input type="button" value="수정" id="qnaUpdateBtn" class="btn btn-success">
						<input type="button" value="취소" id="qnaCancelBtn" class="btn btn-default"> 
						<input type="button" value="목록" id="qnaListBtn" class="btn btn-default">
					</div>
				</form>
			</div>
			
		</div>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>1:1문의 상세내역</title>
      <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
      <script type="text/javascript">	
	      $(function(){
	     		
	      		$("#updateFormBtn").click(function(){
	     			
	     			var qna_no = $("#f_data").children("input[type=hidden]").val();
	     			
	     			location.href="/cscenter/qnaUpdateForm?qna_no="+qna_no;
						     		
	      		});
	     		
	     		$("#qnaListBtn").click(function(){
	     			location.href="/cscenter/qnaBoard";
	     		});
	     		
	     		$("#qnaDeleteBtn").click(function(){
	     			$.ajax({
	     				url : "/cscenter/qnaDelete",
	     				type : "post",
	     				data : "qna_no="+$("#qna_no").val(),
	     				dataType : "text",
	     				error: function(){
	     					alert("답글이 달린글은 삭제할수 없습니다");	
	     				},
	     				success : function(){
	     					qna_no = 0;
	     					location.href="/cscenter/qnaBoard";
	     					alert("답글이 정상적으로 삭제 되었습니다.")
	     				}
	     			});
	     		});
	      	});
	      
	      
      </script>
      <style type="text/css">
      	.re{background: #F6F6F6;}
      </style>
	</head>
   
	<body>
		<div class="contentContainer container-fluid">
			<div class="contentTit page-header"><h3 class="text-center">1:1문의 상세보기</h3></div>
			
			<form name="f_data" id="f_data" method="post">
				<input type="hidden" id="qna_no" name="qna_no" value="${detail.qna_no}">
			</form>
				<div class="btnArea col-md-4">
					<input type="button" value="수정" id="updateFormBtn"  class="btn btn-default">
					<input type="button" value="삭제" id="qnaDeleteBtn"  class="btn btn-default">
					<input type="button" value="목록" id="qnaListBtn"  class="btn btn-default">
				</div>
			</div><br/>
			
			<div class="contentTB text-center">
				<form id="qna_form">
				<table class="table table-bordered">
					<colgroup>
						<col width="17%" />
						<col width="33%" />
						<col width="17%" />
						<col width="33%" />
					</colgroup>
					<tbody>
						<tr>
							<td>작성자</td>
							<td class="text-left">${detail.mem_name}</td>
							<td>작성일</td>
							<td class="text-left"><fmt:formatDate value="${detail.qna_date}" pattern="yyyy/MM/dd "/></td>
						</tr>
						<tr>
							<td>질문유형</td>
							<td class="text-left">${detail.qna_ctgr}</td>
							<td>제목</td>
							<td class="text-left">${detail.qna_title}</td>					
						</tr>
						<tr></tr>
						<tr class="table-height">
							<td>내용</td>
							<td colspan="3" class="text-left">${detail.qna_content}</td>
						</tr>
					</tbody>
				</table>
				</form>
			<div class="text-left">
				<p class="re">-답글-</p>
			</div>
			<div id="replyContainer">
			<!-- 댓글리스트 영역 -->
			<div id="qnaReplyList"></div>
				<table class="table table-bordered">
					<colgroup>
						<col width="10%" />
						<col width="20%" />
						<col width="70%" />
					</colgroup>
					<tbody id="list">
						<c:choose>
							<c:when test="${not empty qna_replyList}">
								<c:forEach var="qr" items="${qna_replyList}" varStatus="status">
									<tr class="tac">
										<td>관리자</td>
										<td>${qr.qr_title}</td>
										<td>${qr.qr_date}</td>
									</tr>
									<tr class="text-center">
										<td colspan="3">${qr.qr_content}</td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</tbody>
				</table>	
		</div>
			</div>
			
			
	</body>
</html>
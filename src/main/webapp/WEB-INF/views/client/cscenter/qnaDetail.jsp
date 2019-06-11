<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	     			
	     		});
	      	});
	      
	      
      </script>
	</head>
   
	<body>
		<div class="contentContainer container-fluid">
			<div class="contentTit page-header"><h3 class="text-center">1:1문의 상세보기</h3></div>
			
			<form name="f_data" id="f_data" method="post">
				<input type="hidden" id="qna_no" name="qna_no" value="${detail.qna_no}">
			</form>
				<div class="btnArea col-md-4">
					<input type="button" value="수정" id="updateFormBtn"  class="btn btn-primary">
					<input type="button" value="삭제" id="qnaDeleteBtn"  class="btn btn-primary">
					<input type="button" value="목록" id="qnaListBtn"  class="btn btn-primary">
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
							<td class="text-left">${detail.qna_date}</td>
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
			
			<jsp:include page="qnaReply.jsp"></jsp:include>
			</div>
			
			
	</body>
</html>
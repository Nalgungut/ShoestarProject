<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		
		<title>관리자 공지사항 상세페이지</title>
		
		<link rel="shortcut icon" type="image⁄x-icon" href="/resources/images/icon.png" />
		<link rel="apple-touch-icon" type="image⁄x-icon" href="/resources/images/icon.png" />
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
     	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
     	
     	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		<!-- [if lt IE 9]>
			<script src="/resources/include/js/html5shiv.js"></script>
		<![endif] -->
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		
		<style>
			#textarea{
				width: 500px;
				height: 500px;
			}
			#boardListBtn{
				text-align: right;
			}
			#te{
				height: 500px;
			}
			textarea{
				height: 500px;
				width: 1000px;
			}
		</style>
		
		<script type="text/javascript">
    	    
    	    	var butChk = 0; //수정버튼과 삭제버튼을 구별하기 위한 변수
				$(function(){
					//수정 버튼 클릭 시 처리 이벤트
					$("#updateFormBtn").click(function(){
						
						//var no_no = $(this).parents("tr").attr("data-num")
						//$("#no_no").val(no_no);
						//console.log("글번호 : "+no_no);
						
						//수정 페이지로 이동하기 위해 form추가 (id=detailForm)
						$("#detailForm").attr({
							"method" : "get",
							"action" : "/admin/brand/updateForm"
						});
						$("#detailForm").submit();
						
					});
					
					//목록 버튼 클릭 시 처리 이벤트
					$("#boardListBtn").click(function(){
						location.href="/admin/brand/adminNoticeList";
					});
					
					 /* 삭제버튼 클릭 시 */
			        $("#boardDeleteBtn").click(function(){
						$.ajax({
							url : "/admin/brand/replyCnt",
							type : "post",
							data : "no_no="+$("#no_no").val(),
							dataType : "text",
							error : function() {
								alert('시스템 오류입니다. 관리자에게 문의하세요');
							},
							success : function(resultData) {
								butChk = 2;
								var goUrl="";
								if(resultData==0){
									if(confirm("삭제하시겠습니까?")){
							        	$("#detailForm").attr({
											"method" : "get",
											"action" : "/admin/brand/noticeDelete"
										});
										$("#detailForm").submit();
										alert("삭제가 완료되었습니다.");
									}
								}else{
									alert("공지사항에 댓글이 존재하여 삭제 할 수 없습니다.");
									return;
								}
							}
						}); 
						
					});
					
					
				}); // 최상위 함수 종료
    	    	
				
    	    
			</script>
		
	</head>
	
	<body>
		<div class="contentContainer container">
			<div class="contentTit page-header">
				<h3 class="text-center">관리자 공지사항 상세보기</h3>
			</div>
			<div class="btnArea col-md-4">
					<input type="button" value="수정" id="updateFormBtn" class="btn btn-success"/>
					<input type="button" value="삭제" id="boardDeleteBtn" class="btn btn-success"/>
					<input type="button" value="목록" id="boardListBtn" class="btn btn-success"/>
			</div>
			
			<form id="detailForm" name="detailForm">
				<input type="hidden" id="no_no" name="no_no" value="${adminDetail.no_no}"/>
				<!-- 상세페이지에서 리스트 이동시 보던 전 페이지로 이동하기 -->
				<%--<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum}">--%> <!-- (pageDTO) 글번호 가져오기 -->
				<%--<input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount}">--%>
			</form>
			
			<!--  상세정보 보기 -->
			<div class="contentTB text-center">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<td>말머리</td>
							<td class="text-left">${adminDetail.no_kind}</td>
							<td>작성일</td>
							<td class="text-left">
							<fmt:formatDate value="${adminDetail.no_date}" pattern="yyyy-MM-dd hh:mm"/></td>
							<td>작성자</td>
							<td class="text-left">${adminDetail.adm_name}</td>
						</tr>
						<tr>
							<td>제 목</td>
							<td colspan="5" class="text-left">${adminDetail.no_subject}</td>
						</tr>
						<tr class="table-height" id="te">
							<td>내 용</td>
							<td colspan="5" class="text-left">${adminDetail.no_content}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>
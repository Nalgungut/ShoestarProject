<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		
	<title>범위 할인 수정</title>
	
	<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />
	
	<link rel="stylesheet" href="/resources/include/css/rdisList.css" >
	<script type="text/javascript"
		   src="/resources/include/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="/resources/include/js/eventList.js"></script>
	<script type="text/javascript" src="/resources/include/js/jquery.form.min.js"></script>
		
	
	<style type="text/css">
		.RD_td{width: 600px; padding: 10px;}
		/* #RdisDetailTable .RD_tdInput{text-align: left;}	 */
	</style>
	
	<script type="text/javascript">
		$(function() {
			
			
			// 저장
			// 저장 버튼 클릭시
				$("#updateBtn").click(function() {
					if(!chkSubmit($("#rd_title"), "할인 제목을")) return;
					else if(!chkSubmit($("#rd_content"), "할인 내용을")) return;
					else if(!chkNumber($("#rd_discount"), "할인가를")) return;
					else if(!chkPercent($("#rd_discount"), "할인율은")) return;
					else{
						$("#RdisForm").attr({
							"method" : "post",
							"action" : "/admin/event/rds/rdsUpdate"
						});
						
						
						$("#RdisForm").submit();
					}
				});
			
			// 취소
			$("#canBtn").click(function(){
				dataReset();
			});
			
			// 리스트
			$("#listBtn").click(function() {
				location.href="/admin/event/rds/list";
			});
		});
		
		function dataReset() {
			$("#RdisForm").each(function(){
				this.reset();
			});
		}
	
	</script>
	
	</head>
		<body>
			<div id="RdisContainer">
				<div id="RdisTDiv"><h1 id="RdisTitle">범위 할인 수정</h1></div>
			
				<div>
						<form name="RdisForm" id="RdisForm">
							<input type="hidden" name="rd_no" id="rd_no" value="${up.rd_no}" />
							
							<table id="RdisDetailTable" border="1">
								<caption class="Rcaption">상세 정보</caption>
								<tr>
									<td class="RD_td gray">번호</td>
								
									<td class="RD_tdInput">${up.rd_no}</td>
								</tr>
								
								<tr>
									<td class="RD_td gray">제목</td>
							
									<td class="RD_tdInput">
									<input type="text" id="rd_title" name="rd_title" maxlength="30" size="100" value="${up.rd_title}"/>
									 </td>
								</tr>

								<tr>
									<td class="RD_td gray">내용</td>
								
									<td class="RD_tdInput">
									<textarea id="rd_content" name="rd_content" rows="7" cols="130" maxlength="100" >${up.rd_content}</textarea>
									 </td>
								</tr>								
								
								<tr>
									<td class="RD_td gray">할인</td>
							
									<td class="RD_tdInput">
									<input type="number" value="${up.rd_discount}" id="rd_discount" name="rd_discount" />
										%
									</td>
								</tr>
								
								<tr>
									<td class="RD_td gray">만료일</td>
							
									<td class="RD_tdInput">
									<input type="date" id="rd_edate" name="rd_edate" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${up.rd_edate}" />"/>
									
									</td>								
								</tr>
								
							</table>
						
						<br />

						
								<div style="padding: 10px; margin-top: 50px; text-align: center;">
									<input type="button" value="수정" id="updateBtn" class="rdBtn" name="updateBtn" />
									<input type="button" value="목록" id="listBtn" class="rdBtn" name="listBtn" />
									<input type="button" value="취소" id="canBtn" class="rdBtn" name="canBtn" />
								</div>
						</form>
					</div>
			</div>
		</body>
</html>
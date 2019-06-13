<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />

<link rel="stylesheet" href="/resources/include/css/eventList.css" >
<script type="text/javascript"
	   src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/eventList.js"></script>
<script type="text/javascript" src="/resources/include/js/jquery.form.min.js"></script>

<style type="text/css">
	.RDcontainer{width: 80%; height: 70%;}
</style>

<script type="text/javascript">
	$(function() {
		
		// 단위 초기값 : %
		$("#inputV").html("%");

		// 단위 바꿀 시 클릭
		$("#disSelect").click(function() {	
			if($("#disSelect").val() == '할인율'){
				$("#inputV").html("%");
			}else if($("#disSelect").val() == '할인금액'){
				$("#inputV").html("원");
			}
		});
		
		// 저장 버튼 클릭시
		$("#insertFormBtn").click(function() {
			if(!chkSubmit($("#rd_title"), "할인 제목을")) return;
			else if(!chkSubmit($("#rd_content"), "할인 내용을")) return;
			else if(!chkNumber($("#rd_discount"), "할인가를")) return;
				if($("#disSelect").val() == '할인율') {
					if(!chkPercent($("#rd_discount"), "할인율은")) return;
				}
				if($("#disSelect").val() == '할인금액') {
					if(!chkKrw($("#rd_discount"), "할인금액은")) return;
				}
			else {
				insertData();
			} 
			console.log($("#rd_discount").val());
		});
		
		// 취소
		$("#RDCancelBtn").click(function() {
			$("#insertForm").each(function(){
				this.reset();
			});
		});
		
		// 목록
		$("#RDListBtn").click(function() {
			location.href="/admin/event/rds/list";
		});
	});
	
	// 저장 function
	function insertData(){
		$("#insertForm").attr({
			"method" : "post",
			"action" : "/admin/event/rds/insert"
		});
		
		$("#insertForm").submit();
	}
</script>

</head>
<body>
	<div class="RDcontainer">
		<div class="RD_header"><h2 id="RDconTitle">범위할인 등록</h2>		
		 <hr />
		 </div>

		<div id="insertDiv">		
			<form id="insertForm">
				<table id="insertTable">
					<caption class="Acaption">범위할인 정보</caption>
					
					<tr>
						<td class="RD_td gray">할인명</td>
						<td class="RD_tdInput"><input type="text" id="rd_title" name="rd_title" maxlength="30" size="100"/></td>	
					</tr>
					
					<tr>
						<td class="RD_td gray">할인 내용</td>
						<td class="RD_tdInput" style="padding: 0px;">
							<textarea id="rd_content" name="rd_content" rows="2" cols="130" maxlength="100">
							</textarea>
						</td>
					</tr>
					
					<tr>
						<td class="RD_td gray">할인가</td>
						<td class="RD_tdInput">
							<select id="disSelect" name="disSelect">
								<option value="할인율">할인율</option>
								<option value="할인금액">할인금액</option>
							</select>
							<input type="number" name="rd_discount" id="rd_discount" />
							<span id="inputV"></span>
						</td>
					<tr>
						<td class="RD_td gray">이벤트 종료일</td>
						<td class="RD_tdInput"><input type="date" id="rd_edate" name="rd_edate" /></td>
					</tr>
				</table>
				
				
				<table border="1" style="border-collapse: collapse; width: 400px; height: 100px;">
					<caption>범위대상</caption>
					<tr>
						<td>대분류</td>
					</tr>
					
					<tr>
						<td>
							<select style="width: 222px;">
								<option>대분류</option>
							</select>
						</td>
					</tr>
				</table>
							<div class="btns">			
								
								<input type="button" value="저장" id="insertFormBtn" /> 
								<input type="button" value="취소" id="RDCancelBtn"> 
								<input type="button" value="목록" id="RDListBtn">
							</div>
		
			</form>	
		</div>		
				
	</div>
	
</body>
</html>
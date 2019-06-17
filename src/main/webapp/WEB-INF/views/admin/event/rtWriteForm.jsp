<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>범위 할인 대상 등록</title>
	</head>

		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />
		
		<link rel="stylesheet" href="/resources/include/css/rdisList.css" >
		<script type="text/javascript"
			   src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/eventList.js"></script>
		<script type="text/javascript" src="/resources/include/js/jquery.form.min.js"></script>

		<script type="text/javascript" src="/resources/include/js/productCommon.js"></script>
		<script type="text/javascript" src="/resources/include/js/prodAdmin.js"></script>
		<script type="text/javascript" src="/resources/include/js/product.js"></script>
		<script type="text/javascript" src="/resources/include/js/prodctg.js"></script>

		<style type="text/css">
			/* .rTcontainer{
				margin-top: 50px;
			} */

		</style>
		
		
		<script type="text/javascript">
			$(function() {
				
				// 카테고리 정보 읽어오기
				  getProdCtgList(null, $("#ctgList"), $("#updateCategoryList")); // #updateCategoryList
				
				 var rd_no = $("tr").attr("data-num");
			
				$("#insertFormBtn").click(function() {
					
					
					// $("#ctgList").find(":selected").val()!=null || $("#ctgList").find(":selected").val()!='' 
					
					//var ss = $("input[id='ctgList']").prop("checked");
					
					var opV = $("#ctgList").find(":selected").html();
					
					console.log(opV);
					
					if(opV != '' ){
						//alert("입력함");
					
						 $("#rtForm").attr({
							"method" : "post",
							"action" : "/admin/event/rt/insert"
						});
						
						$("#rtForm").submit(); 
					}else {
						alert("선택해 주세요.");
					}
					
				});
				
				$("#RTListBtn").click(function() {
					location.href="/admin/event/rds/detail?rd_no="+rd_no;
				});
				
			});
		
		</script>
	<body>
		
			<div class="rTcontainer">
				<div id="header"><h2>범위할인 대상 등록</h2></div>
					<div>
	
					<div>
						<select>
							<c:forEach items="${de}" var="jo">
								  <option value="${jo.pct_no}">${jo.pct_name}입니다~~@@!!</option>
							</c:forEach>
						</select>
						
					</div>
					
					<form name="rtForm" id="rtForm">
						<input type="hidden" id="rd_no" name="rd_no" value="${data.rd_no}" />
						
						<table border="1" style="border-collapse: collapse; width: 80%; height: 100px;">
							<caption class="Rcaption" style="margin-top: 20px;">범위대상</caption>
						
							<tr data-num="${data.rd_no}">
								<td class="gray">범위 할인 번호</td>
								<td>${data.rd_no}</td>
							</tr>
							<tr>
								<td  class="gray">대분류</td>
							
								<td>
									<select name="pct_no" id="ctgList" style="width: 222px;  margin: 10px;" ></select>
								</td>
							</tr>
					
						</table>
				
						
						<div class="btns">			
										
										<input type="button" value="저장" id="insertFormBtn" /> 
										<input type="button" value="뒤로가기" id="RTListBtn" class="rdBtn" >
						</div>
					</form>
					</div>
			</div>
	</body>
</html>
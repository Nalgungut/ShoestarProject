<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
		<title>분류 관리</title>
		<link rel="stylesheet" href="/resources/include/css/product.css" />
		<link rel="stylesheet" href="/resources/include/css/prodAdmin.css" />
		<link rel="stylesheet" href="/resources/include/css/productDetail.css" />
		<script type="text/javascript" src="/resources/include/js/productCommon.js"></script>
		<script type="text/javascript" src="/resources/include/js/prodAdmin.js"></script>
		<script type="text/javascript" src="/resources/include/js/prodctgAdmin.js"></script>
		<script type="text/javascript" src="/resources/include/js/product.js"></script>
		<script type="text/javascript" src="/resources/include/js/prodctg.js"></script>
		
		<script type="text/javascript">
			$(function() {
				// 선택 된 항목 보여주기
				showSelectedPct();
				
				// 선택마다 항목 수정하기
				$("#ctgSelect").change(function() {
					showSelectedPct();
				});
				
				// 입력
				$("#insertCtg").click(function() {
					if(checkAll($("#ctgForm"))) {
						insertCtg($("#ctgForm"));
					}
				});
				
				// 수정
				$("#updateCtg").click(function() {
					if(confirm("카테고리 이름을 수정하시겠습니까?")) {
						if(checkAll($("#ctgForm"))) {
							updateCtg($("#ctgForm"));
						}
					}
				});
				
				// 삭제
				$("#deleteCtg").click(function() {
					if(confirm("카테고리를 삭제하시겠습니까?")) {
						if($("#ctgSelect").find(":selected").attr("data-count") >= 1) {
							alert("등록 된 상품이 존재하는 카테고리는 삭제 할 수 없습니다.");
						} else {
							deleteCtg($("#ctgForm"));
						}
					}
				});
				
				
			});
			
			function showSelectedPct() {
				$("#pct_name").val($("#ctgSelect").find(":selected").attr("data-pctname"));
			}
		</script>
	</head>
	<body>
		<!-- ######################### 타이틀 ######################### -->
		<div class="titleContainer">
			<h3>분류 관리</h3>
			<hr class="blackLine">
		</div>
		
		<!-- ######################### 카테고리 ######################### -->
		<h3 class="sectionTitle">카테고리</h3>
		<form id="ctgForm">
			<div class="ctgSection">
				<div class="ctgSelect col-md-4">
					<h4 class="articleTitle">카테고리 선택</h4>
					<select name="pct_no" class="form-control" data-live-search="true" id="ctgSelect">
						<c:forEach items="${ctglist}" var="ctg">
							<option value="${ctg.pct_no}" data-pctname="${ctg.pct_name}" data-count="${ctg.pd_count}">
								${ctg.pct_name} (${ctg.pd_count}개 상품)
							</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-md-8">
					<h4 class="articleTitle">카테고리 이름</h4>
					<div class="form-group">
						<input type="text" name="pct_name" id="pct_name" required="required" class="form-control">
					</div>
					<div class="form-group form-inline margin-top text-center">
						<button type="button" class="submenuActions" id="insertCtg">
							<span class="glyphicon glyphicon-plus"></span>
							항목 추가
						</button>
						<button type="button" class="submenuActions" id="deleteCtg">
							<span class="glyphicon glyphicon-minus"></span>
							선택 제거
						</button>
						<button type="button" class="submenuActions" id="updateCtg">
							<span class="glyphicon glyphicon-chevron-up"></span>
							선택 수정
						</button>
					</div>
				</div>
			</div>
		</form>
		<!-- ######################### 색상 ######################### -->
		<h3 class="sectionTitle">색상</h3>
			
		<div class="colorSection">
			
		</div>
	</body>
</html>
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
				
				/* ------------------- 카테고리 ------------------- */
				// 선택 된 항목 보여주기
				showSelectedPct();
				
				// 선택마다 항목 수정하기
				$("#ctgSelect").change(function() {
					showSelectedPct();
				});
				
				// 초기화
				$("#resetCtg").click(function() {
					$("#pct_name").val("");
				});
				
				// 입력
				$("#insertCtg").click(function() {
					if(checkAll($("#ctgForm"))) {
						if(confirm("카테고리를 추가하시겠습니까?")) {
							insertCtg($("#ctgForm"));
						}
					}
				});
				
				// 수정
				$("#updateCtg").click(function() {
					if(checkAll($("#ctgForm"))) {
						if(confirm("카테고리 이름을 수정하시겠습니까?")) {
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
				

				/* ------------------- 색상 ------------------- */
				// 선택 된 항목 보여주기
				showSelectedColor();
				
				// 색상 정보 미리보기
				showColorPreview();
				
				// 선택마다 항목 수정하기
				$("#colorSelect").change(function() {
					showSelectedColor();
				});

				// 초기화
				$("#resetColor").click(function() {
					$("#pcl_name").val("");
					$("#pcl_code").val("");
				});
				
				// 입력
				$("#insertColor").click(function() {
					if(checkAll($("#colorForm"))) {
						if(confirm("색상을 추가하시겠습니까?") && isColorCode()) {
							insertColor($("#pcl_name").val(), $("#pcl_code").val());
						}
					}
				});
				
				// 수정
				$("#updateColor").click(function() {
					if(checkAll($("#colorForm"))) {
						if(confirm("색상 정보를 수정하시겠습니까?") && isColorCode()) {
								updateColor($("#colorForm"));
						}
					}
				});
				
				// 삭제
				$("#deleteColor").click(function() {
					if(confirm("색상 정보를 삭제하시겠습니까?")) {
						deleteColor($("#colorForm"));
					}
				});
				
				// 색상변경
				$("#pcl_code").change(function() {
					showColorPreview();
				});
			});
			
			function showSelectedPct() {
				$("#pct_name").val($("#ctgSelect").find(":selected").attr("data-pctname"));
			}
			
			function showSelectedColor() {
				$("#pcl_name").val($("#colorSelect").find(":selected").attr("data-pclname"));
				$("#pcl_code").val($("#colorSelect").find(":selected").attr("data-pclcode"));
				showColorPreview();
			}
			
			function isColorCode(hideWarning) {
				var codeVal = $("#pcl_code").val();
				
				if(codeVal.match(/^[0-9a-f]{6}$/i)) {
					return true;
				} else {
					if(!hideWarning) {
						alert("색상 코드는 16진수 형식으로 6자를 입력해야 합니다.\n(예시: ff0000)");
					}
					return false;
				}
			}
			
			function showColorPreview() {
				if(isColorCode(true)) {
					$("#pcl_code").css({
						"border-right" : "50px solid #" + $("#pcl_code").val()
					});
				} else {
					$("#pcl_code").css({
						"border-right" : "none"
					});
				}
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
						<input type="text" name="pct_name" id="pct_name" required="required" class="form-control" maxlength="20">
					</div>
					<div class="form-group form-inline margin-top text-center">
						<button type="button" class="submenuActions" id="resetCtg">
							<span class="glyphicon glyphicon-repeat"></span>
							초기화
						</button>
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
		
		<form id="colorForm">
			<div class="colorSection">
				<div class="ctgSelect col-md-4">
					<h4 class="articleTitle">색상 선택</h4>
					<select name="pcl_no" class="form-control" data-live-search="true" id="colorSelect">
						<c:forEach items="${colorlist}" var="cl">
							<option value="${cl.pcl_no}" data-pclname="${cl.pcl_name}" data-pclcode="${cl.pcl_code}">
								${cl.pcl_name} (색상 코드 : #${cl.pcl_code})
							</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-md-8">
					<h4 class="articleTitle">색상 이름</h4>
					<div class="form-group">
						<input type="text" name="pcl_name" id="pcl_name" required="required" class="form-control" maxlength="20">
					</div>
					<h4 class="margin-top">색상 코드(RGB - #제외)</h4>
					<div class="form-group">
						<input type="text" name="pcl_code" id="pcl_code" required="required" class="form-control" maxlength="6">
					</div>
					<div class="form-group form-inline margin-top text-center">
						<button type="button" class="submenuActions" id="resetColor">
							<span class="glyphicon glyphicon-repeat"></span>
							초기화
						</button>
						<button type="button" class="submenuActions" id="insertColor">
							<span class="glyphicon glyphicon-plus"></span>
							색상 추가
						</button>
						<button type="button" class="submenuActions" id="deleteColor">
							<span class="glyphicon glyphicon-minus"></span>
							선택 제거
						</button>
						<button type="button" class="submenuActions" id="updateColor">
							<span class="glyphicon glyphicon-chevron-up"></span>
							선택 수정
						</button>
					</div>
				</div>
			</div>
		</form>
	</body>
</html>
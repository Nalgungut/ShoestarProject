<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<title>슈즈스타 - ${prod.pd_name}</title>
		
		<link rel="stylesheet" href="/resources/include/css/product.css" />
		<script type="text/javascript" src="/resources/include/js/productCommon.js"></script>
		<script type="text/javascript" src="/resources/include/js/product.js"></script>
		<script type="text/javascript">
			var pi_no = '${pins.pi_no}';
			var pd_no = '${prod.pd_no}';
			
			$(function() {
				getColorInfo();
				getImageList();
				getSizeList();
			});
			
			// 색상 정보 읽어오기
			function getColorInfo() {
				$("#colorList").html("");
				
				$.ajax({
					url : "/product/pinsList/" + pd_no,
					type : "get",
					dataType : "json",
					error : function() {
						$("#colorList").append(createErrorList("색상 정보를 불러오는데 실패했습니다."));
					},
					success : function(data) {
						if(!jQuery.isEmptyObject(data)) {
							$.each(data, function(index, stack) {
								$("#colorList").append(createPinsBox(stack, pi_no));
							});
						} else {
							$("#colorList").append(createErrorList("색상 정보가 비어있습니다."));
						}
					}
				});
			}
			
			// 이미지 정보 읽어오기
			function getImageList() {
				$("#thumbList").html("");
				
				$.ajax({
					url : "/product/imageList/" + pi_no,
					type : "get",
					dataType : "json",
					error : function() {
						$("#thumbList").append(createErrorList("이미지 정보를 불러오는데 실패했습니다."));
					},
					success : function(data) {
						if(!jQuery.isEmptyObject(data)) {
							$.each(data, function(index, stack) {
								
							});
						} else {
							$("#thumbList").append(createErrorList("이미지 정보를 불러오는데 실패했습니다."));
						}
					}
				});
			}
			
			// 사이즈 정보 읽어오기
			function getSizeList() {
				$("#pi_size").html("");
				
				$.ajax({
					url : "/product/psList/" + pi_no,
					type : "get",
					dataType : "json",
					error : function() {
						$("#pi_size").append(createErrorList("사이즈 정보를 불러오는 데 실패했습니다.", "option").prop("disabled", true));
					},
					success : function(data) {
						if(!jQuery.isEmptyObject(data)) {
							$.each(data, function(index, stack) {
								$("#pi_size").append(createSizeOption(stack));
							});
						} else {
							$("#pi_size").append(createErrorList("사이즈 정보가 비어있습니다.", "option").prop("disabled", true));
						}
					}
				});
			}
		</script>
	</head>
	
	<body>
		<!-- 상단 상품 영역 -->
		<div class="productSection">
			
			<!-- 이미지 섬네일 리스트 영역 -->
			<div class="thumbSection">
				<ul id="thumbList"></ul>
			</div>
			
			<!-- 큰 이미지 영역 -->
			<div class="imageSection">
				<img src="" class="productImageLarge" />
			</div>
			
			<!-- 상품 판매 정보 영역 -->
			<div class="salesSection">
				<!-- 상품평 -->
				<div class="ratingScore ratingScoreSmall"></div>
				
				<!-- 카테고리 -->
				<div class="productCategory">${prod.pct_name}</div>
				
				<!-- 상품명 -->
				<div class="productName"><strong>${prod.pd_name}</strong></div>
				
				<!-- 가격 -->
				<div class="priceSection">
					<span class="originalPrice">${prod.pd_price}</span> <!-- 원가 -->
					<span class="discountPrice"></span> <!-- 할인이 존재할 경우 적용 된 가격, 자바스크립트를 통해 입력 -->
					<span class="won">원</span>
				</div>
				
				<!-- 색상 선택 -->
				<div class="colorSection">
					<div class="colorInfo">${pins.pcl_name}</div>
					<ul id="colorList"></ul>
				</div>
				
				<hr class="blackLine">
				
				<!-- 상품 구매를 위한 색상/사이즈/수량 폼 -->
				<div class="purchaseSection">
					<form class="purchaseForm">
						
						
						<!-- 옵션 하부 선택 -->
						<div class="optionSection">
							<!-- 제품 번호 -->
							<input type="hidden" name="pd_no" value="${prod.pd_no}">
							<!-- 색상 번호 -->
							<input type="hidden" name="pcl_no" value="${param.color}">
							<!-- 사이즈 -->
							<select name="pi_size" id="pi_size" required="required">
							</select>
							<!-- 수량 -->
							<select name="pi_qty" id="pi_qty" required="required"></select>
						</div>
						
						<!-- 버튼 항목 -->
						<div class="submitSection">
							<!-- 바로 구매 -->
							<button type="button" id="purchaseNow" class="btn btn-primary">바로구매</button>
							<!-- 장바구니 -->
							<button type="button" id="cart" class="btn btn-default">장바구니</button>
						</div>
					</form>
				</div>
			</div>
			
		</div>
		<hr class="blackLine">
		
		<!-- 중단 상품 정보 영역 -->
		<div class="infoSection">
			<!-- 상품 정보 테이블 -->
			<table class="productInfoTable">
				<tr>
					<th>제품명</th>
					<td>${prod.pd_name}</td>
				</tr>
				<tr>
					<th>소재</th>
					<td>${prod.pd_fabric}</td>
				</tr>
				<tr>
					<th>제조국</th>
					<td>${prod.pd_country}</td>
				</tr>
				<tr>
					<th>제조연도</th>
					<td>${prod.pd_year}</td>
				</tr>
				<tr>
					<th>제조사</th>
					<td>${prod.pd_manu}</td>
				</tr>
				<tr>
					<th>수입자</th>
					<td>${prod.pd_import}</td>
				</tr>
			</table>
		</div>
		
		<hr class="blackLine">
		
		<!-- 하단 상품평/관련 상품 영역 -->
		<div class="extraSection">
			<!-- 상품평 -->
			<div class="ratingSection"></div>
			
			<!-- 관련 상품 -->
			<div class="relatedProductSection"></div>
		</div>
	</body>
</html>
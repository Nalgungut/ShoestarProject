<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<title>슈즈스타 - ${prod.pd_name}</title>
		
		<link rel="stylesheet" href="/resources/include/css/product.css" />
		<link rel="stylesheet" href="/resources/include/css/productDetail.css" />
		<script type="text/javascript" src="/resources/include/js/productCommon.js"></script>
		<script type="text/javascript" src="/resources/include/js/product.js"></script>
		<script type="text/javascript" src="/resources/include/js/orders.js"></script>
		<script type="text/javascript">
			var pi_no = '${pins.pi_no}';
			var pd_no = '${prod.pd_no}';
			var discountPrice = 0;
			
			$(function() {
				try {
					if('${prod.pd_discount != 0}' == 'true') {
						discountPrice = calculateDiscount('${prod.pd_price}', '${prod.pd_discount}');
						
						$("#originalPrice").addClass("prodPrice prodPrice_depricate");
						$("#discountPrice").text(discountPrice).addClass("prodPrice prodPrice_discount");
					} else {
						$("#originalPrice").addClass("prodPrice_normal");
					}
				} catch (e) {
				}
				
				getColorInfo($("#colorList"));
				getImageList($("#thumbList"));
				getSizeList($("#ps_size"));
				
				// 카트에 추가
				$("#toCart").click(function() {
					addToCart($("#purchaseForm"));
				});
				// 즉시 구매
				$("#purchaseNow").click(function() {
					checkStock($("#purchaseForm"), function() {
						alert("수량이 부족합니다.");
					}, null, function() {
						$("#purchaseForm").attr(purchaseForm()).submit();
					});
					
				});
				
				
				$("#cart_qty").change(function() {
					checkStock($("#purchaseForm"), function() {
						alert("수량이 부족합니다.");
					});
				});
			});
			
			// 색상 정보 읽어오기
			function getColorInfo(target) {
				target.html("");
				
				$.ajax({
					url : "/product/pinsList/" + pd_no,
					type : "get",
					dataType : "json",
					error : function() {
						target.append(createErrorList("색상 정보를 불러오는데 실패했습니다."));
					},
					success : function(data) {
						if(!jQuery.isEmptyObject(data)) {
							$.each(data, function(index, stack) {
								target.append(createPinsBox(stack, pi_no));
							});
							if(target.html() == "") {
								target.append(createErrorList("다른 색상이 없습니다."));
							}
						} else {
							target.append(createErrorList("색상 정보가 비어있습니다."));
						}
					}
				});
			}
			
			// 이미지 정보 읽어오기
			function getImageList(target) {
				target.html("");
				
				$.ajax({
					url : "/product/imageList/" + pi_no,
					type : "get",
					dataType : "json",
					error : function() {
						target.append(createErrorList("이미지 정보를 불러오는데 실패했습니다."));
					},
					success : function(data) {
						if(!jQuery.isEmptyObject(data)) {
							$.each(data, function(index, stack) {
								target.append(createImageBox(stack, $("#productImageLarge")));
							});
						} else {
							target.append(createErrorList("이미지 정보가 없습니다."));
						}
					}
				});
			}
			
			// 사이즈 정보 읽어오기
			function getSizeList(target) {
				target.html("");
				
				$.ajax({
					url : "/product/psList/" + pi_no,
					type : "get",
					dataType : "json",
					error : function() {
						target.append(createErrorList("사이즈 정보를 불러오는 데 실패했습니다.", "option").prop("disabled", true));
					},
					success : function(data) {
						if(!jQuery.isEmptyObject(data)) {
							$.each(data, function(index, stack) {
								target.append(createSizeOption(stack));
							});
						} else {
							target.append(createErrorList("사이즈 정보가 비어있습니다.", "option").prop("disabled", true));
						}
					}
				});
			}
			
			function addToCart(target) {
				$.ajax({
					url : "/orders/addCart",
					type : "post",
					data : target.serialize(),
					dataType : "text",
					error : function(xhr, status, except) {
						if(xhr.status == 400 || xhr.status == 500) {
							if(confirm("로그인이 필요한 작업입니다.\n로그인 하시겠습니까?")) {
								location.href = "/member/login";
							}
						} else {
							alert("서버 오류로 장바구니에 상품을 추가할 수 없었습니다.");
						}
					},
					success : function(result) {
						if(result == "duplicate") {
							if(confirm("이미 장바구니에 추가 된 상품입니다.\n장바구니 페이지로 이동하시겠습니까?")) {
								location.href = "/orders/cart";
							}
						} else if(result == "success") {
							if(confirm("성공적으로 장바구니에 추가되었습니다.\n장바구니 페이지로 이동하시겠습니까?")) {
								location.href = "/orders/cart";
							}
						} else if(result == "outofstock") {
							alert("상품 재고가 부족합니다.");
						} else {
							alert("상품을 장바구니에 추가할 수 없었습니다.");
						}
					}
				});
			}
		</script>
	</head>
	
	<body>
		<!-- 상단 상품 영역 -->
		<div class="productSection row">
			
			<!-- 이미지 섬네일 리스트 영역 -->
			<div class="detailThumbSection col-md-1">
				<ul id="thumbList"></ul>
			</div>
			
			<!-- 큰 이미지 영역 -->
			<div class="detailImageSection">
				<img src="" id="productImageLarge" class="col-md-8"/>
			</div>
			
			<!-- 상품 판매 정보 영역 -->
			<div class="detailSalesSection col-md-3">
				<!-- 상품평 -->
				<div class="ratingScore ratingScoreSmall"></div>
				
				<!-- 카테고리 -->
				<div class="productCategory">${prod.pct_name}</div>
				
				<!-- 상품명 -->
				<div class="productName"><strong>${prod.pd_name}</strong></div>
				
				<!-- 색상명 -->
				<div class="colorInfo text-right">${pins.pcl_name}</div>
				
				<!-- 가격 -->
				<div class="detailPriceSection text-right">
					<span id="originalPrice">${prod.pd_price}</span> <!-- 원가 -->
					<span id="discountPrice"></span><!-- 할인이 존재할 경우 적용 된 가격, 자바스크립트를 통해 입력 -->
					<span class="won">원</span>
				</div>
				
				<!-- 색상 선택 -->
				<div class="detailColorSection">
					다른 색상 선택
					<ul id="colorList"></ul>
				</div>
				
				<hr class="blackLine">
				
				<!-- 상품 구매를 위한 색상/사이즈/수량 폼 -->
				<div class="detailPurchaseSection">
					<form id="purchaseForm" class="purchaseForm form-horizontal col-md-12">
						<div class="form-group">
							<!-- 제품 번호 -->
							<input type="hidden" name="pi_no" value="${pins.pi_no}" class="form-control">
						</div>
						<!-- 사이즈 -->
						<div class="form-group">
							<label for="ps_size">사이즈</label>
							<select name="ps_size" id="ps_size" required="required" class="form-control input-lg">
							</select>
							<!-- 수량 -->
							<label for="cart_qty">수량</label>
							<select name="cart_qty" id="cart_qty" required="required" class="form-control input-lg">
								<c:forEach begin="1" end="5" var="i">
									<option value="${i}">${i}</option>
								</c:forEach>
							</select>
						</div>
						
						<!-- 버튼 항목 -->
						<div class="detailSubmitSection form-group">
							<!-- 바로 구매 -->
							<button type="button" id="purchaseNow"
								class="btn btn-block">바로구매</button>
							<!-- 장바구니 -->
							<button type="button" id="toCart"
								class="btn btn-default btn-block">장바구니</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		
		
		<!-- 아랫단 -->
		<div class="detailInfoSection">
			<!-- 여백잡기용 -->
			<div class="col-md-1"></div>
			<div class="col-md-8">
				
				<hr class="blackLine">
				
				<!-- 상품 정보 테이블 -->
				<div class="detailInfoSection">
					<table class="productInfoTable table">
						<colgroup>
							<col width="25%">
							<col width="75%">
						</colgroup>
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
				<div class="detailExtraSection">
					<!-- 상품평 -->
					<div class="detailRatingSection"></div>
					
					<!-- 관련 상품 -->
					<div class="detailRelatedProductSection"></div>
				</div>
			</div>
			<div class="col-md-3"></div>
		</div>
		
		
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<title>장바구니</title>
		<link rel="stylesheet" href="/resources/include/css/orders.css" />
		<script type="text/javascript" src="/resources/include/js/productCommon.js"></script>
		<script type="text/javascript" src="/resources/include/js/orders.js"></script>
		<script type="text/javascript">
			$(function() {
				// 상품 가격 계산 폼
				calculatePriceTotal();
				
				// 수량 변경 시, 체크박스 변경 시 다시 계산
				$(".itemQty, .itemSelect").on("change", function() {
					calculatePriceTotal(checkBoxSelected());
				});
				
				// TODO: 구매 기능
				
				// 선택 구매 버튼
				$("#purchaseSelected").click(function() {
					alert(itemsIntoJson(true));
				});
				
				// 전체 구매 버튼
				$("#purchaseAll").click(function() {
					alert(itemsIntoJson(false));
				});
				
				// 항목 삭제 버튼
				$(".deleteCartItem").click(function() {
					var i_pi_no = $(this).closest("tr.itemRecord").attr("data-pino");
					var i_ps_size = $(this).closest("tr.itemRecord").attr("data-size");
					var dataJson = [{"pi_no":i_pi_no,"ps_size":i_ps_size}];
					var cartAjaxJson = removeFromCartAjax(dataJson);
					
					cartAjaxJson["success"] = function(data) {
						if(data >= 1) {
							location.reload();
						} else {
							alert("카트 상품 정보를 삭제할 수 없었습니다.");
						}
					}
					
					$.ajax(cartAjaxJson);
				});
			});
			
			// 선택 된 체크박스가 있는지 확인하는 함수
			function checkBoxSelected() {
				return $(".orderTable .itemSelect:checked").length;
			}
			
			// 물품 가격 계산하는 함수
			function calculatePriceTotal(onlySelected) {
				var priceTotal = 0;
				
				$(".orderTable > tbody > tr").each(function() {
					if(onlySelected && !$(this).find("input.itemSelect").prop("checked")) {
						return;
					};
					
					var priceSection = $(this).find(".priceSection");
					
					var originalPrice = parseInt(priceSection.attr("data-original"));
					var dcrate = parseInt(priceSection.attr("data-dcrate"));
					var finalPrice = calculateDiscount(originalPrice, dcrate);
					priceSection.attr("data-finalPrice", finalPrice);
					
					var qtySelected = parseInt($(this).find("select.itemQty").val());
					
					if(finalPrice < originalPrice) {
						priceSection.siblings(".beforeDiscount").text(originalPrice * qtySelected).css("margin-right","10px");
					}
					
					var priceTotalEach = finalPrice * qtySelected;
					priceSection.text(priceTotalEach);
					priceTotal += priceTotalEach;
				});
				
				$("#totalPrice").text(priceTotal + "원");
			}
			
			
			// 물품들을 결제 폼으로 넘길 json의 array 형태로 만드는 함수
			function itemsIntoJson(onlySelected) {
				var resultData = [];
				
				$(".orderTable > tbody > tr").each(function() {
					if(onlySelected && !$(this).find("input.itemSelect").prop("checked")) {
						return;
					};
					
					var i_pi_no = $(this).attr("data-pino");
					var i_ps_size = $(this).attr("data-size");
					var i_oi_qty = $(this).find("select.itemQty").val();
					
					var singleData = {"pi_no":i_pi_no,"ps_size":i_ps_size,"oi_qty":i_oi_qty};
					resultData.push(singleData);
				});
				
				return resultData;
			}
		</script>
	</head>
	
	<body>
		<div class="titleSection">
			<h3 class="pageTitle">장바구니 목록</h3>
			<hr class="blackline">
		</div>
		
		<div class="cartItemSection">
			<form id="sendPurchaseForm"><table class="orderTable table table-hover">
				
				<!-- 사이즈 조절 -->
					<colgroup>
						<col width="5%">
						<col width="10%">
						<col width="10%">
						<col width="25%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
					</colgroup>
				
				<!-- 항목 이름 -->
				<thead>
					<tr>
						<th></th>
						<th>상품 번호</th>
						<th>이미지</th>
						<th>상품 이름</th>
						<th>색상</th>
						<th>사이즈</th>
						<th>수량</th>
						<th>가격</th>
						<th></th>
					</tr>
				</thead>
				
				<!-- 항목 아이템 -->
				<tbody><c:choose><c:when test="${not empty cartlist}"><c:forEach items="${cartlist}" var="stack">
					<tr data-pino="${stack.pi_no}" data-size="${stack.ps_size}" class="itemRecord">
						<td><input type="checkbox" name="itemSelect" class="itemSelect"></td>
						<td>${stack.pi_no}</td>
						<td><c:choose>
							<c:when test="${not empty stack.mainImage}">
								<img src="/shoestarStorage/prod/thumb/${stack.mainImage}" class="mainImage">
							</c:when>
							<c:otherwise>
								<img src="/resources/images/product/noimage.png" class="mainImage">
							</c:otherwise>
						</c:choose></td>
						<td><a href="/product/prod?pi_no=${stack.pi_no}">${stack.pd_name}</a></td>
						<td>${stack.pcl_name}</td>
						<td>${stack.ps_size}</td>
						<td class="form-inline"><select data-qty="${stack.cart_qty}" class="form-control itemQty">
							<c:forEach begin="1" end="5" var="qtyNo">
								<c:choose>
									<c:when test="${qtyNo == stack.cart_qty}">
										<option selected="selected">${qtyNo}</option>
									</c:when>
									<c:otherwise>
										<option>${qtyNo}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select></td>
						<td class="priceColumn">
							<em class="beforeDiscount"></em><br>
							<strong class="priceSection"
								data-original="${stack.pd_price}"
								data-dcrate="${stack.pd_discount}"></strong>
						</td>
						<td>
							<button type="button" class="deleteCartItem"
								data-pino="${stack.pi_no}" data-pssize="${stack.ps_size}">
								<span class="glyphicon glyphicon-remove"></span></button>
						</td>
					</tr>
				</c:forEach></c:when>
				<c:otherwise>
					<tr>
						<td colspan="9" class="emptylist text-center">장바구니에 담긴 상품이 없습니다.</td>
					</tr>
				</c:otherwise>
				</c:choose></tbody>
				
				<!-- 종합란 -->
				<tfoot>
					<tr>
						<td colspan="6"></td>
						<td class="totalPriceLabel text-right">총액:</td>
						<td colspan="2" id="totalPrice" class="totalPrice"></td>
					</tr>
					<tr>
						<td colspan="9" class="submitArea text-right">
							<button type="button" id="purchaseSelected" class="btn btn-default btn-lg">선택 구매</button>
							<button type="button" id="purchaseAll" class="btn btn-default btn-lg">전체 구매</button>
						</td>
					</tr>
				</tfoot>
			</table></form>
		</div>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="orgPriceTotal" value="0" />
<c:set var="priceTotal" value="0" />

<!DOCTYPE html>
<html>
	<head>
		<title>결제 페이지</title>
		<link rel="stylesheet" href="/resources/include/css/orders.css" />
		<script type="text/javascript" src="/resources/include/js/productCommon.js"></script>
		<script type="text/javascript" src="/resources/include/js/orders.js"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script type="text/javascript">
		
		$(function() {
			// 주소 초기화
			resetAddr();
			
			// 주소 변경 버튼 기능
			$(".addrChange").on("change", function() {
				resetAddr();
			});
			
			// 상품 목록 없을 시 버튼 제어
			var itemListSize = "${fn:length(itemlist)}";
			if(!itemListSize) {
				$("#proceedPurchase").prop("disabled", true);
				alert("구매 가능한 상품이 없습니다.");
				location.href = "/orders/cart";
			}
			
			// 결제하기 버튼
			$("#proceedPurchase").click(function() {
				if(checkPurchaseData()) {
					submitPurchase();
				}
			});
		});
		
		function checkPurchaseData() {
			if(!$("#purchaseAgree").prop("checked")) {
				alert("주문 사항에 동의해야합니다.");
				$("#purchaseAgree").focus();
				return false;
			}
			
			if($("#postal").val().isEmpty()) {
				alert("주소 정보를 입력해주세요.");
				$("#searchAddr").focus();
				return false;
			}
			
			return true;
		}
		
		function submitPurchase() {
			$.ajax({
				url :"/orders/process",
				type : "post",
				data : $("#purchaseForm").serialize() + "&"
					+ $("#addrForm").serialize() + "&" + $("#transactionForm").serialize(),
				dataType : "text",
				error : function(xhr) {
					if(askForLogin(xhr)) {
						alert("서버 오류로 결제를 진행할 수 없었습니다.");
					}
				},
				success : function(result) {
					if(result == "true") {
						alert("성공적으로 결제되었습니다.");
						location.href = "/myPage/orders";
					} else {
						alert("결제 과정에서 오류가 발생했습니다.");
					}
				}
			});
		}
		
		// 주소 초기화 작업
		function resetAddr() {
			var addrForm = $("#addrForm");
			
			if($("#addrSaved").prop("checked")) {
				addrForm[0].reset();
				$("#searchAddr").prop("disabled", true);
			} else {
				$.each(addrForm.find("input"), function(index, formControl) {
					$(this).val("");
				})
				$("#searchAddr").prop("disabled", false);
			}
		}
		
		// 주소 받아오는 함수
		function sample4_execDaumPostcode() {
			new daum.Postcode({
				oncomplete: function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
					
					// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var roadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ""; // 참고 항목 변수
					
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if(data.bname !== "" && /[동|로|가]$/g.test(data.bname)){
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if(data.buildingName !== "" && data.apartment === "Y"){
						extraRoadAddr += (extraRoadAddr !== "" ? ", " + data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if(extraRoadAddr !== ""){
						extraRoadAddr = " (" + extraRoadAddr + ")";
					}
					
					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					$("#postal").val(data.zonecode);
					$("#addr1").val(roadAddr);
					
					// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
					if(roadAddr !== ""){
						$("#extraAddr").val(extraRoadAddr);
					} else {
						$("#extraAddr").val("");
					}
				}
			}).open();
		}
		</script>
	</head>
	
	<body>
		<div class="titleSection">
			<h3 class="pageTitle">결제 확인</h3>
			<hr class="blackline">
		</div>
		
		<div class="purchaseContainer">
			<div class="itemSection col-md-9">
				<form id="purchaseForm">
					<h4>상품 내역</h4>
					<table class="orderTable table table-striped">
					<!-- 사이즈 조절 -->
					<colgroup>
						<col width="10%">
						<col width="10%">
						<col width="30%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
					</colgroup>
					
					<!-- 항목 이름 -->
					<thead>
						<tr>
							<th>상품 번호</th>
							<th>이미지</th>
							<th>상품 이름</th>
							<th>색상</th>
							<th>사이즈</th>
							<th>수량</th>
							<th>할인가</th>
							<th>가격</th>
						</tr>
					</thead>
					
					<!-- 항목 아이템 -->
					<c:set var="itemIndex" value="${0}"/>
					<tbody><c:choose><c:when test="${not empty itemlist}"><c:forEach items="${itemlist}" var="stack">
						<tr data-pino="${stack.pi_no}" data-size="${stack.ps_size}" class="itemRecord">
							<td>${stack.pi_no}</td>
							<td><c:choose>
								<c:when test="${not empty stack.mainImage}">
									<img src="/shoestarStorage/prod/thumb/${stack.mainImage}" class="xsImage">
								</c:when>
								<c:otherwise>
									<img src="/resources/images/product/noimage.png" class="xsImage">
								</c:otherwise>
							</c:choose></td>
							<td>${stack.pd_name}</td>
							<td>${stack.pcl_name}</td>
							<td>${stack.ps_size}</td>
							<td>${stack.oi_qty}</td>
							<td class="gray">-
								${stack.oi_org_price > stack.oi_price ? (stack.oi_org_price - stack.oi_price) * stack.oi_qty : ""}
							</td>
							<td>${stack.oi_price * stack.oi_qty}</td>
							<td>
								<c:set var="orgPriceEach" value="${stack.oi_org_price * stack.oi_qty}"/>
								<c:set var="priceEach" value="${stack.oi_price * stack.oi_qty}"/>
								
								<input type="hidden" name="ordersInsList[${itemIndex}].pi_no" value="${stack.pi_no}">
								<input type="hidden" name="ordersInsList[${itemIndex}].oi_qty" value="${stack.oi_qty}">
								<input type="hidden" name="ordersInsList[${itemIndex}].ps_size" value="${stack.ps_size}">
								<input type="hidden" name="ordersInsList[${itemIndex}].pi_no" value="${orgPriceEach}">
								<input type="hidden" name="ordersInsList[${itemIndex}].pi_no" value="${priceEach}">
								<c:set var="itemIndex" value="${itemIndex + 1}"/>
								
								<c:set var="orgPriceTotal" value="${orgPriceTotal + orgPriceEach}"/>
								<c:set var="priceTotal" value="${priceTotal + priceEach}"/>
							</td>
						</tr>
					</c:forEach></c:when>
					<c:otherwise>
						<tr>
							<td colspan="8" class="emptylist text-center"></td>
						</tr>
					</c:otherwise>
					</c:choose></tbody>
					
					<!-- 제외 된 아이템 -->
					<tfoot><c:if test="${not empty errorlist}">
						<tr><td class="emptycell" colspan="8">&nbsp;</tr>
						<tr class="danger">
							<th class="errorTitle" colspan="8"><h4>제외된 상품(재고 부족)</h4></th>
						</tr>
						
						<c:forEach items="${errorlist}" var="stack">
						<tr data-pino="${stack.pi_no}" data-size="${stack.ps_size}" class="itemRecord">
							<td>${stack.pi_no}</td>
							<td><c:choose>
								<c:when test="${not empty stack.mainImage}">
									<img src="/shoestarStorage/prod/thumb/${stack.mainImage}" class="xsImage">
								</c:when>
								<c:otherwise>
									<img src="/resources/images/product/noimage.png" class="xsImage">
								</c:otherwise>
							</c:choose></td>
							<td>${stack.pd_name}</td>
							<td>${stack.pcl_name}</td>
							<td>${stack.ps_size}</td>
							<td></td>
							<td>${stack.oi_org_price > stack.oi_price ? stack.oi_org_price - stack.oi_price : ""}</td>
							<td>${stack.oi_price}</td>
						</tr>
					</c:forEach>
					</c:if></tfoot>
				</table></form>
				
				<hr>
				
				<!-- 기타 정보 표시란 -->
				<div class="addrSection">
					<h4>배송지 입력</h4>
					<div class="col-md-12">
						<label class="col-md-2 control-label">주소 선택</label>
						<div class="form-group col-md-10">
							<input type="radio" id="addrSaved" class="addrChange" name="addrSel_not_for_submit" checked="checked">
							<label for="addrSaved" class="font-weight-normal">기존 배송지</label>
							<input type="radio" id="addrNew" class="addrChange" name="addrSel_not_for_submit">
							<label for="addrNew" class="font-weight-normal">신규 배송지</label>
						</div>
						<form id="addrForm">
						<label class="col-md-2 control-label" for="postal">우편번호</label>
						<div class="form-group col-md-10 form-inline">
							<input type="text" class="form-control" id="postal" readonly="readonly"
								name="postal" value="${addr.mem_zip}">
							<button type="button" class="btn btn-default" id="searchAddr"
								onclick="sample4_execDaumPostcode()">주소 찾기</button><br>
						</div>
						<label class="col-md-2 control-label" for="addr1">주소</label>
						<div class="form-group col-md-10">
							<input type="text" class="form-control" id="addr1" name="addr1"
								readonly="readonly" value="${addr.mem_addr1}">
						</div>
						<label class="col-md-2 control-label" for="addr2">상세 주소</label>
						<div class="form-group col-md-10">
							<input type="text" class="form-control" id="addr2" name="addr2"
								placeholder="상세주소" required="required" value="${addr.mem_addr3}">
						</div>
						<input type="hidden" class="form-control" id="extraAddr">
						</form>
						<span id="guide" style="color:darkred; display:none"></span>
					</div>
				</div>
				
				<hr>
				
				<div class="transactionSection">
					<h4>결제 수단 선택</h4>
					<form id="transactionForm">
						<label class="control-label col-md-2">선택</label>
						<div class="form-group col-md-10 radio">
							<label>
								<input type="radio" name="transType" value="credit" id="trans_credit" checked="checked">
								신용카드
							</label>
							<label>
								<input type="radio" name="transType" value="banking" id="trans_banking">
								무통장 입금
							</label>
							<label>
								<input type="radio" name="transType" value="mobile" id="trans_mobile">
								휴대폰 결제
							</label>
						</div>
					</form>
				</div>
			</div>
			
			<div class="purchaseSection col-md-3">
				<h4>결제 금액</h4>
				<table class="table table-condensed">
					<tr>
						<th>총 상품 수</th>
						<td class="text-right">${fn:length(itemlist)}개</td>
					</tr>
					<tr>
						<th>총 금액</th>
						<td class="text-right">${orgPriceTotal}원</td>
					</tr>
					<tr>
						<th>할인 금액</th>
						<td class="text-right discount">-${orgPriceTotal - priceTotal}원</td>
					</tr>
				</table>
				
				<div class="col-sm-12 finalPrice">
					<strong class="finalTitle">최종 금액</strong>
					<span class="priceTotal">${priceTotal}원</span>
				</div>
				
				<hr>
				
				<div class="buttonSection">
					<div class="agreementSection col-sm-12">
						<div class="agreementInfo text-center">
							<strong>주문 동의 | </strong>
							주문할 상품의 상품명, 가격, 배송정보에 동의하십니까?
						</div>
						<div class="buttonSection text-center">
							<label>
								<input type="checkbox" id="purchaseAgree">
								동의합니다
								<span class="gray">(전자상거래법 제8조 2항)</span>
							</label>
						</div>
					</div>
					<button type="button" class="btn btn-primary btn-block" id="proceedPurchase">결제하기</button>
					<a class="btn btn-default btn-block" id="backToCart" href="/orders/cart">장바구니</a>
				</div>
			</div>
		</div>
		
		<div class="hiddenSubmitSection" hidden="hidden">
			<form id="hiddenForm">
				<ul id="hiddenList"></ul>
			</form>
		</div>
	</body>
</html>
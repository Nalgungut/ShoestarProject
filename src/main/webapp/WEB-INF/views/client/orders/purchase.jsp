<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<title>결제 페이지</title>
	</head>
	
	<body>
		<div class="titleSection">
			<h3 class="pageTitle">결제</h3>
			<hr class="blackline">
		</div>
		
		<div class="itemSection">
			<form id="purchaseForm"><table class="orderTable table table-hover">
				
				<!-- 사이즈 조절 -->
					<colgroup>
						<col width="10%">
						<col width="10%">
						<col width="25%">
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
						<th>가격</th>
					</tr>
				</thead>
				
				<!-- 항목 아이템 -->
				<tbody><c:choose><c:when test="${not empty itemlist}"><c:forEach items="${itemlist}" var="stack">
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
					</tr>
				</c:forEach></c:when>
				<c:otherwise>
					<tr>
						<td colspan="7" class="emptylist text-center"></td>
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
		
		<div class="hiddenSubmitSection" hidden="hidden">
			<form id="hiddenForm">
				<ul id="hiddenList"></ul>
			</form>
		</div>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<title>장바구니</title>
		<link rel="stylesheet" href="/resources/include/css/prodctg.css" />
		<link rel="stylesheet" href="/resources/include/css/product.css" />
		<script type="text/javascript" src="/resources/include/js/productCommon.js"></script>
		<script type="text/javascript" src="/resources/include/js/product.js"></script>
		<script type="text/javascript" src="/resources/include/js/prodctg.js"></script>
		<script type="text/javascript">
			
		</script>
	</head>
	
	<body>
		<div class="titleSection">
			<h3 class="pageTitle">장바구니 목록</h3>
			<hr class="blackline">
		</div>
		
		<div class="cartItemSection">
			<table class="cartTable table">
					<colgroup>
						<col width="10%">
						<col width="25%">
						<col width="25%">
						<col width="15%">
						<col width="10%">
						<col width="15%">
					</colgroup>
				<thead>
					<tr>
						<th>상품 번호</th>
						<th>상품 이미지</th>
						<th>상품 이름</th>
						<th>상품 색상</th>
						<th>상품 사이즈</th>
						<th>상품 수량</th>
					</tr>
				</thead>
				<tbody><c:if test="${not empty cartlist}"><c:forEach items="${cartlist}" var="stack">
					<tr>
						<td>${stack.pi_no}</td>
						<td><c:choose>
							<c:when test="${not empty stack.mainImage}">
								<img src="/shoestarStorage/prod/thumb/${stack.mainImage}" class="mainImage">
							</c:when>
							<c:otherwise>
								<img src="/resources/images/product/noimage.png" class="mainImage">
							</c:otherwise>
						</c:choose></td>
						<td>${stack.pd_name}</td>
						<td>${stack.pcl_name}</td>
						<td>${stack.ps_size}</td>
						<td>${stack.cart_qty}</td>
					</tr>
				</c:forEach></c:if></tbody>
			</table>
		</div>
	</body>
</html>
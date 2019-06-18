<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<title>주문 상세보기</title>
		<link rel="stylesheet" href="/resources/include/css/product.css" />
		<link rel="stylesheet" href="/resources/include/css/prodAdmin.css" />
		<link rel="stylesheet" href="/resources/include/css/productDetail.css" />
		<script type="text/javascript" src="/resources/include/js/jquery.form.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/productCommon.js"></script>
		<script type="text/javascript" src="/resources/include/js/prodAdmin.js"></script>
		<script type="text/javascript" src="/resources/include/js/product.js"></script>
		<script type="text/javascript" src="/resources/include/js/prodctg.js"></script>
	</head>
	
	<body>
		<!-- ######################### 타이틀 ######################### -->
		<div class="titleContainer">
			<h3>상품 정보</h3>
			<hr class="blackLine">
		</div>
		
		<!-- ######################### 주문 정보 ######################### -->
		<h4 class="sectionTitle">주문 정보</h4>
		
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>주문일자</th>
					<th>주문번호</th>
					<th>주문자</th>
					<th>구매종류 수</th>
					<th>총 구매금액</th>
					<th>총 실결제금액</th>
					<th>주문상태</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><fmt:formatDate value="${detail.od_date}" pattern="yyyy-MM-dd"/></td>
					<td>${detail.od_no}</td>
					<td>${detail.mem_name}</td>
					<td>${detail.numberOfProds}개 상품</td>
					<td><fmt:formatNumber value="${detail.totalPriceOrg}" pattern="#,###"/></td>
					<td><fmt:formatNumber value="${detail.totalPrice}" pattern="#,###"/></td>
					<td><c:choose>
						<c:when test='${empty stack.od_prog}'>-</c:when>
						<c:otherwise><span class="statusWarning">${detail.od_prog}</span></c:otherwise>
					</c:choose></td>
				</tr>
			</tbody>
		</table>
		
		<hr class="blackLine">
		
		<!-- ######################### 상품 정보 ######################### -->
		<h4 class="sectionTitle">주문 상품</h4>
		
		<table class="table table-striped">
			<thead>
				<tr>
					<th>상품 번호</th>
					<th>개별 번호</th>
					<th>이름</th>
					<th>색상</th>
					<th>사이즈</th>
					<th>분류</th>
					<th>가격</th>
					<th>실지불액</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty oilist}"><c:forEach items="${oilist}" var="stack">
						<tr>
							<td>${stack.pd_no}</td>
							<td>${stack.pi_no}</td>
							<td>${stack.pd_name}</td>
							<td>${stack.pcl_name}</td>
							<td>${stack.ps_size}</td>
							<td>${stack.pct_name}</td>
							<td>${stack.oi_org_price}</td>
							<td>${stack.oi_price}</td>
						</tr>
					</c:forEach></c:when>
					<c:otherwise>
						<tr>
							<td class="emptyList" colspan="8">구매 목록이 비어있습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<div class="text-right margin-top">
			<button class="btn btn-default" type="button" onclick="history.back()">뒤로</button>
		</div>
	</body>
</html>
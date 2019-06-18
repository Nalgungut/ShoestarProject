<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<title>주문 목록</title>
		<link rel="stylesheet" href="/resources/include/css/prodAdmin.css" />
		<script type="text/javascript" src="/resources/include/js/productCommon.js"></script>
		<script type="text/javascript" src="/resources/include/js/prodAdmin.js"></script>
		<script type="text/javascript" src="/resources/include/js/product.js"></script>
		<script type="text/javascript" src="/resources/include/js/prodctg.js"></script>
		
		<style type="text/css">
			.productRecord {
				cursor: pointer;
			}
		</style>
		<script type="text/javascript">
			$(function() {
				// 항목별 상세 페이지 링크
				$(".productRecord").on("click", function() {
					location.href = "/admin/orders/detail/" + $(this).attr("data-odno");
				});
				
				// 검색 버튼 설정
				$("#btnSearch").on("click", function() {
					submitSearch();
				});
				
				// 페이지네이션 버튼 제어
				$(".paginate_button a").click(function(event) {
					event.preventDefault();
					var pageReq = window.location.search.replace(/&?pageNum=\d/, "");
					pageReq = pageReq + "&pageNum=" + $(this).attr("href");
					location.href = "/admin/orders/list?" + pageReq;
				});
				
				// 날짜 버튼 제어
				$("a.dateRange").click(function(event) {
					event.preventDefault();
					updateDateBegin($(this));
				});
			});
			
			// 검색 적용
			function submitSearch() {
				var searchRequest = $("#searchForm").serialize();
				var allowThese = ["od_prog", "dateBegin", "dateEnd"];
				
				if(!$("#keyword").val().isEmpty()) {
					allowThese.push("search", "keyword");
				}
				
				searchRequest = splitRequest(searchRequest, allowThese);
				location.href = "/admin/orders/list?" + searchRequest;
			}
			
			function updateDateBegin(target) {
				$("#dateRangeGroup").children("a.dateRange").not(target).removeClass("btn-primary").addClass("btn-default");
				$("#dateBegin").val(target.prop("href")).removeClass("btn-default").addClass("btn-primary");
			}
		</script>
	</head>
	
	<body>
		<div class="titleContainer">
			<h3>주문 목록</h3>
			<hr class="blackLine">
		</div>
		<!-- 검색란 -->
		<div class="searchBox">
			<form id="searchForm">
				<table class="table searchTable">
					<colgroup>
						<col width="10%">
						<col width="90%">
					</colgroup>
					
					<thead>
						<tr>
							<th>검색어</th>
							<td class="form-inline">
								<select name="search" id="search" class="form-control">
									<option value="od_no" selected="selected">주문번호</option>
									<option value="pd_name">상품명</option>
									<option value="pd_no">상품번호</option>
									<option value="mem_name">회원명</option>
									<option value="mem_no">회원번호</option>
								</select>
								<input type="text" name="keyword" id="keyword" class="form-control" autocomplete="off">
							</td>
						</tr>
						<tr>
							<th>기간</th>
							<td class="form-inline">
								<div id="dateRangeGroup" class="btn-group" role="group" >
									<a class="dateRange btn btn-default" href="${dtft.year}">1년</a>
									<a class="dateRange btn btn-default" href="${dtft.month}">1달</a>
									<a class="dateRange btn btn-default" href="${dtft.week}">7일</a>
									<a class="dateRange btn btn-default" href="${dtft.day}">1일</a>
								</div>
								<input type="date" name="dateBegin" id="dateBegin" class="form-control" value="${dtft.week}" min="2000-01-01" max="${dtft.today}">
								&nbsp;~&nbsp;
								<input type="date" name="dateEnd" id="dateEnd" class="form-control" value="${dtft.today}" min="2000-01-01" max="${dtft.today}">
							</td>
						</tr>
						<tr>
							<th>상태</th>
							<td>
								<input type="radio" name="od_prog" value="all" id="stall"><label for="stall">전체</label>
								<input type="radio" name="od_prog" value="ok" id="stok"><label for="stok">정상</label>
								<input type="radio" name="od_prog" value="other" id="stde"><label for="stde">취소</label>
							</td>
						</tr>
					</thead>
				</table>
				<div class="text-center">
					<button type="button" class="btn btn-success" id="btnSearch">검색</button>
					<button type="reset" class="btn btn-default" id="btnReset">초기화</button>
				</div>
			</form>
		</div>
		
		<hr class="blackLine">
		
		<!-- 결과 목록란 -->
		<div class="resultBox">
			<table class="table table-hover ordersList">
				<%-- <colgroup>
					<col width="10%">
					<col width="10%">
					<col width="35%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
				</colgroup> --%>
				<thead>
					<tr><td colspan="8" class="listActionBar form-inline">
						<!-- <label for="updateCategoryList">분류 수정</label>
						<select id="updateCategoryList" class="form-control"></select>
						<button type="button" id="startSales" class="btn btn-default">판매개시</button>
						<button type="button" id="endSales" class="btn btn-default">판매중지</button>
						<button type="button" id="deleteProd" class="btn btn-default">삭제</button> -->
					</td></tr>
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
					<c:choose>
						<c:when test="${not empty orderslist}"><form id="recordForm">
							<c:forEach items="${orderslist}" var="stack"><tr class="productRecord" data-odno="${stack.od_no}">
								<td class="od_date"><fmt:formatDate value="${stack.od_date}" pattern="yyyy-MM-dd"/></td>
								<td class="od_no">${stack.od_no}</td>
								<td class="mem_name">${stack.mem_name}</td>
								<td class="numberOfProds">${stack.numberOfProds}개 상품</td>
								<td class="totalPriceOrg"><fmt:formatNumber value="${stack.totalPriceOrg}" pattern="#,###"/></td>
								<td class="totalPrice"><fmt:formatNumber value="${stack.totalPrice}" pattern="#,###"/></td>
								<td class="od_prog"><c:choose>
									<c:when test='${empty stack.od_prog}'></c:when>
									<c:otherwise>${stack.od_prog}</c:otherwise>
								</c:choose></td>
							</tr></c:forEach>
						</form></c:when>
						<c:otherwise><tr>
							<td class="emptyResult text-center" colspan="8">검색 결과가 없습니다.</td>
						</tr></c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		
		<!-- 페이지네이션 -->
		<div>
			<div class="text-center">
				<ul class="pagination">
					<c:if test="${pageinfo.prev}">
						<li class="paginate_button previous">
							<a href="${pageinfo.startPage -1}">이전</a>
						</li>
					</c:if>
					
					<c:forEach var="num" begin="${pageinfo.startPage}" end="${pageinfo.endPage}">
						<li class="paginate_button ${pageinfo.cvo.pageNum == num ? 'active':''}">
							<a href="${num}">${num}</a>
						</li>
					</c:forEach>
					
					<c:if test="${pageinfo.next}">
						<li class="paginate_button next">
							<a href="${pageinfo.endPage + 1}">다음</a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</body>
</html>
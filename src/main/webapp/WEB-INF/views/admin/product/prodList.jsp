<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<title>상품 목록</title>
		
		<link rel="stylesheet" href="/resources/include/css/prodAdmin.css" />
		<script type="text/javascript" src="/resources/include/js/productCommon.js"></script>
		<script type="text/javascript" src="/resources/include/js/product.js"></script>
		<script type="text/javascript" src="/resources/include/js/prodctg.js"></script>
		<script type="text/javascript">
			$(function() {
				// 할인가 계산
				$(".pd_discount").each(function() {
					var discountPrice = calculateDiscount($(this).attr("data-price"),$(this).attr("data-dcrate"));
					$(this).text(discountPrice.formatComma());
				});
				
				// 항목별 상세 페이지 링크
				$(".pd_name").on("click", function() {
					alert($(this).attr("data-pdno"));
				});
				
				// 전체 선택 버튼
				$("#selectAllRecords").on("change", function(event) {
					var isChecked = $(this).is(":checked");
					$(".recordCheckbox").prop("checked", isChecked);
				});
				
				// 선택 해제시 전체 선택 버튼 토글 오프
				$(".recordCheckbox").on("change", function(event) {
					if(!$(this).is(":checked")) {
						$("#selectAllRecords").prop("checked", false);
					}
				});
			});
		</script>
	</head>
	
	<body>
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
									<option value="pd_name" selected="selected">상품명</option>
									<option value="pd_no">상품번호</option>
								</select>
								<input type="text" name="keyword" id="keyword" class="form-control" autocomplete="off">
							</td>
						</tr>
						<tr>
							<th>카테고리</th>
							<td class="form-inline">
								<select name="pct_no" id="ctgList" class="form-control"></select>
							</td>
						</tr>
						<tr>
							<th>상태</th>
							<td>
								<input type="radio" name="pd_status" value="all" id="stall"><label for="stall">전체</label>
								<input type="radio" name="pd_status" value="ok" id="stok"><label for="stok">판매중</label>
								<input type="radio" name="pd_status" value="d" id="stde"><label for="stde">판매완료</label>
							</td>
						</tr>
					</thead>
					
					<tbody id="advancedSearch" class="collapse">
						<tr>
							<th>성별</th>
							<td>
								<input type="radio" name="pd_sex" value="all" id="sxall"><label for="sxall">전체</label>
								<input type="radio" name="pd_sex" value="m" id="sxm"><label for="sxm">남성용</label>
								<input type="radio" name="pd_sex" value="f" id="sxf"><label for="sxf">여성용</label>
							</td>
						</tr>
						<tr>
							<th>연령대</th>
							<td>
								<input type="radio" name="pd_age" value="all" id="agall"><label for="agall">전체</label>
								<input type="radio" name="pd_age" value="a" id="agad"><label for="agad">성인</label>
								<input type="radio" name="pd_age" value="k" id="agki"><label for="agki">아이</label>
							</td>
						</tr>
						<tr>
							<th>색상</th>
							<td class="form-inline">
								<select name="pcl_no" id="colorList" class="form-control"></select>
							</td>
						</tr>
						<tr>
							<th>가격</th>
							<td class="form-inline">
								<input type="number" name="priceBottom" class="form-control"> 이상
								&nbsp;~&nbsp;
								<input type="number" name="priceTop" class="form-control"> 미만
							</td>
						</tr>
					</tbody>
					
					<tfoot>
						<tr>
							<td colspan="2" class="text-right"><a class="btn btn-default btnAdvanced" data-toggle="collapse"
							href="#advancedSearch" aria-expanded="false" aria-controls="advancedSearch">상세 항목</a></td>
						</tr>
					</tfoot>
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
			<c:choose>
				<c:when test="${not empty prodlist}">
					<form id="recordForm"><table class="table table-hover prodList">
						<colgroup>
							<col width="5%">
							<col width="10%">
							<col width="10%">
							<col width="35%">
							<col width="10%">
							<%-- <col width=""> 컬렉션 기능 사용시 해제 --%>
							<col width="10%">
							<col width="10%">
							<col width="10%">
						</colgroup>
						<thead>
							<tr>
								<th><input type="checkbox" id="selectAllRecords"> </th>
								<th>상품번호</th>
								<th>이미지</th>
								<th>상품명</th>
								<th>카테고리</th>
								<!-- <th>컬렉션</th> 컬렉션 기능 사용시 해제 -->
								<th>가격</th>
								<th>할인가</th>
								<th>등록일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${prodlist}" var="stack"><tr class="productRecord">
								<td class="selectionCell"><input type="checkbox" name="pd_no" value="${stack.pd_no}" class="recordCheckbox"></td>
								<td class="pd_no">${stack.pd_no}</td>
								<td class="pim_main"><c:choose>
								<c:when test="${not empty stack.pim_main}">
									<img width="70px" height="70px" class="img-thumbnail prodThumb" src="/shoestarStorage/prod/thumb/${stack.pim_main}">
								</c:when>
								<c:otherwise>
									<img width="70px" height="70px" class="img-thumbnail" src="/shoestarStorage/prod/thumb/noimage.png">
								</c:otherwise>
								</c:choose></td>
								<td class="pd_name" data-pdno="${stack.pd_no}">${stack.pd_name}</td>
								<td class="pct_name">${stack.pct_name}</td>
								<!-- <td>컬렉션</td> 컬렉션 기능 사용시 해제 -->
								<td class="pd_price"><fmt:formatNumber value="${stack.pd_price}" pattern="#,###"/></td>
								<td data-price="${stack.pd_price}" data-dcrate="${stack.pd_discount}" class="pd_discount"></td>
								<td class="pd_date"><fmt:formatDate value="${stack.pd_date}" pattern="yyyy-MM-dd"/></td>
							</tr></c:forEach>
						</tbody>
					</table></form>
				</c:when>
				<c:otherwise>
					<div class="emptyResult text-center">검색 결과가 없습니다.</div>
				</c:otherwise>
			</c:choose>
		</div>
		
		<!-- 페이지네이션 -->
		<div>
			
		</div>
	</body>
</html>
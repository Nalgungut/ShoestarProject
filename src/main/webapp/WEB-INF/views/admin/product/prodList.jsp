<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<title>상품 목록</title>
		
		<link rel="stylesheet" href="/resources/include/css/prodAdmin.css" />
		<script type="text/javascript" src="/resources/include/js/productCommon.js"></script>
		<script type="text/javascript" src="/resources/include/js/prodAdmin.js"></script>
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
					location.href = "/admin/product/detail/" + $(this).attr("data-pdno");
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
				
				// 카테고리 정보 읽어오기
				getProdCtgList($("#ctgList"), $("#updateCategoryList"));
				// 색상 정보 읽어오기
				getColorList($("#colorList"));
				
				// 검색 버튼 설정
				$("#btnSearch").on("click", function() {
					submitSearch();
				});
				
				// 카테고리 변경 제어
				$("#updateCategoryList").on("change", function() {
					if($("#updateCategoryList").val() != 0) {
						preConfirms("선택한 항목들의 분류를 수정하시겠습니까?",
								updateMultipleRecords, "pct_no=" + $("#updateCategoryList").val());
					}
				});
				
				// '판매시작' 버튼 변경 제어
				$("#startSales").on("click", function() {
					preConfirms("선택한 항목들을 판매시작 상태로 변경하시겠습니까?", updateMultipleRecords, "pd_status=null");
				});
				
				// '판매중지' 버튼 변경 제어
				$("#endSales").on("click", function() {
					preConfirms("선택한 항목들을 판매중지 상태로 변경하시겠습니까?", updateMultipleRecords, "pd_status=d");
				});
				
				// '삭제' 버튼 변경 제어
				$("#deleteProd").on("click", function() {
					preConfirms("소분류 항목이나 판매 기록이 있는 데이터는 삭제할 수 없습니다.\n정말로 삭제하시겠습니까?",
							deleteMultipleRecords);
				});
				
				// 페이지네이션 버튼 제어
				$(".paginate_button a").click(function(event) {
					event.preventDefault();
					// TODO: 페이지 넘어가는 기능 만들기
				});
			});
			
			// 항목 수정/삭제 전 확인사항
			function preConfirms(msg, callback, param) {
				if($("#recordForm").serialize() == "") {
					alert("대상을 선택해주세요.");
					resetCtgSelect();
				} else {
					if(confirm(msg)) {
						callback(param);
					}
				}
			}
			
			function submitSearch() {
				var searchRequest = $("#searchForm").serialize();
				var allowThese = ["pd_sex", "pd_age"];
				
				if(!$("#keyword").val().isEmpty()) {
					allowThese.push("search", "keyword");
				}
				
				if($("#ctgList").val() != "0") {
					allowThese.push("pct_no");
				}
				
				if($("#colorList").val() != "0") {
					allowThese.push("pcl_no");
				}
				
				if(!$("#priceBottom").val().isEmpty()) {
					allowThese.push("priceBottom");
				}
				
				if(!$("#priceTop").val().isEmpty()) {
					allowThese.push("priceTop");
				}
				
				searchRequest = splitRequest(searchRequest, allowThese);
				location.href = "/admin/product/list?" + searchRequest;
			}
			
			var updateMultipleRecords = function(updateRequest) {
				$.ajax({
					url : "/admin/product/updateAll",
					type : "post",
					data : $("#recordForm").serialize() + "&" + updateRequest,
					dataType : "text",
					error : function() {
						alert("서버 오류가 발생하여 항목을 수정할 수 없었습니다.");
						resetCtgSelect();
					},
					success : function(data) {
						if(resultNumbers[0] == "0") {
							alert("항목을 수정할 수 없었습니다.");
							resetCtgSelect();
						} else {
							alert("총 " + resultNumbers[1] + "개 항목 중 " + resultNumbers[0] + "개 항목을 수정했습니다.");
							location.reload();
						}
					}
				});
			}
			
			var deleteMultipleRecords = function() {
				$.ajax({
					url : "/admin/product/deleteAll",
					type : "post",
					data : $("#recordForm").serialize(),
					dataType : "text",
					error : function() {
						alert("서버 오류가 발생하여 항목을 삭제할 수 없었습니다.");
					},
					success : function(data) {
						var resultNumbers = data.split("/");
						if(resultNumbers[0] == "0") {
							alert("항목을 삭제할 수 없었습니다.\n상품 소분류 등의 관련 데이터가 존재하는 상품은 삭제할 수 없습니다.");
						} else {
							alert("총 " + resultNumbers[1] + "개 항목 중 " + resultNumbers[0] + "개 항목을 삭제했습니다.");
							location.reload();
						}
					}
				});
			}
			
			function resetCtgSelect() {
				$("#updateCategoryList").prop("selectedIndex", 0);
			}
		</script>
	</head>
	
	<body>
		<div class="titleContainer">
			<h3>상품 목록</h3>
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
								<input type="radio" name="pd_status" value="d" id="stde"><label for="stde">판매중지</label>
								<input type="radio" name="pd_status" value="n" id="stnw"><label for="stnw">신상품</label>
								<input type="radio" name="pd_status" value="h" id="stht"><label for="stht">인기상품</label>
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
							<th>판매 가격</th>
							<td class="form-inline">
								<input type="number" id="priceBottom" name="priceBottom" class="form-control"> 이상
								&nbsp;~&nbsp;
								<input type="number" id="priceTop" name="priceTop" class="form-control"> 미만
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
			<table class="table table-hover prodList">
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
					<tr><td colspan="8" class="listActionBar form-inline">
						<label for="updateCategoryList">분류 수정</label>
						<select id="updateCategoryList" class="form-control"></select>
						<button type="button" id="startSales" class="btn btn-default">판매개시</button>
						<button type="button" id="endSales" class="btn btn-default">판매중지</button>
						<button type="button" id="deleteProd" class="btn btn-default">삭제</button>
					</td></tr>
					<tr>
						<th><input type="checkbox" id="selectAllRecords"> </th>
						<th>상품번호</th>
						<th>이미지</th>
						<th>상품명</th>
						<th>카테고리</th>
						<%-- <th>컬렉션</th> 컬렉션 기능 사용시 해제 --%>
						<th>가격</th>
						<th>할인가</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty prodlist}"><form id="recordForm">
							<c:forEach items="${prodlist}" var="stack"><tr class="productRecord">
								<td class="selectionCell"><input type="checkbox" name="pdnos" value="${stack.pd_no}" class="recordCheckbox"></td>
								<td class="pd_no">${stack.pd_no}</td>
								<td class="pim_main"><c:choose>
								<c:when test="${not empty stack.pim_main}">
									<img width="70px" height="70px" class="img-thumbnail prodThumb" src="/shoestarStorage/prod/thumb/${stack.pim_main}">
								</c:when>
								<c:otherwise>
									<img width="70px" height="70px" class="img-thumbnail" src="/resources/images/product/noimage.png">
								</c:otherwise>
								</c:choose></td>
								<td class="pd_name" data-pdno="${stack.pd_no}">${stack.pd_name}</td>
								<td class="pct_name">${stack.pct_name}</td>
								<%-- <td>컬렉션</td> 컬렉션 기능 사용시 해제 --%>
								<td class="pd_price"><fmt:formatNumber value="${stack.pd_price}" pattern="#,###"/></td>
								<td data-price="${stack.pd_price}" data-dcrate="${stack.pd_discount}" class="pd_discount"></td>
								<td class="pd_date"><fmt:formatDate value="${stack.pd_date}" pattern="yyyy-MM-dd"/></td>
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
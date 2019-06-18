<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<title>상품 수정 - ${prodVO.pd_name}</title>
		<link rel="stylesheet" href="/resources/include/css/product.css" />
		<link rel="stylesheet" href="/resources/include/css/prodAdmin.css" />
		<link rel="stylesheet" href="/resources/include/css/productDetail.css" />
		<script type="text/javascript" src="/resources/include/js/jquery.form.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/productCommon.js"></script>
		<script type="text/javascript" src="/resources/include/js/prodAdmin.js"></script>
		<script type="text/javascript" src="/resources/include/js/product.js"></script>
		<script type="text/javascript" src="/resources/include/js/prodctg.js"></script>
		<script type="text/javascript">
			var pdno = "${prodVO.pd_no}";
			var pdname = "${prodVO.pd_name}";
			var pdsex = "${prodVO.pd_sex}";
			var pdage = "${prodVO.pd_age}";
			var pctno = "${prodVO.pct_no}";
			<%-- var cono = "${prodVO.co_no}"; --%>
			var pdprice = "${prodVO.pd_price}";
			var pdfabric = "${prodVO.pd_fabric}";
			var pdcountry = "${prodVO.pd_country}";
			var pdyear = "${prodVO.pd_year}";
			var pdmanu = "${prodVO.pd_manu}";
			var pdimport = "${prodVO.pd_import}";
			var pdstatus = "${prodVO.pd_status}";
			var pimmain = "${prodVO.pim_main}";
			var pi_no = "${pi_no}";
			
			$(function() {
				// 수정 버튼 설정
				$("#btnUpdateProd").click(function() {
					updatePrimaryData();
				});
				
				// 리셋 버튼 설정
				$("#btnResetForm").click(function() {
					resetPrimaryData();
				});
				
				// 상태 항목 설정
				$(".statusCheck").on("change", function() {
					readStatus();
				});
				
				// 카테고리 정보 읽어오기
				getProdCtgList(pctno, $("#pct_no"));
				// 항목 값 기입
				resetPrimaryData();
				
				// 색상 정보 읽어오기
				getColorInfo($("#colorList"));
				
				// 이미지 정보 읽어오기
				getImageList($("#pimList"));
				
				// 모달창 리셋
				$("#imageModalTitle").click(function() {
					resetPimInsert();
				});
				
				// 이미지 신규 등록
				$("#submitPimInsert").click(function() {
					if(isNaN(pi_no) || pi_no == "0") {
						alert("상품 색상을 우선적으로 추가해야합니다.");
					} else {
						insertPim($("#pimInputForm"));
					}
				});
				
				// 추가되지 않은 색상 정보 불러오기
				unoccupiedColors(pdno, function(colorlist) {
					if(!jQuery.isEmptyObject(colorlist)) {
						$.each(JSON.parse(colorlist), function(index, stack) {
							$("#prodins_colorlist").append($("<option>").attr({
								"value" : stack.pcl_no
							}).html(stack.pcl_name + "(색상 코드 : #" + stack.pcl_code + ")"));
						});
					} else {
						$("#prodinModalBtn").attr({
							"data-target" : ""
						}).click(function() {
							alert("선택 가능한 색상이 없습니다.");
						});
					}
				});
				
				// 색상 입력 버튼 제어
				$("#submitProdinsInsert").click(function() {
					insertProdins($("#prodinsInputForm"), pdno);
				});
				
				// 색상 삭제 버튼 제어
				$("#deleteProdins").click(function() {
					if(confirm("정말로 상품 색상을 삭제하시겠습니까?")) {
						deleteProdins($("#prodinsInputForm"), pdno);
					}
				});
				
				// pi_no가 없을 시 입력 금지
				if(pi_no == 0) {
					$("#imageModalBtn").attr({
						"data-target": "",
						"data-toggle": ""
					}).click(function() {
						alert("우선 색상 정보가 필요합니다!");
					});
					$("#stockModalBtn").attr({
						"data-target": "",
						"data-toggle": ""
					}).click(function() {
						alert("우선 색상 정보가 필요합니다!");
					});
				}
				
				
				// 사이즈 추가 시
				$("#submitStockInsert").click(function() {
					if(checkAll($("#stockInsertForm"))) {
						if(isShoesSize($("#stockInsert_size").val()) && isStockQty($("#stockInsert_qty").val())) {
							if(confirm("사이즈를 추가하시겠습니까?")) {
								insertStock($("#stockInsertForm"));
							}
						}
					}
				});
				
				
				// 재고 수정 시
				$(".updatePst").on("click", function name() {
					if(inputHiddenStockForm($(this), false)) {
						updateStock($("#pstUpdateForm"));
					}
				});
				
				// 재고 삭제 시
				$(".deletePst").on("click", function name() {
					if(inputHiddenStockForm($(this), true)) {
						deleteStock($("#pstUpdateForm"));
					}
				});
			});
			
			// 숨겨진 폼에 값을 입력하고 수정일 경우 값 유효성 체크를 병행하는 함수
			function inputHiddenStockForm(target, isDelete) {
				var size = target.closest("tr").find(".ps_size_userInput").val();
				var qty = target.closest("tr").find(".ps_qty_userInput").val();
				if(isDelete) {
					$("#stockUpdate_size").val(target.attr("data-pssize"));
					$("#stockUpdate_size_self").val("0");
					$("#stockUpdate_qty").val("0");
				} else if(isShoesSize(size) && isStockQty(qty)) {
					$("#stockUpdate_size_self").val(target.attr("data-pssize"));
					$("#stockUpdate_size").val(size);
					$("#stockUpdate_qty").val(qty);
				} else {
					return false;
				}
				
				return true;
			}
			
			// 기초 정보 리셋
			function resetPrimaryData() {
				$("#pd_name").val(pdname);
				$("#pd_sex_" + pdsex).prop("checked", true);
				$("#pd_age_" + pdage).prop("checked", true);
				$("#pct_no").find("option[value="+pctno+"]").prop("selected", true);
				<%-- $("#co_no").find("option[value="+co_no+"]").prop("selected", true); --%>
				$("#pd_price").val(pdprice);
				$("#pd_fabric").val(pdfabric);
				$("#pd_country").val(pdcountry);
				$("#pd_year").val(pdyear);
				$("#pd_manu").val(pdmanu);
				$("#pd_import").val(pdimport);
				$("#pd_status").val(pdstatus);
				switch (pdstatus) {
				case "n":
					$("#stNew").prop("checked", true);
					break;
				case "h":
					$("#stHot").prop("checked", true);
					break;
				case "b":
					$("#stNew").prop("checked", true);
					$("#stHot").prop("checked", true);
					break;
				case "d":
					$("#stDel").prop("checked", true);
					break;
				}
				readStatus();
			}
			
			function updatePrimaryData() {
				var updateReq = $("#prodForm").serialize();
				
				$.ajax({
					url : "/admin/product/update",
					type : "post",
					data : updateReq,
					dataType : "text",
					error : function() {
						alert("서버 오류로 항목을 수정하는데 실패했습니다.");
					},
					success : function(result) {
						if(result == "true") {
							alert("성공적으로 항목을 수정했습니다.");
							location.reload();
						} else {
							alert("서버 오류로 항목을 수정하는데 실패했습니다.");
						}
					}
				});
			}
			
			// 상태값을 읽고 데이터 변환
			function readStatus() {
				var stn = $("#stNew").prop("checked");
				var sth = $("#stHot").prop("checked");
				var std = $("#stDel").prop("checked");
				var resultData = "";
				
				if(stn) {
					resultData = "n";
				}
				if(sth) {
					if(resultData == "n") {
						resultData = "b";
					} else {
						resultData = "h";
					}
				}
				if(std) {
					resultData = "d";
				}
				$("#stNew").prop("disabled", std);
				$("#stHot").prop("disabled", std);
				
				if(resultData == "") {
					resultData = "null";
				}
				$("#pd_status").val(resultData);
			}
			
			// 색상 정보 읽어오기
			function getColorInfo(target) {
				target.html("");
				
				$.ajax({
					url : "/product/pinsList/" + pdno,
					type : "get",
					dataType : "json",
					error : function() {
						target.append(createErrorList("색상 정보를 불러오는데 실패했습니다."));
					},
					success : function(data) {
						if(!jQuery.isEmptyObject(data)) {
							$.each(data, function(index, stack) {
								var coloritem = createPinsBox(stack,null)
									.append($("<div>").text(stack.pcl_name).addClass("text-center"));
								if(stack.pi_no == pi_no) {
									coloritem.addClass("colorSelected");
								}
								target.append(coloritem);
							});
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
								var pimli = createImageBox(stack, null, 180);
								pimli.append(createImageActions(stack, pimmain));
								target.append(pimli);
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
								//target.append(createSizeOption(stack));
							});
						} else {
							target.append(createErrorList("사이즈 정보가 비어있습니다.", "option").prop("disabled", true));
						}
					}
				});
			}
			
			// 모달 폼 리셋
			function resetPimInsert() {
				$resetForm($("#pimInputForm"));
			}
			
		</script>
	</head>
	
	<body>
		<!-- ######################### 타이틀 ######################### -->
		<div class="titleContainer">
			<h3>상품 정보</h3>
			<hr class="blackLine">
		</div>
		
		<!-- ######################### 기초 정보 ######################### -->
		<h3 class="sectionTitle">기초 정보</h3>
		
		<div class="primarySection">
			<form id="prodForm" class="form-horizontal">
				<input type="hidden" id="pd_no" name="pd_no" value="${prodVO.pd_no}">
				<div class="form-group">
					<label for="pd_no" class="col-md-2 control-label">상품 번호</label>
					<div class="col-md-6">
						<strong class="form-control">${prodVO.pd_no}</strong>
					</div>
				</div>
				<div class="form-group">
					<label for="pd_name" class="col-md-2 control-label">상품명</label>
					<div class="col-md-6">
						<input type="text" id="pd_name" name="pd_name" class="form-control" required="required" maxlength="100">
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label">성별</label>
					<div class="col-md-6 radio">
						<label><input type="radio" id="pd_sex_m" name="pd_sex" value="m">
						남성용</label>
						<label><input type="radio" id="pd_sex_f" name="pd_sex" value="f">
						여성용</label>
						<label><input type="radio" id="pd_sex_u" name="pd_sex" value="u">
						공용</label>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label">연령대</label>
					<div class="col-md-6 radio">
						<label><input type="radio" id="pd_age_a" name="pd_age" value="a">
						성인용</label>
						<label><input type="radio" id="pd_age_k" name="pd_age" value="k">
						아동용</label>
					</div>
				</div>
				<div class="form-group">
					<label for="pct_no" class="col-md-2 control-label">카테고리</label>
					<div class="col-md-6">
						<select name="pct_no" id="pct_no" class="form-control" required="required"></select>
					</div>
				</div>
				<%-- 컬렉션 사용시 해제
				<div class="form-group">
					<label for="co_no" class="col-md-2 control-label">컬렉션</label>
					<div class="col-md-6">
						<select name="co_no" id="co_no">
							<option value="0" disabled="disabled"></option>
						</select>
					</div>
				</div>
				--%>
				<div class="form-group">
					<label for="pd_price" class="col-md-2 control-label">가격</label>
					<div class="col-md-6">
						<input type="number" id="pd_price" name="pd_price" class="form-control" required="required">
					</div>
				</div>
				<div class="form-group">
					<label for="pd_fabric" class="col-md-2 control-label">원재료</label>
					<div class="col-md-6">
						<input type="text" id="pd_fabric" name="pd_fabric" class="form-control" required="required" maxlength="100">
					</div>
				</div>
				<div class="form-group">
					<label for="pd_country" class="col-md-2 control-label">제조국</label>
					<div class="col-md-6">
						<input type="text" id="pd_country" name="pd_country" class="form-control" required="required" maxlength="20">
					</div>
				</div>
				<div class="form-group">
					<label for="pd_year" class="col-md-2 control-label">제조연도</label>
					<div class="col-md-6">
						<input type="text" id="pd_year" name="pd_year" class="form-control" required="required" maxlength="7">
					</div>
				</div>
				<div class="form-group">
					<label for="pd_manu" class="col-md-2 control-label">제조사</label>
					<div class="col-md-6">
						<input type="text" id="pd_manu" name="pd_manu" class="form-control" required="required" maxlength="20">
					</div>
				</div>
				<div class="form-group">
					<label for="pd_import" class="col-md-2 control-label">수입자</label>
					<div class="col-md-6">
						<input type="text" id="pd_import" name="pd_import" class="form-control" required="required" maxlength="20">
					</div>
				</div>
				<div class="form-group">
					<label for="pd_status" class="col-md-2 control-label">상품 상태</label>
					<div class="col-md-6 checkbox">
						<label for="stNew">
							<input type="checkbox" id="stNew" class="statusCheck">
							신상품
						</label>
						<label for="stHot">
							<input type="checkbox" id="stHot" class="statusCheck">
							인기상품
						</label>
						<label for="stDel">
							<input type="checkbox" id="stDel" class="statusCheck">
							판매중지
						</label>
						<input type="hidden" id="pd_status" name="pd_status">
					</div>
				</div>
				<hr>
				<div class="buttonContainer form-inline">
					<div class="col-md-2"></div>
					<div class="col-md-10">
						<button type="button" class="btn btn-success" id="btnUpdateProd">기본 정보 수정</button>
						<button type="button" class="btn btn-default" id="btnResetForm">초기화</button>
					</div>
				</div>
			</form>
		</div>
		
		<!-- ######################### 상품 내역 ######################### -->
		<h3 class="sectionTitle">상품 내역</h3>
		
		
		<!-- 색상 정보 -->
		<div class="pinsArticle">
			<div class="articleTitle">
				<h4>색상 선택</h4>
				<button type="button" class="text-center submenuActions" data-toggle="modal" data-target="#colorModal" id="prodinModalBtn">
					신규 색상 <span class='glyphicon glyphicon-plus'></span>
				</button>
			</div>
			<ul id="colorList"></ul>
			<button type="button" class="text-center submenuActions" id="deleteProdins">
				선택 제거 <span class='glyphicon glyphicon-minus'></span>
			</button>
		</div>
		
		
		<!-- 이미지 정보 -->
		<div class="pimArticle">
			<div class="articleTitle">
				<h4>이미지 정보</h4>
				<button type="button" class="text-center submenuActions" data-toggle="modal" data-target="#imageModal" id="imageModalBtn">
					신규 이미지 <span class='glyphicon glyphicon-plus'></span>
				</button>
			</div>
			<ul id="pimList"></ul>
		</div>
		
		
		<!-- 재고 정보 -->
		<div class="stockArticle">
			<div class="articleTitle">
				<h4>재고 정보</h4>
				<button type="button" class="text-center submenuActions" data-toggle="modal" data-target="#stockModal" id="stockModalBtn">
					신규 사이즈 <span class='glyphicon glyphicon-plus'></span>
				</button>
			</div>
			<div class="col-md-8"><table class="table table-hover">
				<thead>
					<tr class="align-middle">
						<th>사이즈</th>
						<th>재고</th>
						<th></th>
						<th class="text-sm padding-right">
							<span class="glyphicon glyphicon-chevron-up"></span>수정
							<span class="glyphicon glyphicon-remove"></span> 삭제
						</th><!-- 버튼 -->
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty pstlist}"><c:forEach items="${pstlist}" var="pst">
							<tr class="form-inline align-middle">
								<td>
									<input type="number" class="ps_size_userInput form-control" value="${pst.ps_size}">
								</td>
								<td>
									<input type="number" class="ps_qty_userInput form-control" value="${pst.ps_qty}">
								</td>
								<td><span class="stockWarning">${pst.ps_qty <= 0 ? "매진" : ""}</span></td>
								<td>
									<button type="button" class="clearButton updatePst" data-pssize="${pst.ps_size}">
										<span class="glyphicon glyphicon-chevron-up"></span>
									</button>
									<button type="button" class="clearButton deletePst" data-pssize="${pst.ps_size}">
										<span class="glyphicon glyphicon-remove"></span>
									</button>
								</td>
							</tr>
						</c:forEach></c:when>
						<c:otherwise>
							<tr>
								<td colspan="4" class="emptyList">재고 항목이 비어있습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table></div>
		</div>
		
		
		
		<!-- ######################### 모달란 ######################### -->
		
		<!-- 이미지 입력을 위한 모달 -->
		<!-- Modal -->
		<div class="modal" id="imageModal" tabindex="-1" role="dialog" aria-labelledby="imageModalTitle" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="imageModalTitle">이미지 등록</h4>
					</div>
					<div class="modal-body">
						<form id="pimInputForm">
							<input type="hidden" name="pi_no" id="piminput_pi_no" value="${pi_no}">
							<label class="col-sm-3 control-label" for="piminput_pim_prioirty">우선순위</label>
							<div class="col-sm-8 form-group">
								<input type="number" name="pim_priority" id="piminput_pim_prioirty"
									maxlength="2" required="required" value="1" class="form-control">
							</div>
							<label class="col-sm-3 control-label" for="piminput_pim_prioirty">파일</label>
							<div class="col-sm-8 form-group">
								<input type="file" name="file" id="piminput_file" required="required"
									class="form-control">
							</div>
							<label class="col-sm-3 control-label" for="piminput_pim_prioirty">대표 이미지 설정</label>
							<div class="col-sm-8 form-group">
								<input type="checkbox" name="updatePimMain" id="piminput_main" value="true">
							</div>
						</form>
						<div class="text-right">
							<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-primary" id="submitPimInsert">등록</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 색상 입력을 위한 모달 -->
		<!-- Modal -->
		<div class="modal" id="colorModal" tabindex="-1" role="dialog" aria-labelledby="colorModalTitle" aria-hidden="true">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="imageModalTitle">색상 선택</h4>
					</div>
					<div class="modal-body">
						<form id="prodinsInputForm">
							<input type="hidden" name="pd_no" id="prodins_pd_no" value="${pd_no}">
							<input type="hidden" name="pi_no" id="prodins_pi_no" value="${pi_no}">
							<div class="form-group">
								<select name="pcl_no" id="prodins_colorlist" class="form-control"></select>
							</div>
						</form>
						<div class="text-right">
							<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-primary" id="submitProdinsInsert">추가</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 재고 입력을 위한 모달 -->
		<!-- Modal -->
		<div class="modal" id="stockModal" tabindex="-1" role="dialog" aria-labelledby="stockModalTitle" aria-hidden="true">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="stockModalTitle">사이즈 추가</h4>
					</div>
					<div class="modal-body">
						<form id="stockInsertForm">
							<input type="hidden" name="pi_no" id="stockInsert_pi_no" value="${pi_no}">
							<div class="form-group">
								<label>
									사이즈
									<input type="number" name="ps_size" id="stockInsert_size" required="required" class="form-control">
								</label>
							</div>
							<div class="form-group">
								<label>
									수량
									<input type="number" name="ps_qty" id="stockInsert_qty" required="required" class="form-control">
								</label>
							</div>
						</form>
						<div class="text-right">
							<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-primary" id="submitStockInsert">추가</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 재고 수정을 위한 숨겨진 폼 -->
		<form id="pstUpdateForm">
			<input type="hidden" name="pi_no" value="${pi_no}">
			<input type="hidden" name="ps_size" id="stockUpdate_size">
			<input type="hidden" name="ps_size_self" id="stockUpdate_size_self">
			<input type="hidden" name="ps_qty" id="stockUpdate_qty">
		</form>
		
	</body>
</html>
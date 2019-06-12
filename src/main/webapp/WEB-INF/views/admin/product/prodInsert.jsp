<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<title>상품 등록</title>
		<link rel="stylesheet" href="/resources/include/css/prodAdmin.css" />
		<script type="text/javascript" src="/resources/include/js/productCommon.js"></script>
		<script type="text/javascript" src="/resources/include/js/prodAdmin.js"></script>
		<script type="text/javascript" src="/resources/include/js/product.js"></script>
		<script type="text/javascript" src="/resources/include/js/prodctg.js"></script>
		<script type="text/javascript">
			$(function() {
				// 카테고리 정보 로드
				getProdCtgList($("#pct_no"));
				
				$("#btnInsertProd").on("click", function() {
					if(checkAll($("#prodForm"))) {
						insertProd();
					}
				});
			});
			
			// 상품 등록 메서드
			function insertProd() {
				$.ajax({
					url : "/admin/product/insert",
					type : "post",
					data : $("#prodForm").serialize(),
					dataType : "text",
					error : function() {
						alert("서버 오류로 상품 정보를 등록할 수 없었습니다.");
					},
					success : function(data) {
						if(parseInt(data) >= 1) {
							alert("성공적으로 상품 정보를 등록했습니다.");
							location.href = "/admin/product/detail/" + data;
						} else {
							alert("상품 정보를 등록할 수 없었습니다.");
						}
					}
				});
			}
		</script>
	</head>
	
	<body>
		<div class="titleContainer">
			<h3>상품 등록</h3>
			<hr class="blackLine">
		</div>
		<div class="formContainer">
			<form id="prodForm" class="form-horizontal">
				<div class="form-group">
					<label for="pd_name" class="col-md-2 control-label">상품명</label>
					<div class="col-md-6">
						<input type="text" id="pd_name" name="pd_name" class="form-control" required="required" maxlength="100">
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label">성별</label>
					<div class="col-md-6 radio">
						<label><input type="radio" id="pd_sex_m" name="pd_sex" value="m" checked="checked">
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
						<label><input type="radio" id="pd_age_a" name="pd_age" value="a" checked="checked">
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
					<label for="pd_status" class="col-md-2 control-label">신상품 표시</label>
					<div class="col-md-6">
						<input type="checkbox" id="pd_status" name="pd_status" value="n" checked="checked">
					</div>
				</div>
				<hr>
				<div class="buttonContainer form-inline">
					<div class="col-md-2"></div>
					<div class="col-md-6">
						<button type="button" class="btn btn-success" id="btnInsertProd">등록</button>
						<button type="reset" class="btn btn-default" id="btnResetForm">초기화</button>
					</div>
				</div>
			</form>
		</div>
	</body>
</html>
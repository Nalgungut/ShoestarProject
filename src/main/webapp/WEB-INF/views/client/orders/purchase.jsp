<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<title>결제 페이지</title>
		<link rel="stylesheet" href="/resources/include/css/orders.css" />
		<script type="text/javascript" src="/resources/include/js/productCommon.js"></script>
		<script type="text/javascript" src="/resources/include/js/orders.js"></script>
		<script type="text/javascript">
		
		
        function sample4_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var roadAddr = data.roadAddress; // 도로명 주소 변수
                    var extraRoadAddr = ''; // 참고 항목 변수

                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraRoadAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                       extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraRoadAddr !== ''){
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('mem_zip').value = data.zonecode;
                    document.getElementById("mem_addr1").value = roadAddr;
                    document.getElementById("mem_addr2").value = data.jibunAddress;
                    
                    // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                    if(roadAddr !== ''){
                        document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                    } else {
                        document.getElementById("sample4_extraAddress").value = '';
                    }

                    var guideTextBox = document.getElementById("guide");
                    // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                    if(data.autoRoadAddress) {
                        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                        guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                        guideTextBox.style.display = 'block';

                    } else if(data.autoJibunAddress) {
                        var expJibunAddr = data.autoJibunAddress;
                        guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                        guideTextBox.style.display = 'block';
                    } else {
                        guideTextBox.innerHTML = '';
                        guideTextBox.style.display = 'none';
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
				<form id="purchaseForm"><table class="orderTable table table-striped">
					
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
							<td class="gray">-${stack.oi_org_price > stack.oi_price ? stack.oi_org_price - stack.oi_price : ""}</td>
							<td>${stack.oi_price}</td>
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
							<th class="errorTitle" colspan="8"><h4>제외 된 상품</h4></th>
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
				
				<!-- 기타 정보 표시란 -->
				<div>
					
					<div class="form-group form-group-sm">
						<label for="phone" class="col-sm-2 control-label">주소</label>
							<div class="col-sm-6">
								<input type="text" id="mem_zip" name="mem_zip" placeholder="우편번호">
								<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
								<input type="text" id="mem_addr1" name="mem_addr1" placeholder="도로명주소">
								<input type="text" id="mem_addr2" name="mem_addr2" placeholder="지번주소"><br>
								<span id="guide" style="color:#999;display:none"></span>
								<input type="text" id="mem_addr3" name="mem_addr3" placeholder="상세주소">
								<input type="text" id="sample4_extraAddress" placeholder="참고항목">
							</div>
					</div>	
				</div>
			</div>
			
			<div class="purchaseSection col-md-3">
				<h1>tesssst</h1>
			</div>
		</div>
		
		<div class="hiddenSubmitSection" hidden="hidden">
			<form id="hiddenForm">
				<ul id="hiddenList"></ul>
			</form>
		</div>
	</body>
</html>
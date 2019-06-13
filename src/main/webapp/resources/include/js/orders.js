/**
 * 상품 주문 관련 자바스크립트
 * @author 배정훈
 */

/**
 * 장바구니 상품 제거를 위한 ajax
 * @param jsonArray 넘겨줄 데이터의 array
 * @returns success를 제외하고 완성 된 json
 */
function removeFromCartAjax(jsonArray) {
	var ajaxJsonForm = {
		url : "/orders/removeCart",
		type : "post",
		postBody : true,
		contentType : "application/json; charset=UTF-8",
		data : JSON.stringify(jsonArray),
		dataType : "text",
		error : function() {
			alert("서버 오류로 장바구니 물품을 삭제할 수 없었습니다.");
		}
	};
	
	return ajaxJsonForm;
}

/**
 * 상품 구매 폼을 위한 json
 */
function purchaseForm() {
	var jsonForm = {
		"method" : "post",
		"action" : "/orders/purchase"
	};
	
	return jsonForm;
}


/**
 * 수량 변경 시 수량 계산
 * @param target 대상 폼
 * @param errorCall 오류 시 실행할 함수
 * @param callbackParam 오류 시 실행할 함수의 파라미터
 * @returns
 */
function checkStock(target, errorCall, callbackParam) {
	var data = target;
	try {
		if(target.is("form")) {
			data = target.serialize();
		}
	} catch (e) {
	}
	
	$.ajax({
		url : "/orders/checkStock",
		type : "get",
		data : data,
		dataType : "text",
		error : function() {
			alert("수랑 정보를 받아오는데 실패했습니다.");
		},
		success : function(data) {
			if(data == "true") {
			} else {
				errorCall(callbackParam);
			}
		}
	});
}
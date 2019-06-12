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
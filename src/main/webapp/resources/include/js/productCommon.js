/**
 * 자주 사용되는 공통 스크립트
 * @author 배정훈
 */


/**
 * 요청값에서 명시된 요청만 남겨서 돌려주는 함수
 * @param requestParam 요청값 전체
 * @param allowThese 가져올 요청 파라미터
 * @returns 필요한 요청만 남긴 String
 */
function splitRequest(requestParam, ...allowThese) {
	var requestToAppend = "";
	
	$.each(requestParam.replace("?","").split("&"), function(index, stack) {
		if(Array.isArray(allowThese[0])) {
			for(var paramIndex in allowThese[0]) {
				if(stack.toLowerCase().startsWith(allowThese[0][paramIndex].toLowerCase())) {
					requestToAppend = requestToAppend + "&" + stack;
					break;
				}
			}
		} else {
			for(var paramIndex in allowThese) {
				if(stack.toLowerCase().startsWith(allowThese[paramIndex].toLowerCase())) {
					requestToAppend = requestToAppend + "&" + stack;
					break;
				}
			}
		}
	});
	
	if(requestToAppend != "") {
		requestToAppend = requestToAppend.substring(1, requestToAppend.length);
	}
	
	return requestToAppend;
}

/**
 * 요청 변수의 값을 돌려주는 함수
 * @param targetRequest 가져올 요청의 이름
 * @returns 요청 값, 존재하지 않을 시 null
 */
function getRequestValue(targetRequest) {
	var paramReg = new RegExp(".*&?"+targetRequest+"=(\\d+).*", "g");
	var regResult = paramReg.exec(window.location.search);
	return regResult != null ? regResult[1] : null;
}


/**
 * 목록을 불러오는데 실패했을 경우 표시하는 에러를 생성해 반환
 * @param msg 보여줄 메시지
 * @param tagName 생성할 태그. li, div 등
 * @returns
 */
function createErrorList(msg, tagName) {
	if(tagName == null || tagName == undefined || tagName == "") {
		tagName = "li";
	}
	
	var errorTag = $("<"+tagName+">").addClass("listHasError").text(msg);
	
	if(tagName == "option")
		errorTag.prop("disabled", true);
	
	return errorTag;
}


/**
 * 원가와 할인율을 입력하면 할인가를 계산해주는 함수
 * @param normalPrice 원가
 * @param discountRate 할인율. 15%일 시 15 입력
 * @returns 할인가
 */
function calculateDiscount(normalPrice, discountRate) {
	if(discountRate < 1) {
		discountRate = discountRate * 100;
	}
	return Math.floor(parseInt(normalPrice) * (100 - discountRate) / 1000) * 10;
}


/**
 * 출처: https://stove99.tistory.com/113 [스토브 훌로구]
 * 숫자 사이에 , 찍어주는 함수
 */
Number.prototype.formatComma = function(){
	if(this==0) return 0;
	
	var reg = /(^[+-]?\d+)(\d{3})/;
	var n = (this + '');
	
	while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
	
	return n;
};


/**
 * 문자가 비어있는지 확인하는 함수
 * @returns 비어있는 함수라면 true
 */
String.prototype.isEmpty = function() {
	return this.replace(/\s/g, "") == "";
}
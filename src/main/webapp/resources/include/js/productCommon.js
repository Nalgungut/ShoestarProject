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
		for(var paramIndex in allowThese) {
			if(stack.toLowerCase().startsWith(allowThese[paramIndex].toLowerCase())) {
				requestToAppend = requestToAppend + "&" + stack;
				break;
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
	return $("<"+tag+">").addClass("listHasError").text(msg);
}
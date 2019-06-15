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
	return $("<"+tagName+">").addClass("listHasError").text(msg);
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



/**
 * 입력 엘리먼트가 비어있는지 확인하는 함수
 * @param formElem input 또는 textarea jquery 엘리먼트
 * @returns 비어있다면 true
 */
function isEmpty(formElem) {
	if(formElem != null && formElem != undefined) {
		try {
			if(formElem.is("input[type='file']")) {
				// 파일일 경우
				return !checkFile(formElem);
			} else if(formElem.is("input, textarea")) {
				// 그 외의 경우
				return formElem.val().isEmpty();
			} else if(formElem.is("select")) {
				return formElem.find(":selected").prop("hidden") == true || formElem.val() == 0 || formElem.val() == "null";
			}
		} catch (e) {
		}
	}
	return true;
}

/**
 * 경고 문구를 제거하는 함수.<br>
 * 타겟의 가장 가까운 div를 찾고 해당 div에서 "has-error" 클래스를 삭제한 후<br>
 * 해당 div가 가진 span.error_msg 태그의 메시지를 삭제한다.
 * @param target 경고 문구를 제거할 컨트롤 또는 div 자체. 미입력시 모든 항목의 에러 메시지 삭제.
 * @returns 성공적으로 삭제했다면 true
 */
function clearWarning(target) {
	var result = true;
	if(target == null) {
		$(".has-error").removeClass("has-error");
		$(".error_msg").each(function() {
			$(this).html("");
		});
	} else {
		try {
			var he = target.is(".has-error") ? target : target.closest(".has-error");
			he.removeClass("has-error");
			he.find("span.error_msg").html("");
		} catch (e) {
			result = false;
		}
	}
	return result;
}

/**
 * 경고 메시지를 표시하는 함수.<br>
 * 타겟의 가장 가까운 div를 찾고 해당 div에 "has-error" 클래스를 추가한다.<br>
 * 그 후 해당 div가 가진 span.error_msg 태그에 msg를 출력한다.
 * @param target 경고 문구를 표시할 컨트롤 또는 div 자체.
 * @param msg 표시할 경고 메시지
 */
function showWarning(target, msg) {
	var div = target.closest("div");
	div.addClass("has-error");
	div.find("span.error_msg").css({"color":"darkred"}).html(msg);
}

/**
 * 폼의 모든 항목을 검사해서 :required 요소들이 비어있는지 확인해 결과 값을 돌려주고<br>
 * 해당 항목들에 대해 경고 메시지를 표시하는 함수
 * @param targetForm 검사할 form jquery 엘리먼트
 * @param allAtOnce 한 번에 모두 검사할지 여부
 * @returns 모든 필수 항목에 값이 존재한다면 true
 */
function checkAll(targetForm, allAtOnce) {
	var result = true;
	var hold = (allAtOnce == null || allAtOnce == undefined) ? false : allAtOnce;
	try {
		clearWarning();
		
		targetForm.find(":required").each(function() {
			if($(this).closest(".form-group").find(".error_msg").length == 0) {
				if($(this).attr("type") == "radio" || $(this).attr("type") == "checkbox") {
					$("input[name="+$(this).attr("name")+"]").on("change", function() {
						clearWarning($(this));
					});
				} else {
					$(this).on("change", function() {
						clearWarning($(this));
					});
				}
				
				$(this).parent().append($("<span>").addClass("error_msg"));
			}
			
			if(isEmpty($(this))) {
				if(!$(this).is("input[type='file']")) {
					showWarning($(this), "항목을 작성해주세요");	
				}
				$(this).focus();
				result = false;
				if(!hold)
					return result;
			}
		});
	} catch (e) {
		result = false;
	}
	return result;
}

/**
 * 폼 초기화 작업
 * @param form 초기화할 폼의 jQuery 객체
 */
function resetForm(form) {
	try {
		form.each(function() {
			this.reset();
		});
	} catch (e) {
		console.log("formReset() : 잘못된 매개변수");
	}
}

/**
 * 파일의 확장자를 확인하여 이미지 파일 여부를 확인하는 함수
 * @param item 확인할 file 형태의 input 객체
 * @returns 이미지 파일일 경우 true
 */
function checkFile(item) {
	var ext = item.val().split('.').pop().toLowerCase();
	
	/*
	 * 배열내의 값을 찾아서 인덱스를 반환하는 함수
	 * 요소가 없을 경우 -1 반환
	 * jQuery.inArray(찾을 값, 검색 대상의 배열)
	 */
	if(jQuery.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
		alert('gif, png, jpg, jpeg 파일만 업로드 할 수 있습니다.');
		return false;
	} else {
		return true;
	}
}

/**
 * 로그인이 필요한 ajax 후 오류 발생 시 처리하는 함수
 * @param xhr 상태값을 담은 xhr 변수
 * @returns 400 또는 500번 에러가 아닐 시 true
 */
function askForLogin(xhr) {
	if(xhr.status == 400 || xhr.status == 500) {
		alert("로그인이 필요한 작업입니다.");
		location.href = "/member/login";
	} else {
		return true;
	}
}
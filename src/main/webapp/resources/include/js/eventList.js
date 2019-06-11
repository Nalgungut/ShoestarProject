/* 함수명: chkSubmit(유효성 체크 대상, 메시지 내용)
 * 출력영역: alert
 * 예시: if(!chkSubmit($("#keyword"), "검색어를")) return;
 */
function chkSubmit(item, msg){
	if(item.val().replace(/\s/g,"")==""){
		alert(msg+ " 입력해 주세요.");
		item.val("");
		item.focus();
		return false;
	} else {
		return true;
	}
}

/* 함수명: checkForm(유효성 체크 대상, 메시지 내용)
 * 출력영역: placeholder 속성이용
 * 예시: if(!checkForm("#keyword", "검색어를")) return;
 */
function checkForm(item, msg){
	var message ="";
	if($(item).val().replace(/\s/g, "")==""){
		message = msg + "입력해 주세요.";
		$(item).attr("placeholder", message);
		return false;
	}else{
		return true;
	}
}


/* 함수명: chkData(유효성 체크 대상, 메시지 내용)
 * 출력영역: alert
 * 예시: if(!chkData("#keyword", "검색어를")) return;
 */
function chkData(item, msg){
	if($(item).val().replace(/\s/g,"")==""){
		alert(msg + " 입력해 주세요.");
		$(item).val("");
		$(item).focus();
		return false;
	} else {
		return true;
	}
}

/*formCheck(유효성 체크 대상, 출력 영역, 메시지 내용)
function formCheck(main, item, msg){
	if(main.val().replace(/\s/g,"")==""){
		item.html(msg+" 입력해 주세요.");
		main.val("");
		return false;
	} else {
		return true;
	}
}*/

// 이미지
/* 함수명 : chkFile(파일명)
 * 설명 : 이미지 파일 여부를 확인하기 위해 확장자 확인 함수
 * */
function chkFile(item) {
	/*
	 *배열내의 값을 찾아서 인덱스를 반환(요소가 없을 경우 -1 반환)
	 *jQuery.inArray(찾을 값, 검색 대상의 배열) 
	 */
	var ext = item.val().split('.').pop().toLowerCase();
	if(jQuery.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
		alert('gif, png, jpg, jpeg 파일만 업로드 할 수 있습니다.');
		return false;
	} else {
		return true;
	}
}

// 숫자 06-11
/*
 * 함수명 : (숫자)
 * 설명 : 값이 비어있으면 false
 * 출력영역: alert
 * 예시: if(!chkNumber($("#number"), "숫자를")) return;
 */
function chkNumber(item, msg){
	if(item.val() == null || item.val().replace(/\s/g,"")==""){
		alert(msg+ " 입력해 주세요.");
		item.val("");
		item.focus();
		return false;
	} else {
		return true;
	}
}

// 퍼센트 값 할인율 1~99
function chkPercent(item, msg){
	if(item.val() <= 0 || item.val() >= 100){
		alert(msg+ " 1~99값 사이의 숫자만 입력할 수 있습니다.");
		item.val("");
		item.focus();
		return false;
	} else {
		return true;
	}
}

// 할인가 값 1~999,999,999
function chkKrw(item, msg){
	if(item.val() <= 0 || item.val() >= 9999999){
		alert(msg+ " 1 ~ 9,999,998 사이의 숫자만 입력할 수 있습니다.");
		item.val("");
		item.focus();
		return false;
	} else {
		return true;
	}
}
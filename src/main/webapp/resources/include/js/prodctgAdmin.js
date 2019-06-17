/**
 * 상품 카테고리 관련 어드민 함수들
 */

/**
 * 카테고리를 추가하는 ajax
 * @param targetForm 대상 폼
 */
function insertCtg(targetForm) {
	$.ajax({
		url : "/admin/product/insertCtg",
		type : "post",
		data : targetForm.serialize(),
		error : function() {
			alert("서버 오류로 항목을 추가하는데 실패했습니다.");
		},
		success : function(data) {
			if(data == "true") {
				alert("성공적으로 추가되었습니다.");
				location.reload();
			} else {
				alert("항목을 추가하는데 실패했습니다.");
			}
		}
	});
}

/**
 * 카테고리를 수정하는 ajax
 * @param targetForm 대상 폼
 */
function updateCtg(targetForm) {
	$.ajax({
		url : "/admin/product/updateCtg",
		type : "post",
		data : targetForm.serialize(),
		error : function() {
			alert("서버 오류로 항목을 수정하는데 실패했습니다.");
		},
		success : function(data) {
			if(data == "true") {
				alert("성공적으로 수정되었습니다.");
				location.reload();
			} else {
				alert("항목을 수정하는데 실패했습니다.");
			}
		}
	});
}

/**
 * 카테고리를 삭제하는 ajax
 * @param targetForm 대상 폼
 */
function deleteCtg(targetForm) {
	$.ajax({
		url : "/admin/product/deleteCtg",
		type : "post",
		data : targetForm.serialize(),
		error : function() {
			alert("서버 오류로 항목을 삭제하는데 실패했습니다.");
		},
		success : function(data) {
			if(data == "true") {
				alert("성공적으로 삭제되었습니다.");
				location.reload();
			} else if(data == "referenceError") {
				alert("등록된 상품이 존재하는 분류는 삭제할 수 없습니다.");
				location.reload();
			} else {
				alert("항목을 삭제하는데 실패했습니다.");
			}
		}
	});
}


/* ------------------------- 색상 관련 ------------------------- */

/**
 * 색상 정보 중복 여부를 확인하는 함수
 * @param targetData 요청값으로 보낼 데이터
 * @param successCallback 성공시 콜백 함수
 * @param callbackParam 콜백 함수 파라미터
 */
function checkColorDuplicate(targetData, successCallback, callbackParam) {
	$.ajax({
		url : "/admin/product/checkColor",
		type : "post",
		data : targetData,
		error : function() {
			alert("서버 오류로 색상을 검사하는데 실패했습니다.");
		},
		success : function(data) {
			if(data == "true") {
				successCallback(callbackParam);
			} else {
				alert("중복 되는 색상 이름 또는 코드가 존재합니다.\n다른 값을 입력하세요.");
			}
		}
	});
}

/**
 * 색상을 추가하는 ajax
 * @param pcl_name 색상명
 * @param pcl_code 색상코드
 */
function insertColor(pcl_name, pcl_code) {
	var encodedData = "pcl_name=" + pcl_name + "&pcl_code=" + pcl_code;
	
	var insertFunction = function(targetData) {
		$.ajax({
			url : "/admin/product/insertColor",
			type : "post",
			data : targetData,
			error : function() {
				alert("서버 오류로 색상을 추가하는데 실패했습니다.");
			},
			success : function(data) {
				if(data == "true") {
					alert("성공적으로 추가되었습니다.");
					location.reload();
				} else {
					alert("색상을 추가하는데 실패했습니다.");
				}
			}
		});
	};
	
	checkColorDuplicate(encodedData, insertFunction, encodedData);
}

/**
 * 색상을 수정하는 ajax
 * @param targetForm 대상 폼
 */
function updateColor(targetForm) {
	var updateFunction = function(targetData) {
		$.ajax({
			url : "/admin/product/updateColor",
			type : "post",
			data : targetData.serialize(),
			error : function() {
				alert("서버 오류로 색상을 수정하는데 실패했습니다.");
			},
			success : function(data) {
				if(data == "true") {
					alert("성공적으로 수정되었습니다.");
					location.reload();
				} else {
					alert("색상을 수정하는데 실패했습니다.");
				}
			}
		});
	};
	
	checkColorDuplicate(targetForm.serialize(), updateFunction, targetForm);
}

/**
 * 카테고리를 삭제하는 ajax
 * @param targetForm 대상 폼
 */
function deleteColor(targetForm) {
	var deleteFunction = function(targetData) {
		$.ajax({
			url : "/admin/product/deleteColor",
			type : "post",
			data : targetData.serialize(),
			error : function() {
				alert("서버 오류로 색상을 삭제하는데 실패했습니다.");
			},
			success : function(data) {
				if(data == "true") {
					alert("성공적으로 삭제되었습니다.");
					location.reload();
				} else if(data == "referenceError") {
					alert("등록된 상품이 존재하는 색상은 삭제할 수 없습니다.");
				} else {
					alert("색상을 삭제하는데 실패했습니다.");
				}
			}
		});
	};
	
	checkColorDuplicate(targetForm.serialize(), deleteFunction, targetForm);
}

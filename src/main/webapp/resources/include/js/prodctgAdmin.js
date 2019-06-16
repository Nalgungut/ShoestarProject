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




/**
 * 색상을 추가하는 ajax
 * @param targetForm 대상 폼
 */
function insertColor(targetForm) {
	$.ajax({
		url : "/admin/product/insertColor",
		type : "post",
		data : targetForm.serialize(),
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
}

/**
 * 색상을 수정하는 ajax
 * @param targetForm 대상 폼
 */
function updateColor(targetForm) {
	$.ajax({
		url : "/admin/product/updateColor",
		type : "post",
		data : targetForm.serialize(),
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
}

/**
 * 카테고리를 삭제하는 ajax
 * @param targetForm 대상 폼
 */
function deleteColor(targetForm) {
	$.ajax({
		url : "/admin/product/deleteColor",
		type : "post",
		data : targetForm.serialize(),
		error : function() {
			alert("서버 오류로 색상을 삭제하는데 실패했습니다.");
		},
		success : function(data) {
			if(data == "true") {
				alert("성공적으로 삭제되었습니다.");
				location.reload();
			} else if(data == "referenceError") {
				alert("등록된 상품이 존재하는 색상은 삭제할 수 없습니다.");
				location.reload();
			} else {
				alert("색상을 삭제하는데 실패했습니다.");
			}
		}
	});
}

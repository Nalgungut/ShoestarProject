/**
 * 상품 관리 페이지에서만 사용하는 스크립트
 * @author 배정훈
 */


/**
 * 상품 분류 정보를 가져와 대상 select 항목에 추가하는 함수
 * @param selectTarget 우선 선택할 대상
 * @param ...targetList select 요소의 jquery 객체
 */
function getProdCtgList(selectTarget, ...targetList) {
	for (var index in targetList) {
		targetList[index].html("");
		targetList[index].append(emptyOption());
	}
	
	$.ajax({
		url: "/pctg/getList?pd_age=all&includeItemless=true",
		type: "get",
		dataType: "json",
		error: function() {
			alert("카테고리 정보를 읽어올 수 없었습니다.");
		},
		success: function(data) {
			if(!jQuery.isEmptyObject(data)) {
				$.each(data, function(index, ctgData) {
					for (var index in targetList) {
						var optionToAppend = $("<option>").attr("value", ctgData.pct_no).text(ctgData.pct_name);
						if(selectTarget == ctgData.pct_no) {
							optionToAppend.prop("selected", true);
						}
						targetList[index].append(optionToAppend);
					}
				});
			} else {
				for (var index in targetList) {
					targetList[index].append(createErrorList("항목없음", "option"));
				}
			}
		}
	});
}

/**
 * 색상 정보를 가져와 대상 select 요소에 추가하는 함수
 * @param selectTarget 우선 선택할 대상
 * @param ...targetList select 요소의 jquery 객체
 */
function getColorList(selectTarget, ...targetList) {
	for (var index in targetList) {
		targetList[index].html("");
		targetList[index].append(emptyOption());
	}
	
	$.ajax({
		url: "/pctg/getColor",		
		type: "get",
		dataType: "json",
		error: function() {
			alert("색상 정보를 불러올 수 없었습니다.");
		},
		success: function(data) {
			if(!jQuery.isEmptyObject(data)) {
				// li 태그 생성 및 추가
				$.each(data, function(index, stack) {
					for (var index in targetList) {
						var optionToAppend = $("<option>").attr("val", stack.pcl_no).text(stack.pcl_name);
						if(selectTarget == stack.pcl_no) {
							optionToAppend.prop("selected", true);
						}
						targetList[index].append(optionToAppend);
					}
				});
			} else {
				for (var index in targetList) {
					targetList[index].append(createErrorList("색상 정보가 없습니다.", "option"));
				}
			}
		}
	});
}

/**
 * 비어있는 항목의 option 객체
 * @returns jquery option 객체
 */
function emptyOption() {
	return $("<option>").prop({"hidden": true, "value" : "0"});
}


/**
 * 
 * 이미지 정보 수정을 위한 폼
 * @param pimVO 이미지 정보
 * @param pim_main 메인 이미지 파일 이름
 * @returns
 */
function createImageActions(pimVO, pim_main) {
	var pimEditForm = $("<form>").addClass("pimEditForm");
	
	// 이미지 번호를 담는 숨겨진 인풋
	var hiddenPimNo = $("<input>").prop({
		"type":"hidden",
		"name":"pim_no",
		"value":pimVO.pim_no
	});
	// pi_no를 담는 숨겨진 인풋
	var hiddenPiNo = $("<input>").prop({
		"type":"hidden",
		"name":"pi_no",
		"value":pimVO.pi_no
	});
	// 기존 파일 이름을 담는 숨겨진 인풋
	var hiddenPimFile = $("<input>").prop({
		"type":"hidden",
		"name":"pim_file",
		"value":pimVO.pim_file
	});
	
	
	// 메인 이미지 여부
	var pimMainDiv = $("<div>").addClass("form-inline text-left");
	
	var pimMainLabel = $("<label>").addClass("text-center").text("대표이미지").prop({
		"for":"pimPr_"+pimVO.pim_no
	}).css({
		"width":"50%"
	});
	var pimMain = $("<input>").prop({
		"type":"checkbox",
		"name":"updatePimMain",
		"value":"true",
		"id":"pimMain_"+pimVO.pim_no
	});
	if(pim_main == pimVO.pim_file) {
		pimMain.prop("checked", true);
	}
	pimMainDiv.append(pimMainLabel).append(pimMain);
	
	// 우선순위
	var pimPriDiv = $("<div>").addClass("form-inline");
	
	// 우선순위 레이블
	var pimPriLabel = $("<label>").text("우선순위").prop({
		"for":"pimPr_"+pimVO.pim_no
	}).css({
		"width":"50%"
	});
	// 우선순위 인풋
	var pimPriority = $("<input>").prop({
		"type":"number",
		"name":"pim_priority",
		"value":pimVO.pim_priority,
		"required":true,
		"id":"pimPr_"+pimVO.pim_no,
		"maxlength":"2"
	}).addClass("form-control").css({
		"width":"50%"
	});
	pimPriDiv.append(pimPriLabel).append(pimPriority);
	
	// 파일 인풋
	var pimFile = $("<input>").prop({
		"type":"file",
		"name":"file"
	}).addClass("");
	
	// 수정 완료 버튼
	var pimSubmit = $("<button>").addClass("btn-block").prop({
		"type":"button"
	}).text("수정").addClass("btn btn-default btn-sm").on("click", function() {
		if(checkAll(pimEditForm)) {
			if(pimFile.val() != null && pimFile.val() != "" && isEmpty(pimFile)) {
				alert("이미지 파일만 선택 가능합니다.");
				return;
			}
			
			var pri = pimPriority.val();
			
			if(isNaN(pri) || parseInt(pri) >= 100 || parseInt(pri) < 1) {
				alert("우선순위는 1~99 사이의 숫자만 가능합니다.");
				return;
			}
			
			pimEditForm.ajaxForm({
				url : "/admin/product/pimUpdate",
				type : "post",
				enctype : "multipart/form-data",
				dataType : "text",
				error : function() {
					alert("서버 오류로 이미지 수정에 실패했습니다.");
				},
				success : function(result) {
					if(result=="true") {
						alert("성공적으로 수정되었습니다.");
						location.reload();
					} else {
						alert("이미지를 수정할 수 없었습니다.");
					}
				}
			}).submit();
		}
	});
	
	// 이미지 제거 버튼
	var pimDelBtn = $("<button>").prop("type", "button").addClass("text-center submenuActions").html(
		"삭제 <span class='glyphicon glyphicon-minus'></span>"
	).on("click", function() {
		if(confirm("정말로 삭제하시겠습니까?")) {
			$.ajax({
				url :"/admin/product/pimDelete",
				type : "post",
				data : "pim_no=" + pimVO.pim_no,
				dataType : "text",
				error : function(xhr) {
					alert("시스템 오류로 이미지를 삭제할 수 없었습니다.");
				},
				success : function(data) {
					if(data == "true") {
						alert("성공적으로 삭제되었습니다.");
						location.reload();
					} else {
						alert("이미지를 삭제할 수 없었습니다.");
					}
				}
			});
		}
	});
	
	// 조립
	var pimDiv = $("<div>").addClass("pimSubmit");
	pimEditForm.append(hiddenPimNo).append(pimFile).append(pimMainDiv)
		.append(pimPriDiv).append(pimSubmit).append(pimDelBtn);
	pimDiv.append(pimEditForm);
	
	return pimDiv;
}


/**
 * 이미지를 상품에 추가하는 함수
 */
function insertPim(pimInsertForm) {
	
	if(checkAll(pimInsertForm)) {
		var pri = pimInsertForm.find('input[name="pim_priority"]').val();
		if(isNaN(pri) || parseInt(pri) >= 100 || parseInt(pri) < 1) {
			alert("우선순위는 1~99 사이의 숫자만 가능합니다.");
			return;
		}
		
		pimInsertForm.ajaxForm({
			url : "/admin/product/pimInsert",
			type : "post",
			enctype : "multipart/form-data",
			dataType : "text",
			error : function() {
				alert("서버 오류로 이미지 수정에 실패했습니다.");
			},
			success : function(result) {
				if(result=="true") {
					alert("성공적으로 등록 되었습니다.");
					location.reload();
				} else {
					alert("이미지를 등록할 수 없었습니다.");
				}
			}
		}).submit();
	}
}

/* ############################# 상품 색상 ############################# */

function unoccupiedColors(pd_no, callbackFunction, callbackParam) {
	$.ajax({
		url :"/admin/product/unoccupiedColors",
		type : "post",
		data : "pd_no=" + pd_no,
		dataType : "text",
		error : function(xhr) {
			alert("시스템 오류로 색상 정보를 불러올 수 없었습니다.");
		},
		success : function(data) {
			callbackFunction(data, callbackParam);
		}
	})
}

/**
 * 상품 색상을 추가하는 ajax
 * @param targetForm 대상 폼
 */
function insertProdins(targetForm, pd_no) {
	$.ajax({
		url : "/admin/product/insertProdins",
		type : "post",
		data : targetForm.serialize(),
		error : function() {
			alert("서버 오류로 색상을 추가하는데 실패했습니다.");
		},
		success : function(data) {
			if(!isNaN(data)) {
				alert("성공적으로 추가되었습니다.");
				location.href = "?pi_no=" + data;
			} else {
				alert("상품 색상을 추가하는데 실패했습니다.");
			}
		}
	});
}

/**
 * 상품 색상을 삭제하는 ajax
 * @param targetForm 대상 폼
 */
function deleteProdins(targetForm, pd_no) {
	$.ajax({
		url : "/admin/product/deleteProdins",
		type : "post",
		data : targetForm.serialize(),
		error : function() {
			alert("서버 오류로 항목을 삭제하는데 실패했습니다.");
		},
		success : function(data) {
			if(data == "true") {
				alert("성공적으로 삭제되었습니다.");
				location.href = "/admin/product/detail/" + pd_no;
			} else if(data == "referenceError") {
				alert("등록된 상품이 존재하거나 판매 기록이 존재해서 삭제할 수 없습니다.");
				location.href = "/admin/product/detail/" + pd_no;
			} else {
				alert("항목을 삭제하는데 실패했습니다.");
			}
		}
	});
}


/* ############################# 상품 재고 ############################# */

/**
 * 적절한 신발 사이즈인지 체크하는 함수
 * @param value 체크할 값
 * @returns 1 ~ 400 사이의 값일 경우 true
 */
function isShoesSize(value) {
	value = parseInt(value);
	var result = !isNaN(value) && Number.isInteger(value) && value >= 1 && value <= 400;
	if(!result) {
		alert("신발 사이즈는 1 ~ 400 사이의 값이어야 합니다.");
	}
	return result;
}

/**
 * 적절한 상품 수량인지 체크하는 함수
 * @param value 체크할 값
 * @returns 0 ~ 100000000 사이의 값일 경우 true
 */
function isStockQty(value) {
	value = parseInt(value);
	var result = !isNaN(value) && Number.isInteger(value) && value >= 0 && value <= 100000000;
	if(!result) {
		alert("수량은 0 ~ 100000000(1억) 사이의 값이어야 합니다.");
	}
	return result;
}


/**
 * 재고 정보 중복 여부를 확인하는 함수
 * @param targetData 요청값으로 보낼 데이터
 * @param successCallback 성공시 콜백 함수
 * @param callbackParam 콜백 함수 파라미터
 */
function checkSizeDuplicate(targetData, successCallback, callbackParam) {
	$.ajax({
		url : "/admin/product/isSafeSize",
		type : "post",
		data : targetData,
		error : function() {
			alert("서버 오류로 사이즈를 검사하는데 실패했습니다.");
		},
		success : function(data) {
			if(data == "true") {
				successCallback(callbackParam);
			} else {
				alert("중복 되는 사이즈가 존재합니다.\n다른 값을 입력하세요.");
			}
		}
	});
}

/**
 * 재고 정보를 추가하는 ajax
 */
function insertStock(targetForm) {
	var encodedData = targetForm.serialize();
	
	var insertFunction = function(targetData) {
		$.ajax({
			url : "/admin/product/insertProdStock",
			type : "post",
			data : targetData,
			error : function() {
				alert("서버 오류로 재고 정보를 추가하는데 실패했습니다.");
			},
			success : function(data) {
				if(data == "true") {
					alert("성공적으로 추가되었습니다.");
					location.reload();
				} else {
					alert("재고 정보를 추가하는데 실패했습니다.");
				}
			}
		});
	};
	
	checkSizeDuplicate(encodedData, insertFunction, encodedData);
}

/**
 * 재고 정보를 수정하는 ajax
 * @param targetForm 대상 폼
 */
function updateStock(targetForm) {
	var encodedData = targetForm.serialize();
	
	var updateFunction = function(targetData) {
		$.ajax({
			url : "/admin/product/updateProdStock",
			type : "post",
			data : targetData,
			error : function() {
				alert("서버 오류로 재고 정보를 수정하는데 실패했습니다.");
			},
			success : function(data) {
				if(data == "true") {
					alert("성공적으로 수정되었습니다.");
					location.reload();
				} else {
					alert("재고 정보를 수정하는데 실패했습니다.");
				}
			}
		});
	};
	
	checkSizeDuplicate(encodedData, updateFunction, encodedData);
}

/**
 * 재고 정보를 삭제하는 ajax
 * @param targetForm 대상 폼
 */
function deleteStock(targetForm) {
	$.ajax({
		url : "/admin/product/deleteProdStock",
		type : "post",
		data : targetForm.serialize(),
		error : function() {
			alert("서버 오류로 재고 정보를 삭제하는데 실패했습니다.");
		},
		success : function(data) {
			if(data == "true") {
				alert("성공적으로 삭제되었습니다.");
				location.reload();
			} else if(data == "referenceError") {
				alert("등록된 상품이 존재하는 재고 정보는 삭제할 수 없습니다.");
			} else {
				alert("재고 정보를 삭제하는데 실패했습니다.");
			}
		}
	});
}
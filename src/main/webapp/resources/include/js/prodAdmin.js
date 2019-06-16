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
	
	// 조립
	var pimDiv = $("<div>").addClass("pimSubmit");
	pimEditForm.append(hiddenPimNo).append(pimFile).append(pimMainDiv).append(pimPriDiv).append(pimSubmit);
	pimDiv.append(pimEditForm);
	
	return pimDiv;
}


/**
 * 이미지를 상품에 추가하는 함수
 */
function insertPim(pimInsertForm) {
	if(checkAll(pimInsertForm)) {
		var pri = pimInsertForm.find("input[type='number']").val();
		
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
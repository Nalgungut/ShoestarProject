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
 * 이미지 정보 수정을 위한 폼
 * @param pimVO
 * @returns
 */
function createImageActions(pimVO, pim_main) {
	var pimEditForm = $("<form>");
	
	var hiddenPimNo = $("<input>").prop({
		"type":"hidden",
		"name":"pim_no",
		"value":pimVO.pim_no
	});
	var pimPriority = $("<input>").prop({
		"type":"number",
		"name":"pim_priority",
		"value":pimVO.pim_priority,
		"required":true
	});
	
	// TODO: 집가서 할 것
}
/**
 * 상품 관리 페이지에서만 사용하는 스크립트
 * @author 배정훈
 */


/**
 * 상품 분류 정보를 가져와 대상 select 항목에 추가하는 함수
 * @param ...targetList select 요소의 jquery 객체
 */
function getProdCtgList(...targetList) {
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
						targetList[index].append($("<option>").attr("value", ctgData.pct_no).text(ctgData.pct_name));
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
 * @param ...targetList select 요소의 jquery 객체
 */
function getColorList(...targetList) {
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
						targetList[index].append($("<option>").attr("val", stack.pcl_no).text(stack.pcl_name));
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
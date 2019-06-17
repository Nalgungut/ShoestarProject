/**
 * 항상 실행 되는 공용 스크립트
 */


/**
 * aop 오류 방지를 위해 빈 login 객체를 생성하거나
 * 추후 쿠키를 통한 자동 로그인 기능을 위한 함수
 */

$(function() {
	checkLogin();
	
	$("#searchKeyword").keydown(function(keyEvent) {
		if(keyEvent.keyCode == 13) {
			doSearch();
		}
	});
	
	$("i.zmdi-search").click(function() {
		doSearch();
	});
});

function checkLogin() {
	$.ajax({
		url : "/checkLogin",
		type : "post",
		dataType : "text",
		error : function(xhr) {
			// 통신 실패?
		},
		success : function(data) {
			if (data == "true") {
				// 성공
			} else {
				// 실패
			}
		}
	});
}

function doSearch() {
	var keyword = $("#searchKeyword").val();
	if(keyword == null || keyword.replace(/\s/g, "") == "") {
		$("#searchKeyword").focus();
	} else {
		location.href = "/product/showList?keyword=" + keyword;
	}
}
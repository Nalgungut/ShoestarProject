/**
 * 항상 실행 되는 공용 스크립트
 */


/**
 * aop 오류 방지를 위해 빈 login 객체를 생성하거나
 * 추후 쿠키를 통한 자동 로그인 기능을 위한 함수
 */

$(function() {
	checkLogin();
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
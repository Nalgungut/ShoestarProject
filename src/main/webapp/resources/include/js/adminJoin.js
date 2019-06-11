//비밀번호와 비밀번호 확인 일치여부
function passwordCheck() {
	if($("#adm_pwd").val() != $("#adminUserPwdCheck").val()) {
		alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		$("#adminUserPwdCheck").focus();
		$("#adminUserPwdCheck").val("");
		return false;
	}else {
		return true;
	}
}

//아이디에 비밀번호 포함 여부 확인
function idPwdCheck() {
	var adm_id = $("#adm_id").val();
	var adm_pwd = $("#adm_pwd").val();
	if(adm_pwd.indexOf(adm_id) > -1) {
		alert("비밀번호에 아이디를 포함할 수 없습니다.");
		$("#adm_pwd").val("");
		$("#adm_pwd").focus();
		return false;
	}else {
		return true;
	}
}

var idConfirm = -1;
$(function(){
	/*adminCodeCheck();*/
	//사용자에게 요구사항에 대한 문자열로 배열 초기화
	var message = ["영문, 숫자를 섞어, 6~12자로 입력해주세요",
					"영문, 숫자, 특수문자만 가능합니다. 8~15자로 입력해주세요.",
					"비밀번호와 비밀번호 확인란은 값이 일치해야 합니다.",
					"- 를 포함하여 입력해주세요. ex)010-1234-5678"];
	
	$('.error').each(function(index){
		$('.error').eq(index).html(message[index]);
	});
	
	$('#adm_id, #adm_pwd, #adminUserPwdCheck, #adm_phone').bind("focus", function(){
		var mem_no = $("#adm_id, #adm_pwd, #adminUserPwdCheck, #adm_phone").index(this);
		//console.log("대상 : " + dix);
		$(this).parents(".form-group").find(".error").html(message[mem_no]);
	});
	
	//아이디 중복체크
	$("#adminIdConfirmBtn").click(function(){
		if(!formCheck($('#adm_id'), $('.error:eq(0)'), "아이디를"))  return;
		else if(!inputVerify(0,'#adm_id', '.error:eq(0)')) return;
		else {
			$.ajax({
				 	url: "/adminMember/adminUserIdConfirm",
				 	type: "post",
				 	data: "adm_id="+$("#adm_id").val(),
				 	error: function(){
				 		alert('사이트 접속문제로 정상접속이 되지 않았습니다.\n잠시 후 다시 시도해 주세요~');
				 	},
				 	success: function(resultData){
				 		console.log("resultData "+ resultData);
				 		if(resultData=="1") {
				 			$("#adm_id").parents(".form-group").find(".error").html("현재 사용중인 아이디입니다.");
				 		}else if(resultData=="2") {
				 			$("#adm_id").parents(".form-group").find(".error").html("사용 가능한 아이디입니다.");
				 			idConfirm = 2;
				 		}
				 	}
			});
		}
	});
	
	//회원수정 테스트
	$("#adminModifyBtn").click(function(){
		location.href="/adminMember/adminModify";
	}); 
	
	//확인 버튼 클릭 시 처리 이벤트
	$("#adminJoinInsert").click(function(){
		//입력값 체크
		if(!formCheck($('#adm_id'), $('.error:eq(0)'), "아이디를")) return;
		else if(!inputVerify(0, '#adm_id', '.error:eq(0)')) return;
		else if(!formCheck($('#adm_pwd'), $('.error:eq(1)'), "비밀번호를")) return;
		else if(!inputVerify(1, '#adm_pwd', '.error:eq(1)')) return;
		else if(!idPwdCheck()) return;
		
		else if(!formCheck($('#adminUserPwdCheck'), $('.error:eq(2)'), "비밀번호 확인을")) return;
		else if(!inputVerify(1, '#adminUserPwdCheck', '.error:eq(2)')) return;
		else if(!passwordCheck()) return;
		
		else if(!formCheck($('#adm_phone'), $('.error:eq(3)'), "전화번호를")) return;
		else if(!inputVerify(2, '#adm_phone', '.error:eq(3)')) return;
		else if(!formCheck($('#adm_name'), $('.error:eq(5)'), "이름을")) return;
		else if(!formCheck($('#adm_email'), $('.error:eq(6)'), "이메일을")) return;
		else if(idConfirm!=2) {
			alert("아이디 중복 체크를 해주세요");
			return;
		}else {
			
			$("#adm_email").val($("#adm_email").val()+"@"+$("#emailDomain").val());
			
			$("#adminMemberForm").attr({
				"method":"post",
				"action":"/adminMember/adminJoin"
			});
			$("#adminMemberForm").submit();
		}
	});
	
	$("#adminJoinCancel").click(function(){
		location.href-"/adminMember/adminLogin";
	});
	
	$("#adminJoinReset").click(function(){
		$("#adminMemberForm").each(function(){
			this.reset();
		});
	});
});
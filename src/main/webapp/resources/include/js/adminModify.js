var adminLoginUserId ="";
$(function(){
	/*adminCodeCheck();*/
	emailCheck();
	
	var message = ["기존 비밀번호를 입력해 주세요",
		"영문 숫자 특수문자만 가능합니다(8~16자)",
		"비밀번호와 비밀번호 확인란은 값이 일치해야 합니다",
		"'-'포함하여 입력해 주세요"];
	$('.error').each(function(index){
		$('.error').eq(index).html(message[index]);
	});
	
	$("#adm_oldUserPwd, #adm_pwd, #adminUserPwdCheck, #adm_phone").bind("focus", function(){ 
		var adm_no = $("#adm_oldUserPwd, #adm_pwd, #adminUserPwdCheck, #adm_phone").index(this);
		//console.log("대상: "+ mem_no):
		$(this).parents(".form-group").find(".error").html(message[adm_no]);
	});
	
	//확인버튼 클릭시 처리 이벤트
	$("#adminModify").click(function(){
		//입력값 체크
		if(!formCheck($('#adm_oldUserPwd'), $('.error:eq(0)'), "기존 비밀번호를")) return;
		else if(!inputVerify(1, '#adm_oldUserPwd', '.error:eq(0)')) return;
		else if(!formCheck($('#adm_phone'), $('.error:eq(3)'), "전화번호를")) return;
		else if(!inputVerify(2, '#adm_phone', '.error:eq(3)')) return;
		else if(!formCheck($('#adm_email'), $('.error:eq(4)'), "이메일주소를")) return;
		else {
				if($('#adm_pwd').val()!="") {
					if(!inputVerify(1, '#adm_pwd', '.error:eq(1)')) return;
					/*if(!idPwdCheck()) return;*/
				}
				if($('#adminUserPwdCheck').val()!="") {
					if(!inputVerify(1, '#adminUserPwdCheck', '.error:eq(2)')) return;
				}
				if($('#adm_pwd').val()!="" && $('#adminUserPwdCheck').val()!="") {
					if(!passwordCheck()) return;
				}
				$("#adm_email").val($("#adm_email").val()+"@"+$("#emailDomain").val());
				$("#adminMemberForm").attr({
					"method":"post",
					"action":"/adminMember/adminModify"
				});
				$("#adminMemberForm").submit();
		}
	});
	
	$("#adminModifyReset").click(function(){
		$("#adminMemberForm").each(function(){
			this.reset();
		});
	});
	
	$("#adminModifyCancel").click(function(){
		location.href="/adminMember/adminLogin";
	});
});

function passwordCheck() {
	if($("#adm_pwd").val()!=$("#adminUserPwdCheck").val()) {
		alert("패스워드 입력이 일치하지 않습니다");
		$("adm_pwd").val("");
		$("#adminUserPwdCheck").val("");
		$("#adm_pwd").focus();
		return false;
	}
	return true;
}

/*function idPwdCheck() {
	var adm_id = adminLoginUserId;
	var adm_pwd = $("#adm_pwd").val();
	if(adm_pwd.indexOf(adm_id)>-1) {
		alert("비밀번호에 아이디를 포함할 수 없습니다");
		$("#adm_pwd").val("");
		$("#adm_pwd").focus();
		return false;
	}else {
		return true;
	}
}*/

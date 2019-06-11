$(function(){
	/*codeCheck();*/ 
        		$('#adm_id, #adm_pwd').bind("keyup", function(){
        			$(this).parents("div").find(".error").html("");
        		});
        		//로그인 버튼 클릭시 처리 이벤트
        		$("#adminLoginBtn").click(function(){
        			if(!formCheck($('#adm_id'), $('.error:eq(0)'), "아이디를")) return;
        			else if(!inputVerify(0,'#adm_id','.error:eq(0)')) return;
        			else if(!formCheck($('#adm_pwd'),$('.error:eq(1)'), "비밀번호를")) return;
        			else if(!inputVerify(1,'#adm_pwd', '.error:eq(1)')) return;
        			else{
        				$("#adminLoginForm").attr({
        					"method":"POST",
        					"action":"/member/adminLogin"
        				});
        				$("#adminLoginForm").submit();
        			}
        		});
        		
        	 	//회원가입 버튼 클릭시 처리 이벤트
        		$("#adminJoinBtn").click(function(){
        			location.href="/member/adminJoin";
        		}); 
        	});
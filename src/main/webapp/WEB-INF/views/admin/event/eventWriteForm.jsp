<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 등록</title>


<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />

<link rel="stylesheet" href="/resources/include/css/eventList.css" >
<script type="text/javascript"
	   src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/eventList.js"></script>
<script type="text/javascript" src="/resources/include/js/jquery.form.min.js"></script>

<style type="text/css">
	.Aventcontainer{width: 80%; height: 70%;}
</style>

<script type="text/javascript">
	$(function() {
		$("#insertFormBtn").click(function(){
			if(!chkSubmit($('#ev_title'),"이벤트 제목을")) return;
			else if (!chkSubmit($('#ev_content'),"이벤트 내용을")) return;
			
			else if (!chkSubmit($('#ev_img'),"이벤트 이미지를")) return;
			else if (!chkFile($('#ev_img'))) return;
			
			else if (!chkSubmit($('#ev_thumb'),"이벤트 썸네일을")) return;
			else if (!chkFile($('#ev_thumb'))) return;
			else{
				$("#insertForm").attr({
					"method" : "post",
					"enctype" : "multipart/form-data",
					"action" : "/admin/event/insert"
				});
				$("#insertForm").submit();
				
				/* 
  				$("#insertForm").ajaxForm({
  					action : "/admin/event/insert",
  					type : "post",
  					enctype : "multipart/form-data", // 필수
  					dataType : "text",
  					error : function() {
  						alert('시스템 오류 입니다. 관리자에게 문의 하세요');
  					},
  					success : function(data) {
  						console.log(data);
  						if(data=="성공"){
  							dataReset();
  							listData();
  							location.href="/admin/event/list";
  						} else {
  							alert("["+ data + "]\n등록에 문제가 있어 완료하지 못하였습니다. 잠시 후 다시 시도해 주세요.");
  							dataReset();
  						}
  					}
  				});
  			
  				$("#insertForm").submit();
  				 */
			}
 		});
		
		// 목록 가기
		$("#eventListBtn").click(function(){
			//if($("#ev_title") )
			
			location.href="/admin/event/list";
		});
		
		// 취소 버튼
		$("#eventCancelBtn").click(function(){
			dataReset();
		});
	})// function
	
	function dataReset() {
		$("#insertForm").each(function(){
			this.reset();
		});
	}
</script>

</head>
<body>
	<div class="Aventcontainer">
		<div class="Avent_header"><h2 id="AEvconTitle">이벤트 등록</h2>		
		 <hr />
		 </div>

		<div id="insertDiv">		
			<form id="insertForm">
				<table id="insertTable">
					<caption class="Acaption">이벤트 정보</caption>
					
					<tr>
						<td class="Avent_td gray">이벤트명</td>
						<td class="Avent_tdInput"><input type="text" id="ev_title" name="ev_title" maxlength="30" size="100"/></td>	
					</tr>
					
					<tr>
						<td class="Avent_td gray">이벤트 내용</td>
						<td class="Avent_tdInput marginLeft"><textarea id="ev_content" name="ev_content" rows="7" cols="130" maxlength="1000"></textarea></td>
					</tr>
					
					<tr>
						<td class="Avent_td gray">이벤트 이미지</td>
						<td class="Avent_tdInput"><input type="file" id="ev_img" name="files[0]" /></td>
					</tr>
					
					<tr>
						<td class="Avent_td gray">이벤트 썸네일</td>
						<td class="Avent_tdInput"><input type="file" id="ev_thumb" name="files[1]" /></td>
					</tr>
					
					<tr>
						<td class="Avent_td gray">이벤트 종료일</td>
						<td class="Avent_tdInput"><input type="date" id="ev_edate" name="ev_edate" /></td>
					</tr>
				</table>
							<div class="btns">			
								
								<input type="button" value="저장" id="insertFormBtn" /> 
								<input type="button" value="취소" id="eventCancelBtn"> 
								<input type="button" value="목록" id="eventListBtn">
							</div>
		
			</form>	
		</div>		
				
	</div>
	
</body>
</html>
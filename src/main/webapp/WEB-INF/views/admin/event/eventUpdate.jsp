<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="now" value="<%=new java.util.Date()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>^^</title>

<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />

<link rel="stylesheet" href="/resources/include/css/eventList.css" >
<script type="text/javascript"
	   src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/eventList.js"></script>
<script type="text/javascript" src="/resources/include/js/jquery.form.min.js"></script>

<style type="text/css">
	/* .Aventcontainer{height: 50%; width: 50%;} */
	#ViewImg img{width: 220px; height: 170px; margin-top: 6px;}
	#ViewThumb img{width: 150px; height: 70px; margin-top: 6px;}
	#ViewThumb img#min{width: 150px; height: 70px; margin-top: 6px; margin-left: 3px;}
</style>

<script type="text/javascript">
	$(function() {
		
		$("#updateFormBtn").click(function(){
			if(!chkSubmit($('#ev_title'),"이벤트 제목을")) return;
			else if (!chkSubmit($('#ev_content'),"이벤트 내용을 ")) return;
			
/* 			else if (!chkSubmit($('#ev_img'),"이벤트 이미지를 ")) return;
			else if (!chkFile($('#ev_img'))) return;
			
			else if (!chkSubmit($('#ev_thumb'),"이벤트 썸네일을 ")) return;
			else if (!chkFile($('#ev_thumb'))) return; */
			else{
				$("#updateForm").attr({
					"method" : "post",
					"enctype" : "multipart/form-data",
					"action" : "/admin/event/update"
				});
				$("#updateForm").submit();
				
			}
 		});
		
		
		// 취소 선택
		$("#eventCancelBtn").click(function() {
			dataReset();
		});
		
		// 목록 선택
		$('#eventListBtn').click(function() {
			location.href="/admin/event/list";
		})
		
	}); // function 종료

	
	function dataReset() {
		$("#updateForm").each(function(){
			this.reset();
		});
	}
</script>

</head>
<body>
		<div class="Aventcontainer">
		<div class="Avent_header"><h2 id="AEvconTitle">이벤트 수정</h2>		
		 <hr />
		 </div>

		<div id="updateDiv">		
			<form id="updateForm">
				<input type="hidden" id="ev_no" value="${up.ev_no}" name="ev_no" />
			
				<table id="updateTable">
					<caption class="Acaption">이벤트 정보</caption>
					
					<tr>
						<td class="Avent_td gray">이벤트명</td>
						<td class="Avent_tdInput"><input type="text" id="ev_title" name="ev_title" maxlength="30" size="100"  value="${up.ev_title}"  /></td>	
					</tr>
					
					<tr>
						<td class="Avent_td gray">이벤트 내용</td>
						<td class="Avent_tdInput marginLeft"><textarea id="ev_content" name="ev_content" rows="2" cols="130" maxlength="1000" >${up.ev_content}</textarea></td>
					</tr>
					
					<tr>
						<td class="Avent_td gray">이벤트 이미지</td>
						<td class="Avent_tdInput">
							<input type="file" id="ev_img" name="files[0]"  />
							<input type="hidden" name="ev_img" value="${up.ev_img}" /> <!-- 기존값 가져오는 거 -->
							<div id="ViewImg">
								<img src="/shoestarStorage/event/${up.ev_img}">
							</div>
						</td>
					</tr>
					
					<tr>
						<td class="Avent_td gray">이벤트 썸네일</td>
						<td class="Avent_tdInput"><input type="file" id="ev_thumb" name="files[1]" />
							<input type="hidden" name="ev_thumb" value="${up.ev_thumb}" /> <!-- 기존값 가져오는 거 -->
							<div id="ViewThumb">
								<img src="/shoestarStorage/eventThumb/${up.ev_thumb}">
								<img id="min" src="/shoestarStorage/eventThumb/thumbnail/thumbnail_${up.ev_thumb}">
							</div>
						</td>
					
					</tr>
					
					<tr>
						<td class="Avent_td gray">이벤트 종료일</td>
						<td class="Avent_tdInput"><input type="date" id="ev_edate" name="ev_edate" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${up.ev_edate}" />"/></td>
					</tr>
				</table>
							<div class="btns">			
								
								<input type="button" value="저장" id="updateFormBtn" /> 
								<input type="button" value="취소" id="eventCancelBtn"> 
								<input type="button" value="목록" id="eventListBtn">
							</div>
		
			</form>	
		</div>		
				
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
						<td class="Avent_tdInput"><input type="text" id="ev_title" name="ev_title" maxlength="30" size="100"  value="${up.ev_title}"  /></td>	
					</tr>
					
					<tr>
						<td class="Avent_td gray">이벤트 내용</td>
						<td class="Avent_tdInput"><textarea id="ev_content" name="ev_content" rows="2" cols="150" maxlength="1000" ></textarea></td>
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
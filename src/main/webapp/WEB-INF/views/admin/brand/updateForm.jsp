<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			
			<!-- 브라우저의 호환성 보기 모드를 막고, 해당 브라우저에서 지원하는 가장 최신버전의 방식으로 HTML보여주도록 설정하는법 -->
			<meta name="viewport" content="width=device-width initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
			<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
			
			<title>Insert title here</title>
			
			<!--모바일 웹 페이지 설정-->
			<link rel="shortcut icon" href="../image/icon.png"/>
			<link rel="apple-touch-icon" href="../image/icon.png"/>
		<!-- 	<link rel="stylesheet" type="text/css" href="../css/bootstrap.css"> -->
			<!--모바일 웹 페이지 설정 끝-->
			<!--<link rel="stylesheet" type="text/css" href=""/>-->	
			
			<!-- 인터넷익스8 이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다. -->
			<!-- [if it IE 9] > <script src="js/html5shiv.js"></script><![endif] -->
			<!-- <link rel="stylesheet" type="text/css" href="../js/jquery-1.12.4.min.js">
			<!-- jQuery프레임워크 참조 -->         
     		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
      		
      		<!-- <link rel="stylesheet" type="text/css" href="/resources/include/css/bootstrap.css"/> -->
     	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
     	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
     	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
     	    <script type="text/javascript" src="/resources/include/js/searchNotice.js"></script>
     	    
    	    <script type="text/javascript">
				$(function(){
					//수정 버튼 클릭 시 처리이벤트
					$("#boardUpdateBtn").click(function(){
						//입력값 체크
						if(!chkSubmit($('#no_subject'),"제목을")) return;
						else if(!chkSubmit($('#no_content'),"작성할 내용을")) return;
						else{
							$("#f_updateForm").attr({
								"method" : "post",
								"action" : "/admin/brand/noticeUpdate"
							});
							$("#f_updateForm").submit();
							alert("수정이 완료되었습니다.");
						}
					});
					//취소버튼 클릭 시 처리이벤트
					$("#boardCancel").click(function(){
						$("#f_updateForm").each(function(){
							this.reset();
						});
					});
					//목록 버튼 클릭 시 처리이벤트
					$("#boardListBtn").click(function(){
						location.href="/admin/brand/adminNoticeList";
					});
				});
			</script>
		</head>
	<body>
		<div class="contentContainer container-fluid">
			<div class="contentTit page-header"><h3 class="text-center">공지사항 글수정</h3></div>
			
			<div class="contentTB text-center">
				<form id="f_updateForm" name="f_updateForm">
					<input type="hidden" id="no_no" name="no_no" value="${updateData.no_no}"/>
					<input type="hidden" id="no_kind" name="no_kind" value="${updateData.no_kind}"/>
					<%-- <input type="hidden" name="pageNum" id="pageNum" value="${data.pageNum}"> 
					<input type="hidden" name="amount" id="amount" value="${data.amount}"> --%>
					
					<table class="table table-bordered">
						<colgroup>
							<col width="17%"/>
							<col width="33%"/>
							<col width="17%"/>
							<col width="33%"/>
						</colgroup>
						<tbody>
							<tr>
								<td>글번호</td>
								<td class="text-left">${updateData.no_no}</td>
								<td>작성일</td>
								<td class="text-left">${updateData.no_date}</td>
							</tr>
							<tr>
								<td>글제목</td>
								<td colspan="4" class="text-left"><input type="text" name="no_subject" id="no_subject"
								value="${updateData.no_subject}" class="form-control"/></td>
							</tr>
							<tr class="table-height">
								<td>내용</td>
								<td colspan="4" class="text-left"><textarea name="no_content" id="no_content"
								 class="form-control" rows="8">${updateData.no_content}</textarea></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			
			<div class="contentBtn text-right">
				<input type="button" value="수정" id="boardUpdateBtn" class="btn btn-success">
				<input type="button" value="취소" id="boardCancelBtn" class="btn btn-success">
				<input type="button" value="목록" id="boardListBtn" class="btn btn-success">
			</div>
		</div>
	</body>
</html>
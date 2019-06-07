<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		
		<title>Title</title>
		
		<link rel="shortcut icon" type="image⁄x-icon" href="/resources/images/icon.png" />
		<link rel="apple-touch-icon" type="image⁄x-icon" href="/resources/images/icon.png" />
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
     	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		
		<script type="text/javascript" src="/resources/include/naver/js/service/HuskyEZCreator.js"></script>
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<!-- [if lt IE 9]>
			<script src="/resources/include/js/html5shiv.js"></script>
		<![endif] -->
		
		<style type="text/css">
			h3{
				text-align: center;
			}
			#no_kind{
				margin-left: 40px;
				padding-left: -200px;
			}
			textarea{
				width: 1000px;
				height: 500px;
			}
			table{
				width: 1000px;
			}
		</style>
		
		<script type="text/javascript">
			$(function () {
				/* 저장버튼 클릭 시 처리 이벤트 */
				$("#boardInsertBtn").click(function(){
					//입력값 체크
					if(!chkSubmit($('#no_kind'),"글머리를")) return;
					else if(!chkSubmit($('#no_title'),"제목을")) return;
					else if(!chkSubmit($('#no_content'),"작성할 내용을")) return;
					else{
						$("#f_writeForm").attr({
							"method" : "post",
							"action" : "admin/noticeInsert"
						});
						$("#f_writeForm").submit();
					}
				});
				
				/* 취소 버튼 클릭 시 처리 이벤트 */
				$("#boardCancelBtn").click(function(){
					$("#f_writeForm").each(function(){
						this.reset();
					});
				});
				
				/* 목록 버튼 클릭 시 처리 이벤트 */
				$("#boardListBtn").click(function(){
					/* var queryString = "?pageNum="+$("#pageNum").val()+"&amount="+$("#amount").val(); */
					location.href="admin/adminNoticeList"/* +queryString */;
				});
				
				// 네이버 스마트에디터
				nhn.husky.EZCreator.createInIFrame({
				    oAppRef: oEditors,
				    elPlaceHolder: "popContent",  //textarea ID
				    sSkinURI: "/resources/include/naver/SmartEditor2Skin.html",  //skin경로
				    fCreator: "createSEditor2",
				});
				
			});
		</script>
		
	</head>
	
	<body>
		<h3>공지사항 작성</h3>
		<div class="contentContainer container-fluid">
			<div class="contentTit page-header"><h3 class="text-center"></h3></div>
			
			<div class="contentTB text-center">
				<form id="f_writeForm" name="f_writeForm" class="form-horizontal">
				<%-- <input type="hidden" name="pageNum" id="pageNum" value="${data.pageNum}"> 
				<input type="hidden" name="amount" id="amount" value="${data.amount}"> --%>
					<table class="table table-bordered">
						<colgroup>
							<col width="20%"/>
							<col width="80%"/>
						</colgroup>
						<tbody>
							<tr>
								<td>글머리</td>
								<td class="">
									<input type="radio" name="no_kind" id="no_kind" value="event" class="">이벤트
									<input type="radio" name="no_kind" id="no_kind" value="info" class="">알림
									<input type="radio" name="no_kind" id="no_kind" value="system" class="">시스템 
							</tr>
							<tr>
								<td>글제목</td>
								<td class="text-left"><input type="text" name="no_title" id="no_title" class="form-control" /></td>
							</tr>
							<tr>
								<td>글내용</td>
								<td class="text-left"><textarea class="text-left" name="no_content" id="popContent" class="form-control"></textarea></td>
							</tr>
						</tbody>
					</table>
					
					<div class="text-right">
						<input type="button" value="저장" id="boardInsertBtn" class="btn btn-success">
						<input type="button" value="취소" id="boardCancelBtn" class="btn btn-success">
						<input type="button" value="목록" id="boardListBtn" class="btn btn-success">
					</div>
				</form>
			</div>
		</div>
	</body>
</html>
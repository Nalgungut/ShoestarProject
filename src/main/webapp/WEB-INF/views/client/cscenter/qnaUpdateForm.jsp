<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Title</title>
      
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
		<link rel="shortcut icon" type="image⁄x-icon" href="../image/icon.png" />
		<link rel="apple-touch-icon" type="image⁄x-icon" href="../image/icon.png" />
		<!-- [if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif] -->
      	<script type="text/javascript">
      		
      	</script>
	</head>
   
	<body>
		<div class="contentContainer container-fluid">
			<div class="header">
				<h3 class="text-center">1:1문의 수정</h3>
				<hr class="greenLine">
			</div>
			
			<div class="tableContainer">
				<form class="form-horizontal" id="f_updateForm">
					<input type="hidden" name="qna_no" id="qna_no" value="${detail.qna_no}">
					<div class="form-group form-inline">
						<label class="col-sm-1 control-label" for="mem_name">작성자</label>
						<div class="col-sm-7">
							<div class="form-control-static" id="mem_name">${login.mem_name}</div>
						</div>
						<label class="col-sm-1 control-label" for="qna_date">작성일</label>
						<div class="col-sm-3">
							<div class="form-control-static" id="qna_date">${detail.qna_date}</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-1 control-label" for="qna_title"><strong>제목</strong></label>
						<div class="col-sm-11">
							<input type="text" id="qna_title" name="qna_title"
								class="form-control" required="required" value="${detail.qna_title}">
							<span class="error_msg"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-1 control-label" for="b_content"><strong>내용</strong></label>
						<div class="col-sm-11">
							<textarea id="qna_content" name="qna_content" cols="10"
								class="form-control" required="required">${detail.qna_content}</textarea>
							<span class="error_msg"></span>
						</div>
					</div>
				</form>
			</div>
			
			<div class="buttonContainer text-right">
				<button type="button" id="boardUpdateBtn" class="btn btn-success">수정</button>
				<button type="button" id="boardCancelBtn" class="btn btn-default">취소</button>
				<a id="btnList" class="btn btn-default" href="/cscenter/qnaBoard">목록</a>
			</div>
		</div>
	</body>
</html>
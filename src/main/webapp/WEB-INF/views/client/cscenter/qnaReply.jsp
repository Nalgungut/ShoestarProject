<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Title</title>
      
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />
		<link rel="stylesheet" type="text/css" href="/resources/include/css/default.css"/>
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
		$(function(){
			var qna_no = ${detail.qna_no};
			listAll(qna_no);
			
			if(!$("#replyInsertBtn").attr("data-button")){
				$("#replyInsertBtn").attr("data-button", "insertBtn");
			}
			$("#replyInsertFormBtn").click(function(){
				setModal("댓글등록", "insertBtn", "등록");
				dataReset();
				$("#replyModal").modal();
			});
			
			$(document).on("click", "button[date-button='insertBtn']", function(){
				if(check($("#qna_title").val())) return false;
				else if(check($("#qna_conetnt"))) return false;
				else{
					var insertUrl = "/replies/replyInsert";
					
					$.ajax({
						url : insertUrl,
						type : "post",
						
					});
				}
			});
		});
		
		function check(value){
			if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){
				return true }
			else{ 
				return false } 
		};

		
		
		function addItem(qr_no, qr_title, qr_content, qr_date){
			var wrapper_div = $("<div>");
			wrapper_div.attr("data-num", qr_no);
			wrapper_div.addClass("panel panel-default");
			
			var new_div = $("<div>");
			new_div.addClass("panel-heading form-inline");
			
			var qr_no_span = $("<span>");
			qr_no_span.addClass("qr_no");
			qr_no_span.html(qr_no+"번 댓글");
			
			var date_span = $("<span>");
			date_span.html(" / " + qr_date + " ");
			
			//수정버튼
			var upBtn = $("<button>");
			upBtn.attr({"type" : "button"});
			upBtn.attr("data-btn", "upBtn");
			upBtn.addClass("btn btn-primary gap");
			upBtn.html("수정하기");
			
			var delBtn = $("<button>");
			delBtn.attr({"type" : "button"});
			delBtn.attr("data-btn","delBtn");
			delBtn.addClass("btn btn-primary gap");
			delBtn.html("삭제하기");
			
			var content_div = $("<div>");
			content_div.html(r_content);
			content_div.addClass("panel-body");
			
			new_div.append(qr_no_span).append(date_span).append(upBtn).append(delBtn);
			wrapper_div.append(new_div).append(content_div);
			$("#reviewList").append(wrapper_div);
		}
		
		function listAll(qna_no){
			$("#reviewList").html("");
			var url = "/replies/all/" + qna_no + ".json";
			
			$.getJSON(url, function(data){
				console.log("list count : " + data.length);
				replyCnt = data.length;
				$(data).each(function(){
					var qr_no = this.qna_no;
					var qr_title = this.qna_title;
					var qr_content = this.qna_content;
					var qr_date = this.qna_date;
					qr_content = qr_content.replace(/(\r\n|\r|\n)/g, "<br/>");
					addItem(qr_no, qr_title, qr_content, qr_date);
				});	
			}).fail(function(){
				alert("댓글 목록을 불러오는데 실패 했습니다 잠시후에 다시 시도해 주세요");
			});
		};
		</script>
      
	</head>
   
	<body>
			<div id="replyContainer">
			
			<!-- 등록 버튼 영역 -->
			<p class="tar">
				<button type="button" class="btn btn-primary" id="replyInsertFormBtn">댓글등록</button>
			</p>
			
			<!-- 리스트 영역 -->
			<div id="reviewList"></div>
			
			<!-- 등록 화면 영역(modal) -->
			<div class="modal fade" id="replyModal" tabindex="-1" role="dialog" aria-labelledby="replyModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h4 class="modal-title" id="replyModalLabel">댓글 등록</h4>
						</div>
						<div class="modal-body">
							<form id="comment_form" name="comment_form">
								<div class="form-group">
							    	<label for=" mem_name" class="control-label">${login.mem_name}</label>
							    	<input type="text" class="form-control" name="r_name" id="r_name" maxlength="5" />
							    </div>
							    <div class="form-group">
									<label for="g_content" class="control-label">글내용</label>
									<textarea class="form-control" name="r_content" id="r_content" rows="5"></textarea>
							    </div>
							    <div class="form-group">
									<label for="g_pwd" class="control-label">비밀번호</label>
									<input type="text" class="form-control" name="r_pwd" id="r_pwd" />
							    </div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-primary" id="replyInsertBtn">등록</button>
						</div>
					</div>
				</div>
			</div>
			
			
		</div>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		
		<title>Title</title>
		
		<link rel="shortcut icon" type="image⁄x-icon" href="/resources/images/icon.png" />
		<link rel="apple-touch-icon" type="image⁄x-icon" href="/resources/images/icon.png" />
		
		<!-- [if lt IE 9]>
			<script src="/resources/include/js/html5shiv.js"></script>
		<![endif] -->
		
		
		<style>
			#textarea{
				width: 500px;
				height: 500px;
			}
			#boardListBtn{
				text-align: right;
			}
			textarea{
				height: 500px;
				width: 1000px;
			}
		</style>
		
		<script type="text/javascript">
			$(function () {
				$("#boardListBtn").click(function () {
					location.href="/brand/noticeList";
				});
				
			});
		</script>
		
	</head>
	
	<body>
		<div class="contentContainer container">
			<div class="contentTit page-header">
				<h3 class="text-center">게시판 상세보기</h3>
			</div>
			<div>
				<input type="button" value="목록" id="boardListBtn" class="btn btn-success"/>
			</div>
			<!--  상세정보 보기 -->
			<div class="contentTB text-center">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<td>말머리</td>
							<td class="text-left">${detail.no_kind}</td>
							
							<td>작성일</td>
							<td class="text-left"><fmt:formatDate value="${detail.no_date}" pattern="yyyy-MM-dd hh:mm"/></td>
							
							<td>작성자</td>
							<td class="text-left">${detail.adm_name}</td>
						</tr>
						<tr>
							<td>제 목</td>
							<td colspan="5" class="text-left">${detail.no_subject}</td>
						</tr>
						<tr class="table-height">
							<td>내 용</td>
							<td colspan="5" class="text-left" id="textarea">${detail.no_content}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<jsp:include page="noticeReply.jsp"/>
		</div>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<title>페이지를 찾을 수 없습니다</title>
		<style type="text/css">
			.errorMsg{
				margin-top: 150px;
			}
			
			.errorMsg > * {
				margin-bottom: 30px;
			}
		</style>
	</head>
	<body>
		<div class="text-center errorMsg">
			<img src="/resources/images/exception/warning.png" width="300px" height="300px">
			<c:choose>
				<c:when test='${errorCode == "404"}'>
					<h3>페이지를 찾을 수 없습니다</h3>
					<p>요청하신 페이지를 찾을 수 없습니다. 다른 주소를 시도해보세요.</p>
				</c:when>
				<c:when test='${errorCode == "login"}'>
					<h3>로그인이 필요한 작업입니다</h3>
					<p>요청하신 작업은 로그인이 필요한 작업입니다. 로그인 후 시도해보세요.</p>
					<a href="/member/login" class="btn btn-primary">로그인</a>
				</c:when>
				<c:when test='${errorCode == "db"}'>
					<h3>데이터베이스 에러가 발생했습니다</h3>
					<p>요청하신 작업을 수행하던 중 데이터베이스 에러가 발생했습니다. 다시 시도해주세요.</p>
				</c:when>
				<c:otherwise>
					<h3>오류가 발생했습니다</h3>
					<p>페이지를 이용하던 중 오류가 발생했습니다. 다른 경로를 시도해보세요.</p>
				</c:otherwise>
			</c:choose>
			
			<c:if test='${errorCode != "login"}'>
				<a href="/" class="btn btn-primary">홈 페이지</a>
			</c:if>
			<button type="button" class="btn btn-primary" onclick="history.back()">이전 페이지</button>
		</div>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Title</title>
      
		<script type="text/javascript">
			
		</script>
      
	</head>
   
	<body>
		<div id="replyContainer">
			<!-- 리스트 영역 -->
			<div id="qnaReplyList"></div>
				<table class="table">
					<colgroup>
						<col width="10%" />
						<col width="20%" />
						<col width="70%" />
					</colgroup>
					<tbody id="list">
						<c:choose>
							<c:when test="${not empty qna_replyList}">
								<c:forEach var="qr" items="${qna_replyList}" varStatus="status">
									<tr class="tac">
										<td>관리자</td>
										<td>${qr.qr_title}</td>
										<td>${qr.qr_date}</td>
									</tr>
									<tr>
										<td colspan="3">${qr.content}</td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</tbody>
				</table>	
		</div>
	</body>
</html>
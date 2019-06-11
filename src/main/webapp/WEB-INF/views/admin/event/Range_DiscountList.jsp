<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="now" value="<%=new java.util.Date()%>" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/resources/include/css/eventList.css" >
<script type="text/javascript"
	   src="/resources/include/js/jquery-1.12.4.min.js"></script>

<style type="text/css">
 a:link { text-decoration: none;}
 a:visited {text-decoration: none;}
 a:hover {text-decoration: underline;}
</style>

<script type="text/javascript">
	$(function() {
		$("#eventBtn").click(function() {
			location.href="/admin/event/list";
		}); // 이벤트 리스트로 가기~
	}); // 종료 function
</script>

</head>
<body>
		<div class="Aventcontainer">
		<div class="Avent_header"><h2 id="AEvconTitle">이벤트 관리
		<input type="button" value="이벤트 리스트" id="eventBtn" />
		<input type="button" value="새로 만들기" id="insertBtn" /> 
		</h2>
				
		 <hr /></div>
			
		<!-- 검색 기능 -->
		<div id="AventSearchDiv">	
			<form id="AventSearchForm" >
				<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
           		<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
           		
           		
      			<table id="AvnetViewTable" class="table" >
					<caption class="Acaption">이벤트 검색</caption>
					<tr>
						<td class="Avent_td gray" id="Aev_no">번호</td>
						<td class="Avent_tdInput"><input type="text" id="no_text" class="keyword" placeholder="이벤트번호을 입력하세요" size="50" /></td>
					</tr>
					<tr>
						<td class="Avent_td gray" id="Aev_title">할인명</td>
						<td class="Avent_tdInput"><input type="text" id="name_text" class="keyword" placeholder="이벤트명을 입력하세요" size="50" /></td>
					</tr>
					<tr>	
						<td class="Avent_td gray" id="Aev_date">등록일</td>
						<td class="Avent_tdInput"><input type="date" id="date_text" class="keyword" placeholder="이벤트 등록날짜를 입력하세요" /></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
							<input type="button" id="searchData" value="검색" />
						</td>
					</tr>
				</table>
      		
			</form>
			 </div>
		
		<hr />
		
		<div id="AventList" class="">
			<form id="AventListForm">
				<input type="hidden" name="rd_no" id="rd_no" />
				
				<table id="AventListTable" class="table">
					<caption class="Acaption">이벤트 목록</caption>
						
						<tr>
							<td class="Avent_td bgray tdW">번호</td>
							<td class="Avent_td bgray">이벤트명</td>
							<td class="Avent_td bgray">이벤트 내용</td>
							<td class="Avent_td bgray">이벤트 시작일</td>
							<td class="Avent_td bgray">이벤트 종료일</td>
							<td class="Avent_td bgray tdW">상태</td>
							<td class="Avent_td bgray tdW">보기</td>
							<td class="Avent_td bgray tdW">수정</td>
							<td class="Avent_td bgray tdW">삭제</td>
						</tr>
						<c:forEach var="ard" items="${ARDList}" varStatus="status">
							<tr class="daNum" data-num="${ard.rd_no}">
								<td class="Avent_td tdW">${ard.rd_no}</td>
								<td class="Avent_td"><a class="AventUpdateBtn">${ard.rd_title}</a></td>
								<td class="Avent_td">${ard.rd_content}</td>
								<td class="Avent_td"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${ard.rd_date}" /></td>
								<td class="Avent_td"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${ard.rd_edate}" /></td>
								<td class="Avent_td tdW">
									<div id="AventSituation" class="tdW">
										<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${now}" var="Ave_date"/>
										<fmt:parseNumber var="day" value="${(now.time - evt.ev_edate.time) / (1000*60*60*24) }" integerOnly="true" /> 
										 <c:choose>
											<c:when test="${evt.ev_edate == null}" >
												&nbsp;진행중<%--  | ${day} --%>&nbsp;
											</c:when>
										 	<c:when test="${day < 0 }">
										 		&nbsp;진행중<%--  | ${day} --%>&nbsp;
										 	</c:when>
											<c:when test="${day >= 0}">
												&nbsp;끝<%--  | ${day} --%>&nbsp;
											</c:when>
										  </c:choose>	
									</div>
								</td>
								<td class="Avent_td">
									<button type="button" class="AventPreviewBtn tdW Abtn">확인</button>
								</td>
								<td class="Avent_td">
									<button type="button" class="AventUpdateBtn tdW Abtn">수정</button>
								</td>
								<td class="Avent_td">
									<button type="button" class="AventDeleteBtn tdW Abtn">삭제</button>
								</td>
							</tr>
							
						</c:forEach>
						
				</table>
			</form>
		
		</div>
			
	</div>
</body>
</html>
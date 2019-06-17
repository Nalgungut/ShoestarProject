<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="now" value="<%=new java.util.Date()%>" />
									
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 조회</title>

<link rel="stylesheet" href="/resources/include/css/eventList.css" >
<script type="text/javascript"
	   src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/eventList.js"></script>

<style type="text/css">
 a:link { text-decoration: none;}
 a:visited {text-decoration: none;}
 a:hover {text-decoration: underline;}
 #searchData{
	margin-top: 0px;
}
 
</style>


<script type="text/javascript">
	$(function() {
		  //검색후 검색 대상과 검색 단어 출력
		   var word= "<c:out value='${data.keyword}'/>";
		   var value = "";
		   if(word!=""){
			  $("#keyword").val("<c:out value='${data.keyword}'/>");
			  $("#search").val("<c:out value='${data.search}'/>");

	 	 }
		   
	      
		 // 검색 버튼 선택
		 $("#searchData").click(function() {
		       if($("#search").val()!="all"){
		            if(!chkData("#keyword","검색어를")) return
		         }
		      goPage();	
		 });
 
			
		 // 다음 페이지 볼 수 있는
		 $(".paginate_button a").click(function(e){
				e.preventDefault();
		   		$("#AventSearchForm").find("input[name='pageNum']").val($(this).attr("href"));
		   		goPage();
		 });
		 	 
		
		// 미리보기 선택
		$(".AventPreviewBtn").click(function() {
			   var ev_no = $(this).parents("tr").attr("data-num");
		         $("#ev_no").val(ev_no);
		
		         $("#AventListForm").attr({
		            "method" : "get",
		            "action" : "/event/detail"
		         });
		         $("#AventListForm").submit();
	      });
		
		// 수정하기 선택 (미완)
		$(".AventUpdateBtn").click(function() {
			 var ev_no = $(this).parents("tr").attr("data-num");
	         $("#ev_no").val(ev_no);
	
	          $("#AventListForm").attr({
	            "method" : "get",
	            "action" : "/admin/event/updateForm"
	         });
	
	          $("#AventListForm").submit();
			}); // 수정 끝
		
		// 삭제하기 선택 (완)
		$(".AventDeleteBtn").click(function() {
			
			if(confirm("선택한 내용을 삭제하시겠습니까?")) {
      		
			 var ev_no = $(this).parents("tr").attr("data-num");
	         $("#ev_no").val(ev_no);
	
	         $("#AventListForm").attr({
	            "method" : "get",
	            "action" : "/admin/event/delete"
	         });
	         $("#AventListForm").submit();
	         
			}
			
		});
		
		 // 새로 만들기 버튼 선택
	      $("#insertBtn").click(function() {
		         location.href = "/admin/event/writeForm";
		      });
		 
		 
		 // 범위할인 리스트 버튼 선택
		 $("#rang_disBtn").click(function() {
			 location.href = "/admin/event/rds/list";
		 });
		 
	 	 
	}); // function
	
	 /* 검색을 위한 실질적인 처리 함수 */
	   function goPage() {
	      if($("#search").val()=="all"){
	         $("#keyword").val("");
	      }
	      $("#search").attr({
	         "method" : "get",
	         "action" : "/admin/event/list"
	      });
	      $("#AventSearchForm").submit();
	   }
	   
	
	
	
</script>

</head>
<body>
	<div class="Aventcontainer">
		<div class="Avent_header"><h2 id="AEvconTitle">이벤트 관리
		<input type="button" value="범위할인 리스트" id="rang_disBtn"/>
		<input type="button" value="새로 만들기" id="insertBtn" /> 
		</h2>
				
		 <hr /></div>
			
		<!-- 검색 기능 -->
		<div id="AventSearchDiv">	
			<form id="AventSearchForm" name="AventSearchForm" >
				<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
           		<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
           		
           		
           		<label>검색조건  </label>
           		<div class="form-group"> 
               <select id="search" name="search" class="formcontrol">
                  <option value="all">전체</option>
                  <option value="ev_no">번호</option>
                  <option value="ev_title">이벤트명</option>
               </select> 
               <input type="text" placeholder="검색어를 입력해주세요" id="keyword"
                  name="keyword" class="formcontrol"> 
               <input type="button"
                  value="검색" class="btn btn-primary" id="searchData">
           		</div>
           		
           		
			</form>
			 </div> <!-- 검색기능 -->
		
		<hr />
		
		<div id="AventList" class="">
			<form id="AventListForm">
				<input type="hidden" name="ev_no" id="ev_no" />
				
				<table id="AventListTable" class="table">
					<caption class="Acaption">이벤트 목록</caption>
						
						<tr>
							<td class="Avent_td bgray tdW">번호</td>
							<td class="Avent_td bgray tsize">이벤트명</td>
							<td class="Avent_td bgray consize">이벤트 내용</td>
							<td class="Avent_td bgray">이벤트 시작일</td>
							<td class="Avent_td bgray">이벤트 종료일</td>
							<td class="Avent_td bgray tdW">상태</td>
							<td class="Avent_td bgray tdW">미리 보기</td>
							<td class="Avent_td bgray tdW">수정</td>
							<td class="Avent_td bgray tdW">삭제</td>
						</tr>
						
						<c:forEach var="evt" items="${AdmineventList}" varStatus="status">
							<tr class="daNum" data-num="${evt.ev_no}">
								<td class="Avent_td tdW">${evt.ev_no}</td>
								<td class="Avent_td"><a class="AventUpdateBtn">${evt.ev_title}</a></td>
								<td class="Avent_td">
									<c:set var="TextValue" value="${evt.ev_content}"/>
										${fn:substring(TextValue,0,30)}...
										
								</td>
								<td class="Avent_td"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${evt.ev_date}" /></td>
								<td class="Avent_td"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${evt.ev_edate}" /></td>
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
		<%--============================리스트 종료========================== --%>
	
	   <%-- 페이징 처리 --%>
	   <div class="text-center">
	   		<ul class="pagination">
	   			<c:if test="${pageMaker.prev}">
	   				<li class="paginate_button" ><!-- previous -->
	   					<a href="${pageMaker.startPage -1}">Previous</a>
	   				</li>
	   			</c:if>
	   			
	   			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	   				<li class="paginate_button ${pageMaker.cvo.pageNum == num ? 'active' : ''}">
	   					<a href="${num}">${num}</a>
	   				</li>
	   			</c:forEach>
	   			
	   			<c:if test="${pageMaker.next}">
	   				<li class="paginate_button next">
	   					<a href="${pageMaker.endPage +1}">Next</a>
	   				</li>
	   			</c:if>
	   		</ul>
	   </div>	
		
		<div style="position: fixed; bottom: 70px; right: 10px;">
				<div style="cursor:pointer; border: 1px solid #D3D3D3; background-color: #D3D3D3; color:white; padding: 5px;" 
					onclick="window.scrollTo(0,0);">TOP</div>
			</div>	
			
	</div>
</body>
</html>
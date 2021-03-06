<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="now" value="<%=new java.util.Date()%>" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>범위 할인 조회</title>

<link rel="stylesheet" href="/resources/include/css/rdisList.css" >
<script type="text/javascript"
	   src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/eventList.js"></script>
	   

<style type="text/css">
 a:link { text-decoration: none;}
 a:visited {text-decoration: none;}
 a:hover {text-decoration: underline;}
 .mins{width: 95px;}
 #search{margin-top: 5px;}
 #searchData{margin-top: 2px;}
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
		
		/* var content = $(".cont").html();
		$(".cont").html(content.substring(0, 12)+"..."); 
		
		console.log(content);
		 */
				
		$("#eventBtn").click(function() {
			location.href="/admin/event/list";
		}); // 이벤트 리스트로 가기~
		
		$("#insertBtn").click(function() {
			location.href="/admin/event/rds/writeForm";
		}); // 새로 만들기~
		
		
		
		
		// 수정
			$(".RDUpdateBtn").click(function() {
			 var rd_no = $(this).parents("tr").attr("data-num");
	         $("#rd_no").val(rd_no);
	
	          $("#RDListForm").attr({
	            "method" : "post",
	            "action" : "/admin/event/rds/updateForm"
	         });
	
	          $("#RDListForm").submit();
			}); // 수정 끝
		
		// 삭제
		$(".RDDeleteBtn").click(function() {
			if(confirm("선택한 내용을 삭제하시겠습니까?\n삭제시 모든 범위 할인 대상은 사라집니다.")) {
				 var rd_no = $(this).parents("tr").attr("data-num");
		         $("#rd_no").val(rd_no);
		
		         $("#RDListForm").attr({
		            "method" : "get",
		            "action" : "/admin/event/rds/delete"
		         });
		         $("#RDListForm").submit();
		         
			}
		});
			
		// 상세보기 가기~
		$(".RDViewBtn").click(function() {
			var rd_no = $(this).parents("tr").attr("data-num");
			$("#rd_no").val(rd_no);
			
			$("#RDListForm").attr({
				"method" : "get",
				"action" : "/admin/event/rds/detail"
			});
			
			$("#RDListForm").submit();
		});
	}); // 종료 function
	
	 /* 검색을 위한 실질적인 처리 함수 */
	   function goPage() {
	      if($("#search").val()=="all"){
	         $("#keyword").val("");
	      }
	      $("#search").attr({
	         "method" : "get",
	         "action" : "/admin/event/rds/list"
	      });
	      $("#RDSearchForm").submit();
	   }
	
	
</script>

</head>
<body>
		<div class="RDcontainer">
		<div class="RD_header"><h2 id="RDconTitle">범위할인 관리
		<input type="button" value="이벤트 리스트" id="eventBtn" />
		<input type="button" value="새로 만들기" id="insertBtn" /> 
		</h2>
				
		 <hr /></div>
			
		<!-- 검색 기능 -->
		<div id="RDSearchDiv">	
			<form id="RDSearchForm" name="RDSearchForm" >
				<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
           		<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
           		
           		
	           		 <label>범위할인 검색</label>
	           		<div class="form-group"> 
	               <select id="search" name="search" class="formcontrol">
	                  <option value="all">전체</option>
	                  <option value="rd_no">번호</option>
	                  <option value="rd_title">할인명</option>
	               </select> 
	               <input type="text" placeholder="검색어를 입력해주세요" id="keyword"
	                  name="keyword" class="formcontrol"> 
	               <input type="button"
	                  value="검색" class="btn btn-primary" id="searchData">
	           		</div>
           		
      			<%-- <table id="RDViewTable" class="table" >
					<caption class="Rcaption">범위할인 검색</caption>
					<tr>
						<td class="RD_td gray" id="Aev_no">번호</td>
						<td class="RD_tdInput"><input type="text" id="no_text" class="keyword" placeholder="이벤트번호을 입력하세요" size="50" /></td>
					</tr>
					<tr>
						<td class="RD_td gray" id="Aev_title">할인명</td>
						<td class="RD_tdInput"><input type="text" id="name_text" class="keyword" placeholder="이벤트명을 입력하세요" size="50" /></td>
					</tr>
					<tr>	
						<td class="RD_td gray" id="Aev_date">등록일</td>
						<td class="RD_tdInput"><input type="date" id="date_text" class="keyword" placeholder="이벤트 등록날짜를 입력하세요" /></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
							<input type="button" id="searchData" value="검색" />
						</td>
					</tr>
				</table> --%>
      		
			</form>
			 </div>
		
		<hr />
		
		<div id="RDList" class="">
			<form id="RDListForm">
				<input type="hidden" name="rd_no" id="rd_no" />
				
				<table id="RDListTable" class="table">
					<caption class="Rcaption">범위할인 목록</caption>
						
						<tr>
							<td class="RD_td bgray tdW">번호</td>
							<td class="RD_td bgray">할인명</td>
							<td class="RD_td bgray">할인 내용</td>
							<td class="RD_td bgray mins">할인가</td>
							<td class="RD_td bgray mins">시작일</td>
							<td class="RD_td bgray mins">종료일</td>
							<td class="RD_td bgray tdW">상태</td>
							<td class="RD_td bgray tdW">상세 보기</td>
							<td class="RD_td bgray tdW">수정</td>
							<td class="RD_td bgray tdW">삭제</td>
						</tr>
						<c:forEach var="ard" items="${ARDList}" varStatus="status">
							<tr class="daNum" data-num="${ard.rd_no}">
								<td class="RD_td tdW">${ard.rd_no}</td>
								<td class="RD_td"><a class="RDViewBtn">${ard.rd_title}</a></td>
								<td class="RD_td">
									<c:set var="TextValue" value="${ard.rd_content}"/>
										${fn:substring(TextValue,0,30)}...
									
								</td>
								<td class="RD_td">${ard.rd_discount}
									<c:choose>
										<c:when test="${ard.rd_discount < 100}">
											%
										</c:when>
										<%-- <c:otherwise>
											원
										</c:otherwise> --%>
									</c:choose>
								</td>
								<td class="RD_td"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${ard.rd_date}" /></td>
								<td class="RD_td"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${ard.rd_edate}" /></td>
								<td class="RD_td tdW">
									<div id="RDSituation" class="tdW">
										<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${now}" var="ARD_date"/>
										<fmt:parseNumber var="day" value="${(now.time - ard.rd_edate.time) / (1000*60*60*24) }" integerOnly="true" /> 
										 <c:choose>
											<c:when test="${ard.rd_edate == null}" >
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
								<td class="RD_td">
									<button type="button" id="RDViewBtn" class="RDViewBtn tdW Abtn">확인</button>
								</td>
								<td class="RD_td">
									<button type="button" id="RDUpdateBtn" class="RDUpdateBtn tdW Abtn">수정</button>
								</td>
								<td class="RD_td">
									<button type="button" id="RDDeleteBtn" class="RDDeleteBtn tdW Abtn">삭제</button>
								</td>
							</tr>
							
						</c:forEach>
						
				</table>
			</form>
		
		</div>
		<%-- ============리스트 종료~ --%>
		
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
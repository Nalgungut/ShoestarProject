<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>배송준비중 관리</title>
      	<script type="text/javascript">
      		$(function(){
      			
      			$("#searchBtn").click(function(){
      				
      				console.log($("#odno").val());
      				$("#search_form").attr({
      					"method" : "post",
      					"action" : "/admin/cscenter/dm_end_search"
      				});
      				$("#search_form").submit();
      			});
      			
      			$("#allBtn").click(function(){
      				location.href="/admin/cscenter/csAdminDm_end";
      			});
      			
      		});
      	</script>
	</head>
   
	<body>
		<div class="contentContainer container-fluid">
	  <div class="contentTit page-header"><h3 class="text-center">배송완료  택배 조회</h3></div> 
		<div class="form-group">
			<form id="search_form">
				<p>주문번호 검색</p>
				<input type="text" id="odno" name="odno">
				<button type="button" class="btn btn-default" id="searchBtn">검색</button>
				<button type="button" class="btn btn-default" id="allBtn">전체조회</button>
			</form>
		</div>
			<br>
	         <div class="container-fluid">
      <div class="row-fluid">
      	
        <div class="span9">
          <!-- 리스트시작 -->
          <div id="dm_list"> 	
	          <div class="row-fluid">     
			        <table class="table">
			        	<thead>
			        		<tr>
			        			<th>주문자</th>
			        			<th>주문번호</th>
			        			<th>상품명</th>
			        			<th>주문날짜</th>
			        			<th>택배사</th>
			        			<th>운송장번호</th>
			        			<th>배송상태</th>
			        		</tr>
			        	</thead>
			        	<tbody>
			        		
			        		<c:choose>
			        			<c:when test="${not empty dmList}">
			        			<form id="dm_form" name="dm_form">	
			        				<c:forEach var="dm" items="${dmList}" varStatus="status">
			        					<input type="hidden" name="dm_no" id="dm_no" value="${dm.dm_no}"/>
			        					<tr class="span4">
			        						<td>${dm.mem_name}</td>
			        						<td>${dm.od_no}</td>
			        						<td>${dm.pd_name}</td>
			        						<td><fmt:formatDate value="${dm.od_date}" pattern="yyyy년MM월dd일 HH시mm분ss초"/></td>
			        						<td>${dm.dm_name}</td>
			        						<td>${dm.dm_number }</td>
			        						<td>${dm.dm_status}</td>
			        					</tr>
			        				</c:forEach>
			        			</form>
			        			</c:when>
			        			<c:otherwise>
			        				<div class="span3">
			        					<h2>배송완료된 상품이 없습니다.</h2>
			        				</div>
			        			</c:otherwise>
			        		</c:choose>
			        		
			        	</tbody>
			        </table>
	          </div>
	        </div>
	      </div>
		</div>
      <hr>
    </div>
   	</div>
	</body>
</html>
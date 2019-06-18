<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상품처리완료 탭</title>
      	<script type="text/javascript">
      		$(function(){
      			
      	</script>
	</head>
   
	<body>
		<div class="contentContainer container-fluid">
	  <div class="contentTit page-header"><h3 class="text-center">상품처리 완료 리스트</h3></div> 
		<div class="form-group">
			<form id="search_form" name="search_form">
				<p>주문번호 검색</p>
				<input type="text" id="odno" name="odno">
				<button type="button" class="btn btn-default" id="searchBtn">검색</button>
				<button type="button" class="btn btn-default" id="allBtn">전체조회</button>
			</form>
		</div>
			<br>
	         <div class="container-fluid">
      <div class="row-fluid">
      	<div>
      		<span style="color: red;"></span>
      	</div>
        <div class="span9">
          <!-- 리스트시작 -->
          <div id="dm_list"> 	
	          <div class="row-fluid">     
			        <table class="table">
			        	<thead>
			        		<tr>
			        			<th>문의자</th>
			        			<th>상품이름</th>
			        			<th>상품수량</th>
			        			<th>문의형태</th>
			        			<th>주문날짜</th>
			        			<th>주문번호</th>
			        			<th>처리완료</th>
			        		</tr>
			        	</thead>
			        	<tbody>
			        		<c:choose>
			        		
			        			<c:when test="${not empty osList}">
			        			<form id="dm_form" name="dm_form">	
			        				<c:forEach var="os" items="${osList}" varStatus="status">
			        					<input type="hidden" name="os_no" id="os_no" value="${os.os_no}"/>
			        					<tr class="span4">
			        						<td>${os.mem_name}</td>
			        						<td>${os.pd_name}</td>
			        						<td>${os.os_qty}</td>
			        						<td>${os.qna_ctgr}</td>
			        						<td><fmt:formatDate value="${os.od_date}" pattern="yyyy년MM월dd일 HH시mm분ss초"/></td>
			        						<td>${os.od_no}</td>
			        						<td>${os.os_status}</td>
			        					</tr>
			        				
			        				</c:forEach>
			        			</form>
			        			</c:when>
			        			
			        			<c:otherwise>
			        				<div class="span3">
			        					<h2>처리완료된 문의번호가 없습니다.</h2>
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
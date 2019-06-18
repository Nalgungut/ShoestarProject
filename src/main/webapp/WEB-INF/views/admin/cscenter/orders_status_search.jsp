<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상품상태 처리 탭</title>
      	<script type="text/javascript">
	      	$(function(){
	  			$(document).on("click","input[name='ingBtn']",function(){
	  				$("#os_form").attr({
	  					"method" : "post",
	  					"action" : "/admin/cscenter/osUpdate"
	  				});
	  				$("#os_form").submit();
	  				alert('정상적으로 처리완료 처리 되었습니다.');
	  			});
	  			
	  			$("#searchBtn").click(function(){ 
	  				
	  				$("#search_form").attr({
	  					"method" : "post",
	  					"action" : "/admin/cscenter/orders_status_search"
	  				});
	  				$("#search_form").submit();
	  			});
	  			
	  			$("#allBtn").click(function(){
	  				location.href="/admin/cscenter/csAdminOrder_status";
	  			});
	  		});
  		
      	</script>
	</head>
   
	<body>
		<div class="contentContainer container-fluid">
	  <div class="contentTit page-header"><h3 class="text-center">상품문의 처리대기 리스트</h3></div> 
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
      		<span style="color: red;">*주문번호가 같은경우 상단의 주문번호를 처리완료 하시면 처리됩니다.</span>
      	</div>
        <div class="span9">
          <!-- 리스트시작 -->
          <div id="os_list"> 	
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
			        			<th>처리완료버튼</th>
			        		</tr>
			        	</thead>
			        	<tbody>
			        		<c:choose>
			        		
			        			<c:when test="${not empty osList}">
			        			<form id="os_form" name="os_form">	
			        				<c:forEach var="os" items="${osList}" varStatus="status">
			        					<input type="hidden" name="os_no" id="os_no" value="${os.os_no}"/>
			        					<tr class="span4">
			        						<td>${os.mem_name}</td>
			        						<td>${os.pd_name}</td>
			        						<td>${os.os_qty}</td>
			        						<td>${os.qna_ctgr}</td>
			        						<td><fmt:formatDate value="${os.od_date}" pattern="yyyy년MM월dd일 HH시mm분ss초"/></td>
			        						<td>${os.od_no}</td>
			        						<td><input type="button" id="ingBtn" name="ingBtn" value="처리완료" class="btn btn-default"/></td>
			        					</tr>
			        				
			        				</c:forEach>
			        			</form>
			        			</c:when>
			        			
			        			<c:otherwise>
			        				<div class="span3">
			        					<h2>문의가 들어온 주문번호가 없습니다</h2>
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
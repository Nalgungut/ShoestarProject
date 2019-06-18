<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>주문상품 배송내역</title>
	</head>
	<body>
		<table summary="나의 배송 주문내역" class="table">
            
            <thead>
               <tr>
                  <th>주문자이름</th>
                  <th>주문번호</th>
                  <th>택배사이름</th>
                  <th>운송장번호</th>
                  <th>상품이름</th>
                  <th>주문날짜</th>
                  <th>택배상태</th>
               </tr>
            </thead>
            <tbody id="list">
               <c:choose>
                  <c:when test="${not empty deliveryList}">
                     <c:forEach var="deli" items="${deliveryList}" varStatus="status">
                        <tr class="tac" data-num="${deli.dm_no}"> <!-- data-num = 택배번호  디테일 페이지 만들때 이걸로 가시면 됩니다-->
                           <td>${deli.mem_name}</td>
                           <td>${deli.od_no}</td>
                           <td>${deli.dm_name}</td>
                           <td>${deli.dm_number}</td>
                           <td>${deli.pd_name}</td>          
                          <td><fmt:formatDate value="${deli.od_date}" pattern="yyyy/MM/dd"/></td>
                           <td>${deli.dm_status}</td>
                        </tr>
                     </c:forEach>
                  </c:when>
                  <c:otherwise>
                     <tr>
                        <td colspan="4" class="tac">등록된 게시물이 없습니다.</td>
                     </tr>
                  </c:otherwise>
               </c:choose>
            </tbody>
         </table>
	</body>
</html>
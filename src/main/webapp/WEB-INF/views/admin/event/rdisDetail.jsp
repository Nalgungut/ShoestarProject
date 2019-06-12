<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	
	<link rel="stylesheet" href="/resources/include/css/rdisList.css" >
	 <script type="text/javascript"
	   src="/resources/include/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="/resources/include/js/jquery.form.min.js"></script>
	
	<script type="text/javascript">
		
	</script>
	
	<title>Insert title here</title>
	
	</head>
		<body>
			<h3>${Alldetail}</h3>
			<%-- ${detail.rd_no} 
			${detail.rd_title} 
			${detail.rd_content} 
			${detail.rd_discount} 
			<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${detail.rd_date}" />
			<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${detail.rd_edate}" /> --%>
			<div id="RdisContainer">
				<div id="RdisTDiv"><h1 id="RdisTitle"></h1></div>
			
				<div>
						<form name="RdisForm">
							<input type="hidden" name="rd_no" id="rd_no" />
							
							<table id="RdisDetailTable" border="1">
								<caption class="Rcaption">상세 정보</caption>
								<tr>
									<td class="RD_td">번호</td>
								</tr>
								<tr>
									<td class="daNum" data-num="${detail.rd_no}">${detail.rd_no}</td>
								</tr>
								
								<tr>
									<td class="RD_td">제목</td>
								</tr>
								<tr>
									<td>${detail.rd_title} </td>
								</tr>

								<tr>
									<td class="RD_td">내용</td>
								</tr>
								<tr>
									<td>${detail.rd_content} </td>
								</tr>								
								
								<tr>
									<td class="RD_td">할인</td>
								</tr>
								<tr>
									<td>${detail.rd_discount}
									<c:choose>
										<c:when test="${detail.rd_discount < 100}">
											%
										</c:when>
										<c:otherwise>
											원
										</c:otherwise>
									</c:choose>
									</td>
								</tr>
								
								<tr>
									<td class="RD_td">등록일</td>
								</tr>
								<tr>
									<td>
									<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${detail.rd_date}" />
									</td>
								</tr>
								
								<tr>
									<td class="RD_td">만료일</td>
								</tr>
								<tr>
									<td>
									<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${detail.rd_edate}" />
									</td>								
								</tr>
							</table>
						
						</form>
						
						<table id="prodRdisDetailTable" border="1">
							<caption class="Rcaption">범위 할인 대상</caption>
							<!-- 
								rty.rd_no, 
								rty.pct_no, 
								pt.pct_name, 
								rpr.pd_no,  
								pr.pd_name,
								pr.pim_main
							
							 -->
							<c:forEach items="${Alldetail}" var="jo" varStatus="status">
								<tr>
									<td class="RD_td">카테고리명</td>
									<td>${jo.pct_name}</td>
								</tr>	
								
								<tr>
									<td class="RD_td">신발명</td>
									<td>${jo.pd_name}</td>
								</tr>	
				
								<tr>
									<td class="RD_td">신발 대표 이미지</td>
									<td><%-- <img src="/shoestarStorage/prod/thumb/ --%>${jo.pim_main}<%-- " /> --%></td>
								</tr>
							</c:forEach>
								
						
						</table>
					
					</div>
			</div>
		</body>
</html>
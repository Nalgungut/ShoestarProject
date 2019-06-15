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
	
	<style type="text/css">
		#imgSize{width: 70px; height: 70px;}
		.RD_td{width: 180px;}
	
	</style>
	
	<script type="text/javascript">
		$(function() {
			$("#updateBtn").click(function() {
				
				
				$.ajax({
					url : "/admin/event/rds/updateForm",
					type : "post",
					data : $("#RdisForm").serialize(),
					dataType : "text",
					error : function(){
						alert('시스템 오류 입니다. 관리자에게 문의해 주세요.');
					},
					success : function(resultData){
						alert("수정게시판으로 이동합니다.");
					}
					
				});
			});
		})
	</script>
	
	<title>Insert title here</title>
	
	</head>
		<body>
			
			<%-- ${detail.rd_no} 
			${detail.rd_title} 
			${detail.rd_content} 
			${detail.rd_discount} 
			<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${detail.rd_date}" />
			<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${detail.rd_edate}" /> --%>
			<div id="RdisContainer">
				<div id="RdisTDiv"><h1 id="RdisTitle"></h1></div>
			
				<div>
						<form name="RdisForm" id="RdisForm">
							<input type="hidden" name="rd_no" id="rd_no" />
							
							<table id="RdisDetailTable" border="1">
								<caption class="Rcaption">상세 정보</caption>
								<tr>
									<td class="RD_td gray">번호</td>
								
									<td data-num="${detail.rd_no}">${detail.rd_no}</td>
								</tr>
								
								<tr>
									<td class="RD_td gray">제목</td>
							
									<td>${detail.rd_title} </td>
								</tr>

								<tr>
									<td class="RD_td gray">내용</td>
								
									<td>${detail.rd_content} </td>
								</tr>								
								
								<tr>
									<td class="RD_td gray">할인</td>
							
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
									<td class="RD_td gray">등록일</td>
							
									<td>
									<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${detail.rd_date}" />
									</td>
								</tr>
								
								<tr>
									<td class="RD_td gray">만료일</td>
							
									<td>
									<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${detail.rd_edate}" />
									</td>								
								</tr>
								<!-- 
								
								</tr>
								<tr>
								 -->
							</table>
						
						</form>
						
						<table id="prodRdisDetailTable">
							<caption class="Rcaption">범위 할인 대상</caption>
							<!-- 
								rty.rd_no, 
								rty.pct_no, 
								pt.pct_name, 
								rpr.pd_no,  
								pr.pd_name,
								pr.pim_main
							
							 -->
							 <tr>
							 		<td class="RD_td gray">카테고리번호</td>
									<td class="RD_td gray">카테고리명</td>
									<td class="RD_td gray">신발번호</td>
									<td class="RD_td gray">신발명</td>

									<td class="RD_td gray">신발 대표 이미지</td>
							 </tr>	
							<c:forEach items="${Alldetail}" var="jo" varStatus="status">
								 <tr style="border: 1px solid black;">
								 	<td>${jo.pct_no}</td>
									<td>${jo.pct_name}</td>
									<td>${jo.pd_no}</td>
									<td>${jo.pd_name}</td>
									
									<td><img id="imgSize" src="/shoestarStorage/prod/thumb/${jo.pim_main}" /></td>
								 <tr>
							</c:forEach>
							
							<tr>
								<td colspan="5" style="padding: 10px;">
									<input type="button" value="수정" id="updateBtn" class="updateBtn" name="updateBtn" />
								</td>
							</tr>
						</table>
					
					</div>
			</div>
		</body>
</html>
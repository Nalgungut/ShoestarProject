<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	
	<title>범위할인 상세</title>
	
	<link rel="stylesheet" href="/resources/include/css/rdisList.css" >
	 <script type="text/javascript"
	   src="/resources/include/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="/resources/include/js/jquery.form.min.js"></script>
	
	<style type="text/css">
		#imgSize{width: 70px; height: 70px;}
		.RD_td{width: 180px;}
		td{border: 1px solid black;}
		/* #RdisTitle{
				margin-top: 50px;
			} */
	</style>
	
	<script type="text/javascript">
		$(function() {
			
			
			
			// 중복 제거
/* 			var opValues = [];
			$("select#pct_no").each(function() {
				opValues.push($(this).html());
			});	
 */
			var tmp_val="";

			$("select#pct_no option").each(function(){

				var this_val=$(this).attr("value");

				if(tmp_val==this_val) $(this).remove();

				else tmp_val=this_val;

			});

			
			
			
			$("#updateBtn").click(function() {
				 var rd_no = $("#rdNo").attr("data-num");
		         $("#rd_no").val(rd_no);
		         $("#no").val(rd_no);
		
		          $("#RdisForm").attr({
		            "method" : "post",
		            "action" : "/admin/event/rds/updateForm"
		         });
		
		          $("#RdisForm").submit();
				
			/* 	$.ajax({
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
					
				}); */
			});
			
			// 타입 더 추가~
			$("#rtInsertBtn").click(function() {
				
				 var rd_no = $("#rdNo").attr("data-num");
		         $("#rd_no").val(rd_no);
		
		         $("#rtDeleteForm").attr({
		            "method" : "post",
		            
		            "action" : "/admin/event/rt/insertForm"
		         });
		         $("#rtDeleteForm").submit();
				
			});
			
			// 타입 삭제
			$("#rtDeleteBtn").click(function() {
				
				if(confirm("선택한 내용을 삭제하시겠습니까?")) {
					var rd_no = $("#rdNo").attr("data-num");
			         $("#rd_no").val(rd_no);
			
			         $("#rtDeleteForm").attr({
			            "method" : "get",
			            
			            "action" : "/admin/event/rt/delete"
			         });
			         $("#rtDeleteForm").submit();
				}
			})
			
			// 목록 가기
			$("#listBtn").click(function() {
				location.href="/admin/event/rds/list";
			});
			
			// 범위 할인 전체 삭제
			$("#deleteBtn").click(function() {
				if(confirm("선택한 내용을 삭제하시겠습니까?\n삭제시 모든 범위 할인 대상은 사라집니다.")) {
					 var rd_no = $("#rdNo").attr("data-num");
			         $("#rd_no").val(rd_no);
			
			         $("#RdisForm").attr({
			            "method" : "get",
			            "action" : "/admin/event/rds/delete"
			         });
			         $("#RdisForm").submit();
			         
				}
			});
		});
		
/* 		function popupOpen(){
			
			var popUrl = "/admin/event/rt/insertForm";	//팝업창에 출력될 페이지 URL

			var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
			
			 	window.open(popUrl, "", popOption); // url , form의 target, 사이즈
				
			    $("#insertForm").submit();
				 

			}
 */

	
	</script>
	
	</head>
		<body>
			
			<%-- ${detail.rd_no} 
			${detail.rd_title} 
			${detail.rd_content} 
			${detail.rd_discount} 
			<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${detail.rd_date}" />
			<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${detail.rd_edate}" /> --%>
			<div id="RdisContainer">
				<div id="RdisTDiv"><h1 id="RdisTitle">${detail.rd_title}의 상세 정보</h1></div>
			<!-- <div id="header"><h3>범위할인 대상 등록</h3></div> -->
					
				<div>
						<!-- <form name="insertForm">
							<input type="hidden" name="no" id="no" />
							<a href="javascript:popupOpen();" > 열려라 팝업창! </a>
						</form> -->
						
						
						
						<form name="RdisForm" id="RdisForm">
							<input type="hidden" name="rd_no" id="rd_no" />

							<table id="RdisDetailTable" border="1">
								<caption class="Rcaption" style="font-size:17pt;">정보</caption>
								<tr>
									<td class="RD_td gray">번호</td>
								
									<td id="rdNo" data-num="${detail.rd_no}">${detail.rd_no}</td>
								</tr>
								
								<tr>
									<td class="RD_td gray">제목</td>
							
									<td id="rd_title">${detail.rd_title} </td>
								</tr>

								<tr>
									<td class="RD_td gray">내용</td>
								
									<td id="rd_content">${detail.rd_content} </td>
								</tr>								
								
								<tr>
									<td class="RD_td gray">할인</td>
							
									<td id="rd_discount">${detail.rd_discount}
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
							
									<td id="rd_date">
									<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${detail.rd_date}" />
									</td>
								</tr>
								
								<tr>
									<td class="RD_td gray">만료일</td>
							
									<td id="rd_edate">
									<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${detail.rd_edate}" />
									</td>								
								</tr>
								<!-- 
								
								</tr>
								<tr>
								 -->
							</table>
					</form>	
						<br />
						
						<form name="rtDeleteForm" id="rtDeleteForm">
							<input type="hidden" name="rd_no" value="${detail.rd_no}" data-num="${detail.rd_no}" />
							
						<table id="prodRdisDetailTable">
							<caption class="Rcaption" style="margin-bottom:5px;">범위 할인 대상
							
								
								<input type="button" id="rtDeleteBtn" name="rtDeleteBtn"
										class="rdBtn" value="대상 삭제"
										style=" font-size: 13px; width: 70px; float: right; 
										margin-left: 10px;
										"
								 />
							
								<input type="button" id="rtInsertBtn" name="rtInsertBtn" 
										class="rdBtn" value="대상 등록"
										style=" font-size: 13px; width: 70px; float: right; 
										margin-left: 10px;"
								 />
								 
								<select id="pct_no" name="pct_no"
								 style="float: right; font-size: 15px; margin-top: 10px;
										font-weight: normal;">
								<c:forEach items="${Alldetail}" var="jo">
								  <option value="${jo.pct_no}">${jo.pct_name}</option>
								</c:forEach>
								</select>
								<span style="float: right; font-size: 15px; margin-top: 11px;
									margin-right: 10px;">
									선택
								</span>
							</caption>
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
									<!-- <td class="RD_td gray">삭제하기</td> -->
							 </tr>	
							<c:forEach items="${Alldetail}" var="jo" varStatus="status">
								 <tr style="border: 1px solid black;">
								 	<td>${jo.pct_no}</td>
									<td id="pct_name">${jo.pct_name}</td>
									<td id="pd_no">${jo.pd_no}</td>
									<td id="pd_name">${jo.pd_name}</td>
									
									<td><img id="imgSize" src="/shoestarStorage/prod/thumb/${jo.pim_main}" /></td>
<!-- 									<td><input type="button" id="rtDeleteBtn" name="rtDeleteBtn" class="tdw Abtn" value="삭제" /></td>
 -->								 <tr>
							</c:forEach>
							
							<!-- <tr>
								<td colspan="5" style="padding: 10px; margin-top: 20px;">
									<input type="button" value="수정" id="updateBtn" class="updateBtn" name="updateBtn" />
									<input type="button" value="목록" id="listBtn" class="rdBtn" name="listBtn" />
									<input type="button" value="삭제" id="deleteBtn" class="rdBtn" name="deleteBtn" />
								</td>
							</tr> -->
						</table>
						</form>
								<div style="padding: 10px; margin-top: 50px; text-align: center;">
									<input type="button" value="수정" id="updateBtn" class="updateBtn" name="updateBtn" />
									<input type="button" value="목록" id="listBtn" class="rdBtn" name="listBtn" />
									<input type="button" value="삭제" id="deleteBtn" class="rdBtn" name="deleteBtn" />
								</div>

					</div>
					
					<div style="position: fixed; bottom: 70px; right: 10px;">
							<div style="cursor:pointer; border: 1px solid #D3D3D3; background-color: #D3D3D3; color:white; padding: 5px;" 
								onclick="window.scrollTo(0,0);">TOP</div>
					</div>	
			
					
			</div>
		</body>
</html>
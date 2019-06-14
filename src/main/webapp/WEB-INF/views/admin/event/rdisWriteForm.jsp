<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />
		
		<link rel="stylesheet" href="/resources/include/css/eventList.css" >
		<script type="text/javascript"
			   src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/eventList.js"></script>
		<script type="text/javascript" src="/resources/include/js/jquery.form.min.js"></script>

		<script type="text/javascript" src="/resources/include/js/productCommon.js"></script>
		<script type="text/javascript" src="/resources/include/js/prodAdmin.js"></script>
		<script type="text/javascript" src="/resources/include/js/product.js"></script>
		<script type="text/javascript" src="/resources/include/js/prodctg.js"></script>

	<style type="text/css">
		.RDcontainer{width: 80%; height: 70%;}
		#proSelectBtn{margin-left: 10px;
			border:none; border-radius: 5px;
			background-color: #2166B5; color: white; 
			padding: 5px; padding-left: 10px; padding-right: 10px;}
	</style>
	
	<script type="text/javascript">
		$(function() {
			
			// 카테고리 정보 읽어오기
			getProdCtgList(null, $("#ctgList"), $("#updateCategoryList")); // #updateCategoryList
			
		// 카테고리 정보의 value값을 선택하면 그 값의 pct_no에 해당하는 제품명들을 불러옴
		// 제품들을 클릭시 우측 칸에 제목이 들어가고 저장시에는 pd_no가 rt_product에 들어감
			
			
		// 카테고리 목록 클릭하면 제품명 보이게
		$("#ctgList").click(function() {		
				var ctg_no = $("#ctgList").val();
				 if($("#ctgList").val()!=0){
					console.log(ctg_no);
					submitSearch(ctg_no, $("#prodList")  ,$("#prodList")  );
				 }		
			
				//"/product/getList?pct_no=+"+ctg_no+"&includeItemless=true";
		});
		
			
		var opt_vals = [];
		
		$("select.#prodList option").each(function(){
			opt_vals.push(($this).html());
		});		
			
			// 제품 번호 확인
		$("#prodList").click(function() {		
				var pd_no = $("#prodList").val();
				console.log(pd_no);
		});
			
		// 제품명을 select한 상태에서 버튼을 누르면 우측 테이블에 값이 들어온다.
		$("#proSelectBtn").click(function() {
			
			if($("#prodList").val()!=null && $("#prodList").val()!=0){
				var pd_no = $("#prodList").val();
				var pd_name = $("#prodList").find(":selected").html(); // 선택된 부분의 html가져옴
				
				console.log(pd_name);
				
				if(!chkPdNo($("#prodList").val(), opt_vals , "이 제품은")) return;

				var tr = $("<tr>");
	      		tr.attr("data-num", pd_no);
	      		tr.addClass("trtr");
	      		
	      		var td1 = $("<td>");
	      		
	      		var td2 = $("<td>");
	      		
	      		var a1 = $("<a>");
	      		a1.html(pd_no);
	      		//a.attr("href", ""); // 상품이 크게 자세히 뜬다.
				
	      		var a2 = $("<a>");
	      		a2.html(pd_name);
	      		
	      		tr.append(td1.append(a1)).append(td2.append(a2));
	      		
	      		$("#prTable").append(tr);
	      		
			}else{
				alert("제품을 선택해주세요!");
			}
		});
					
			// 단위 초기값 : %
			$("#inputV").html("%");
	
			// 단위 바꿀 시 클릭
			$("#disSelect").click(function() {	
				if($("#disSelect").val() == '할인율'){
					$("#inputV").html("%");
				}else if($("#disSelect").val() == '할인금액'){
					$("#inputV").html("원");
				}
			});
			
			// 저장 버튼 클릭시
			$("#insertFormBtn").click(function() {
				if(!chkSubmit($("#rd_title"), "할인 제목을")) return;
				else if(!chkSubmit($("#rd_content"), "할인 내용을")) return;
				else if(!chkNumber($("#rd_discount"), "할인가를")) return;
					if($("#disSelect").val() == '할인율') {
						if(!chkPercent($("#rd_discount"), "할인율은")) return;
					}
					if($("#disSelect").val() == '할인금액') {
						if(!chkKrw($("#rd_discount"), "할인금액은")) return;
					}
				//else if(!chkSubmit($(".pd_no li"), "제품명을 ")) return;
				else {
					insertData();
				} 
				console.log($("#rd_discount").val());
			});
			
			// 취소
			$("#RDCancelBtn").click(function() {
				$("#insertForm").each(function(){
					this.reset();
				});
			});
			
			// 목록
			$("#RDListBtn").click(function() {
				location.href="/admin/event/rds/list";
			});
		});
				
		
		// 저장 function
		function insertData(){
			$("#insertForm").attr({
				"method" : "post",
				"action" : "/admin/event/rds/insert"
			});
			
			$("#insertForm").submit();
		}
		
		// 상품 정보들을 보여준다.
		function submitSearch(ctg_no, selectTarget, ...targetList) {
			for (var index in targetList) {
				targetList[index].html("");
				targetList[index].append(emptyOption());
			}
			//"/admin/event/rds/writeForm?" + searchRequest;
			$.ajax({
				url: "/product/getList?pct_no="+ctg_no+"&includeItemless=true",
				type: "get",
				dataType: "json",
				error: function() {
					alert("제품명 정보를 읽어올 수 없었습니다.");
				},
				success: function(data) {
					if(!jQuery.isEmptyObject(data)) {
						$.each(data, function(index, ctgData) {
							for (var index in targetList) {
								var optionToAppend = $("<option>").attr("value", ctgData.pd_no).text(ctgData.pd_name);
								if(selectTarget == ctgData.pd_no) {
									optionToAppend.prop("selected", true);
								}
								targetList[index].append(optionToAppend);
							}
						});
					} else {
						for (var index in targetList) {
							targetList[index].append(createErrorList("항목없음", "option"));
						}
					}
				}
			});
		}
		
		/* function(){
			var etcs = '';
			$('select[name=aa] option:selected').each(function(index){
			 etcs += $(this).attr('etc') +',';
			});
		} */
	</script>
	
	</head>
	<body>
		<div class="RDcontainer">
			<div class="RD_header"><h2 id="RDconTitle">범위할인 등록</h2>		
			 <hr />
			 </div>
			<div id="insertDiv">		
				<form id="insertForm">
					<table id="insertTable">
						<caption class="Acaption">범위할인 정보</caption>
						
						<tr>
							<td class="RD_td gray">할인명</td>
							<td class="RD_tdInput"><input type="text" id="rd_title" name="rd_title" maxlength="30" size="100"/></td>	
						</tr>
						
						<tr>
							<td class="RD_td gray">할인 내용</td>
							<td class="RD_tdInput" style="padding: 0px;">
								<textarea id="rd_content" name="rd_content" rows="2" cols="130" maxlength="100"></textarea>
							</td>
						</tr>
						
						<tr>
							<td class="RD_td gray">할인가</td>
							<td class="RD_tdInput">
								<select id="disSelect" name="disSelect">
									<option value="할인율">할인율</option>
									<option value="할인금액">할인금액</option>
								</select>
								<input type="number" name="rd_discount" id="rd_discount" />
								<span id="inputV"></span>
							</td>
						<tr>
							<td class="RD_td gray">이벤트 종료일</td>
							<td class="RD_tdInput"><input type="date" id="rd_edate" name="rd_edate" /></td>
						</tr>
					</table>
				
					
					<table border="1" style="border-collapse: collapse; width: 400px; height: 100px;">
						<caption>범위대상</caption>
					
					<thead>	
						<tr>
							<td>대분류</td>
						<!-- </tr>
						
						<tr> -->
							<td>
								<select name="pct_no" id="ctgList" style="width: 222px;" ></select>
							</td>
						</tr>
					</thead>
				<tbody>
				
					<tr>
							<td colspan="2">
								<select name="list[0].pd_no" id="prodList" style="width: 222px;" >
								</select>
								
								<input type="button" value="선택" id="proSelectBtn" name="proSelectBtn" />
							</td>
					</tr>
					
				</tbody>
					</table>
					
					<table id="prTable" style="border-collapse: collapse;" border="1">
						<tr>
							<td>신발번호</td><td>신발명</td>
						</tr>
						<tr>
							<td>
								신발번호(안에다가 data-num 넣는다)
							</td>
							<td>
								신발명 나오게
							</td>
						</tr>
					</table>
					
					
								<div class="btns">			
									
									<input type="button" value="저장" id="insertFormBtn" /> 
									<input type="button" value="취소" id="RDCancelBtn"> 
									<input type="button" value="목록" id="RDListBtn">
								</div>
			
			</form>			
			</div>		
					
		</div>
		
	</body>
</html>
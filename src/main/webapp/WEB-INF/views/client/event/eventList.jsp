<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

 
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>이벤트</title>

	
      <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
	  <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />

	  <link rel="stylesheet" href="/resources/include/css/eventList.css" >
	  <script type="text/javascript" src="/resources/include/js/eventList.js" ></script>

	  <!-- 상위 버전 링크 추가 + jquery + bootstrap.js : 쓸 시 아래 주석 -->
	  <!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script> -->
	  
	  <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js" ></script>
      <script type="text/javascript" src="/resources/include/js/jquery.form.min.js"></script>


	<style type="text/css">
		#Container{margin-left: 80px;}
		#EvconTitle{font-size: 30pt; color: black;}
		.img{width: 500px; height: 400px;}
		li{list-style: none;}
		*{text-align: left;}
		#rowEventArea{margin-top: 20px;}
		.thumbnail{
			/* width: 315px; height: 145px; */ 
			width: 315px; height: 145px;
			padding: 0px; 
		}
		#thumImg{/* width: 315px; height: 145px; */width: 100%; height: 100%;}
		#cols{width: 340px; height: 180px;}
		.Event_td{padding: 0px;}
		.ts{width: 293px;}
		/* .topBorder{background-color: #F2EADF;}  *//* 제목 배경색 나중에 하자 ★ */
	</style>

	<script type="text/javascript">
		 $(function(){
			
			$(".EventTitle").click(function() {
				   var ev_no = $(this).parents("tr").attr("data-num");
					
			         $("#ev_no").val(ev_no);
			
			         $("#EventListform").attr({
			            "method" : "get",
			            "action" : "/event/detail"
			         });
			         $("#EventListform").submit();
		      });
			
			$(".EventTitle").hover(function(){
				
			/* 	// 이미지 속성 부여하면 같은 이미지로만 슬라이드..
				var ss = $(this).attr("data-thumb");
				//console.log(ss);
				var uThumb = "/shoestarStorage/eventThumb/"+ss;
				$(this).parents().find(".item").find("img").attr("src",uThumb);
	
				 */
				 
				// 제목 부트 스트랩 마우스 오버시 CSS 
				$("li").css("list-style","none");
				
				$(this).parent().css("list-style","disc");
			});
			
			
			// 부트스트랩 + 제이쿼리 상위 버전으로 제목에 커서 올릴 시 이동.. (상위버전 쓰면 충돌.. 사용 불가)
			/* $('.EventTitle').hover(function(){ // (e)는  작동하기 위해? 누른 값을 가져오는 얘 (없어도 있어도 상관 X)
				var value = $(this).attr("data-title");
				console.log(parseInt(value));
				
				//$(this).parents().find(".item").find("img").attr("data-slide-to",value);
				$('.carousel ol li').attr("data-slide-to", value);
				$('.carousel').carousel(parseInt(value));
				
			}, function() { // 이거는 썸네일이미지로 속성 변경시로 쓰면 될 듯.
				console.log("아닐시~");
				$('.carousel').carousel({
					  interval: 2000
					})
			});
			*/
		
			
			
		}); // function 종료
	

	</script>

	</head>
<body>
	<div id="Container">
	
	
		<div id="EvcontainerTitle"><h1 id="EvconTitle">이벤트</h1>
		</div>
		
		
		<div id="EventList">
			<form id="EventListform" name="EventListform">
				<div id="EventTable">
					
				<input type="hidden" name="ev_no" id="ev_no" />
					
					<table id="EvnetViewTable">
						<tr>
							
							<!-- 시작 -->
							
							<!-- 이벤트 제목인  event_tab_A~D를 hover하면 그 제목에 해당하는 이미지로 뜬다. -->
							<td rowspan="7" class="Event_td" id="liSize">

									<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
									
									  <ol class="carousel-indicators">
									    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
									    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
									    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
									    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
									  </ol>
							
									  <div class="carousel-inner" role="listbox">
									  	
									  	
										<c:forEach var="evt" items="${eventList}" varStatus="status" end="3">
									  
									  	  <c:choose>
										  		<c:when test="${status.index == 0}">
											    <div class="item active">
												      <a class="EventImage" href="/event/detail?ev_no=${evt.ev_no}">
												      		<img class="img siz" src="/shoestarStorage/eventThumb/${evt.ev_thumb}" alt="...">
												      </a>
											    </div>
											    </c:when>
											    
											    <c:otherwise>
											    <div class="item">
											      <a class="EventImage" href="/event/detail?ev_no=${evt.ev_no}">
											      		<img class="img siz" src="/shoestarStorage/eventThumb/${evt.ev_thumb}" alt="...">
											      </a>
											    </div>
										    	</c:otherwise>
									    	</c:choose>
										 </c:forEach>
																			   	
									  </div>
									
									 
									  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
									    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
									    <span class="sr-only">Previous</span>
									  </a>
									  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
									    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
									    <span class="sr-only">Next</span>
									  </a>
									</div>									
					
							
							<!-- 끝 -->
							</td>
						</tr>
					
						<tr>
						<td rowspan="7">&nbsp;&nbsp;</td>
							<td style="border-bottom: 2px solid #595959;"></td></tr>
							
						<!-- 이벤트 4개 선택하면 그 항목 보이고 선택 안하면 최신별4개 ex: -->
						<c:forEach var="evt" items="${eventList}" varStatus="status" end="3">
							<tr class="evtno" data-num="${evt.ev_no}">
								
								<td class="Event_td ts topBorder" style="padding: 30px">
									<ul>
										<li style="margin-left: 5px;">
											<a class="EventTitle" data-title="${status.index}" data-thumb="${evt.ev_thumb}">
													${evt.ev_title}							
											</a>
										</li>
									</ul>
									
								</td>
							</tr>
						</c:forEach>
						
						<tr>
							<td style="border-top: 2px solid #595959;"></td></tr>
					</table>
					
<!-- 					
					<table id="table2">
						<tr>
							<td id="tableB"><img alt="즉시 할인 상품 바로 보기" src="">즉시 할인 상품 바로 보기</td>
						</tr>
					</table>
		 -->
		 
				</div>
			</form>
		</div>
		
		<hr style="width: 1000px; margin-top: 12px; border: 2px solid black;" />
		<hr style="width: 1000px; border: 1px solid black;" />
		
		
		<div id="shostLog" style="margin-top: 40px;">
			<a href="http://localhost:8080/" class="logo">
							<img  style="width: 1000px; height: 130px;"
							 src="/resources/include/test/images/icons/shoestar1.png" alt="IMG-LOGO">
			</a>
		</div>
		
		<p style="margin-top: 40px; color: black; font-weight: bold;">Shoestar 진행중인 기획전/이벤트</p>
		<hr style="width: 1000px; margin-top: 5px; margin-bottom: 10px; border: 1px solid black;" />
		
		<!-- 
						동적 생성할 event 리스트  : 생성 할 때마다 추가됨. >> 동적 말고 c:forEach 로 ㄱㄱ  여기서 forEach로 썸네일 이미지 + 링크 보여주기 > detail-->
		<%-- 이벤트 리스트 영역 --%>
		<div class="row" id="rowEventArea">
					
					 
		<c:forEach var="evt" items="${eventList}" varStatus="status">
			<div class="col-sm-6 col-md-4" id="cols">
				<div class="thumbnail">
					<a href="/event/detail?ev_no=${evt.ev_no}" data-lightbox="roadtrip">
						<img id="thumImg" src= "/shoestarStorage/eventThumb/thumbnail/thumbnail_${evt.ev_thumb}" alt="${evt.ev_title}">
						<span style="color: #4F495E; font-size:8pt;">
						
							<c:set var="TextValue" value="${evt.ev_title}"/>		
						
							<strong style="font-size:10pt;  float:left; ">${fn:substring(TextValue,0,10)}..</strong>
							
							<span style=" float: right;">기간 : <fmt:formatDate pattern="yyyy-MM-dd" value="${evt.ev_date}" />
							
								<c:choose>	
									<c:when test="${evt.ev_edate == null || evt.ev_edate==''}">
										<div style="margin-left: 45px; float: right;"></div>
									</c:when>	
									<c:otherwise><fmt:formatDate pattern="yyyy-MM-dd" value="${evt.ev_edate}" /></c:otherwise>
								</c:choose>
							
							</span>
						</span>
					</a>
				</div>
			</div>
		</c:forEach>
			
			<hr style="width: 1000px; margin-top: 35px; border: 2px solid black;" />
			<hr style="width: 1000px; border: 1px solid black;" />
		

			<div style="position: fixed; bottom: 10px; right: 10px;">
				<div style="cursor:pointer; border: 1px solid #D3D3D3; background-color: #D3D3D3; color:white; padding: 5px;" 
					onclick="window.scrollTo(0,0);">TOP</div>
			</div>
		</div>
	</div>
</body>
</html>
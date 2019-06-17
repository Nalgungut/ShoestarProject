<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		
		<title>브랜드 뉴스페이지에 오신것을 환영합니다.</title>
		<!-- 3. 공지사항 페이지 -->
		
		<link rel="shortcut icon" type="image⁄x-icon" href="/resources/images/icon.png" />
		<link rel="apple-touch-icon" type="image⁄x-icon" href="/resources/images/icon.png" />
		
		<!-- [if lt IE 9]>
			<script src="/resources/include/js/html5shiv.js"></script>
		<![endif] -->
		<link href="/resources/include/dist/css/bootstrap-responsive.css" rel="stylesheet">
		<link href="/resources/include/dist/css/bootstrap-ko.css" rel="stylesheet">
		
    	<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
      	<script type="text/javascript" src="/resources/include/js/searchNotice.js"></script>
      	
      	<!-- <link rel="stylesheet" type="text/css" href="/resources/include/css/bootstrap.css"/> -->
     	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
     	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
     	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		
		<style>
		
				/*사이드바 */
			.bb {
			  margin: 0;
			  font-family: "Lato", sans-serif;
			}
			
			.sidebar {
			  margin-left: -30px;
			  margin-top: 125px;
			  padding: 0px;
			  background-color: black; 
			  position: absolute;
			  overflow: auto; 
			  left: 30px;
			  float: left;
			}
			
			.sidebar a {
			  display: block;
			  color: black;
			  padding: 16px;
			  text-decoration: none;
			}
			 
			.sidebar a.active {
			  background-color: #505050;
			  color: white;
			}
			
			.sidebar a:hover:not(.active) {
			  background-color: #555;
			  color: white;
			}
			
		
			
			div.content {
			  margin-left: 200px;
			  padding: 1px 16px;
			  height: 1000px;
			}
			
			 @media screen and (max-width: 700px) {
			  .sidebar {
			    width: 100%;
			    height: auto;
			    position: relative;
			  }
			  .sidebar a {float: left;}
			  div.content {margin-left: 0;}
			}
			
			@media screen and (max-width: 400px) {
			  .sidebar a {
			    text-align: center;
			    float: none;
			  }
			} 
			/* 사이드 바 종료 */
			p{
				text-align: center;
			}
			
			/* 사이드 바 종료 */
				
				table{
					line-height:1.8;
					font-size:17px;
					width:100%;
					margin:50px 70px;
				}
				#insertFormBtn{
					float:right;}
					.cnt{color:red;}
				h3{
					text-align: center;
				}
				th{
					text-align: center;
				}
					
				#boardsearch{
					float:right;}
				.required{
					color:red;}
				
				
				.noticeList{
					margin-left: 50px;
				}
				#keyword{
					width: 200px;
					height: 35px;
					
				}
				
				#se{
					text-align: right;
					color: navy;
				}
			</style>
		
		<script type="text/javascript">
           
           
           $(function(){
              listData();
              
              
              
              /* 팝오버 설정 */
               var options = {
                     html : true,
                     placement : 'right',
                     container : 'body',
                     title: function(){
                        return $("#popover-head").html();
                     },
                     content: function(){
                        return $("#popover-content").html();
                     }
               }
               
               $(document).on("click", "a[data-btn]", function(){   /* a[data-btn] -> a태그안에 data-btn값을 가지고 있다면 */
                  $("a[data-btn]").not($(this)).popover(options).popover("hide");
                  $(this).popover(options).popover("show");
                  btnKind = $(this).attr("data-btn");
                  galleryNum = $(this).parents("div.col-sm-6").attr("data-num");
                  console.log("클릭버튼 btnKind : " + btnKind + "선택한 글번호 : " + ar_no);
               });
               
               
           	}); /* function종료 */
                 function listData(){
                    $("#rowArea").html("");
                    $.getJSON("/brand/brandNewsData", $("#f_search").serialize(), function(data){
                       console.log("length: " + data.length);
                       $(data).each(function(index){
                          var ar_no = this.ar_no;
                          var ar_subject = this.ar_subject;
                          var ar_content = this.ar_content;
                          var ar_file = this.ar_file;
                          console.log("index : "+index);
                          thumbnailList(ar_no, ar_subject, ar_content, ar_file, index);
                       });
                    }).fail(function(){
                       alert("목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.");
                    });
                 }
            //modal 초기화 작업
            function setModal(title, value, text){
               $("#galleryModalLabel").html(title);
               $("#galleryBtn").attr("data-button", value);
               $("#galleryBtn").html(text);
               if($("#galleryBtn").attr("data-button")=="insertBtn"){
            	   $("#f_writeForm > input[type='hidden'], #f_writeForm .image_area > img").remove();
            	   $("#g_name").removeAttr("readonly");
               }
            }
            
            //썸네일 작업
            function thumbnailList(ar_no, ar_subject, ar_content, ar_file, index){
               var column = $("<div>");
               column.attr("data-num", ar_no);
               column.addClass("col-sm-6 col-md-4");
               
               var thumbnail = $("<div>");
               thumbnail.addClass("thumbnail");
               
               var lightbox_a = $("<a>");
               lightbox_a.attr({"href":"/brand/brandNewsDetail",
                            "data-lightbox": "roadtrip",
                            "title":ar_subject});
               
               var img = $("<img>");
               img.attr("src", "/uploadStorage/gallery/thumbnail/"+ar_file);
               
               var caption = $("<div>");
               caption.addClass("caption");
               
               var h3 = $("<h3>");
               h3.html(ar_subject.substring(0, 12)+"...");
               
               
               var pContent = $("<p>");
               pContent.html(ar_content.substring(0, 24)+"...");
               
               var pBtnArea = $("<p>");
                     
                 /* var upBtn = $("<a>");
                     upBtn.attr({"data-btn":"upBtn", "role":"button"});
                     upBtn.addClass("btn btn-primary gap");
                     upBtn.html("수정");


               
               var delBtn = $("<a>");
               delBtn.attr({"data-btn":"delBtn", "role":"button"});
               delBtn.addClass("btn btn-defalut");
               delBtn.html("삭제"); */
               
               caption.append(h3).append(pContent)//.append(pBtnArea.append(upBtn).append(delBtn));
               column.append(thumbnail.append(lightbox_a.append(img)).append(caption));
               
               $("#rowArea").append(column);
   
            }
         </script>
		
	</head>
	
	<body>
		
		
	
	<!-- 페이징 처리를 위한 Form -->
	<form name="f_search" id="f_search"></form>
	
	<!-- 갤러리 리스트 영역 -->
	<div class="row" id="rowArea"></div>
	<!-- 사이드 바  -->
		<!-- 사이드 바  -->
			<div class="sidebar" style="width:10%; background-color:#222;" >
			
			  <a href="/brand/brandMain" style="color: white;">브랜드 소개</a>
			  <a class="active" href="/brand/brandNewslist">브랜드 뉴스</a>
			  <a href="/brand/noticeList" style="color: white;">공지사항</a>
			</div>
            
           <!-- 갤러리 등록 화면 영역(modal) -->
	    <div class="modal fade" id="galleryModal" tabindex="-1" role="dialog" aria-labelledby="galleryModalLabel" aria-hidden="true">
	    	<div class="modal-dialog">
	             <div class="modal-content">
	             	<div class="modal-header">
	                	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	                 	<h4 class="modal-title" id="replyModalLabel">갤러리 등록</h4>
	               </div>
	               <div class="modal-body">
	               	    <form id="f_writeForm" name="f_writeForm">
	                    	<div class="form-group">
	                     		<label for="ar_name" class="control-label">기사번호</label>
	                     		<input type="text" class="form-control" id="ar_no" name="ar_no" maxlength="5">
	                   		</div>
	                   		<div class="form-group">
	                     		<label for="ar_subject" class="control-label">기사제목</label>
	                     		<input type="text" class="form-control" id="ar_subject" name="ar_subject" maxlength="5">
	                   		</div>
	                   		<div class="form-group">
	                      		<label for="ar_content" class="control-label">기사내용</label>
	                      		<textarea class="form-control" name="ar_content" id="ar_content" rows="4"></textarea>
	                   		</div>
	                   		<div class="form-group image_area">
	                      		<label for="ar_file" class="control-label">이미지</label>
	                      		<input type="file" name="ar_file" id="ar_file"/> <!-- GalleryVO에 g_file -->
	                   		</div>
	                 	</form>
	               </div>
	               <div class="modal-footer">
	               		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	                 	<button type="button" class="btn btn-primary" id="galleryBtn">등록</button>
	               </div>
	           </div>
	        </div>
	     </div>
	</body>
</html>
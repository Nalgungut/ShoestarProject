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
		
				/*사이드 바 */
			body {
			  margin: 0;
			  font-family: "Lato", sans-serif;
			}
			
			.sidebar {
			  margin-left: -240px;
			  padding: 0px;
			  width: 200px;
			  background-color: #f1f1f1;
			  position: fixed;
			  height: 100%;
			  overflow: auto;
			}
			
			.sidebar a {
			  display: block;
			  color: black;
			  padding: 16px;
			  text-decoration: none;
			}
			 
			.sidebar a.active {
			  background-color: #4CAF50;
			  color: white;
			}
			
			.sidebar a:hover:not(.active) {
			  background-color: #555;
			  color: white;
			}
				
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
           
           
           /* 전역변수 */
           var message = "입력한 비밀번호를 입력해 주세요.",  btnKind="", galleryNum = 0;

           
           $(function(){
              listData();
              
              if(!$("#galleryBtn").attr("data-button")){
                 $("#galleryBtn").attr("data-button", "insertBtn");
              }
              
              $("#galleryInsertBtn").click(function(){
                 setModal("갤러리 등록", "insertBtn", "등록");
                 dataReset();
                 $('#galleryModal').modal();
              });
              
              //저장버튼 클릭 시 처리 이벤트
              $(document).on("click", "button[data-button='insertBtn']", function(){
                 //입력갑 체크
                 if(!checkForm($('#g_name'),"작성자를")) return;
                 else if(!checkForm($('#g_subject'),"글제목을")) return;
                 else if(!checkForm($('#g_content'),"글내용을")) return;
                 else if(!checkForm($('#file'))) return;
                 else if(!chkFile($('#file'))) return;
                 else if(!checkForm($('#g_pwd'),"비밀번호를")) return;
                 else{
                    $("#f_writeForm").ajaxForm({
                       url: "/gallery/galleryInsert",
                       type: "post",
                       enctype: "multipart/form-data", /* 인코딩 타입 */
                       dataType: "text",
                       error: function(){
                          alert('시스템 오류입니다. 관리자에게 문의하세요.');
                       },
                       success: function(data){
                          console.log(data);
                          if(data=="성공"){
                             dataReset();
                             $('#galleryModal').modal('hide');
                             listData();
                          }else{
                             alert("[ "+data+" ]\n등록에 문제가 있어 완료하지 못하였습니다. \n잠시 후 다시 시도해 주세요.");
                             dataReset();
                          }
                       }
                    });
                    $("#f_writeForm").submit(); 
                 }
              });
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
                  console.log("클릭버튼 btnKind : " + btnKind + "선택한 글번호 : " + galleryNum);
               });

              
             //비밀번호 체크 화면에서 "취소" 버튼 클릭 처리
               $(document).on("click", ".pwdResetBtn", function(){
                  $("a[data-btn]").popover(options).popover("hide");
               });
               
               //비밀번호 확인 버튼 클릭 시 처리 이벤트
               $(document).on("click", ".pwdCheckBtn", function(){
                  var form = $(this).parents("form[name='f_passwd']");
                  var passwd = form.find(".passwd");
                  var message = form.find(".message");
                  var value = 0;
                  if(!formCheck(passwd, message, "비밀번호를")) return;
                  else{
                     /*호출 함수.then() 함수 매개변수로 성공 콜백함수, 실패 콜백함수 넘겨줌
                        각 함수의 매개변수는 resolve, reject 함수에서 넘겨준 매개변수를 자동으로 넘겨 받는다*/
                        pwdCheck(passwd, message).then(function(data){
                           console.log("data : " + data);
                           if(data == 1){
                              console.log("비밀번호 확인 후 btnKind : " + btnKind);
                              if(btnKind=="upBtn"){
                                 //console.log("수정 폼 출력");
                                 updateForm();
                              }else if(btnKind=="delBtn"){
                                 console.log("삭제 처리");
                                 deleteBtn();
                              }
                           }
                           btnKind="";
                        });
                     }
               });
               //비밀번호 확인 버튼 클릭 시 실질적인 처리 함수
               function pwdCheck(passwd, message){
                  var def = new $.Deferred();
                  
                  $.ajax({
                     url : "/gallery/pwdConfirm",
                     type : "post",
                     data : "g_num="+galleryNum+"&g_pwd="+passwd.val(),
                     dataType : "text",
                     error : function(){
                        alert('시스템 오류입니다. 관리자에게 문의해 주세요.');
                     },
                     success : function(resultData){
                        console.log("resultData : " + resultData + " / btnKind : " + btnKind);
                        //비동기 함수 success 콜백 함수에 def.resolve()함수 호출
                        if(resultData==0){//일치하지 않는 경우
                           message.addClass("msg_error");
                              message.text("입력한 비밀번호가 일치하지 않습니다");
                              passwd.select();
                        }else if(resultData==1){//일치 할 경우
                           def.resolve(resultData);
                              $("a[data-btn]").popover(options).popover("hide");
                        }
                     }
                  });
                  //def.promise() 함수 리턴
                  return def.promise();
               }
               
             //비밀번호 입력 양식에 키보드로 문자를 누르면 처리 이벤트
               $(document).on("keydown", ".passwd", function(){
                  var span = $(this).parents("form[name='f_passwd']").find(".message");
                  span.removeClass("msg_error");
                  span.addClass("msg_default");
                  span.html(message);
               });
               
               //모달(Modal)에서 수정버튼으로 변경 후 처리 이벤트
               $(document).on("click", "button[data-button='updateBtn']", function(){
                  //console.log("수정버튼");
                  if(!checkForm($('#g_subject'),"글제목을")) return;
                  else if (!checkForm($('#g_content'),"내용을")) return;
                  else{
                     if($('#file').val()!=""){
                        if(!chkFile($('#file'))) return;
                     }
                     
                     $('#f_writeForm').ajaxForm({
                        url : "/gallery/galleryUpdate",
                        type : "post",
                        enctype : "multipart/form-data",
                        dataType : "text",
                        error : function(){
                           alert('시스템 오류입니다. 관리자에게 문의해 주세요.');
                        },
                        success : function(data){
                           console.log(data);
                           if(data=="성공"){
                              dataReset();
                              galleryNum=0;
                              $('#galleryModal').modal('hide');
                              listData();
                           }else{
                              alert("[ "+data+" ]\n 수정에 문제가 있어 완료하지 못했습니다. 잠시 후 다시 시도해 주세요.")
                              dataReset();
                           }
                        }
                     });
                     $("#f_writeForm").submit();
                  }
                  });
               
           	}); /* function종료 */

           
                 function listData(){
                    $("#rowArea").html("");
                    $.getJSON("/gallery/galleryData", $("#f_search").serialize(), function(data){
                       console.log("length: " + data.length);
                       $(data).each(function(index){
                          var g_num = this.g_num;
                          var g_name = this.g_name;
                          var g_subject = this.g_subject;
                          var g_content = this.g_content;
                          var g_thumb = this.g_thumb;
                          var g_file = this.g_file;
                          var g_date = this.g_date;
                          console.log("index : "+index);
                          thumbnailList(g_num, g_name, g_subject, g_content, g_thumb, g_file, g_date, index);
                       });
                    }).fail(function(){
                       alert("목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.");
                    });
                 }
           
                 /* 글 삭제를 위한 Ajax 연동 처리 */
                 function deleteBtn(){
                    if(confirm("선택한 내용을 삭제하시겠습니까?")){
                       $.ajax({
                          url : "/gallery/galleryDelete",
                          type : "post",
                          data : "g_num="+galleryNum,
                          dataType : "text",
                          error : function(){
                             alert('시스템 오류입니다. 관리자에게 문의해주세요.');
                          },
                          success : function(data){
                        	 /* alert('삭제 성공')
                        	 listData(); */
                             if(data == '성공'){ // 여기부분이 인식이 안되던거 xml 에서 select 가 아니라 delete 로 수정
                            	console.log("삭제성공");
                             	alert("삭제 성공");
                                galleryNum = 0;
                                listData();
                             }
                          }
                       });
                    }
                 }
                 
                 /*수정 폼 구현 함수*/
                 function updateForm(){
                    $("#f_writeForm > input[type='hidden'],#f_writeForm .image_area > img").remove();
                    $.ajax({
                       url : "/gallery/galleryDetail",
                       type : "get",
                       data : "g_num="+galleryNum,
                       dataType : "json",
                       error : function(){
                          alert('시스템 오류 입니다. 관리자에게 문의하세요');
                       },
                       success : function(data){
                          $("#g_name").val(data.g_name);
                          $("#g_subject").val(data.g_subject);
                          $("#g_content").val(data.g_content);
                          
                          var input_num = $("<input>");
                          input_num.attr({"type":"hidden","name":"g_num"});
                          input_num.val(data.g_num);
                          
                          var input_file = $("<input>");
                          input_file.attr({"type":"hidden","name":"g_file"});
                          input_file.val(data.g_file);
                          
                          var input_thumb = $("<input>");
                          input_thumb.attr({"type":"hidden","name":"g_thumb"});
                          input_thumb.val(data.g_thumb);
                          
                          var img = $("<img>");
                          img.attr({"src":"/uploadStorage/gallery/thumbnail/"+data.g_thumb,
                             "alt":data.g_subject});
                          img.addClass("img-rounded margin_top");
                          
                          $("#f_writeForm").append(input_num).append(input_file).append(input_thumb);
                          $(".image_area").append(img);
                          $("#g_name").attr("readonly", "readonly");
                          
                          setModal("갤러리 수정", "updateBtn", "수정");
                          $('#galleryModal').modal();
                       }
                    });
                 }
           
            /* 폼 초기화 작업 */
            function dataReset(){
               $("#f_writeForm").each(function(){
                  this.reset();
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
            function thumbnailList(g_num, g_name, g_subject, g_content, g_thumb, g_file, g_date, index){
               var column = $("<div>");
               column.attr("data-num", g_num);
               column.addClass("col-sm-6 col-md-4");
               
               var thumbnail = $("<div>");
               thumbnail.addClass("thumbnail");
               
               var lightbox_a = $("<a>");
               lightbox_a.attr({"href":"/uploadStorage/gallery/"+g_file,
                            "data-lightbox": "roadtrip",
                            "title":g_subject});
               
               var img = $("<img>");
               img.attr("src", "/uploadStorage/gallery/thumbnail/"+g_thumb);
               
               var caption = $("<div>");
               caption.addClass("caption");
               
               var h3 = $("<h3>");
               h3.html(g_subject.substring(0, 12)+"...");
               
               var pInfo = $("<p>");
               pInfo.html("작성자: "+ g_name +" / 등록일: " + g_date);
               
               var pContent = $("<p>");
               pContent.html(g_content.substring(0, 24)+"...");
               
               var pBtnArea = $("<p>");
                     
                 var upBtn = $("<a>");
                     upBtn.attr({"data-btn":"upBtn", "role":"button"});
                     upBtn.addClass("btn btn-primary gap");
                     upBtn.html("수정");


               
               var delBtn = $("<a>");
               delBtn.attr({"data-btn":"delBtn", "role":"button"});
               delBtn.addClass("btn btn-defalut");
               delBtn.html("삭제");
               
               caption.append(h3).append(pInfo).append(pContent).append(pBtnArea.append(upBtn).append(delBtn));
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
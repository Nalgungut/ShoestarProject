/**
 * 공백을 검사하는 내용을 주는 쿼리
 */
function chkSubmit(v_item, v_msg) {
   if(v_item.val().replace(/\s/g,"")==""){
      alert(v_msg+ " 입력해주세요");
      v_item.val("");
      v_item.focus();
      return false;
   } else{
      return true;
   }
}
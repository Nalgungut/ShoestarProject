package com.shoestar.client.brand.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.shoestar.client.brand.Service.NoticeReplyService;
import com.shoestar.client.brand.vo.NoticeReplyVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping(value="/replies")
@Log4j
@AllArgsConstructor

public class NoticeReplyController {
	
	private NoticeReplyService noticeReplyService;
	
	@GetMapping(value="/all/{no_no}",
				produces = {MediaType.APPLICATION_ATOM_XML_VALUE,
							MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<NoticeReplyVO>> replyList(@PathVariable("no_no") Integer no_no){
		log.info("list 댓글 호출");
		
		ResponseEntity<List<NoticeReplyVO>> entity = null;
		entity = new ResponseEntity<> (noticeReplyService.replyList(no_no), HttpStatus.OK);
		
		return entity;
			}
	
	@PostMapping(value="/replyInsert", consumes = "application/json", 
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> replyInsert(@RequestBody NoticeReplyVO nvo){
		log.info("replyInsert 호출");
		int result = 0;
		
		result = noticeReplyService.replyInsert(nvo);
		return result==1 ? new ResponseEntity<String>("SUCCESS", HttpStatus.OK):
						   new ResponseEntity<String>(
								   HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	
	@GetMapping(value = "/{no_no)",
			produces = {MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<NoticeReplyVO> replySelect(@PathVariable("no_no")Integer no_no){
		log.info("replySelect 호출 성공");
		
		ResponseEntity<NoticeReplyVO> entity = null;
		entity = new ResponseEntity<>(noticeReplyService.replySelect(no_no), HttpStatus.OK);
			return entity;
			}
	
	// 댓글 수정
	@RequestMapping(value="/{re_no}",
			method = {RequestMethod.PUT, RequestMethod.PATCH},
			consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> replyUpdate(@PathVariable("re_no")Integer re_no,
			@RequestBody NoticeReplyVO rvo){
		log.info("replyUpdate 호출");
		
		rvo.setRe_no(re_no);
		int result = noticeReplyService.replyUpdate(rvo);
		return result==1?
				new ResponseEntity<String>("SUCCESS", HttpStatus.OK):
				new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 댓글 삭제
	@DeleteMapping(value="/{re_no}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> replyDelete(@PathVariable("re_no")Integer re_no){
		log.info("replyDelete 호출");
		
		int result = noticeReplyService.replyDelete(re_no);
		return result == 1?
				new ResponseEntity<String>("SUCCESS", HttpStatus.OK):
				new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	

}

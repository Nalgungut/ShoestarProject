package com.shoestar.client.cscenter.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.shoestar.client.cscenter.service.QNAReplyService;
import com.shoestar.client.cscenter.vo.QNAReplyVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping(value="/cscenter/replies/*")
@Log4j
//@AllArgsConstructor
public class QNAReplyController {
	/*
	private QNAReplyService qnaReplyService;
	
	@GetMapping(value="/all/{qna_no}", produces = {MediaType.APPLICATION_XML_VALUE,MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<QNAReplyVO>> qnaReplyList(@PathVariable("qna_no") Integer qna_no){
		
		ResponseEntity<List<QNAReplyVO>> entity = null;
		entity = new ResponseEntity<>(qnaReplyService.qnaReplyList(qna_no), HttpStatus.OK);
		return entity;
	}
	*/
}

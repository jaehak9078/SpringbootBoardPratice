package com.cos.board.config;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestController;

import com.cos.board.config.ex.MyArgsNotFound;

@ControllerAdvice //내프로그램 전체를 관리
@RestController
public class ExceptionController {
	
	@ExceptionHandler(value=Exception.class)
	public String 모든오류(Exception e) {
		return e.getMessage();
	}
}

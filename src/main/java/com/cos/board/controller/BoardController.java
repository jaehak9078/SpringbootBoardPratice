package com.cos.board.controller;

import java.util.List;
import java.util.Optional;
import java.util.function.Supplier;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cos.board.config.ex.MyArgsNotFound;
import com.cos.board.dto.BoardSaveRequestDto;
import com.cos.board.model.Board;
import com.cos.board.repository.BoardRepository;
import com.cos.board.service.BoardService;


@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	

	@GetMapping("/saveForm")
	public String saveForm() {
		return "saveForm";
	}
	
	@PostMapping("/save")
	public String save(BoardSaveRequestDto dto) {
		boardService.글쓰기(dto);
		return "redirect:list";
	}
	
	@GetMapping({"","/","/list"})
	public String list(Model model) {
		
		model.addAttribute("boards",boardService.글목록());
		return "list";
	}
	
	@GetMapping("/board/{id}")
	public String detail(@PathVariable int id,Model model) throws Exception {
		//Board board = boardRepositoy.findById(id).orElse(new Board());
//		Board board = boardRepositoy.findById(id)
//				.orElseGet(() -> {
//					
//						System.out.println("못 찾으면 어떻게 할지");
//						System.out.println("못 찾으면 어떻게 할지");
//						System.out.println("못 찾으면 어떻게 할지");
//						System.out.println("못 찾으면 어떻게 할지");
//						System.out.println("못 찾으면 어떻게 할지");
//						
//						return new Board();
//					}
//				);
		model.addAttribute("board",boardService.글상세보기(id));
		
		return "detail";
	}
	
	@ResponseBody
	@DeleteMapping("/board/{id}")
	public String delete(@PathVariable int id) {
		boardService.글삭제하기(id);
		return "ok";
	}
	
	@PutMapping("/board/{id}")
	@ResponseBody
	public String update(@PathVariable int id, @RequestBody BoardSaveRequestDto dto) {
		boardService.글수정하기(id,dto);
		return "ok";
	}
}

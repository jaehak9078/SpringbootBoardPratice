package com.cos.board.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.function.Supplier;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cos.board.dto.BoardSaveRequestDto;
import com.cos.board.model.Board;
import com.cos.board.repository.BoardRepository;

@Service
public class BoardService {

	@Autowired
	private BoardRepository boardRepositoy;
	
	
	@Transactional
	public void 글쓰기(BoardSaveRequestDto dto) {
		Board boardEntity = BoardSaveRequestDto.toEntity(dto);
		boardRepositoy.save(boardEntity);
	}
	
	@Transactional(readOnly = true)
	public Page<Board> 글목록(Pageable pageable) {
		 return boardRepositoy.findAll(pageable);
	}
	
	@Transactional(readOnly = true)
	public ArrayList<String> 글내용바꾸기() {
		
		ArrayList<String> contents = new ArrayList<>();
			
		String content;
		List<Board> boards = boardRepositoy.findAll();
		for(Board board : boards) {
			
			content = board.getContent();
			if(content != null)
			content.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
			contents.add(content);
		}
		
		 return contents;
	}
	
	@Transactional
	public Board 글상세보기(int id){
		Board board;
		
		board = boardRepositoy.findById(id).orElseThrow(()-> new RuntimeException("오류났어요")
		);
		board.setReadCount(board.getReadCount()+1);
		return board;
	}
	
	@Transactional
	public void 글삭제하기(int id) {
		boardRepositoy.mDeleteById(id);
	}
	
	@Transactional
	public void 글수정하기(int id, BoardSaveRequestDto dto) {
		//더티 체킹
		Board boardEntity = boardRepositoy.mFindById(id);
		boardEntity.setTitle(dto.getTitle());
		boardEntity.setContent(dto.getContent());
		
	}
}

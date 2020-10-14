package com.cos.board.service;

import java.util.List;
import java.util.function.Supplier;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public List<Board> 글목록() {
		 return boardRepositoy.findAll();
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

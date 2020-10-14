package com.cos.board.model;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data // => Getter,Setter 합쳐져 있음 + toString() 구현되어 있음.              
//@Getter
//@Setter
@AllArgsConstructor //전체 파라메터를 가진 생성자
@NoArgsConstructor //파라메터가 없는 생성자
@Builder// 빌더 패턴
@Entity // ORM
public class Board {
	@Id //기본키 설정
	@GeneratedValue(strategy = GenerationType.IDENTITY) //해당 데이터베이스 번호증가 전략을 따라가기
	private int id;
	private String title;
	private String content;
	private int readCount;
	
	@CreationTimestamp
	private Timestamp createDate;
	
	
	
	public String getCreateDate() {
		try {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		 String dateFormated = dateFormat.format(createDate);
	     return dateFormated;
		
		}catch(Exception e){
			e.getMessage();
			return null;
		}
		
	}
	
}

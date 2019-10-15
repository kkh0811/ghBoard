package com.example.kkhBoard.mapper;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.kkhBoard.dto.BoardVO;
import com.example.kkhBoard.dto.Search;

// Mapper
// 최근에는 서비스 계층에서 트랜잭션등에 대한 처리가 완료되기 때문에 인터페이스식으로 매퍼를 만듬.
// 최근 스프링부트에서 DAO를 DAO라고 명시하지 않고, mapper라고 정의함. 
// 따라서 어떤 패캐지에서 mapper들을 스캔할것인가를 최상위에 annotation으로 정의함 (DatabaseConfig.java 참고 )

// @Repository
// 해당 클래스가 데이터베이스에 접근하는 클래스임을 명시 
// 파일마다 객체를 계속 만들 필요가 없음 -> 어디에서든지 사용가능 (DI,의존성 주입)
@Repository("com.example.kkhboard.mapper.BoardMapper")
public interface BoardMapper {
	
	// 게시판 목록
    public List<BoardVO> getAll(Search search) throws Exception;
    
    // 게시글 상세
    public BoardVO boardDetail(int id) throws Exception;
    
    // 게시글 작성  
    public int boardInsert(BoardVO board) throws Exception;
    
    // 게시글 수정  
    public int boardUpdate(BoardVO board) throws Exception;
    
    // 게시글 삭제  
    public int boardDelete(int id) throws Exception;
    
}

package com.example.kkhBoard.service;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.kkhBoard.dto.BoardVO;
import com.example.kkhBoard.mapper.BoardMapper;

/* 서비스는 함께 실행되는 메소드를 하나의 트랜젝션으로 묶는다
 * 하나의 트랜잭션으로 묶인 메소드들은 하나라도 실패하면 rollback이 된다
 * 모두 정상적으로 완료되어야 commit 되기 때문에 서비스가 망가질 일이없다
 * 컨트롤러가 DB 조회를 요청할 Service
 * */
 
@Service
public class BoardService {
 
    @Autowired // 타입정보를 기준으로 의존관계를 주입
    BoardMapper boardMapper; //BoardMapper interface를 autowired걸고 밑에 함수들을 call한다.
    
    public List<BoardVO> getAll() throws Exception{
        return boardMapper.getAll();
    }
    
    public BoardVO boardDetailService(int id) throws Exception{
        return boardMapper.boardDetail(id);
    }
    
    public int boardInsertService(BoardVO board) throws Exception{
        return boardMapper.boardInsert(board);
    }
    
    public int boardUpdateService(BoardVO board) throws Exception{  
        return boardMapper.boardUpdate(board);
    }
    
    public int boardDeleteService(int id) throws Exception{   
        return boardMapper.boardDelete(id);
    }
}


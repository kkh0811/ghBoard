package com.example.kkhBoard.controller;
 
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.kkhBoard.dto.BoardVO;
import com.example.kkhBoard.dto.Search;
import com.example.kkhBoard.service.BoardService;

// 컨트롤러 역할을 하는 클래스
@Controller // Control 애노테이션적용 -> 자동으로 상속받는 형식(extends HttpServlet)의 클래스로 변환됨, 주소요청이 올때 어떤 함수를 줄지 결정.
public class BoardController { //순수 자바 클래스이지만 애노테이션 적용해서 컨트롤러 역할을 하게함
 
    @Autowired 
    BoardService boardService; 
    
    @RequestMapping(value="post",method = RequestMethod.GET) // post를 호출하면 post메소드가 호출됨
	public String post(Model model) throws Exception { // String이 오면 return을 String으로 함
		List<BoardVO> list;		
		list = boardService.getAll(null);	
		model.addAttribute("list",list);	
		return "post"; // 생성한 jsp명 (post.jsp), post.jsp를 뷰로 사용해서 사용자 응답을 함
	}
    
    @ResponseBody //스프링 버전이 3.0 이하일 경우는 @ResponseBody 쓰고 3.0 이상일 경우 RestController쓰기
    @RequestMapping("/post/search")
    public List<BoardVO> search(@RequestParam(required = false, defaultValue = "title") String searchType, 
            @RequestParam(required = false) String keyword) throws Exception {
    	//RequestParam은 URL 뒤에 붙는 파라메터의 값을 가져올때 사용함. required(boolean)는 해당 파라미터값이 필수인지 아닌지 결정 
		//PathVariable은 URL 처리할때쓰임
    	List<BoardVO> list;    // 리스트를 불러온다
        Search search = new Search(); // Search 객체 생성
        search.setSearchType(searchType); // search 객체에 파라메터로 받은 searchType 넣어줌
        search.setKeyword(keyword); // search 객체에 파라메터로 받은 keyword 넣어줌
        list = boardService.getAll(search); // list에 해당되는 객체 넣어줌
        return list;
    }
    
    
    @RequestMapping("/detail/{id}") // @Controller에서 @RequestMapping(value="값") 값을 찾아서 리턴 받는다.
    private String boardDetail(@PathVariable int id, Model model) throws Exception{ 
        model.addAttribute("detail", boardService.boardDetailService(id)); 
        return "detail";
    }
    
    @RequestMapping("/insert") //게시글 작성폼 호출  
    private String boardInsertForm(){
        return "insert";
    }
    
    @RequestMapping("/insertProc")
    private String boardInsertProc(HttpServletRequest request) throws Exception{
    	BoardVO board = new BoardVO();
    	board.setTitle(request.getParameter("title"));
    	board.setContent(request.getParameter("content"));
    	board.setWriter(request.getParameter("writer"));
    	boardService.boardInsertService(board);
    	return "redirect:/post";

    }
    
    @RequestMapping("/update/{id}") //게시글 수정폼 호출  
    private String boardUpdateForm(@PathVariable int id, Model model) throws Exception{
        model.addAttribute("detail", boardService.boardDetailService(id));        
        return "update";
    }
    
    @RequestMapping("/updateProc")
    private String boardUpdateProc(HttpServletRequest request) throws Exception{       
    	BoardVO board = new BoardVO();
    	board.setTitle(request.getParameter("title"));
    	board.setContent(request.getParameter("content"));
    	board.setId(Integer.parseInt(request.getParameter("id")));
    	boardService.boardUpdateService(board);
    	return "redirect:/detail/"+ request.getParameter("id");
    }
 
    @RequestMapping("/delete/{id}")
    private String boardDelete(@PathVariable int id) throws Exception{
    	boardService.boardDeleteService(id);       
        return "redirect:/post";
    }
    
}



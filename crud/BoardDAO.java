package net.hb.crud;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate; //dao-context.xml문서 맨마지막에 bean명시화
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

@Repository
@Component
public class BoardDAO { // implements BoardDAOImp

	@Autowired
	SqlSessionTemplate temp;
	
	//1017========================================================
	public void signupInsert(BoardDTO dto) {
		temp.insert("board.signupInsert", dto);
	}//end
	
	//=========================================================
	public void boardInsert(BoardDTO dto) {
		temp.insert("board.add", dto);
	}//end
	
	public List<BoardDTO>  boardSelect1() { 
		List<BoardDTO> list = temp.selectList("board.selectAll") ;
		return list;
	}//end
	
	public int  boardCount() { 
	  return temp.selectOne("board.countAll");
	}//end
	   
    public BoardDTO boardDetail( int data ) { 
      return temp.selectOne("board.detail", data);
    }//end
    
    public void  boardDelete(int data) { 
    	temp.delete("board.delete", data);
    }//end
    
	public void  boardEdit(BoardDTO dto) {
		temp.update("board.edit", dto);
	}//end
	
	
	
	//1015 페이징===============================================
	public List<BoardDTO>  boardSelect2(int start, int end) { 
		BoardDTO dto = new BoardDTO();
		dto.setStart(start);
		dto.setEnd(end);
		return temp.selectList("board.selectAll", dto) ;
	}//end
	
	public List<BoardDTO> boardSelect(int start, int end, String skey, String sval) {      
	    BoardDTO dto = new BoardDTO();
	     dto.setStart(start); 
	     dto.setEnd(end); 
	     dto.setSkey(skey);
	     dto.setSval(sval);
	    return temp.selectList("board.selectAll789", dto); 
	}//end
	
	public int boardCountSearch(String skey, String sval) {
		BoardDTO dto = new BoardDTO();
		dto.setSkey(skey);
		dto.setSval(sval);
		return temp.selectOne("board.countAllSearch", dto);
	}
}//BoardDAO class END




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
	
	//회원가입========================================================
	public void signupInsert(BoardDTO dto) {
		temp.insert("board.signupInsert", dto);
	}//end
	

	//게시판 ====================================================
	public void boardInsert(BoardDTO dto) {
		temp.insert("board.writeInsert", dto);
	}//end
	
	public List<BoardDTO>  boardSelect1() { 
		return temp.selectList("board.selectAll") ;
	}//end
	
	public int  boardCount() { 
	  return temp.selectOne("board.countAll");
	}//end
	
	
	
	/*한건 상세================================================*/
    public BoardDTO boardDetail( int data ) { 
      return temp.selectOne("board.detail", data);
    }//end
    
    public void  boardDelete(int idx) { 
    	temp.delete("board.delete", idx);
    }//end
    
	public void  boardEdit(BoardDTO dto) {
		temp.update("board.edit", dto);
	}//end
	
	
	/*조회수 ========================================================*/
	public void BoardAddhit(int idx) {
		temp.update("board.BoardAddhit", idx);
	}//end

	/*추천 =========================================================*/
	
	public int  boardLikeCheck(BoardDTO dto) {
		//추천을 이미 했다면 cnt 가 1이고 안했다면 0을 반환
		int checkResult = temp.selectOne("board.LikeCheck", dto);
		if(checkResult==-1) {checkResult=0;}
		return checkResult;
	}//end
	
	public int boardLikePlusOne(BoardDTO dto) {
		return temp.update("board.LikePlusOne", dto);
	}//end
	
	public int boardLikeMinusOne(BoardDTO dto) {
		return temp.update("board.LikeMinusOne", dto);
	}//end
	
	public void boardLikeInsert(BoardDTO dto) {
		temp.insert("board.likeInsert", dto);
	}//end
	
	public void boardLikeDelete(BoardDTO dto) {
		System.out.println(dto.getHwriter());
		System.out.println(dto.getBoard_idx());
		temp.delete("board.likeDelete", dto);
	}//end
	
	
	
	/*댓글 삽입=================================================*/

	public void replyInsert(BoardDTO dto) {
		temp.insert("board.replyInsert", dto);
	}//end
	
	/*댓글 전체 출력 */
	public List<BoardDTO> replySelect(int board_idx) {
		List<BoardDTO> replyList= temp.selectList("board.replySelect", board_idx);
		return replyList;
	}//end
	
	/*단어출력 ===============================================*/
	
	public List<BoardDTO> wordSelect() {
		List<BoardDTO> wordlist = temp.selectList("board.wordSelect");
		return wordlist;
	}//end
	
	
	public BoardDTO wordSelectOne(int wrn) {
		BoardDTO oneWord = temp.selectOne("board.wordSelectOne", wrn);
		return oneWord;
	}//end

	public int wordCount() {
		return temp.selectOne("board.wordCount");
	}//end
	
	public void wordExamAdd() {

	}//end
	
	
	
	
	
	
	
	/*페이징 ===============================================*/
	public List<BoardDTO>  boardSelect2(int start, int end) { 
		BoardDTO dto = new BoardDTO();
		dto.setStart(start);
		dto.setEnd(end);
		return temp.selectList("board.selectAll", dto) ;
	}//end
	
	/*페이징+검색 ========================================================================*/
	public List<BoardDTO> boardSelect(int start, int end, String skey, String sval, String topic) {      
	    BoardDTO dto = new BoardDTO();
	     dto.setStart(start); 
	     dto.setEnd(end); 
	     dto.setSkey(skey);
	     dto.setSval(sval);
	     dto.setTopic(topic);
	    return temp.selectList("board.boardSelect", dto); 
	}//end
	
	/*검색 ===============================================*/
	public int boardCountSearch(String skey, String sval) {
		BoardDTO dto = new BoardDTO();
		dto.setSkey(skey);
		dto.setSval(sval);
		return temp.selectOne("board.countAllSearch", dto);
	}
	
	
	
	
}//BoardDAO class END




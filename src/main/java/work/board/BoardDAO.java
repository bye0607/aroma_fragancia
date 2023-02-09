package work.board;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Map<String, String>> boardList(Map<String, String> boardParam){
		return sqlSession.selectList("board.boardList", boardParam);
	}

	public Map<String, String> boardView(Map<String, String> boardParam){
		return sqlSession.selectOne("board.boardView", boardParam);
	}

	public String maxBoardNo(){
		return sqlSession.selectOne("board.maxBoardNo");
	}

	public void boardWrite(BoardBean board){
		sqlSession.insert("board.boardWrite", board);
	}

	public void boardModify(BoardBean board){
		sqlSession.update("board.boardModify", board);
	}

	public void updateBoardHits(Map<String, String> boardParam){
		sqlSession.update("board.updateBoardHits", boardParam);
	}

	public void deleteBoard(Map<String, String> boardParam){
		sqlSession.delete("board.deleteBoard", boardParam);
	}

	public void deleteBoard2(Map<String, String> boardParam){
		sqlSession.delete("board.deleteBoard2", boardParam);
	}
}

package work.board;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
	@Resource(name = "boardDAO")
	private BoardDAO boardDAO;

	public List<Map<String, String>> boardList(Map<String, String> boardParam){
		return boardDAO.boardList(boardParam);
	}

	public Map<String, String> boardView(Map<String, String> boardParam){
		return boardDAO.boardView(boardParam);
	}

	public String maxBoardNo(){
		return boardDAO.maxBoardNo();
	}

	public void boardWrite(BoardBean board){
		boardDAO.boardWrite(board);
	}

	public void boardModify(BoardBean board){
		boardDAO.boardModify(board);
	}

	public void updateBoardHits(Map<String, String> boardParam){
		boardDAO.updateBoardHits(boardParam);
	}

	public void deleteBoard(Map<String, String> boardParam){
		boardDAO.deleteBoard(boardParam);
	}

	public void deleteBoard2(Map<String, String> boardParam){
		boardDAO.deleteBoard2(boardParam);
	}
}

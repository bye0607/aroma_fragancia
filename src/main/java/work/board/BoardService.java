package work.board;

import java.util.List;
import java.util.Map;


public interface BoardService {
	public List<Map<String, String>> boardList(Map<String, String> boardParam);

	public Map<String, String> boardView(Map<String, String> boardParam);

	public String maxBoardNo();

	public void boardWrite(BoardBean board);

	public void boardModify(BoardBean board);

	public void updateBoardHits(Map<String, String> boardParam);

	public void deleteBoard(Map<String, String> boardParam);
	public void deleteBoard2(Map<String, String> boardParam);
}

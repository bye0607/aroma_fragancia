package work.board;

import java.io.Serializable;

public class BoardBean implements Serializable{
	private String boardNo;     	//글번호
	private String userCode;    	//등록자
	private String userModCode;    	//수정자
	private String boardTitle;      //제목
	private String boardContents;   //내용
	private String boardDate;       //등록일자
	private String boardModDate;    //수정일자
	private String boardHits;       //조회수

	public BoardBean() {
		super();
	}

	public BoardBean(String boardNo, String userCode, String userModCode, String boardTitle, String boardContents,
			String boardDate, String boardModDate, String boardHits) {
		super();
	
		this.boardNo = boardNo;
		this.userCode = userCode;
		this.userModCode = userModCode;
		this.boardTitle = boardTitle;
		this.boardContents = boardContents;
		this.boardDate = boardDate;
		this.boardModDate = boardModDate;
		this.boardHits = boardHits;
	}

	
	public String getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getUserModCode() {
		return userModCode;
	}

	public void setUserModCode(String userModCode) {
		this.userModCode = userModCode;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContents() {
		return boardContents;
	}

	public void setBoardContents(String boardContents) {
		this.boardContents = boardContents;
	}

	public String getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}

	public String getBoardModDate() {
		return boardModDate;
	}

	public void setBoardModDate(String boardModDate) {
		this.boardModDate = boardModDate;
	}

	public String getBoardHits() {
		return boardHits;
	}

	public void setBoardHits(String boardHits) {
		this.boardHits = boardHits;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("BoardBean [boardNo=");
		builder.append(boardNo);
		builder.append(", userCode=");
		builder.append(userCode);
		builder.append(", userModCode=");
		builder.append(userModCode);
		builder.append(", boardTitle=");
		builder.append(boardTitle);
		builder.append(", boardContents=");
		builder.append(boardContents);
		builder.append(", boardDate=");
		builder.append(boardDate);
		builder.append(", boardModDate=");
		builder.append(boardModDate);
		builder.append(", boardHits=");
		builder.append(boardHits);
		builder.append("]");
		return builder.toString();
	}

}

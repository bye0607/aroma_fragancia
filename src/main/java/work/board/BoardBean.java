package work.board;

import java.io.Serializable;

public class BoardBean implements Serializable{
	private String boNo;		//글번호
	private String boTitle;		//제목
	private String boContent;	//내용
	private String boRegId;		//등록자
	private String boModId;		//수정자
	private String boRegDate;	//등록일자
	private String boModDate;	//수정일자
	private String boHit;		//조회수

	public BoardBean() {
		super();
	}

	public BoardBean(String boNo, String boTitle, String boContent, String boRegId, String boModId, String boRegDate,
			String boModDate, String boHit) {
		super();
		this.boNo = boNo;
		this.boTitle = boTitle;
		this.boContent = boContent;
		this.boRegId = boRegId;
		this.boModId = boModId;
		this.boRegDate = boRegDate;
		this.boModDate = boModDate;
		this.boHit = boHit;
	}

	
	
	public String getBoNo() {
		return boNo;
	}

	public void setBoNo(String boNo) {
		this.boNo = boNo;
	}

	public String getBoTitle() {
		return boTitle;
	}

	public void setBoTitle(String boTitle) {
		this.boTitle = boTitle;
	}

	public String getBoContent() {
		return boContent;
	}

	public void setBoContent(String boContent) {
		this.boContent = boContent;
	}

	public String getBoRegId() {
		return boRegId;
	}

	public void setBoRegId(String boRegId) {
		this.boRegId = boRegId;
	}

	public String getBoModId() {
		return boModId;
	}

	public void setBoModId(String boModId) {
		this.boModId = boModId;
	}

	public String getBoRegDate() {
		return boRegDate;
	}

	public void setBoRegDate(String boRegDate) {
		this.boRegDate = boRegDate;
	}

	public String getBoModDate() {
		return boModDate;
	}

	public void setBoModDate(String boModDate) {
		this.boModDate = boModDate;
	}

	public String getBoHit() {
		return boHit;
	}

	public void setBoHit(String boHit) {
		this.boHit = boHit;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("BoardBean [boardNo=");
		builder.append(boNo);
		builder.append(", userCode=");
		builder.append(boRegId);
		builder.append(", boardTitle=");
		builder.append(boTitle);
		builder.append(", boardContents=");
		builder.append(boContent);
		builder.append(", boardDate=");
		builder.append(boRegDate);
		builder.append(", boardHits=");
		builder.append(boHit);
		builder.append("]");
		return builder.toString();
	}

}

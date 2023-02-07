package work.board;

import java.io.Serializable;

public class CommunityBean implements Serializable{
	private String comuNO;     	//글번호
	private String comuREGID;   //등록자
	private String comuMODID;   //수정자
	private String comuTITLE;   //제목
	private String comuCONTENT; //내용
	private String comuREGDATE; //등록일자
	private String comuMODDATE; //수정일자
	private String comuHIT;     //조회수

	public CommunityBean() {
		super();
	}

	public CommunityBean(String comuNO, String comuREGID, String comuMODID, String comuTITLE, String comuCONTENT,
			String comuREGDATE, String comuMODDATE, String comuHIT) {
		super();
	
		this.comuNO = comuNO;
		this.comuREGID = comuREGID;
		this.comuMODID = comuMODID;
		this.comuTITLE = comuTITLE;
		this.comuCONTENT = comuCONTENT;
		this.comuREGDATE = comuREGDATE;
		this.comuMODDATE = comuMODDATE;
		this.comuHIT = comuHIT;
	}

	


	public String getComuNO() {
		return comuNO;
	}

	public void setComuNO(String comuNO) {
		this.comuNO = comuNO;
	}

	public String getComuREGID() {
		return comuREGID;
	}

	public void setComuREGID(String comuREGID) {
		this.comuREGID = comuREGID;
	}

	public String getComuMODID() {
		return comuMODID;
	}

	public void setComuMODID(String comuMODID) {
		this.comuMODID = comuMODID;
	}

	public String getComuTITLE() {
		return comuTITLE;
	}

	public void setComuTITLE(String comuTITLE) {
		this.comuTITLE = comuTITLE;
	}

	public String getComuCONTENT() {
		return comuCONTENT;
	}

	public void setComuCONTENT(String comuCONTENT) {
		this.comuCONTENT = comuCONTENT;
	}

	public String getComuREGDATE() {
		return comuREGDATE;
	}

	public void setComuREGDATE(String comuREGDATE) {
		this.comuREGDATE = comuREGDATE;
	}

	public String getComuMODDATE() {
		return comuMODDATE;
	}

	public void setComuMODDATE(String comuMODDATE) {
		this.comuMODDATE = comuMODDATE;
	}

	public String getComuHIT() {
		return comuHIT;
	}

	public void setComuHIT(String comuHIT) {
		this.comuHIT = comuHIT;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CommunityBean [communityNo=");
		builder.append(comuNO);
		builder.append(", userCode=");
		builder.append(comuREGID);
		builder.append(", userModCode=");
		builder.append(comuMODID);
		builder.append(", communityTitle=");
		builder.append(comuTITLE);
		builder.append(", communityContents=");
		builder.append(comuCONTENT);
		builder.append(", communityDate=");
		builder.append(comuREGDATE);
		builder.append(", communityModDate=");
		builder.append(comuMODDATE);
		builder.append(", communityHit=");
		builder.append(comuHIT);
		builder.append("]");
		return builder.toString();
	}

}

package work.board;

import java.io.Serializable;

public class NoticeBean implements Serializable{
	private String ntcNo;		//글번호
	private String ntcTitle;	//제목
	private String ntcContent;	//내용
	private String ntcRegId;	//등록자
	private String ntcRegDate;	//등록일자
	private String ntcModDate;	//수정일자
	private String ntcHit;		//조회수

	public NoticeBean() {
		super();
	}

	public NoticeBean(String ntcNo, String ntcTitle, String ntcContent, String ntcRegId, String ntcRegDate,
			String ntcModDate, String ntcHit) {
		super();
		this.ntcNo = ntcNo;
		this.ntcTitle = ntcTitle;
		this.ntcContent = ntcContent;
		this.ntcRegId = ntcRegId;
		this.ntcRegDate = ntcRegDate;
		this.ntcModDate = ntcModDate;
		this.ntcHit = ntcHit;
	}

	public String getNtcNo() {
		return ntcNo;
	}

	public void setNtcNo(String ntcNo) {
		this.ntcNo = ntcNo;
	}

	public String getNtcTitle() {
		return ntcTitle;
	}

	public void setNtcTitle(String ntcTitle) {
		this.ntcTitle = ntcTitle;
	}

	public String getNtcContent() {
		return ntcContent;
	}

	public void setNtcContent(String ntcContent) {
		this.ntcContent = ntcContent;
	}

	public String getNtcRegId() {
		return ntcRegId;
	}

	public void setNtcRegId(String ntcRegId) {
		this.ntcRegId = ntcRegId;
	}

	public String getNtcRegDate() {
		return ntcRegDate;
	}

	public void setNtcRegDate(String ntcRegDate) {
		this.ntcRegDate = ntcRegDate;
	}

	public String getNtcModDate() {
		return ntcModDate;
	}

	public void setNtcModDate(String ntcModDate) {
		this.ntcModDate = ntcModDate;
	}

	public String getNctHit() {
		return ntcHit;
	}

	public void setNctHit(String nctHit) {
		this.ntcHit = nctHit;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("NoticeBean [noticeNo=");
		builder.append(ntcNo);
		builder.append(", noticeTitle=");
		builder.append(ntcTitle);
		builder.append(", noticeContent=");
		builder.append(ntcContent);
		builder.append(", noticeRegId=");
		builder.append(ntcRegId);
		builder.append(", noticeRegDate=");
		builder.append(ntcRegDate);
		builder.append(", noticeModDate=");
		builder.append(ntcModDate);
		builder.append(", noticeHit=");
		builder.append(ntcHit);
		builder.append("]");
		return builder.toString();
	}

}

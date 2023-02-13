package work.board;

import java.io.Serializable;

public class ReservationBean implements Serializable{
	private String vstNo; //-- 글번호
	private String vstTitle; //-- 제목
	private String vstContent; //-- 내용
	private String vstPhone; //-- 전화번호
	private String vstEmail; //-- 이메일
	private String vstRegId; //-- 등록자
	private String vstModId; //-- 수정자
	private String vstRegDate; //-- 등록일자
	private String vstModDate; // -- 수정일자
	

	public ReservationBean() {
		super();
	}

	

	public ReservationBean(String vstNo, String vstTitle, String vstContent, String vstPhone, String vstEmail,
			String vstRegId, String vstModId, String vstRegDate, String vstModDate) {
		super();
		this.vstNo = vstNo;
		this.vstTitle = vstTitle;
		this.vstContent = vstContent;
		this.vstPhone = vstPhone;
		this.vstEmail = vstEmail;
		this.vstRegId = vstRegId;
		this.vstModId = vstModId;
		this.vstRegDate = vstRegDate;
		this.vstModDate = vstModDate;
	}



	public String getVstNo() {
		return vstNo;
	}



	public void setVstNo(String vstNo) {
		this.vstNo = vstNo;
	}



	public String getVstTitle() {
		return vstTitle;
	}


	public void setVstTitle(String vstTitle) {
		this.vstTitle = vstTitle;
	}


	public String getVstContent() {
		return vstContent;
	}



	public void setVstContent(String vstContent) {
		this.vstContent = vstContent;
	}



	public String getVstPhone() {
		return vstPhone;
	}


	public void setVstPhone(String vstPhone) {
		this.vstPhone = vstPhone;
	}



	public String getVstEmail() {
		return vstEmail;
	}



	public void setVstEmail(String vstEmail) {
		this.vstEmail = vstEmail;
	}


	public String getVstRegId() {
		return vstRegId;
	}


	public void setVstRegId(String vstRegId) {
		this.vstRegId = vstRegId;
	}

	public String getVstModId() {
		return vstModId;
	}



	public void setVstModId(String vstModId) {
		this.vstModId = vstModId;
	}


	public String getVstRegDate() {
		return vstRegDate;
	}



	public void setVstRegDate(String vstRegDate) {
		this.vstRegDate = vstRegDate;
	}


	public String getVstModDate() {
		return vstModDate;
	}


	public void setVstModDate(String vstModDate) {
		this.vstModDate = vstModDate;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ReservationBean [reservationNo=");
		builder.append(vstNo);
		builder.append(", reservationTitle=");
		builder.append(vstTitle);
		builder.append(", reservationPhone=");
		builder.append(vstPhone);
		builder.append(", reservationEmail=");
		builder.append(vstEmail);
		builder.append(", reservationRegId=");
		builder.append(vstRegId);
		builder.append(", reservationModId=");
		builder.append(vstModId);
		builder.append(", reservationRegDate=");
		builder.append(vstRegDate);
		builder.append(", reservationModDate=");
		builder.append(vstModDate);
		return builder.toString();
	}
	

	
}

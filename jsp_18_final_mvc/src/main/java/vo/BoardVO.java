package vo;

import java.util.Date;

public class BoardVO {

	private int qnaNum;
	private String qnaName;
	private String qnaTitle;
	private String qnaContent;
	private int qnaWriterNum;
	private int qnaReadCount;
	private Date qnaDate;
	private int qnaReRef; // 원본 글 번호 추가

	public int getQnaReRef() {
		return qnaReRef;
	}

	public void setQnaReRef(int qnaReRef) {
		this.qnaReRef = qnaReRef;
	}

	public int getQnaNum() {
		return qnaNum;
	}

	public void setQnaNum(int qnaNum) {
		this.qnaNum = qnaNum;
	}

	public String getQnaName() {
		return qnaName;
	}

	public void setQnaName(String qnaName) {
		this.qnaName = qnaName;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public int getQnaWriterNum() {
		return qnaWriterNum;
	}

	public void setQnaWriterNum(int qnaWriterNum) {
		this.qnaWriterNum = qnaWriterNum;
	}

	public int getQnaReadCount() {
		return qnaReadCount;
	}

	public void setQnaReadCount(int qnaReadCount) {
		this.qnaReadCount = qnaReadCount;
	}

	public Date getQnaDate() {
		return qnaDate;
	}

	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}

	@Override
	public String toString() {
		return "BoardVO [qnaNum=" + qnaNum + ", qnaName=" + qnaName + ", qnaTitle=" + qnaTitle + ", qnaContent="
				+ qnaContent + ", qnaWriterNum=" + qnaWriterNum + ", qnaReadCount=" + qnaReadCount + ", qnaDate="
				+ qnaDate + "]";
	}

}

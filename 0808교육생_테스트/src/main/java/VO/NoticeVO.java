package VO;

import java.sql.Timestamp;

public class NoticeVO {
    private int noticeNum;
    private String noticeCategory;
    private String noticeAuthor;
    private String noticeTitle;
    private String noticeContent;
    private Timestamp noticeDate;

    // 기본 생성자
    public NoticeVO() {}

    // 매개변수가 있는 생성자
    public NoticeVO(int noticeNum, String noticeCategory, String noticeAuthor, String noticeTitle, String noticeContent, Timestamp noticeDate) {
        this.noticeNum = noticeNum;
        this.noticeCategory = noticeCategory;
        this.noticeAuthor = noticeAuthor;
        this.noticeTitle = noticeTitle;
        this.noticeContent = noticeContent;
        this.noticeDate = noticeDate;
    }

    // getter와 setter 메소드
    public int getNoticeNum() {
        return noticeNum;
    }

    public void setNoticeNum(int noticeNum) {
        this.noticeNum = noticeNum;
    }

    public String getNoticeCategory() {
        return noticeCategory;
    }

    public void setNoticeCategory(String noticeCategory) {
        this.noticeCategory = noticeCategory;
    }

    public String getNoticeAuthor() {
        return noticeAuthor;
    }

    public void setNoticeAuthor(String noticeAuthor) {
        this.noticeAuthor = noticeAuthor;
    }

    public String getNoticeTitle() {
        return noticeTitle;
    }

    public void setNoticeTitle(String noticeTitle) {
        this.noticeTitle = noticeTitle;
    }

    public String getNoticeContent() {
        return noticeContent;
    }

    public void setNoticeContent(String noticeContent) {
        this.noticeContent = noticeContent;
    }

    public Timestamp getNoticeDate() {
        return noticeDate;
    }

    public void setNoticeDate(Timestamp noticeDate) {
        this.noticeDate = noticeDate;
    }

    @Override
    public String toString() {
        return "NoticeVO{" +
                "noticeNum=" + noticeNum +
                ", noticeCategory='" + noticeCategory + '\'' +
                ", noticeAuthor='" + noticeAuthor + '\'' +
                ", noticeTitle='" + noticeTitle + '\'' +
                ", noticeContent='" + noticeContent + '\'' +
                ", noticeDate=" + noticeDate +
                '}';
    }
}
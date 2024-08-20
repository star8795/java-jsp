package notice.model;

import java.util.Date;
import jakarta.servlet.http.HttpServletRequest;

public class NoticeBoard {
	
	private int notice_num;
	private String notice_category;
	private String notice_author;
	private String notice_title;
	private String notice_content;
	private Date notice_date;
	
	public NoticeBoard() {}
	
	public NoticeBoard(HttpServletRequest request) {
		String notice_num = request.getParameter("notice_num");
		String notice_category = request.getParameter("notice_category");
		String notice_author = request.getParameter("notice_author");
		String notice_title = request.getParameter("notice_title");
		String notice_content = request.getParameter("notice_content");
		if(notice_num != null)this.notice_num = Integer.parseInt(notice_num);
		if(notice_category != null)this.notice_category = notice_category;
		if(notice_author != null)this.notice_author = notice_author;
		if(notice_title != null)this.notice_title = notice_title;
		if(notice_content != null)this.notice_content = notice_content;
	}



	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	public String getNotice_category() {
		return notice_category;
	}
	public void setNotice_category(String notice_category) {
		this.notice_category = notice_category;
	}
	public String getNotice_author() {
		return notice_author;
	}
	public void setNotice_author(String notice_author) {
		this.notice_author = notice_author;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public Date getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}
	
	@Override
	public String toString() {
		return "NoticeVO [notice_num=" + notice_num + ", notice_category=" + notice_category + ", notice_author="
				+ notice_author + ", notice_title=" + notice_title + ", notice_content=" + notice_content
				+ ", notice_date=" + notice_date + "]";
	}

}

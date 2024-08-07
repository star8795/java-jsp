package service;

import java.util.ArrayList;

import dao.NoticeDAO;
import dao.NoticeDAOImplement;
import jakarta.servlet.http.HttpServletRequest;
import util.Criteria;
import util.PageMaker;
import util.SearchCriteria;
import util.SearchPageMaker;
import vo.NoticeVO;

public class NoticeServiceImplement implements NoticeService {

	NoticeDAO dao = new NoticeDAOImplement();

	@Override
	public ArrayList<NoticeVO> noticeAllList() {
		return dao.getAllList();
	}

	@Override
	public boolean noticeWrite(HttpServletRequest request) {
		String notice_category = request.getParameter("notice_category");
		String notice_author = request.getParameter("notice_author");
		String notice_title = request.getParameter("notice_title");
		String notice_content = request.getParameter("notice_content");
		NoticeVO notice = new NoticeVO();
		notice.setNotice_category(notice_category);
		notice.setNotice_author(notice_author);
		notice.setNotice_title(notice_title);
		notice.setNotice_content(notice_content);

		return dao.noticeWrite(notice);
	}

	@Override
	public ArrayList<NoticeVO> noticeList(HttpServletRequest request) {

		// 파라미터로 전달된 page 정보에 따라
		// 시작인덱스 번호와 한번에 보여줄 게시글 개수에 따라 게시글 목록 반환
		int page = 1;
		String pageParam = request.getParameter("page");
		if (pageParam != null) {
			page = Integer.parseInt(pageParam);
		}

		// 한번에 보여줄 게시물 개수
		int perPageNum = 10;
		String strPerPageNum = request.getParameter("perPageNum");
		if (strPerPageNum != null) {
			perPageNum = Integer.parseInt(strPerPageNum);
		}

		// page 처리된 게시글 목록
		Criteria cri = new Criteria(page, perPageNum);
		System.out.println(cri);
		ArrayList<NoticeVO> noticeList = dao.getNoticeList(cri.getPageStart(), perPageNum);

		// page 처리된 게시글 목록을 이동할 수 있는 페이지 블럭 정보
		// 전체 게시물 개수
		int totalCount = dao.getListCount();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setTotalCount(totalCount);
		pageMaker.setCri(cri);
		pageMaker.setDisplayPageNum(10);

		request.setAttribute("pageMaker", pageMaker);

		return noticeList;
	}

	@Override
	public NoticeVO noticeDetail(HttpServletRequest request) {
		String strNum = request.getParameter("notice_num");
		int notice_num = Integer.parseInt(strNum);
		return dao.getNoticeVO(notice_num);
	}

	@Override
	public boolean noticeUpdate(HttpServletRequest request) {
		// notice_num, notice_category, notice_author, notice_title, notice_cotnent
		int notice_num = Integer.parseInt(request.getParameter("notice_num"));
		String notice_category = request.getParameter("notice_category");
		String notice_author = request.getParameter("notice_author");
		String notice_title = request.getParameter("notice_title");
		String notice_cotnent = request.getParameter("notice_content");

		NoticeVO n = new NoticeVO();
		n.setNotice_num(notice_num);
		n.setNotice_category(notice_category);
		n.setNotice_author(notice_author);
		n.setNotice_title(notice_title);
		n.setNotice_content(notice_cotnent);

		return dao.noticeUpdate(n);
	}

	@Override
	public boolean noticeDelete(HttpServletRequest request) {
		int notice_num = Integer.parseInt(request.getParameter("notice_num"));
		return dao.noticeDelete(notice_num);
	}

	@Override
	public ArrayList<NoticeVO> search(HttpServletRequest request) {
		int page = 1;
		int perPageNum = 10;

		String paramPage = request.getParameter("page");
		String paramPerPageNum = request.getParameter("perPageNum");
		String searchName = request.getParameter("searchName");
		String searchValue = request.getParameter("searchValue");

		if (paramPage != null) {
			page = Integer.parseInt(paramPage);
		}

		if (paramPerPageNum != null) {
			perPageNum = Integer.parseInt(paramPerPageNum);
		}

		Criteria cri = new SearchCriteria(page, perPageNum, searchName, searchValue);

		// paging 처리 블럭에 필요한 객체 생성
		PageMaker pm = new SearchPageMaker();
		pm.setCri(cri); // table 에서 행정보 검색 기준
		pm.setDisplayPageNum(5); // 페이지번호 출력 개수

		int totalCount = dao.getSearchListCount(searchName, searchValue);

		pm.setTotalCount(totalCount);

		request.setAttribute("pageMaker", pm);

		// 검색된 게시글 목록
		ArrayList<NoticeVO> noticeList = dao.getSearchNoticeList(pm);

		return noticeList;
	}

}
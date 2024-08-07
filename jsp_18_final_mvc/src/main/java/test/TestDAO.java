package test;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import dao.NoticeDAO;
import dao.NoticeDAOImplement;
import vo.NoticeVO;

public class TestDAO {

	NoticeDAO dao;

	@Before
	public void before() {
		dao = new NoticeDAOImplement();
		System.out.println("test 수행 전");
	}

	@Test
	public void getSearchTotalCount() {
		int totalCount = dao.getSearchListCount("author", "M");
		System.out.println("totalCount : " + totalCount);
	}

	// @Test // 이 메소드가 테스트하기 위한 기능을 정의 메소드 임을 명시
	public void getAllListTest() {
		List<NoticeVO> noticeList = dao.getAllList();
		System.out.println(noticeList);
	}

	// @Test
	public void noticeWriteTest() {
		for (int i = 0; i < 100; i++) {
			NoticeVO vo = new NoticeVO();
			vo.setNotice_category("공지");
			vo.setNotice_author("MASTER");
			vo.setNotice_title("서울에 사시는 김동하 바보 " + i);
			vo.setNotice_content("예?");
			boolean isSuccess = dao.noticeWrite(vo);
			System.out.println("noticeWriteTest : " + isSuccess);
		}
	}

	// @Test
	public void deleteDongHaTest() {
		boolean isSuccess = dao.noticeDelete(1);
		System.out.println("deleteDongHaTest : " + isSuccess);
	}

	@After
	public void after() {
		System.out.println("test 수행 완료 후");
	}

}
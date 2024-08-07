package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import util.DBCPUtil;
import util.PageMaker;
import util.SearchCriteria;
import vo.NoticeVO;

public class NoticeDAOImplement implements NoticeDAO {

	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet resultSet;

	@Override
	public ArrayList<NoticeVO> getAllList() {
		// notice_board table에 저장된 각 행정보를 저장하여 반환할 리스트
		ArrayList<NoticeVO> noticeList = new ArrayList<>();

		String sql = "SELECT * FROM notice_board ORDER BY notice_num DESC";

		conn = DBCPUtil.getConnection();

		try {
			stmt = conn.createStatement();
			resultSet = stmt.executeQuery(sql);
			while (resultSet.next()) {
				/*
				 * notice_num int primary key auto_increment, -- 게시글 번호 notice_category
				 * VARCHAR(20), -- 게시글 분류 notice_author VARCHAR(50), -- 작성자 이름 notice_title
				 * VARCHAR(50), -- 제목 notice_content TEXT, -- 내용 notice_date TIMESTAMP default
				 * now() -- 작성 시간
				 */
				int notice_num = resultSet.getInt(1);
				String notice_category = resultSet.getString(2);
				String notice_author = resultSet.getString(3);
				String notice_title = resultSet.getString(4);
				String notice_content = resultSet.getString(5);
				java.util.Date notice_date = resultSet.getTimestamp(6);
				// 각행의 정보(데이터)를 저장할 vo class 생성
				NoticeVO notice = new NoticeVO(notice_num, notice_category, notice_author, notice_title, notice_content,
						notice_date);
				noticeList.add(notice);
			} // end rs.next() while
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(resultSet, stmt, conn);
		}
		return noticeList;
	}

	@Override
	public boolean noticeWrite(NoticeVO noticeVO) {
		boolean isSuccess = false;

		conn = DBCPUtil.getConnection();

		String sql = "INSERT INTO notice_board VALUES(null,?,?,?,?,now())";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, noticeVO.getNotice_category());
			pstmt.setString(2, noticeVO.getNotice_author());
			pstmt.setString(3, noticeVO.getNotice_title());
			pstmt.setString(4, noticeVO.getNotice_content());
			// INSERT, UPDATE, DELETE == table의 행정보를 변경할 때는 executeUpdate()
			// 변경된 행의 개수를 int type으로 반환
			int result = pstmt.executeUpdate();
			if (result == 1) {
				isSuccess = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(pstmt, conn);
		}
		return isSuccess;
	}

	@Override
	public NoticeVO getNoticeVO(int notice_num) {
		// 행번호가 일치하는 게시글 정보를 저장할 객체
		NoticeVO notice = null;

		conn = DBCPUtil.getConnection();

		String sql = "SELECT * FROM  notice_board WHERE notice_num = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, notice_num);
			resultSet = pstmt.executeQuery();

			if (resultSet.next()) {
				notice = new NoticeVO(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3),
						resultSet.getString(4), resultSet.getString(5), resultSet.getTimestamp(6));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(resultSet, pstmt, conn);
		}
		return notice;
	}

	@Override
	public boolean noticeUpdate(NoticeVO noticeVO) {

		String sql = "UPDATE notice_board SET notice_category = ? , " + "notice_author = ? , " + "notice_title = ? , "
				+ "notice_content = ? " + "WHERE notice_num = ?";

		conn = DBCPUtil.getConnection();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, noticeVO.getNotice_category());
			pstmt.setString(2, noticeVO.getNotice_author());
			pstmt.setString(3, noticeVO.getNotice_title());
			pstmt.setString(4, noticeVO.getNotice_content());
			pstmt.setInt(5, noticeVO.getNotice_num());
			int result = pstmt.executeUpdate();
			if (result == 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(pstmt, conn);
		}
		return false;
	}

	@Override
	public boolean noticeDelete(int notice_num) {

		String sql = "DELETE FROM notice_board WHERE notice_num = ?";

		conn = DBCPUtil.getConnection();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, notice_num);
			int result = pstmt.executeUpdate();
			if (result == 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(pstmt, conn);
		}
		return false;
	}

	@Override
	public ArrayList<NoticeVO> getNoticeList(int startRow, int perPageNum) {

		ArrayList<NoticeVO> noticeList = new ArrayList<>();

		String sql = "SELECT * FROM notice_board ORDER BY notice_num DESC limit ?, ?";

		conn = DBCPUtil.getConnection();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow); // 검색할 시작인덱스 번호
			pstmt.setInt(2, perPageNum); // 검색할 게시물 개수
			resultSet = pstmt.executeQuery();

			while (resultSet.next()) {
				NoticeVO notice = new NoticeVO(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3),
						resultSet.getString(4), resultSet.getString(5), resultSet.getTimestamp(6));
				noticeList.add(notice);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(resultSet, pstmt, conn);
		}
		return noticeList;
	}

	@Override
	public int getListCount() {
		int listCount = 0;

		String sql = "SELECT count(*) AS count FROM notice_board";
		conn = DBCPUtil.getConnection();

		try {
			stmt = conn.createStatement();
			resultSet = stmt.executeQuery(sql);
			if (resultSet.next()) {
				// listCount = resultSet.getInt(1);
				listCount = resultSet.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(resultSet, stmt, conn);
		}
		return listCount;
	}

	@Override
	public int getSearchListCount(String searchName, String searchValue) {
		int listCount = 0;

		conn = DBCPUtil.getConnection();

		String sql = "SELECT count(*) FROM notice_board ";

		if (searchName.equals("title")) {
			sql += "WHERE notice_title LIKE CONCAT('%',?,'%')";
		} else {
			// author
			sql += "WHERE notice_author LIKE CONCAT('%',?,'%')";
		}

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchValue);
			resultSet = pstmt.executeQuery();
			if (resultSet.next()) {
				listCount = resultSet.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(resultSet, pstmt, conn);
		}
		return listCount;
	}

	@Override
	public ArrayList<NoticeVO> getSearchNoticeList(PageMaker pageMaker) {
		ArrayList<NoticeVO> noticeList = new ArrayList<>();
		SearchCriteria cri = (SearchCriteria) pageMaker.getCri();

		conn = DBCPUtil.getConnection();

		String sql = "SELECT * FROM notice_board ";

		if (cri.getSearchName().equals("title")) {
			sql += " WHERE notice_title LIKE ? ";
		} else {
			sql += " WHERE notice_author LIKE ? ";
		}

		sql += " ORDER BY notice_num DESC limit ?, ?";

		try {
			// '%searchValue%'
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + cri.getSearchValue() + "%");
			pstmt.setInt(2, cri.getPageStart());
			pstmt.setInt(3, cri.getPerPageNum());

			resultSet = pstmt.executeQuery();

			while (resultSet.next()) {
				noticeList.add(new NoticeVO(resultSet.getInt("notice_num"), resultSet.getString("notice_category"),
						resultSet.getString("notice_author"), resultSet.getString("notice_title"),
						resultSet.getString("notice_content"), resultSet.getTimestamp("notice_date")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(resultSet, pstmt, conn);
		}
		return noticeList;
	}

}

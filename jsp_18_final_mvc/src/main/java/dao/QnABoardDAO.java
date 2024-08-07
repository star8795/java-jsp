package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.DBCPUtil;
import vo.BoardVO;

public class QnABoardDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private CallableStatement cstmt;
	private ResultSet rs;

	public boolean boardWrite(String qna_title, String qna_content, int qna_writer_num) {

		conn = DBCPUtil.getConnection();

		String sql = " INSERT INTO qna_board(qna_title,qna_content,qna_writer_num) " + " VALUES(?,?,?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qna_title);
			pstmt.setString(2, qna_content);
			pstmt.setInt(3, qna_writer_num);

			int result = pstmt.executeUpdate();

			if (result == 1)
				return true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(pstmt, conn);
		}
		return false;
	} // end noticeWrite method

	public ArrayList<BoardVO> getBoardAllList() {
		ArrayList<BoardVO> list = new ArrayList<>();

		conn = DBCPUtil.getConnection();

		String sql = "SELECT * FROM v_qna_board ORDER BY qnaReRef DESC";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardVO board = getBoardVO(rs);
				list.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(rs, pstmt, conn);
		}

		return list;
	} // end getBoardAllList method

	/**
	 * @param int qnaNum : 검색할 게시글 번호
	 * @return BoardVO - 검색된 게시글 행 정보를 저장하여 반환
	 */
	public BoardVO getBoardVO(int qnaNum) {
		BoardVO board = null;

		conn = DBCPUtil.getConnection();
		String sql = "SELECT * FROM v_qna_board WHERE qnaNum = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qnaNum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				board = getBoardVO(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(rs, pstmt, conn);
		}
		return board;
	}

	private BoardVO getBoardVO(ResultSet rs) throws SQLException {
		BoardVO board = new BoardVO();
		board.setQnaNum(rs.getInt("qnaNum"));
		board.setQnaName(rs.getString("qnaName"));
		board.setQnaTitle(rs.getString("qnaTitle"));
		board.setQnaContent(rs.getString("qnaContent"));
		board.setQnaWriterNum(rs.getInt("qnaWriterNum"));
		board.setQnaReadCount(rs.getInt("qnaReadCount"));
		board.setQnaDate(rs.getTimestamp("qnaDate"));
		board.setQnaReRef(rs.getInt("qnaReRef")); // 원본 글 번호 추가
		return board;
	}

	/**
	 * @param board - qnaNum, qnaTitle, qnaContent, qnaWriterNum
	 * @return boolean - 게시글 수정 성공 여부
	 */
	public boolean boardUpdate(BoardVO board) {

		conn = DBCPUtil.getConnection();

		String sql = "UPDATE v_qna_board SET " + " qnaTitle = ? , " + " qnaContent = ? "
				+ " WHERE qnaNum = ? AND qnaWriterNum = ? ";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getQnaTitle());
			pstmt.setString(2, board.getQnaContent());
			pstmt.setInt(3, board.getQnaNum());
			pstmt.setInt(4, board.getQnaWriterNum());

			if (pstmt.executeUpdate() == 1)
				return true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(pstmt, conn);
		}

		return false;
	}

	/**
	 * @param qnaNum - 삭제할 게시글 번호
	 * @return boolean - 게시글 삭제 처리 성공 여부
	 */
	public boolean boardDelete(int qnaNum) {
		conn = DBCPUtil.getConnection();

		// String sql = "DELETE FROM qna_board WHERE qna_num = ?";
		String sql = "CALL deleteBoard(?)";

		try {

			cstmt = conn.prepareCall(sql);
			cstmt.setInt(1, qnaNum);

			if (cstmt.executeUpdate() == 1) {
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(cstmt, conn);
		}

		return false;
	}

	/**
	 * @param vo - 답변글 등록이 필요한 파라미터 정보 - qnaTitle, qnaContent, qnaWriterNum,
	 *           qnaReRef
	 */
	public void boardReply(BoardVO vo) {

		conn = DBCPUtil.getConnection();

		String sql = "INSERT INTO v_qna_board(qnaTitle, qnaContent, qnaWriterNum, qnaReRef) " + " VALUES(?,?,?,?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getQnaTitle());
			pstmt.setString(2, vo.getQnaContent());
			pstmt.setInt(3, vo.getQnaWriterNum());
			pstmt.setInt(4, vo.getQnaReRef());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(pstmt, conn);
		}
	}

}
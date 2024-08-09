package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.Criteria;
import util.DBCPUtil;
import vo.BoardVO;

public class QnABoardDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private CallableStatement cstmt;
	private ResultSet rs;
	
	public boolean boardWrite(String qna_title, String qna_content, int qna_writer_num) {
		
		conn = DBCPUtil.getConnection();
		
		String sql = " INSERT INTO v_qna_board(qnaTitle,qnaContent,qnaWriterNum) "
					+" VALUES(?,?,?)";
		
		try {
			conn.setAutoCommit(false);			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qna_title);
			pstmt.setString(2, qna_content);
			pstmt.setInt(3, qna_writer_num);
			
			int result = pstmt.executeUpdate();
			
			if(result == 1) {
				
				sql = " UPDATE v_qna_board SET qnaReRef = LAST_INSERT_ID() "
					+ " WHERE qnaNum = LAST_INSERT_ID() ";
				pstmt = conn.prepareStatement(sql);
				result = pstmt.executeUpdate();
				if(result == 1) {
					conn.commit();
					return true;
				}
			}
			
			conn.rollback();
			
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {}
		} finally {
			DBCPUtil.close(pstmt, conn);
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {}
		}
		return false;
	} // end noticeWrite method

	
	public ArrayList<BoardVO> getBoardAllList() {
		ArrayList<BoardVO> list = new ArrayList<>();
		
		conn = DBCPUtil.getConnection();
		
		String sql = "SELECT * FROM v_qna_board ORDER BY qnaReRef DESC, qnaReSeq ASC";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardVO board = getBoardVO(rs);
				list.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBCPUtil.close(rs,pstmt,conn);
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
			if(rs.next()) {
				board = getBoardVO(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
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
		board.setQnaReSeq(rs.getInt("qnaReSeq")); // 답변 글 정렬 번호 추가
		board.setQnaReLev(rs.getInt("qnaReLev")); // 답변 글 view level 번호 추가
		board.setQnaDelete(rs.getString("qnaDelete")); // 게시글 삭제 여부 추가
		return board;
	}

	/**
	 * @param board - qnaNum, qnaTitle, qnaContent, qnaWriterNum
	 * @return boolean - 게시글 수정 성공 여부 
	 */
	public boolean boardUpdate(BoardVO board) {
		
		conn = DBCPUtil.getConnection();
		
		String sql = "UPDATE v_qna_board SET "
					+" qnaTitle = ? , "
					+" qnaContent = ? "
					+" WHERE qnaNum = ? AND qnaWriterNum = ? ";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getQnaTitle());
			pstmt.setString(2, board.getQnaContent());
			pstmt.setInt(3, board.getQnaNum());
			pstmt.setInt(4, board.getQnaWriterNum());
			
			if(pstmt.executeUpdate() == 1) return true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
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
		
		// String sql = "DELETE FROM v_qna_board WHERE qna_num = ?";
		String sql = "CALL deleteBoard(?)";
		
		try {
			
			cstmt = conn.prepareCall(sql);
			cstmt.setInt(1, qnaNum);
			
			if(cstmt.executeUpdate() == 1) {
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
	 * @param vo - 답변글 등록이 필요한 파라미터 정보 
	 * 	         - qnaTitle, qnaContent, qnaWriterNum, qnaReRef
	 */
	public void boardReply(BoardVO vo) {
		
		conn = DBCPUtil.getConnection();
		
		try {
			String seqSql = "UPDATE v_qna_board SET qnaReSeq = qnaReSeq + 1 "
						+ " WHERE qnaReRef = ? AND qnaReSeq > ?";
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement(seqSql);
			pstmt.setInt(1, vo.getQnaReRef());
			pstmt.setInt(2, vo.getQnaReSeq());
			
			pstmt.executeUpdate();
			
			String sql = "INSERT INTO v_qna_board("
					+ "qnaTitle, qnaContent, qnaWriterNum, qnaReRef, qnaReSeq, qnaReLev) "
						+ " VALUES(?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getQnaTitle());
			pstmt.setString(2, vo.getQnaContent());
			pstmt.setInt(3, vo.getQnaWriterNum());
			pstmt.setInt(4, vo.getQnaReRef());
			pstmt.setInt(5, vo.getQnaReSeq() + 1);
			pstmt.setInt(6, vo.getQnaReLev() + 1);
			
			pstmt.executeUpdate();
			
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {}
			
		} finally {
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {}
			
			DBCPUtil.close(pstmt, conn);
			
		}
	}


	public ArrayList<BoardVO> getBoardList(Criteria cri) {
		ArrayList<BoardVO> boardList = new ArrayList<>();
		
		conn = DBCPUtil.getConnection();
		
		String sql = "SELECT * FROM v_qna_board "
					+"ORDER BY qnaReRef DESC, qnaReSeq ASC limit ?, ?";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cri.getPageStart());			// 검색 시작 인덱스 번호
			pstmt.setInt(2, cri.getPerPageNum());			// 검색할 게시글 개수
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardVO board = getBoardVO(rs);
				boardList.add(board);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBCPUtil.close(rs,pstmt,conn);
		}
		
		return boardList;
	}

	/**
	 * v_qna_board table 전체 게시글 개수 
	 */
	public int getListCount() {
		conn = DBCPUtil.getConnection();
		String sql = "SELECT count(*) FROM v_qna_Board";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	/**
	 * @param qnaNum - 매개변수로 전달받은 게시글번호로 게시글의 조회수 1 증가
	 */
	public void updateReadCount(int qnaNum) {
		
		conn = DBCPUtil.getConnection();
		
		String sql = "UPDATE v_qna_board SET qnaReadCount = qnaReadCount + 1 "
					+" WHERE qnaNum = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qnaNum);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBCPUtil.close(pstmt,conn);
		}
	}


}













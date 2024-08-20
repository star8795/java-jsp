package notice.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import mvc.dao.DAOProviderAdapter;
import notice.model.NoticeBoard;
import util.Criteria;
import util.DBCPUtil;

public class NoticeDAO extends DAOProviderAdapter<NoticeBoard>{
	
	@Override
	public ArrayList<NoticeBoard> getList(Criteria cri) {
		ArrayList<NoticeBoard> list = new ArrayList<>();
		conn = DBCPUtil.getConnection();
		String sql = "SELECT * FROM notice_board ORDER BY notice_date DESC limit ?, ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cri.getPageStart());
			pstmt.setInt(2, cri.getPerPageNum());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(getVO(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBCPUtil.close(rs,pstmt,conn);
		}
		return list;
	}

	@Override
	public int count() {
		
		int count = 0;
		
		conn = DBCPUtil.getConnection();
		String sql = "SELECT count(*) FROM notice_board";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next())count = rs.getInt(1);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBCPUtil.close(rs,pstmt,conn);
		}
		return count;
	}

	@Override
	public NoticeBoard read(NoticeBoard t) {
	    NoticeBoard notice = null;
	    conn = DBCPUtil.getConnection();
	    String sql = "SELECT * FROM notice_board WHERE notice_num = ?";
	    
	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, t.getNotice_num());
	        rs = pstmt.executeQuery();
	        
	        if (rs.next()) {
	            // 결과가 있는 경우 NoticeBoard 객체 생성
	            notice = getVO(rs);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        DBCPUtil.close(rs, pstmt, conn);
	    }
	    
	    return notice; // null이 아닌 실제 결과 객체를 반환
	}


	@Override
	public boolean write(NoticeBoard t) {
	    boolean result = false;
	    conn = DBCPUtil.getConnection();
	    String sql = "INSERT INTO notice_board VALUES (null, ?, ?, ?, ?, now())";
	    
	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, t.getNotice_category());
	        pstmt.setString(2, t.getNotice_author());
	        pstmt.setString(3, t.getNotice_title());
	        pstmt.setString(4, t.getNotice_content());
	        if(pstmt.executeUpdate() > 0)result = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBCPUtil.close(pstmt,conn);
		}
		return result;
	}
	
	@Override
	public boolean update(NoticeBoard t) {
	    boolean isSuccess = false;
	    String sql = "UPDATE notice_board SET "
	               + "notice_category = ?, "
	               + "notice_author = ?, "
	               + "notice_title = ?, "
	               + "notice_content = ?, "
	               + "notice_date = now() "
	               + "WHERE notice_num = ?";

	    try {
	        conn = DBCPUtil.getConnection();
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, t.getNotice_category());
	        pstmt.setString(2, t.getNotice_author());
	        pstmt.setString(3, t.getNotice_title());
	        pstmt.setString(4, t.getNotice_content());
	        pstmt.setInt(5, t.getNotice_num());
	        
	        int result = pstmt.executeUpdate();
	        if (result > 0) {
	            isSuccess = true;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        // Null 체크 추가
	        if (pstmt != null) {
	            try {
	                pstmt.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	        if (conn != null) {
	            try {
	                conn.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	    }
	    return isSuccess;
	}


	@Override
	public boolean delete(NoticeBoard t) {
	    boolean isSuccess = false;
	    String sql = "DELETE FROM notice_board WHERE notice_num = ?";
	    
	    try {
	        conn = DBCPUtil.getConnection();
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, t.getNotice_num());
	        
	        int result = pstmt.executeUpdate();
	        if (result > 0) {
	            isSuccess = true;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        // Null 체크를 추가한 리소스 관리
	        if (pstmt != null) {
	            try {
	                pstmt.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	        if (conn != null) {
	            try {
	                conn.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	    }
	    return isSuccess;
	}

	
	
	public NoticeBoard getVO(ResultSet rs) throws SQLException{
		NoticeBoard nb = new NoticeBoard();
		nb.setNotice_num(rs.getInt("notice_num"));
		nb.setNotice_author(rs.getString("notice_author"));
		nb.setNotice_category(rs.getString("notice_category"));
		nb.setNotice_content(rs.getString("notice_content"));
		nb.setNotice_title(rs.getString("notice_title"));
		nb.setNotice_date(rs.getTimestamp("notice_date"));
		return nb;
	}
	
}

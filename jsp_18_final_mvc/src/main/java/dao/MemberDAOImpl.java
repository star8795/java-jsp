package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.MemberDTO;

public class MemberDAOImpl implements MemberDAO {
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public void setConnection() {
		try {
			// DriverClass load
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/digital_jsp",
				"digital",
				"1234"
			);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
		
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	} // end close
	
	

	@Override
	public boolean memberJoin(MemberDTO member) {
		
		setConnection();
		
		// 중복 아이디 확인
		String sql = "SELECT * FROM mvc_member WHERE id = ?";
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				// id가 일치하는 행 정보가 존재
				return false;
			}
			
			// 중복아이디 아님
			sql = "INSERT INTO mvc_member(id,pass,name,age,gender) VALUES(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPass());
			pstmt.setString(3, member.getName());
			pstmt.setInt(4, member.getAge());
			pstmt.setString(5, member.getGender());
			int result = pstmt.executeUpdate();
			
			if(result == 1) {
				return true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			} 
			
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		} // end finally
		return false;
	}

	@Override
	public MemberDTO memberLogin(String id, String pass) {
		
		MemberDTO member = null;
		
		this.setConnection();
		
		String sql = "SELECT * FROM mvc_member WHERE id = ? AND pass = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setString(2,pass);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member = new MemberDTO();
				member.setNum(rs.getInt(1));
				String name = rs.getString("name");
				member.setName(name);
				member.setId(id);
				member.setPass(pass);
				member.setAge(rs.getInt("age"));
				member.setGender(rs.getString("gender"));
				member.setRegdate(rs.getTimestamp("regdate"));
				member.setUpdatedate(rs.getTimestamp("updatedate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			this.close();
		}
		return member;
	}

	@Override
	public boolean memberUpdate(MemberDTO member) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteMember(int num) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public MemberDTO getMemberById(String id) {
		MemberDTO member = null;
		this.setConnection();
		
		String sql = "SELECT * FROM mvc_member WHERE id = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member = new MemberDTO(
					rs.getInt(1),			// num
					rs.getString(2),		// id
					rs.getString(3),		// pass
					rs.getString(4),		// name
					rs.getInt(5),			// age
					rs.getString(6),		// gender
					rs.getTimestamp(7),		// regdate
					rs.getTimestamp(8)		// updatedate
				);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		
		return member;
	}

}

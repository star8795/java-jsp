package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.sql.DataSource;
import vo.MemberVO;

public class MemberDAOImpl implements MemberDAO {

    private DataSource dataSource;

    public MemberDAOImpl(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    @Override
    public boolean memberJoin(MemberVO member) {
        String sql = "INSERT INTO test_mvc (id, pass, name) VALUES (?, ?, ?)";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, member.getId());
            pstmt.setString(2, member.getPass()); // 비밀번호 직접 저장 (해싱 권장)
            pstmt.setString(3, member.getName());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public MemberVO memberLogin(String id, String pass) {
        String sql = "SELECT * FROM test_mvc WHERE id = ? AND pass = ?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, id);
            pstmt.setString(2, pass);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    MemberVO member = new MemberVO();
                    member.setNum(rs.getInt("num"));
                    member.setId(rs.getString("id"));
                    member.setPass(rs.getString("pass"));
                    member.setName(rs.getString("name"));
                    return member;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public MemberVO getMemberById(String id) {
        String sql = "SELECT * FROM test_mvc WHERE id = ?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, id);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    MemberVO member = new MemberVO();
                    member.setNum(rs.getInt("num"));
                    member.setId(rs.getString("id"));
                    member.setPass(rs.getString("pass"));
                    member.setName(rs.getString("name"));
                    return member;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}

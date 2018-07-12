package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Conn.DBConnect;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private DBConnect DB;

	public UserDAO() {
		DB = DBConnect.getInstance();
	}

	private void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				rs.close();
			}
		} catch (Exception e) {

		}
	}

	public int login(String userID, String userPassword) {
		Connection conn = null;
		String SQL = "SELECT userPassword FROM user WHERE userID=?";
		// 데이터 베이스에서 입력 받은 userID에 맞는 userPasswor가 있는지 확인하는 과정
		try {
			conn = DB.getConnection();
			pstmt = conn.prepareStatement(SQL);// conn으로 데이터베이스에 접속
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(userPassword)) {
					return 1; // 로그인 성공
				} else
					return 0;// 비밀번호 불일치
			}
			return -1; // 아이디 없음
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return -2; // 데이터베이스
	}

	public int join(User user) {
		String SQL = "INSERT INTO user VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"; // INSERT���� �ݵ�� 0�̻��� ��ȯ�ȴ�
		try {
			conn = DB.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserBirth());
			pstmt.setString(6, user.getUserBirth1());
			pstmt.setString(7, user.getUserBirth2());
			pstmt.setString(8, user.getUserPhone());
			pstmt.setString(9, user.getUserPhone1());
			pstmt.setString(10, user.getUserPhone2());
			pstmt.setTimestamp(11, user.getReg_date());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return -1; // 데이터베이스 오류
	}

	public User getuser(String userID) { //회원정보 불러오기
		User user = new User();
		// 쿼리 준비
		String sql = "select * from user where userID=?";
		try {
			// 쿼리 실행
			conn = DB.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			 // 쿼리 실행 후 결과를 resultset이 받아줌
			rs = pstmt.executeQuery();
			while (rs.next()) {
				user.setUserID(rs.getString("userID"));
				user.setUserPassword(rs.getString("userPassword"));
				user.setUserName(rs.getString("userName"));
				user.setUserGender(rs.getString("userGender"));
				user.setUserBirth(rs.getString("userBirth"));
				user.setUserBirth1(rs.getString("userBirth1"));
				user.setUserBirth2(rs.getString("userBirth2"));
				user.setUserPhone(rs.getString("userPhone"));
				user.setUserPhone1(rs.getString("userPhone1"));
				user.setUserPhone2(rs.getString("userPhone2"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
		}
		return user;
	}

	public int update(User user) { // 수정
		int rs = 0;
		String SQL = "update user set userPassword=?, userGender=?, userBirth=?, userBirth1=?, userBirth2=?, "
				+ "userPhone=?, userPhone1=?, userPhone2=? where userID=?";
		try {
			conn = DB.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserPassword());
			pstmt.setString(2, user.getUserGender());
			pstmt.setString(3, user.getUserBirth());
			pstmt.setString(4, user.getUserBirth1());
			pstmt.setString(5, user.getUserBirth2());
			pstmt.setString(6, user.getUserPhone());
			pstmt.setString(7, user.getUserPhone1());
			pstmt.setString(8, user.getUserPhone2());
			pstmt.setString(9, user.getUserID());

			rs = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return rs;
	}

	public int delete(String userID) {// 회원탈퇴

		int x = -1;

		Connection conn = null;

		String SQL = "DELETE  FROM user WHERE userID=?";// 삭제 쿼리문

		try {

			conn = DB.getConnection();

			pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, userID);

			x = pstmt.executeUpdate();

			if (x == 1) {

				System.out.println("삭제 성공");

			} else {

				System.out.println("삭제 실패");

			}

			System.out.print(x);

		} catch (Exception ex) {

			ex.printStackTrace();

		} finally {

			close();

		}
		return x;

	}

}

package kr.ac.kopo.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;

import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.util.ConnectionFactory;

public class MemberDAO {

	public void insertMember(MemberVO member) {
		StringBuilder sql = new StringBuilder();
		sql.append("insert into tbl_member(user_id, password, username, email) ");
		sql.append("values(?, ?, ?, ?) ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, member.getUserId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getUsername());
			pstmt.setString(4, member.getEmail());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 로그인여부 확인
	 * 
	 * @param loginVO 조회할 id, password
	 * @return 조회된 MemeberVO, 단 로그인 실패시 null 반환
	 */
	public MemberVO login(MemberVO loginVO) {
		StringBuilder sql = new StringBuilder();
		sql.append("select user_id, username, email ");
		sql.append("  from tbl_member ");
		sql.append(" where user_id = ? ");
		sql.append("   and password = ? ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, loginVO.getUserId());
			pstmt.setString(2, loginVO.getPassword());

			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				MemberVO member = new MemberVO();
				member.setUserId(rs.getString("user_id"));
				member.setUsername(rs.getString("username"));
				member.setEmail(rs.getString("email"));
				return member;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public MemberVO selectMember(MemberVO member) {
		StringBuilder sql = new StringBuilder();
		sql.append("select user_id ");
		sql.append("  from tbl_member ");
		sql.append(" where username = ? ");
		sql.append("   and email = ? ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, member.getUsername());
			pstmt.setString(2, member.getEmail());
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				MemberVO result = new MemberVO();
				result.setUserId(rs.getString("user_id"));
				return result;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public void deleteMember(MemberVO userVO) {
		StringBuilder sql = new StringBuilder();
		sql.append("delete from tbl_member ");
		sql.append(" where user_id = ? ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, userVO.getUserId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void updatePassword(MemberVO member) {
		StringBuilder sql = new StringBuilder();
		sql.append("update tbl_member ");
		sql.append("   set password = ? ");
		sql.append(" where user_id = ? ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, member.getPassword());
			pstmt.setString(2, member.getUserId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public MemberVO updateTempPassword(MemberVO userVO) {
		StringBuilder sql = new StringBuilder();
		sql.append("update tbl_member ");
		sql.append("   set password = ? ");
		sql.append(" where user_id = ? ");
		sql.append("   and username = ? ");
		sql.append("   and email = ? ");
		MemberVO member = new MemberVO();
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			String tempPassword = generateRandomPassword();
			pstmt.setString(1, tempPassword);
			pstmt.setString(2, userVO.getUserId());
			pstmt.setString(3, userVO.getUsername());
			pstmt.setString(4, userVO.getEmail());
			pstmt.executeUpdate();
			member.setPassword(tempPassword);
			return member;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	private String generateRandomPassword() {
		int leftLimit = 48; // numeral '0'
		int rightLimit = 122; // letter 'z'
		int targetStringLength = 10;
		Random random = new Random();
		String generatedString = random.ints(leftLimit, rightLimit + 1)
				.filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97)).limit(targetStringLength)
				.collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append).toString();
		return generatedString;

	}
}

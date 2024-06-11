package kr.ac.kopo.email.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.email.vo.EmailVO;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.util.ConnectionFactory;

public class EmailDAO {
	public List<EmailVO> selectReceivedEmailList(MemberVO userVO) {
		List<EmailVO> emailList = new ArrayList<>();

		StringBuilder sql = new StringBuilder();
		sql.append("select no, sender, title, to_char(created_at,'YYYY-MM-DD HH24:MI:SS') created_at ");
		sql.append("  from tbl_email ");
		sql.append(" where user_id = ? ");
		sql.append("   and receiver = ? ");
		sql.append(" order by created_at desc ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {

			pstmt.setString(1, userVO.getUserId());
			pstmt.setString(2, userVO.getUserId());
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				int no = rs.getInt("no");
				String sender = rs.getString("sender");
				String title = rs.getString("title");
				String createdAt = rs.getString("created_at");

				EmailVO email = new EmailVO();
				email.setNo(no);
				email.setSender(sender);
				email.setTitle(title);
				email.setCreatedAt(createdAt);

				emailList.add(email);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return emailList;
	}

	public List<EmailVO> selectSentEmailList(MemberVO userVO) {
		List<EmailVO> emailList = new ArrayList<>();

		StringBuilder sql = new StringBuilder();
		sql.append("select no, receiver, title, to_char(created_at,'YYYY-MM-DD HH24:MI:SS') created_at ");
		sql.append("  from tbl_email ");
		sql.append(" where user_id = ? ");
		sql.append("   and sender = ? ");
		sql.append(" order by created_at desc ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {

			pstmt.setString(1, userVO.getUserId());
			pstmt.setString(2, userVO.getUserId());
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				int no = rs.getInt("no");
				String receiver = rs.getString("receiver");
				String title = rs.getString("title");
				String createdAt = rs.getString("created_at");

				EmailVO email = new EmailVO();
				email.setNo(no);
				email.setReceiver(receiver);
				email.setTitle(title);
				email.setCreatedAt(createdAt);

				emailList.add(email);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return emailList;
	}

	public List<EmailVO> selectBinEmailList(MemberVO userVO) {
		List<EmailVO> emailList = new ArrayList<>();

		StringBuilder sql = new StringBuilder();
		sql.append("select no, sender, receiver, title, to_char(created_at,'YYYY-MM-DD HH24:MI:SS') created_at ");
		sql.append("      ,to_char(deleted_at,'YYYY-MM-DD HH24:MI:SS') deleted_at ");
		sql.append("  from tbl_bin ");
		sql.append(" where user_id = ? ");
		sql.append(" order by deleted_at desc ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {

			pstmt.setString(1, userVO.getUserId());
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				int no = rs.getInt("no");
				String sender = rs.getString("sender");
				String receiver = rs.getString("receiver");
				String title = rs.getString("title");
				String createdAt = rs.getString("created_at");
				String deletedAt = rs.getString("deleted_at");

				EmailVO email = new EmailVO();
				email.setNo(no);
				email.setSender(sender);
				email.setReceiver(receiver);
				email.setTitle(title);
				email.setCreatedAt(createdAt);
				email.setDeletedAt(deletedAt);

				emailList.add(email);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return emailList;
	}

	public EmailVO selectByNo(int emailNo) {
		StringBuilder sql = new StringBuilder();
		sql.append("select no, sender, receiver, title, contents ");
		sql.append("      ,to_char(created_at,'YYYY-MM-DD HH24:MI:SS') as created_at ");
		sql.append("  from tbl_email ");
		sql.append(" where no = ? ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {
			pstmt.setInt(1, emailNo);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				int no = rs.getInt("no");
				String sender = rs.getString("sender");
				String receiver = rs.getString("receiver");
				String title = rs.getString("title");
				String contents = rs.getString("contents");
				String createdAt = rs.getString("created_at");
				EmailVO email = new EmailVO(no, sender, receiver, title, contents, createdAt);
				return email;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void restoreEmail(EmailVO email) {
		StringBuilder sql = new StringBuilder();
		sql.append("insert into tbl_email(no, user_id, sender, receiver, title, contents, created_at) ");
		sql.append("values(seq_email_no.nextval, ?, ?, ?, ?, ?, to_date(?,'YYYY-MM-DD HH24:MI:SS')) ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, email.getUserId());
			pstmt.setString(2, email.getSender());
			pstmt.setString(3, email.getReceiver());
			pstmt.setString(4, email.getTitle());
			pstmt.setString(5, email.getContents());
			pstmt.setString(6, email.getCreatedAt());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void insertEmail(EmailVO email) {
		insertEmailSender(email);
		insertEmailReceiver(email);
	}

	private void insertEmailSender(EmailVO email) {
		StringBuilder sql = new StringBuilder();
		sql.append("insert into tbl_email(no, user_id, sender, receiver, title, contents) ");
		sql.append("values(seq_email_no.nextval, ?, ?, ?, ?, ?) ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, email.getSender());
			pstmt.setString(2, email.getSender());
			pstmt.setString(3, email.getReceiver());
			pstmt.setString(4, email.getTitle());
			pstmt.setString(5, email.getContents());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void insertEmailReceiver(EmailVO email) {
		StringBuilder sql = new StringBuilder();
		sql.append("insert into tbl_email(no, user_id, sender, receiver, title, contents) ");
		sql.append("values(seq_email_no.nextval, ?, ?, ?, ?, ?) ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, email.getReceiver());
			pstmt.setString(2, email.getSender());
			pstmt.setString(3, email.getReceiver());
			pstmt.setString(4, email.getTitle());
			pstmt.setString(5, email.getContents());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void deleteByNo(int emailNo) {
		insertEmailBin(emailNo);
		StringBuilder sql = new StringBuilder();
		sql.append("delete from tbl_email ");
		sql.append(" where no = ? ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {
			pstmt.setInt(1, emailNo);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void deleteBinByNo(int emailNo) {
		StringBuilder sql = new StringBuilder();
		sql.append("delete from tbl_bin ");
		sql.append(" where no = ? ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {
			pstmt.setInt(1, emailNo);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void deleteBinAll(MemberVO userVO) {
		StringBuilder sql = new StringBuilder();
		sql.append("delete from tbl_bin ");
		sql.append(" where user_id = ? ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {
			pstmt.setString(1, userVO.getUserId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void insertEmailBin(int emailNo) {
		StringBuilder sql = new StringBuilder();
		sql.append("insert into tbl_bin(no, user_id, sender, receiver, title, contents, created_at) ");
		sql.append("select * ");
		sql.append("  from tbl_email ");
		sql.append(" where no = ? ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setInt(1, emailNo);

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public EmailVO selectBinByNo(int emailNo) {
		StringBuilder sql = new StringBuilder();
		sql.append("select no, sender, receiver, title, contents ");
		sql.append("      ,to_char(created_at,'YYYY-MM-DD HH24:MI:SS') as created_at ");
		sql.append("      ,to_char(deleted_at,'YYYY-MM-DD HH24:MI:SS') as deleted_at ");
		sql.append("  from tbl_bin ");
		sql.append(" where no = ? ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {
			pstmt.setInt(1, emailNo);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				int no = rs.getInt("no");
				String sender = rs.getString("sender");
				String receiver = rs.getString("receiver");
				String title = rs.getString("title");
				String contents = rs.getString("contents");
				String createdAt = rs.getString("created_at");
				String deletedAt = rs.getString("deleted_at");
				EmailVO email = new EmailVO(no, sender, receiver, title, contents, createdAt, deletedAt);
				return email;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}

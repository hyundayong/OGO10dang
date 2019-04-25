package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import vo.Registration;

public class MemberDAO {
	// �̱��� ��ü�� ����
	static private MemberDAO memberDAO = new MemberDAO();
	private MemberDAO() { }
	public static MemberDAO getInstance() {
		return memberDAO;
	}
	
	// ����� ���ᰴü ����
	Connection conn;
	public void setConnection(Connection conn) {
		this.conn = conn;
	}
	
	// ȸ�� ���� DAO �޼ҵ�
	public int insertMember(Registration regist) {
		PreparedStatement pstmt = null;
		int insertCount = 0;
		
		try {
			String sql = "INSERT INTO MEMBERINFO_HM(NAME, ID, TEL, PASS, EMAIL) "
					+ "VALUES(?, ?, ?, ?, ?)";		// ȸ�� ������ INSERT
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, regist.getName());
			pstmt.setString(2, regist.getId());
			pstmt.setString(3, regist.getTel());
			pstmt.setString(4, regist.getPw());
			pstmt.setString(5, regist.getEmail());
			
			insertCount = pstmt.executeUpdate();	// INSERT�� ����
		} catch(Exception e) {
			System.out.println("insertMember ���� : " + e);
		} finally {
			close(pstmt);
		}
		return insertCount;
	}
	
	// ���̵� �ߺ� üũ �޼ҵ�
	public boolean idOverlapCheck(String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		boolean idavailable = false;
		try {
			sql = "SELECT * FROM MEMBERINFO_HM WHERE ID=?";		// ���̵�� ������ ����� ��ȸ
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();			// SELECT�� ����
			
			if(!rs.next()) {		// ��� ���ڵ尡 ������
				idavailable = true;	// ���̵� ��� ����
			}
		} catch (Exception e) {
			System.out.println("idOverlapCheck ����" + e);
		} finally {
			close(rs);	close(pstmt);
		}
		return idavailable;
	}
	
	public int getLoginMember(String id, String pw) {	// �α��� â���� �Է��� ������ DB�� ����Ǿ��ִ� ID�� PW�� �����ִ� �޼ҵ�
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// loginInfoCheck�� id, pw�� ��� ������ 1, id�� ������ 2, pw�� ������ 3�� �ȴٰ� ����.
		int loginInfoCheck = 2;	// ó���� üũ�ؾ� �Ǵ� ���� id�̹Ƿ�, �ʱ� ���� 2
		
		try {
			String sql = "SELECT ID, PASS FROM MEMBERINFO_HM";
			pstmt = conn.prepareStatement(sql);	// DB���� �ش� Id, pw�� ������ �����Ͱ� �ִ��� Ȯ�� ��
			rs = pstmt.executeQuery();	// ��ȸ ���� rs�� �����ϰ�
			while(rs.next()) {
				if(id.equals(rs.getString(1))) {	// DB�� �Է��� id�� �ְ�, 
					if(pw.equals(rs.getString(2))) {	// �Է��� pw�� ������
						loginInfoCheck = 1;
					} else {	// �Է��� pw�� ������
						loginInfoCheck = 3;
						System.out.println("DB�� �Է��� ��й�ȣ�� ����");
					}
				}
			}
		} catch(Exception e) {
			System.out.println("getLoginMember ���� : " + e);
		} finally {
			close(rs); close(pstmt);
		}
		return loginInfoCheck;
		
	}
	
	public String getUserName (String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String loginName = "";
		
		try {
			String sql = "SELECT ID, NAME FROM MEMBERINFO_HM";
			pstmt = conn.prepareStatement(sql);	// DB�� ����� ����� �̸�, ID ����� ��ȸ�� ��
			rs = pstmt.executeQuery(); // ��ȸ ���� rs�� �����ϰ�
			while(rs.next()) {
				if(id.equals(rs.getString(1))) {	// DB�� �Է��� id�� ������
					loginName = rs.getString(2);	// �ش� ����� �̸��� ������
					System.out.println("loginName = " + loginName);
				} else {
					
				}
			}
		} catch(Exception e) {
			System.out.println("getUserName ���� : " + e);
		} finally {
			close(rs); close(pstmt);
		}
		return loginName;
	}
}

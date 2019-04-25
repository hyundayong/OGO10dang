package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import vo.Registration;

public class MemberDAO {
	// 싱글톤 객체로 지정
	static private MemberDAO memberDAO = new MemberDAO();
	private MemberDAO() { }
	public static MemberDAO getInstance() {
		return memberDAO;
	}
	
	// 사용할 연결객체 지정
	Connection conn;
	public void setConnection(Connection conn) {
		this.conn = conn;
	}
	
	// 회원 가입 DAO 메소드
	public int insertMember(Registration regist) {
		PreparedStatement pstmt = null;
		int insertCount = 0;
		
		try {
			String sql = "INSERT INTO MEMBERINFO_HM(NAME, ID, TEL, PASS, EMAIL) "
					+ "VALUES(?, ?, ?, ?, ?)";		// 회원 정보를 INSERT
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, regist.getName());
			pstmt.setString(2, regist.getId());
			pstmt.setString(3, regist.getTel());
			pstmt.setString(4, regist.getPw());
			pstmt.setString(5, regist.getEmail());
			
			insertCount = pstmt.executeUpdate();	// INSERT문 실행
		} catch(Exception e) {
			System.out.println("insertMember 에러 : " + e);
		} finally {
			close(pstmt);
		}
		return insertCount;
	}
	
	// 아이디 중복 체크 메소드
	public boolean idOverlapCheck(String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		boolean idavailable = false;
		try {
			sql = "SELECT * FROM MEMBERINFO_HM WHERE ID=?";		// 아이디와 동일한 레쿄드 조회
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();			// SELECT문 실행
			
			if(!rs.next()) {		// 결과 레코드가 없으면
				idavailable = true;	// 아이디 사용 가능
			}
		} catch (Exception e) {
			System.out.println("idOverlapCheck 에러" + e);
		} finally {
			close(rs);	close(pstmt);
		}
		return idavailable;
	}
	
	public int getLoginMember(String id, String pw) {	// 로그인 창에서 입력한 정보와 DB에 저장되어있는 ID와 PW를 비교해주는 메소드
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// loginInfoCheck는 id, pw가 모두 있으면 1, id가 없으면 2, pw가 없으면 3이 된다고 하자.
		int loginInfoCheck = 2;	// 처음에 체크해야 되는 것이 id이므로, 초기 값은 2
		
		try {
			String sql = "SELECT ID, PASS FROM MEMBERINFO_HM";
			pstmt = conn.prepareStatement(sql);	// DB에서 해당 Id, pw와 동일한 데이터가 있는지 확인 후
			rs = pstmt.executeQuery();	// 조회 값을 rs에 저장하고
			while(rs.next()) {
				if(id.equals(rs.getString(1))) {	// DB에 입력한 id가 있고, 
					if(pw.equals(rs.getString(2))) {	// 입력한 pw도 있으면
						loginInfoCheck = 1;
					} else {	// 입력한 pw가 없으면
						loginInfoCheck = 3;
						System.out.println("DB에 입력한 비밀번호가 없음");
					}
				}
			}
		} catch(Exception e) {
			System.out.println("getLoginMember 에러 : " + e);
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
			pstmt = conn.prepareStatement(sql);	// DB에 저장된 사용자 이름, ID 목록을 조회한 후
			rs = pstmt.executeQuery(); // 조회 값을 rs에 저장하고
			while(rs.next()) {
				if(id.equals(rs.getString(1))) {	// DB에 입력한 id가 있으면
					loginName = rs.getString(2);	// 해당 사용자 이름을 가져옴
					System.out.println("loginName = " + loginName);
				} else {
					
				}
			}
		} catch(Exception e) {
			System.out.println("getUserName 에러 : " + e);
		} finally {
			close(rs); close(pstmt);
		}
		return loginName;
	}
}

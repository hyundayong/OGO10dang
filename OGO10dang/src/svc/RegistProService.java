package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.MemberDAO;
import vo.Registration;
public class RegistProService {
	// 회원가입 메소드
	// 회원 가입에 성공하면 true, 실패하면 false 반환
	public boolean registMember(Registration regist) throws Exception {
		boolean isWriteSuccess = false;
		Connection conn = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(conn);
		
		int insertCount = memberDAO.insertMember(regist);		// INSERT된 행의 개수 반환
		if(insertCount > 0) {
			commit(conn);			// 성공하면 commit
			isWriteSuccess = true;
		} else {
			rollback(conn);			// 실패하면 rollback
			}
		close(conn);
		return isWriteSuccess;		// 회원가입 성공하면 true, 실패하면 false
		}

	// 아이디 중복체크 메소드
	public boolean idOverlapCheck(String id) {
		boolean idavailable = false;
		Connection conn = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(conn);
		
		idavailable = memberDAO.idOverlapCheck(id);		// 아이디가 이용 가능하면 true, 중복되면 false
		close(conn);		// 자원 반납
		return idavailable;
	}
}

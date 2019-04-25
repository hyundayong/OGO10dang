package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.MemberDAO;
import vo.Registration;
public class RegistProService {
	// ȸ������ �޼ҵ�
	// ȸ�� ���Կ� �����ϸ� true, �����ϸ� false ��ȯ
	public boolean registMember(Registration regist) throws Exception {
		boolean isWriteSuccess = false;
		Connection conn = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(conn);
		
		int insertCount = memberDAO.insertMember(regist);		// INSERT�� ���� ���� ��ȯ
		if(insertCount > 0) {
			commit(conn);			// �����ϸ� commit
			isWriteSuccess = true;
		} else {
			rollback(conn);			// �����ϸ� rollback
			}
		close(conn);
		return isWriteSuccess;		// ȸ������ �����ϸ� true, �����ϸ� false
		}

	// ���̵� �ߺ�üũ �޼ҵ�
	public boolean idOverlapCheck(String id) {
		boolean idavailable = false;
		Connection conn = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(conn);
		
		idavailable = memberDAO.idOverlapCheck(id);		// ���̵� �̿� �����ϸ� true, �ߺ��Ǹ� false
		close(conn);		// �ڿ� �ݳ�
		return idavailable;
	}
}

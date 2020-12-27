package member.service;

import java.sql.Connection;
import java.sql.SQLException;

import auth.service.User;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import member.dao.MemberDao;
import member.model.Member;

public class RemoveMemberService {
	private MemberDao memberDao = new MemberDao();
	
	public void removeMember(User user, String password) {
		
		// 0. 커넥션 얻기
		Connection conn = null;
		// 1. dao 의 selectById로 member 객체 얻기
		// 	  1.1 member없으면 MemberNotFoundException 발생
		
		// 2. password와 member.password가 같은지 확인
		//    2.1 다르면 InvalidPasswordException 발생
		
		// 3. delete() 메소드 실행
		 try {
	         conn = ConnectionProvider.getConnection();
	         conn.setAutoCommit(false);
	         Member member = memberDao.selectById(conn, user.getId());
	         if (member == null) {
	            throw new MemberNotFoundException();
	         }
	         if (!member.matchPassword(password)) {
	            throw new InvalidPasswordException();
	         }
	         memberDao.delete(conn, user.getId());
	         conn.commit();
	      } catch (SQLException e) {
	         JdbcUtil.rollback(conn);
	         throw new RuntimeException(e);
	      } finally {
	         JdbcUtil.close(conn);
	      }

	}
}

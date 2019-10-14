package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.User;

public class UserDAO {
	private JDBCUtil jdbcUtil = null;
	
	private static UserDAO instance = new UserDAO();

	// 자신의 객체를 리턴하는 메소드 만듬
	public static UserDAO getInstance() {
		return instance;
	}
	
	public UserDAO() {			
		jdbcUtil = new JDBCUtil();	// JDBCUtil 객체 생성
	}
	
	//사용자 생성
	public int create(User user) throws SQLException {
		String sql = "INSERT INTO CONSUMER (consumer_id, password, nickname, interest1, interest2, interest3) "
				+ "VALUES (?, ?, ?, ?, ?, ?)";		
		Object[] param = new Object[] {user.getUser_id(), user.getPassword(), user.getNickname(), 
				user.getInterest1(), user.getInterest2(), user.getInterest3()};				
		jdbcUtil.setSqlAndParameters(sql, param);	
						
		try {				
			int result = jdbcUtil.executeUpdate();	
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {		
			jdbcUtil.commit();
			jdbcUtil.close();	
		}		
		return 0;			
	}
	
	
	
	/**
	 * 주어진 사용자 ID에 해당하는 사용자 정보를 데이터베이스에서 찾아 User 도메인 클래스에 
	 * 저장하여 반환.
	 */
	public User findUser(String user_id) throws SQLException {
        String sql = "SELECT password, nickname, total_point, interest1, interest2, interest3 "
        			+ "FROM CONSUMER WHERE consumer_id = ? ";              
		jdbcUtil.setSqlAndParameters(sql, new Object[] {user_id});	// JDBCUtil에 query문과 매개 변수 설정

		try {
			ResultSet rs = jdbcUtil.executeQuery();		// query 실행
			if (rs.next()) {						
				User user = new User( user_id, rs.getString("nickname"), rs.getString("password"),rs.getInt("total_point"), 
						rs.getString("interest1"), rs.getString("interest2"), rs.getString("interest3") );
				return user;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		return null;
	}
	
	
	
	/**
	 * 주어진 사용자 ID에 해당하는 사용자가 존재하는지 검사 
	 */
	public boolean existingUser(String userId) throws SQLException {
		String sql = "SELECT count(*) FROM CONSUMER WHERE consumer_id=?";      
		jdbcUtil.setSqlAndParameters(sql, new Object[] {userId});	// JDBCUtil에 query문과 매개 변수 설정

		try {
			ResultSet rs = jdbcUtil.executeQuery();		// query 실행
			if (rs.next()) {
				int count = rs.getInt(1);
				return (count == 1 ? true : false);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		return false;
	}
		
	
	
	
	
	
	
	
	
	/**
	 * 전체 사용자 정보를 검색하여 List에 저장 및 반환
	 */
	public List<User> findUserList() throws SQLException {
        String sql = "SELECT consumer_id, password, nickname, total_point, interest1, interest2, interest3 " 
        		   + "FROM CONSUMER";
		jdbcUtil.setSqlAndParameters(sql, null);		// JDBCUtil에 query문 설정
					
		try {
			ResultSet rs = jdbcUtil.executeQuery();			// query 실행			
			List<User> userList = new ArrayList<User>();	// User들의 리스트 생성
			while (rs.next()) {
				User user = new User(			// User 객체를 생성하여 현재 행의 정보를 저장
					rs.getString("consumer_id"),
					rs.getString("password"),
					rs.getString("nickname"),
					rs.getInt("total_point"),
					rs.getString("interest1"),
					rs.getString("interest2"),
					rs.getString("interest3"));	
				userList.add(user);				// List에 User 객체 저장
			}		
			return userList;					
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		return null;
	}
	
	/**
	 * 전체 사용자 정보를 검색한 후 현재 페이지와 페이지당 출력할 사용자 수를 이용하여
	 * 해당하는 사용자 정보만을 List에 저장하여 반환.
	 */
	public List<User> findUserList(int currentPage, int countPerPage) throws SQLException {
        String sql = "SELECT consumer_id, password, nickname, total_point, interest1, interest2, interest3 " 
        		   + "CONSUMER ORDER BY consumer_id";
		jdbcUtil.setSqlAndParameters(sql, null,					// JDBCUtil에 query문 설정
				ResultSet.TYPE_SCROLL_INSENSITIVE,				// cursor scroll 가능
				ResultSet.CONCUR_READ_ONLY);						
		
		try {
			ResultSet rs = jdbcUtil.executeQuery();				// query 실행			
			int start = ((currentPage-1) * countPerPage) + 1;	// 출력을 시작할 행 번호 계산
			if ((start >= 0) && rs.absolute(start)) {			// 커서를 시작 행으로 이동
				List<User> userList = new ArrayList<User>();	// User들의 리스트 생성
				do {
					User user = new User(		// User 객체를 생성하여 현재 행의 정보를 저장
							rs.getString("consumer_id"),
							rs.getString("password"),
							rs.getString("nickname"),
							rs.getInt("total_point"),
							rs.getString("interest1"),
							rs.getString("interest2"),
							rs.getString("interest3"));	
					userList.add(user);							// 리스트에 User 객체 저장
				} while ((rs.next()) && (--countPerPage > 0));		
				return userList;							
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		return null;
	}

}

package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Post;
import java.text.*;
import java.util.*;

public class PointDAO {
	private JDBCUtil jdbcUtil = null;

	public PointDAO() {
		jdbcUtil = new JDBCUtil();
	}
	
	//point 적립
		public int GivePoint(String user_id) throws SQLException {
			
			int result = 0;
			String sql = "";
			Object[] param = null;
			
			sql = "UPDATE CONSUMER SET total_point = total_point + 10 WHERE consumer_id = ?";
			param = new Object[] {user_id} ;	
			
			jdbcUtil.setSqlAndParameters(sql, param); 
			

			try {
				result = jdbcUtil.executeUpdate();
				
			} catch (Exception ex) {
				jdbcUtil.rollback();
				ex.printStackTrace();
			} finally {
				jdbcUtil.commit();
				jdbcUtil.close();
				
			}
			
			return result;
			
		}
		
		//review point 적립
				public int GiveReviewPoint(String user_id) throws SQLException {
					
					int result = 0;
					String sql = "";
					Object[] param = null;
					
					sql = "UPDATE CONSUMER SET total_point = total_point + 1 WHERE consumer_id = ?";
					param = new Object[] {user_id} ;	
					
					jdbcUtil.setSqlAndParameters(sql, param); 
					

					try {
						result = jdbcUtil.executeUpdate();
						
					} catch (Exception ex) {
						jdbcUtil.rollback();
						ex.printStackTrace();
					} finally {
						jdbcUtil.commit();
						jdbcUtil.close();
						
					}
					
					return result;
					
				}
	
	//point 소멸
		public int TakePoint(String user_id) throws SQLException {
			
			int result = 0;
			String sql = "";
			Object[] param = null;
			
			sql = "UPDATE CONSUMER SET total_point = total_point - 5 WHERE consumer_id = ?";
			param = new Object[] {user_id} ;	
			
			jdbcUtil.setSqlAndParameters(sql, param); 
			

			try {
				result = jdbcUtil.executeUpdate();
				
			} catch (Exception ex) {
				jdbcUtil.rollback();
				ex.printStackTrace();
			} finally {
				jdbcUtil.commit();
				jdbcUtil.close();
				
			}
			
			return result;
			
		}
	

	//point 기록하기
		public int RecordPoint(String what, int post_id, String user_id ) throws SQLException {
			
			int result = 0;
			String sql = "";
			Object[] param = null;
			
			if (what.equals("use")) {
				sql = "INSERT INTO POINT (use_or_get, point_id, post_id, consumer_id)"
						+ "VALUES (?, POINT_ID_SEQUENCE.nextval, ?, ?)";;
				param = new Object[] {"use", post_id, user_id} ;	
			}
			else {
					sql = "INSERT INTO POINT (use_or_get, point_id, post_id, consumer_id)"
							+ "VALUES (?, POINT_ID_SEQUENCE.nextval, ?, ?)";;
					param = new Object[] {"get", post_id, user_id} ;	
			}
			
			jdbcUtil.setSqlAndParameters(sql, param); 
			

			try {
				result = jdbcUtil.executeUpdate();
				
			} catch (Exception ex) {
				jdbcUtil.rollback();
				ex.printStackTrace();
			} finally {
				jdbcUtil.commit();
				jdbcUtil.close();
				
			}
			
			return result;
			
		}

}


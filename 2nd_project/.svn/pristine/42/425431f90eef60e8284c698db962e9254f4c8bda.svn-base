package user;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbcDAO.JdbcDAO;

public class UserDAO extends JdbcDAO{
	private static UserDAO _dao;
	
	private UserDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new UserDAO();
	}
	
	public static UserDAO getDAO() {
		return _dao;
	}
	
	//회占쏙옙 占쌩곤옙 (회占쏙옙占쏙옙占쏙옙)
	public int addUser(UserDTO user) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		
		try {
			con=getConnection();
			String sql="insert into users values(?,?,?,?,?,?,?,?,'user',sysdate,user_seq.nextval,null)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, user.getuId());
			pstmt.setString(2, user.getuPwd());
			pstmt.setString(3, user.getuName());
			pstmt.setString(4, user.getuEmail());
			pstmt.setString(5, user.getuPost());
			pstmt.setString(6, user.getuAbasic());
			pstmt.setString(7, user.getuAdetail());
			pstmt.setString(8, user.getuPhone());
			
			rows=pstmt.executeUpdate();
		}catch(SQLException e) {
			System.out.println("addUser()占쌨소듸옙 SQL占쏙옙占쏙옙 = "+e.getMessage());
		}finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//회占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙
	public UserDTO getUser(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		UserDTO user=null;
		try {
			con=getConnection();
			String sql="select * from users where u_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				user=new UserDTO();
				user.setuId(rs.getString("u_id"));
				user.setuPwd(rs.getString("u_pwd"));
				user.setuName(rs.getString("u_name"));
				user.setuPhone(rs.getString("u_phone"));
				user.setuJoindate(rs.getString("u_joindate"));
				user.setuEmail(rs.getString("u_email"));
				user.setuPost(rs.getString("u_post"));
				user.setuAbasic(rs.getString("u_abasic"));
				user.setuAdetail(rs.getString("u_adetail"));
				user.setuGrade(rs.getString("u_grade"));
			}
			
		} catch(SQLException e) {
			System.out.println("getUser() 占쌨소듸옙 SQL 占쏙옙占쏙옙 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return user;
	}
	
	//占쌩븝옙 ID 체크 占쏙옙 회占쏙옙占쏙옙占� 占싯삼옙(회占쏙옙占쏙옙占� 占쏙옙환)
	public String checkUserId(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String grade="";
		try {
			con=getConnection();
			String sql="select u_grade from users where u_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				grade=rs.getString(1);
			}
			
		} catch(SQLException e) {
			System.out.println("checkUserId() 占쌨소듸옙 SQL 占쏙옙占쏙옙 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		if(grade==null) grade="";
		return grade;
	}
	
	//회占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙
	public int modifyUser(UserDTO user) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		
		try {
			con=getConnection();
			String sql="update users set u_pwd=?,u_name=?,u_email=?,u_post=?,u_abasic=?,u_adetail=?,u_phone=? where u_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, user.getuPwd());
			pstmt.setString(2, user.getuName());
			pstmt.setString(3, user.getuEmail());
			pstmt.setString(4, user.getuPost());
			pstmt.setString(5, user.getuAbasic());
			pstmt.setString(6, user.getuAdetail());
			pstmt.setString(7, user.getuPhone());
			pstmt.setString(8, user.getuId());
			
			rows=pstmt.executeUpdate();
		} catch(SQLException e) {
			System.out.println("modifyUser() 占쌨소듸옙 SQL 占쏙옙占쏙옙 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
		
	//占쏙옙占싼븝옙占쏙옙(탈占쏙옙/占쏙옙占� 占쏙옙占쏙옙)
	public int modifyUserGrade(String uId,String grade) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		
		try {
			con=getConnection();
			String sql="";
			if(grade.equals("leave")) {
				sql="update users set u_grade='leave', u_dropdate=sysdate where u_id=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, uId);
			} else {
				sql="update users set u_grade=? where u_id=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, grade);
				pstmt.setString(2, uId);
			}
			rows=pstmt.executeUpdate();
			
		} catch(SQLException e) {
			System.out.println("modifyUserGrade() 占쌨소듸옙 SQL 占쏙옙占쏙옙 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	public int modifyorderstatus(String num,String status) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		//System.out.println(num + "----" + status);
		try {
			con=getConnection();
			String sql="";
			
				sql="update Stock_list set s_status=? where s_num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, status);
				pstmt.setInt(2, Integer.parseInt(num));
			
			
			rows=pstmt.executeUpdate();
			
		} catch(SQLException e) {
			System.out.println("modifyorderstatus() 占쌨소듸옙 SQL 占쏙옙占쏙옙 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//占쏙옙占싱듸옙 찾占쏙옙
	public String lookupId(String uName, String uPhone, String uId) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String id="";
		try {
			con=getConnection();
			if(uId.equals("")) {
				String sql="select U_ID from users where u_name=? and u_phone=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, uName);
				pstmt.setString(2, uPhone);
			} else if(!uId.equals("")) {
				String sql="select U_ID from users where u_name=? and u_phone=? and u_id=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, uName);
				pstmt.setString(2, uPhone);
				pstmt.setString(3, uId);
			}
			rs=pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1)!=null) id=rs.getString(1);
			} 
		} catch (SQLException e) {
			System.out.println("discoverId() 占쌨소듸옙 SQL 占쏙옙占쏙옙 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return id;
	}
		
	//占쏙옙斌占쏙옙占� leave(탈占쏙옙)占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占� 占쏙옙占쏙옙 占쏙옙환
	public List<UserDTO> getUserList(int startRow,int endRow,String search,String keyword){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<UserDTO> userList=new ArrayList<UserDTO>();
		try {
			con=getConnection();
			
			if(search.equals("")) {
				String sql="select * from (select rownum rn,temp.* from ("
						+ "select * from users where u_grade!='leave' order by u_joindate desc) temp"
						+ ") where rn between ? and ?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);	
			} else {
				String sql="select * from (select rownum rn,temp.* from ("
						+ "select * from users where "+search+" like "
						+ "'%'||?||'%' and u_grade!='leave' order by u_joindate desc"
						+ ") temp) where rn between ? and ?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, keyword);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			}
			
			rs=pstmt.executeQuery();

			while(rs.next()) {
				UserDTO user=new UserDTO();
				user.setuId(rs.getString("u_id"));
				user.setuPwd(rs.getString("u_pwd"));
				user.setuName(rs.getString("u_name"));
				user.setuPhone(rs.getString("u_phone"));
				user.setuJoindate(rs.getString("u_joindate"));
				user.setuEmail(rs.getString("u_email"));
				user.setuPost(rs.getString("u_post"));
				user.setuAbasic(rs.getString("u_abasic"));
				user.setuAdetail(rs.getString("u_adetail"));
				user.setuGrade(rs.getString("u_grade"));

				
				userList.add(user);
			}
		} catch (SQLException e) {
			System.out.println("[占쏙옙占쏙옙]getUserList() 占쌨소듸옙 SQL 占쏙옙占쏙옙 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return userList;
	}
	//占쏙옙占쏙옙占싶몌옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占싹댐옙 占쌨소듸옙
	public int removeUser(String uId) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="delete from users where u_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, uId);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[占쏙옙占쏙옙]removeMember() 占쌨소듸옙占쏙옙 SQL 占쏙옙占쏙옙 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	//탈占쏙옙占쏙옙 占쏙옙占� 占쏙옙占쏙옙占쏙옙 占쏙옙환
	public List<UserDTO> getLeaveUserList(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<UserDTO> userList=new ArrayList<UserDTO>();
		try {
			con=getConnection();
			
			String sql="select * from users where u_grade='leave'";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				UserDTO user=new UserDTO();
				user.setuId(rs.getString("u_id"));
				user.setuPwd(rs.getString("u_pwd"));
				user.setuName(rs.getString("u_name"));
				user.setuPhone(rs.getString("u_phone"));
				user.setuJoindate(rs.getString("u_joindate"));
				user.setuEmail(rs.getString("u_email"));
				user.setuPost(rs.getString("u_post"));
				user.setuAbasic(rs.getString("u_abasic"));
				user.setuAdetail(rs.getString("u_adetail"));
				user.setuGrade(rs.getString("u_grade"));

				
				userList.add(user);
			}
		} catch (SQLException e) {
			System.out.println("[占쏙옙占쏙옙]getLeaveUserList() 占쌨소듸옙 SQL 占쏙옙占쏙옙 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return userList;
	}
	
	//占싯삼옙占쌨댐옙占쏙옙 키占쏙옙占썲를 占쏙옙占쌨받억옙 user 占쏙옙占싱븝옙 占쏙옙占쏙옙占� 占싯삼옙 占쌉시깍옙占쏙옙 占쏙옙占쏙옙占쏙옙 占싯삼옙占싹울옙 占쏙옙환占싹댐옙 占쌨소듸옙
	//=> 占쏙옙占쌨듸옙 占싯삼옙占쌨댐옙占쏙옙 占쏙옙占쌕몌옙 user 占쏙옙占싱븝옙 占쏙옙占쏙옙占� 占쏙옙체 占쌉시깍옙占쏙옙 占쏙옙占쏙옙占쏙옙 占싯삼옙占싹울옙 占쏙옙환占싹댐옙 占쌨소듸옙
	public int getTotalUser(String search,String keyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int rows=0;
		try {
			con=getConnection();
			
			//占식띰옙占쏙옙沽占� 占쏙옙占쌨듸옙 占쏙옙占쏙옙 占쏙옙占쏙옙 占쌕몌옙 SQL 占쏙옙占쏙옙占� PreparedStatement
			//占싸쏙옙占싹쏙옙占쏙옙 占쏙옙占쏙옙占싹울옙 占쏙옙占쏙옙占싹울옙 占쏙옙占쌔되듸옙占쏙옙 占쌜쇽옙 - 占쏙옙占쏙옙 SQL
			if(search.equals("")) {
				String sql="select count(*) from users where u_grade!='leave'";
				pstmt=con.prepareStatement(sql);
			} else {
				String sql="select count(*) from users where "+search+" like '%'||?||'%' and u_grade!='leave'";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, keyword);
			}
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				rows=rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("[占쏙옙占쏙옙]getTotalUser() 占쌨소듸옙占쏙옙 SQL 占쏙옙占쏙옙 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return rows;
	}
	
	//user_SEQ 占쏙옙체占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占싯삼옙占싹울옙 占쏙옙환占싹댐옙 占쌨소듸옙
	public int getUserNum() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int num=0;
		try {
			con=getConnection();
			
			String sql="select u_seq.nextval from dual";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				num=rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("[占쏙옙占쏙옙]getUserNum() 占쌨소듸옙占쏙옙 SQL 占쏙옙占쏙옙 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return num;
	}
}

package patient;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PatientDAO extends JDBCManager {
	
	private static PatientDAO _dao;
	
	private PatientDAO() {
		// TODO Auto-generated constructor stub
	}
	static {
		_dao=new PatientDAO();
	}
	public static PatientDAO getPatientDAO() {
		return _dao;
	}
	
	//INSERT
	public int insertPatient(PatientDTO p) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		
		try {
			con=getConnection();
			String sql="insert into patient values(?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, p.getNo());
			pstmt.setString(2, p.getName());
			pstmt.setString(3, p.getPhone());
			pstmt.setString(4, p.getRecord());
			pstmt.setString(5, p.getCdate());
			pstmt.setString(6, p.getDoctor());
			
			rows=pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//UPDATE
	public int updatePatient(PatientDTO p) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		
		try {
			con=getConnection();
			String sql="update patient set name=?,phone=?,record=?,cdate=?,doctor=? where no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, p.getName());
			pstmt.setString(2, p.getPhone());
			pstmt.setString(3, p.getRecord());
			pstmt.setString(4, p.getCdate());
			pstmt.setString(5, p.getDoctor());
			pstmt.setInt(6, p.getNo());
			
			rows=pstmt.executeUpdate();
		
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//DELETE
	public int deletePatient(int no) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		
		try {
			con=getConnection();
			String sql="delete from patient where no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rows=pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	
	
	//SELECT
	public List<PatientDTO> selectAllPatient() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<PatientDTO> patientList=new ArrayList<PatientDTO>();
		try {
			con=getConnection();
			String sql="select * from patient order by no";
			
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				PatientDTO patient=new PatientDTO();
				patient.setNo(rs.getInt("no"));
				patient.setName(rs.getString("name"));
				patient.setPhone(rs.getString("phone"));
				patient.setRecord(rs.getString("record"));
				patient.setCdate(rs.getString("cdate").substring(0, 10));
				patient.setDoctor(rs.getString("doctor"));
			
				patientList.add(patient);
			}
		} catch(SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			close(con, pstmt, rs);
		}

		return patientList;
		
	}

	
	//SELECT 1-1
	public PatientDTO selectNoPatient(int no){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		PatientDTO patient=new PatientDTO();
		try {
			con=getConnection();
			String sql="select * from patient where no=?";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				patient.setNo(rs.getInt("no"));
				patient.setName(rs.getString("name"));
				patient.setPhone(rs.getString("phone"));
				patient.setRecord(rs.getString("record"));
				patient.setCdate(rs.getString("cdate").substring(0, 10));
				patient.setDoctor(rs.getString("doctor"));
				
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(con, pstmt, rs);
		}
		return patient;
	}
	
	
	//SELECT 1-2
	public List<PatientDTO> selectOnePatient(String c, String v){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<PatientDTO> patientList=new ArrayList<PatientDTO>();
		try {
			con=getConnection();
			String sql="select * from patient where "+c+"=?";
						
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, v);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				PatientDTO patient=new PatientDTO();
				patient.setNo(rs.getInt("no"));
				patient.setName(rs.getString("name"));
				patient.setPhone(rs.getString("phone"));
				patient.setRecord(rs.getString("record"));
				patient.setCdate(rs.getString("cdate"));
				patient.setDoctor(rs.getString("doctor"));
				
				patientList.add(patient);
			}
					
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(con, pstmt, rs);
		}
		return patientList;
	}
	
	
	public PatientDTO selectNamePatient(String name){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		PatientDTO patient=new PatientDTO();
		try {
			con=getConnection();
			String sql="select * from patient where name=?";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, name);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				patient.setNo(rs.getInt("no"));
				patient.setName(rs.getString("name"));
				patient.setPhone(rs.getString("phone"));
				patient.setRecord(rs.getString("record"));
				patient.setCdate(rs.getString("cdate").substring(0, 10));
				patient.setDoctor(rs.getString("doctor"));
				
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(con, pstmt, rs);
		}
		return patient;
	}
	
	
	public PatientDTO selectPhonePatient(String phone){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		PatientDTO patient=new PatientDTO();
		try {
			con=getConnection();
			String sql="select * from patient where phone=?";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, phone);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				patient.setNo(rs.getInt("no"));
				patient.setName(rs.getString("name"));
				patient.setPhone(rs.getString("phone"));
				patient.setRecord(rs.getString("record"));
				patient.setCdate(rs.getString("cdate").substring(0, 10));
				patient.setDoctor(rs.getString("doctor"));
				
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(con, pstmt, rs);
		}
		return patient;
	}

	public int deleteNamePatient(String name) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		
		try {
			con=getConnection();
			String sql="delete from patient where name=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, name);
			
			rows=pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	public int deletePhonePatient(String phone) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		
		try {
			con=getConnection();
			String sql="delete from patient where phone=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, phone);
			
			rows=pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	
}
	



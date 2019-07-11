package patient;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import oracle.ucp.jdbc.PoolDataSource;
import oracle.ucp.jdbc.PoolDataSourceFactory;

public abstract class JDBCManager {
	
	private static PoolDataSource _pds;
	
	public JDBCManager() {
		_pds=PoolDataSourceFactory.getPoolDataSource();
		try {
			_pds.setConnectionFactoryClassName("oracle.jdbc.pool.OracleDataSource");
			_pds.setURL("jdbc:oracle:thin:@192.168.14.6:1521:xe");
			_pds.setUser("scott");
			_pds.setPassword("tiger");
			_pds.setInitialPoolSize(2);
			_pds.setMaxPoolSize(3);
		
		} catch(SQLException e) {
			System.out.println(e.getMessage());
		}
	}
	
	public Connection getConnection() {
		Connection con=null;
		try {
			con=_pds.getConnection();
		} catch(SQLException e) {
			System.out.println(e.getMessage());
		}
		return con;
	}
	
	public void close(Connection con) {
		try {
			if(con!=null) con.close();
		} catch(SQLException e) {
			System.out.println(e.getMessage());
		}
	}
	
	public void close(Connection con,PreparedStatement pstmt) {
		try {
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		} catch(SQLException e) {
			System.out.println(e.getMessage());
		}
	}
	
	public void close(Connection con,PreparedStatement pstmt,ResultSet rs) {
		try {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		} catch(SQLException e) {
			System.out.println(e.getMessage());
		}
	}
	
	
	
}

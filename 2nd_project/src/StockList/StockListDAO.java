package StockList;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbcDAO.JdbcDAO;



public class StockListDAO extends JdbcDAO{
	private static StockListDAO _dao;
	
	private StockListDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new StockListDAO();
	}
	
	public static StockListDAO getDAO() {
		return _dao;
	}
	
	
	public int addCart(String uname, String pname,int price,  int count, String addr) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="insert into stock_List values"
					+ "(s_num_seq.nextval,?,?,?,0,?,sysdate,?,'n','구매예정')";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, uname);
			pstmt.setString(2, pname);
			pstmt.setInt(3, price);
			pstmt.setInt(4, count);
			pstmt.setString(5, addr);

			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[占쎈퓠占쎌쑎]addCart() 筌롫뗄�꺖占쎈굡占쎌벥 SQL 占쎌궎�몴占� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	public int addBuy(String uname, String pname, int price, int credit,int count, String addr) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="insert into stock_List values"
					+ "(s_num_seq.nextval,?,?,?,?,?,sysdate,?,'y','배송중')";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, uname);
			pstmt.setString(2, pname);
			pstmt.setInt(3, price);
			pstmt.setInt(4, credit);
			pstmt.setInt(5, count);
			pstmt.setString(6, addr);

			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[占쎈퓠占쎌쑎]addBuy() 筌롫뗄�꺖占쎈굡占쎌벥 SQL 占쎌궎�몴占� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	
	public int BuyUpdate(int credit,int count, int num, String status) {
		Connection con=null;
		PreparedStatement pstmt=null;
		
		int rows= 0;
		try {
			con=getConnection();
			String sql="update Stock_List set s_credit=?, s_count=?,  s_pay = 'y', s_status = ? where s_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, credit);
			pstmt.setInt(2, count);
			pstmt.setString(3, status);
			pstmt.setInt(4, num);

			rows = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			System.out.println("[占쎈퓠占쎌쑎]BuyUpdate() 筌롫뗄�꺖占쎈굡占쎌벥 SQL 占쎌궎�몴占� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
		
	}
	
	
	public int delList(int num) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = 0;
		try {
			con = getConnection();
			
			String sql = "delete from Stock_List where s_num =?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			} catch (SQLException e) {
				System.out.println("[占쎈퓠占쎌쑎]delList() 筌롫뗄�꺖占쎈굡占쎌벥 SQL 占쎌궎�몴占� = "+e.getMessage());
			} finally {
				close(con, pstmt);
			}
		return 2 ; //占쎄텣占쎌젫占쎈쭡
			
		}
	
	public List<StockListDTO> getcartList(String name, String grade, int startRow,int endRow,String search,String keyword){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<StockListDTO> stockList=new ArrayList<StockListDTO>();
		try {
			con=getConnection();
			
				if(grade.equals("user")) {
					String sql="select * from (select rownum rn,temp.* from ("
						   	+ "select * from Stock_List where s_uname=? and s_pay ='n' order by s_date desc) temp"
							+ ") where rn between ? and ?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, name);
					pstmt.setInt(2, startRow);
					pstmt.setInt(3, endRow);	
				} 

			rs=pstmt.executeQuery();

			while(rs.next()) {
				StockListDTO article = new StockListDTO();
				article.setNum(rs.getInt("s_num"));
				article.setUname(rs.getString("s_uname"));
				article.setPname(rs.getString("s_pname"));
				article.setPrice(rs.getInt("s_price"));
				article.setCredit(rs.getInt("s_credit"));
				article.setCount(rs.getInt("s_count"));
				article.setDate(rs.getString("s_date"));
				article.setAddress(rs.getString("s_address"));
				article.setPay(rs.getString("s_pay"));
				article.setStatus(rs.getString("s_status"));
				stockList.add(article);
			} 
		} catch (SQLException e) {
			System.out.println("[�뜝�룞�삕�뜝�룞�삕]getStockList() �뜝�뙣�냼�벝�삕 SQL �뜝�룞�삕�뜝�룞�삕 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return stockList;
	}
	
	public List<StockListDTO>  checkList(String name, String grade, int startRow,int endRow,String search,String keyword) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<StockListDTO> articleList = null;
		articleList = new ArrayList<StockListDTO>();
		//System.out.println(grade+"" +id);
		try {
			con = getConnection();
			
			if(grade.equals("user")) {
				String sql="select * from (select rownum rn,temp.* from ("
					   	+ "select * from Stock_List where s_uname=? and s_pay ='y' order by s_date desc) temp"
						+ ") where rn between ? and ?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);	
			} 

		rs=pstmt.executeQuery();
			while(rs.next()) {
					StockListDTO article = new StockListDTO();
					article.setNum(rs.getInt("s_num"));
					article.setUname(rs.getString("s_uname"));
					article.setPname(rs.getString("s_pname"));
					article.setPrice(rs.getInt("s_price"));
					article.setCredit(rs.getInt("s_credit"));
					article.setCount(rs.getInt("s_count"));
					article.setDate(rs.getString("s_date"));
					article.setAddress(rs.getString("s_address"));
					article.setPay(rs.getString("s_pay"));
					article.setStatus(rs.getString("s_status"));
					articleList.add(article);
				} 
			//System.out.println(articleList.size());
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close(con, pstmt, rs);
		}
		return articleList;
	}
	
	public int getCartTotalStock(String name,String grade) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int rows=0;
		try {
			con=getConnection();
			
			if(grade.equals("user")) {
				String sql="select count(*) from Stock_List where s_uname=? and s_pay='n'";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, name);
				rs=pstmt.executeQuery();
			}
			if(rs.next()) {
				rows=rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("getCartTotalStock() = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return rows;
	}
	
	public int getChechkTotalStock(String name,String grade) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int rows=0;
		try {
			con=getConnection();
			
			if(grade.equals("user")) {
				String sql="select count(*) from Stock_List where s_uname=? and s_pay='y'";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, name);
				rs=pstmt.executeQuery();
			}
			if(rs.next()) {
				rows=rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("getChechkTotalStock() = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return rows;
	}


	
	public List<StockListDTO> getStockList(int startRow,int endRow,String search,String keyword){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<StockListDTO> stockList=new ArrayList<StockListDTO>();
		try {
			con=getConnection();
			
			if(search.equals("")) {
				String sql="select * from (select rownum rn,temp.* from ("
						+ "select * from Stock_List where s_pay='y' order by s_date desc) temp"
						+ ") where rn between ? and ?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);	
			} else {
				String sql="select * from (select rownum rn,temp.* from ("
						+ "select * from Stock_List where "+search+" like "
						+ "'%'||?||'%' and s_pay='y' order by s_date desc"
						+ ") temp) where rn between ? and ?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, keyword);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			}
			
			rs=pstmt.executeQuery();

			while(rs.next()) {
				StockListDTO article = new StockListDTO();
				article.setNum(rs.getInt("s_num"));
				article.setUname(rs.getString("s_uname"));
				article.setPname(rs.getString("s_pname"));
				article.setPrice(rs.getInt("s_price"));
				article.setCredit(rs.getInt("s_credit"));
				article.setCount(rs.getInt("s_count"));
				article.setDate(rs.getString("s_date"));
				article.setAddress(rs.getString("s_address"));
				article.setPay(rs.getString("s_pay"));
				article.setStatus(rs.getString("s_Status"));
				stockList.add(article);
			} 
		} catch (SQLException e) {
			System.out.println("[�뜝�룞�삕�뜝�룞�삕]getStockList() �뜝�뙣�냼�벝�삕 SQL �뜝�룞�삕�뜝�룞�삕 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return stockList;
	}
	
	public int getTotalStock(String search,String keyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int rows=0;
		try {
			con=getConnection();
			
			if(search.equals("")) {
				String sql="select count(*) from Stock_List where s_pay='y'";
				pstmt=con.prepareStatement(sql);
			} else {
				String sql="select count(*) from Stock_List where "+search+" like '%'||?||'%' and s_pay='y'";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, keyword);
			}
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				rows=rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("[�뜝�룞�삕�뜝�룞�삕]getTotalStock() �뜝�뙣�냼�벝�삕�뜝�룞�삕 SQL �뜝�룞�삕�뜝�룞�삕 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return rows;
	}
}

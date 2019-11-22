package join;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import utility.DBclose;
import utility.DBopen;

public class JoinDAO {
	
	public String getGrade(String id) {
		String grade = null;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append("    select grade       ");
		sql.append("    from join       ");
		sql.append("    where id=?       ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				grade = rs.getString("grade");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBclose.close(con, pstmt, rs);
		}
		
		return grade;
	}
	
	public boolean delete(String id) {
		boolean flag = false;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		
		sql.append("  delete from join         ");
		sql.append("  where id = ?         ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			int cnt = pstmt.executeUpdate();
			if(cnt>0) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBclose.close(con, pstmt);
		}
		
		
		return flag;
	}
	
	public String PWfind(Map map) {
		String passwd = null;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String jname = (String)map.get("jname");
		String id = (String)map.get("id");
		StringBuffer sql = new StringBuffer();
		sql.append("  select passwd from join         ");
		sql.append("  where id=? and jname=?         ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, jname);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
			passwd = rs.getString("passwd");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBclose.close(con, pstmt, rs);
		}
		
		
		
		return passwd;
	}
	
	public String IDfind(Map map) {
		String id = null;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String jname = (String)map.get("jname");
		String email = (String)map.get("email");
		StringBuffer sql = new StringBuffer();
		sql.append("  select id from join         ");
		sql.append("  where jname=? and email=?         ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, jname);
			pstmt.setString(2, email);
			rs=pstmt.executeQuery();
			if(rs.next()) {
			id=rs.getString("id");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBclose.close(con, pstmt, rs);
		}
		
		
		
		return id;
	}
	
	public boolean loginCheck(Map map) {
		boolean flag = false;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String id = (String)map.get("id");
		String pw = (String)map.get("pw");
		
		StringBuffer sql = new StringBuffer();
		sql.append("     select count(id) as cnt      ");
		sql.append("     from join      ");
		sql.append("     where id=? and passwd=?      ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			rs.next();
			int cnt = rs.getInt(1);
			if(cnt>0) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBclose.close(con, pstmt, rs);
		}
		
		
		
		return flag;
	}
	
	public boolean updatePw(Map map) {
		boolean flag = false;
		Connection con =DBopen.open();
		PreparedStatement pstmt = null;
		
		String pw = (String)map.get("pw");
		String id = (String)map.get("id");
		
		StringBuffer sql = new StringBuffer();
		sql.append("  update join       ");
		sql.append("   set passwd=?      ");
		sql.append("   where id=?               ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, pw);
			pstmt.setString(2, id);
			
			int cnt = pstmt.executeUpdate();
			if(cnt > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBclose.close(con, pstmt);
		}
		
		return flag;
	}
	
	public boolean update(JoinDTO dto) {
	boolean flag = false;
	Connection con = DBopen.open();
	PreparedStatement pstmt = null;
	StringBuffer sql = new StringBuffer();
	sql.append("    update join    ");
	sql.append("    set zipcode=?,     ");
	sql.append("    address1=?,     ");
	sql.append("    address2=?,     ");
	sql.append("    tel=?,    ");
	sql.append("    email=?          ");
	sql.append("    where id = ?    ");
		
	try {
		pstmt=con.prepareStatement(sql.toString());
		pstmt.setString(1, dto.getZipcode());
		pstmt.setString(2, dto.getAddress1());
		pstmt.setString(3, dto.getAddress2());
		pstmt.setString(4, dto.getTel());
		pstmt.setString(5, dto.getEmail());
		pstmt.setString(6, dto.getId());
		
		int cnt = pstmt.executeUpdate();
		if(cnt >0) {
			flag = true;
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		DBclose.close(con, pstmt);
	}
	
	return flag;
	}
	
	public boolean updateFile(Map map) {
		boolean flag = false;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		
		String id = (String)map.get("id");
		String fname = (String)map.get("fname");
		sql.append(" update join       ");
		sql.append(" set fname=?       ");
		sql.append("  where id=?      ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, fname);
			pstmt.setString(2, id);
			
			int cnt = pstmt.executeUpdate();
			if(cnt > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBclose.close(con, pstmt);
		}
		
		
		return flag;
	}
	
	public JoinDTO read(String id) {
		JoinDTO dto = null;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select id, jname, zipcode, address1, address2, tel, fname, email       ");
		sql.append(" from join        ");
		sql.append(" where id = ?        ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new JoinDTO();
				dto.setId(rs.getString("id"));
				dto.setJname(rs.getString("jname"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
				dto.setTel(rs.getString("tel"));
				dto.setFname(rs.getString("fname"));
				dto.setEmail(rs.getString("email"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBclose.close(con, pstmt, rs);
		}
		
		
		return dto;
	}
	
	public int total(Map map) {
		int total=0;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		 
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		
		StringBuffer sql = new StringBuffer();
		sql.append("     select count(*)        ");
		sql.append("     from join         ");
		if(word.trim().length() >0) {
		sql.append("     where "+col+" like '%'||?||'%'          ");
		}
		
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			if(word.trim().length() >0) {
				pstmt.setString(1, word);
			}
			rs = pstmt.executeQuery();
			if(rs.next()) {
				total = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBclose.close(con, pstmt, rs);
		}
		
		
		return total;
	}
	
	public List<JoinDTO> list(Map map) {
		List<JoinDTO> list = new ArrayList<JoinDTO>();
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String)map.get("col");
		String word= (String)map.get("word");
		int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");
		
		StringBuffer sql = new StringBuffer();
		sql.append("     select id, jname, zipcode, address1, address2, tel, fname, email, r       ");
		sql.append("     from(       ");
		sql.append("     select id, jname, zipcode, address1, address2, tel, fname, email, rownum r       ");
		sql.append("     from(       ");
		sql.append("     select id, jname, zipcode, address1, address2, tel, fname, email       ");
		sql.append("     from join       ");
		
		if(word.trim().length()>0) {
		sql.append("     where "+col+" like '%'||?||'%'       ");
		}
		
		sql.append("     order by id desc       ");
		sql.append("         )       ");
		sql.append("     )where r>=? and r<=?       ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			int i = 0;
			if(word.trim().length()>0) {
			pstmt.setString(++i, word);
		}
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				JoinDTO dto = new JoinDTO();
				dto.setId(rs.getString("id"));
				dto.setJname(rs.getString("jname"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
				dto.setTel(rs.getString("tel"));
				dto.setFname(rs.getString("fname"));
				dto.setEmail(rs.getString("email"));
				
				list.add(dto);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBclose.close(con, pstmt, rs);
		}
		
		
				
		return list;
	}
	
	public boolean duplicateEmail(String email) {
		boolean flag = false;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(email) from join          ");
		sql.append(" where email=?           ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			rs.next();
			int cnt = rs.getInt(1);
			if(cnt > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBclose.close(con, pstmt, rs);
		}
		
		
		return flag;
	}
	
	public boolean passid(String id) {
		boolean flag = false;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append("    select count(id) from join    ");
		sql.append("    where id=?     ");
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			rs.next();
			int cnt = rs.getInt(1);
			if(cnt >0) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBclose.close(con, pstmt, rs);
		}
		
		return flag;
	}
	
	public boolean create(JoinDTO dto) {
		boolean flag = false;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append("      insert into join(id, jname, zipcode, address1, address2, tel, fname, passwd, email)     ");
		sql.append("      values(?, ?, ?, ?, ?, ?, ?,?,?)      ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getJname());
			pstmt.setString(3, dto.getZipcode());
			pstmt.setString(4, dto.getAddress1());
			pstmt.setString(5, dto.getAddress2());
			pstmt.setString(6, dto.getTel());
			pstmt.setString(7, dto.getFname());
			pstmt.setString(8, dto.getPasswd());
			pstmt.setString(9, dto.getEmail());
			
			int cnt = pstmt.executeUpdate();
			if(cnt >0) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBclose.close(con, pstmt);
		}
		
		
		return flag;
	}

}

package oldlego;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import utility.DBclose;
import utility.DBopen;

public class OldLegoDAO {
	
	public boolean delete(String id) {
		boolean flag = false;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		
		sql.append("    delete from lego      ");
		sql.append("    where id = ?       ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
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
	
	public boolean update(OldLegoDTO dto) {
		boolean flag = false;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append("      update lego     ");
		sql.append("      set title=?,      ");
		sql.append("      content=?,        ");
		sql.append("      fname=?       ");
		sql.append("    where id = ?                ");  
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getFname());
			pstmt.setString(4, dto.getId());
			
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
	
	
	public boolean passwdCheck(Map map) {
		boolean flag = false;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String id = (String)map.get("id");
		String passwd = (String)map.get("passwd");
		
		StringBuffer sql = new StringBuffer();
		sql.append("    select count(*) from lego    ");
		sql.append("    where id=? AND passwd=?     ");
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
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
	
	public boolean passid(String id) {
		boolean flag = false;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append("    select count(*) from lego     ");
		sql.append("        where id =?      ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
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
	
	public OldLegoDTO read(String id) {
		OldLegoDTO dto = null;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append("     select id, passwd, title, content, mdate, fname      ");
		sql.append("        from lego      ");
		sql.append("        where id =?       ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new OldLegoDTO();
				dto.setId(rs.getString("id"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setMdate(rs.getString("mdate"));
				dto.setFname(rs.getString("fname"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBclose.close(con, pstmt, rs);
		}
		
		
		return dto;
	}
	
	public boolean create(OldLegoDTO dto) {
		boolean flag = false;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append("       insert into lego(id, passwd, title, content, mdate, fname)       ");
		sql.append("       values(?, ?, ?, ?, sysdate, ?)        ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getTitle());
			pstmt.setString(4, dto.getContent());
			pstmt.setString(5, dto.getFname());
			
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
	
	
	public int total() {
		int total = 0;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append("  select count(*) from lego           ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			rs=pstmt.executeQuery();
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
	
	public List<OldLegoDTO> list(){
		List<OldLegoDTO> list = new ArrayList<OldLegoDTO>();
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		/*int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");*/
		
		
		StringBuffer sql = new StringBuffer();
		
		sql.append("           select id, passwd, title, content, mdate, fname, r             ");
		sql.append("          from(             ");
		sql.append("           select id, passwd, title, content, mdate, fname, rownum r             ");
		sql.append("           from(             ");
		sql.append("              select id, passwd, title, content, mdate, fname             ");
		sql.append("              from lego             ");
		sql.append("              order by mdate desc             ");
		sql.append("              )             ");
		sql.append("          )             ");
		/*sql.append("  where r>=? and r<=?                        ");*/
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			/*pstmt.setInt(1, sno);
			pstmt.setInt(2, eno);*/
			
			
			rs= pstmt.executeQuery();
			while(rs.next()) {
				OldLegoDTO dto = new OldLegoDTO();
				dto.setId(rs.getString("id"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setMdate(rs.getString("mdate"));
				dto.setFname(rs.getString("fname"));
				
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

}

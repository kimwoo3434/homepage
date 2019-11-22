package bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import utility.DBclose;
import utility.DBopen;

public class BbsDAO {
	
	public boolean reply_create(BbsDTO dto) {
		boolean flag = false;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into bbs(bbsno, wname, title, content, passwd, wdate, grpno, indent, ansnum) " );
		sql.append(" values( (select NVL(MAX(bbsno), 0)+1 from bbs),");
		sql.append(" ?,?,?,?,sysdate, ");		
		sql.append(" ?,?,? ) ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setInt(5, dto.getGrpno());
			pstmt.setInt(6, dto.getIndent()+1);
			pstmt.setInt(7, dto.getAnsnum()+1);
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt >0)flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBclose.close(con, pstmt);
		}
		
		return flag;
	}
	
	public void reply_ansnum(Map map) {
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		
		int grpno = (Integer)map.get("grpno");
		int ansnum = (Integer)map.get("ansnum");
		
		StringBuffer sql = new StringBuffer();
		
		sql.append("  update bbs         ");
		sql.append("  set ansnum = ansnum +1         ");
		sql.append("  where     ");
		sql.append("  grpno = ? AND ansnum > ?      ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, grpno);
			pstmt.setInt(2, ansnum);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBclose.close(con, pstmt);
		}
		
		
	}
	
	public BbsDTO reply_read(int bbsno) {
		BbsDTO dto = null;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select bbsno, grpno, indent, ansnum, title    ");
		sql.append(" from bbs      ");
		sql.append(" where bbsno = ?     ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new BbsDTO();
				dto.setBbsno(rs.getInt("bbsno"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
				dto.setTitle(rs.getString("title"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBclose.close(con, pstmt, rs);
		}
		
		
		return dto;
	}
	
	
	public boolean delete(int bbsno) {
		boolean flag = false;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		
		sql.append(" delete from bbs ");
		sql.append(" where bbsno = ? " );
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			int cnt = pstmt.executeUpdate();
			
			if(cnt > 0)flag = true;
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return flag;
	}
	
	public boolean update(BbsDTO dto) {
		boolean flag = false;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append("  update bbs set wname=? , title=?, content=?      ");
		sql.append("   where bbsno = ?      ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getBbsno());
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt > 0) flag = true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBclose.close(con, pstmt);
		}
		
		
		return flag;
	}
	
	
	public boolean passCheck(Map map) {
		boolean flag = false;
		
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int bbsno = (Integer)map.get("bbsno");
		String passwd = (String)map.get("passwd");
		
		StringBuffer sql = new StringBuffer();
		sql.append("     select count(bbsno) as cnt    ");
		sql.append("     from bbs     ");
		sql.append("     where bbsno = ? AND passwd=?    ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			pstmt.setString(2, passwd);
			rs = pstmt.executeQuery();
			
			rs.next();
			
			int cnt =rs.getInt("cnt");
			if(cnt > 0) {
				flag=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBclose.close(con, pstmt, rs);
		}
		
		
		
		
		return flag;
	}
	
	
	public BbsDTO read(int bbsno) {
		BbsDTO dto = null;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append("     select bbsno, wname, title, content, viewcnt, wdate      ");
		sql.append("     from bbs       ");
		sql.append("    where bbsno = ?          ");                
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				 dto = new BbsDTO();
				dto.setBbsno(rs.getInt("bbsno"));
				dto.setWname(rs.getString("wname"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setWdate(rs.getString("wdate"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return dto;
	}
	
	public boolean upViewcnt(int bbsno) {
		boolean flag = false;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" update bbs set viewcnt = viewcnt + 1    ");
		sql.append(" where bbsno = ? " );
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			int cnt =pstmt.executeUpdate();
			if(cnt > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return flag;
		
	}
	
	public boolean create(BbsDTO dto) {
		boolean flag = false;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into bbs(bbsno, wname, title, content, passwd, wdate, grpno) " );
		sql.append(" values( (select NVL(MAX(bbsno), 0)+1 from bbs),");
		sql.append(" ?,?,?,?,sysdate, ");		
		sql.append(" (select NVL(MAX(grpno), 0)+1 from bbs) ) ");		
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			
			int cnt= pstmt.executeUpdate();
			
			if(cnt >0) {
				return flag=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBclose.close(con, pstmt);
		}
		
				
		return flag;
	}

	public List<BbsDTO> list(){
		List<BbsDTO> list = new ArrayList<BbsDTO>();
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select bbsno, wname, title, viewcnt, wdate,     ");
		sql.append(" grpno, indent, ansnum      ");
		sql.append(" from bbs       ");
		sql.append(" order by grpno desc, ansnum ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BbsDTO dto = new BbsDTO();
				dto.setBbsno(rs.getInt("bbsno"));
				dto.setWname(rs.getString("wname"));
				dto.setTitle(rs.getString("title"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setWdate(rs.getString("wdate"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
				
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

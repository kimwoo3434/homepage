package memo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import utility.DBclose;
import utility.DBopen;

public class MemoDAO {
	
	public boolean delete(int memono) {
		boolean flag = false;

		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" delete from memo ");
		sql.append(" where memono = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, memono);
			int cnt = pstmt.executeUpdate();
			
			if(cnt > 0)flag=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return flag;
	}
	
	
	public boolean create(MemoDTO dto) {
		boolean flag = false;
		
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		
		sql.append(" insert into memo(memono, title, content, wdate) ");
		sql.append(" values(memo_seq.nextval,?,?,sysdate) ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt > 0)flag=true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBclose.close(con, pstmt);
		}
		return flag;
	
	}
	
	public boolean update(MemoDTO dto) {
		boolean flag = false;
		
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" update memo      ");
		sql.append(" set       ");
		sql.append(" title =?,        ");
		sql.append("  content = ?       ");
		sql.append(" where memono = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(3, dto.getMemono());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(1, dto.getTitle());
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt > 0)flag=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	public void upViewcnt(int memono) {
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" update memo ");
		sql.append(" set viewcnt = viewcnt +1      ");
		sql.append(" where memono = ?  ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, memono);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBclose.close(con, pstmt);
		}
		
		
	}
	
	public MemoDTO read(int memono) {
		MemoDTO dto = null;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select * from memo   ");
		sql.append(" where memono = ?   ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, memono);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new MemoDTO();
				dto.setMemono(rs.getInt("memono"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setWdate(rs.getString("wdate"));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBclose.close(con, pstmt, rs);
		}
		
		
		
		
		return dto;
	}
	
	public List<MemoDTO> list(){
		List<MemoDTO> list = new ArrayList<MemoDTO>();
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select memono, to_char(wdate,'yyyy-mm-dd')wdate, ");
		sql.append(" viewcnt, title  ");
		sql.append(" from memo ");
		sql.append(" order by memono desc  ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemoDTO dto = new MemoDTO();
				dto.setMemono(rs.getInt("memono"));
				dto.setWdate(rs.getString("wdate"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setTitle(rs.getString("title"));
				
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

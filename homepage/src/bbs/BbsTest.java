package bbs;

import java.util.*;

public class BbsTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		BbsDAO dao  = new BbsDAO();
		/*list(dao);*/
		/*create(dao);*/
		/*upViewcnt(dao);*/
		/*read(dao);*/
		/*passCheck(dao);*/
		/*update(dao);*/
		delete(dao);
		
	} 

	private static void delete(BbsDAO dao) {
		// TODO Auto-generated method stub
		int bbsno = 3;
		if(dao.delete(bbsno)) {
			p("삭제성공");
		}else {
			p("삭제실패");
		}
		
	}

	private static void update(BbsDAO dao) {
		// TODO Auto-generated method stub
		BbsDTO dto = dao.read(3);
		dto.setWname("강아지");
		dto.setTitle("고양이");
		dto.setContent("동물이다.");
		if(dao.update(dto)) {
			p("업데이트 성공");
		}else {
			p("업데이트 실패");
		}
		
	}

	private static void passCheck(BbsDAO dao) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("bbsno", 5);
		map.put("passwd", "123");
		if(dao.passCheck(map)) {
			p("올바른 비번");
		}else {
			p("잘못된 비번");
		}
		
	}

	private static void read(BbsDAO dao) {
		// TODO Auto-generated method stub
		int bbsno = 5;
		BbsDTO dto = dao.read(bbsno);
		p(dto);
		
	}

	private static void upViewcnt(BbsDAO dao) {
		// TODO Auto-generated method stub
		int bbsno = 5;
		if(dao.upViewcnt(bbsno)) {
			p("조회수증가 성공");
		}else {
			p("조회수증가 실패");
		}
		
	}

	private static void create(BbsDAO dao) {
		// TODO Auto-generated method stub
		BbsDTO dto = new BbsDTO();
		dto.setWname("박길동");
		dto.setTitle("제목");
		dto.setContent("내용");
		dto.setPasswd("1234");
		if(dao.create(dto)) {
			p("성공");
		}else {
			p("실패");
		}
	}

	private static void list(BbsDAO dao) {
		// TODO Auto-generated method stub
		
		List<BbsDTO> list = dao.list();
		
		Iterator iter = list.iterator();
		while(iter.hasNext()) {
			BbsDTO dto = new BbsDTO();
			 dto = (BbsDTO) iter.next();
			 p(dto);
			 p("----------------------");
			
		}
		
		
	}

	private static void p(BbsDTO dto) {
		// TODO Auto-generated method stub
		
	p("번호: "+dto.getBbsno());
	p("글쓴이: "+dto.getWname());	
	p("제목: "+dto.getTitle());
	p("날짜: "+dto.getWdate());
	p("조회수: "+dto.getViewcnt());
	
		
	}
	private static void p(String string) {
		// TODO Auto-generated method stub
		System.out.println(string);
		
	}

}

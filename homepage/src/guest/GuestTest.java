package guest;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class GuestTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		GuestDAO dao = new GuestDAO();
		/*total(dao);*/
		/*list(dao);*/
		/*create(dao);*/
		/*read(dao);*/
		/*upviewcnt(dao);*/
		/*passcheck(dao);*/
		/*update(dao);*/
		/*delete(dao);*/
	}

	
	private static void total(GuestDAO dao) {
		Map map = new HashMap();
		map.put("col", "title");
		map.put("word", "");
		p("레코드전체갯수:" +dao.total(map));
		
	}


	private static void delete(GuestDAO dao) {
		// TODO Auto-generated method stub
		int guestno = 4;
		if(dao.delete(guestno)) {
			p("삭제성공");
		}else {
			p("삭제실패");
		}
		
	}


	private static void update(GuestDAO dao) {
		// TODO Auto-generated method stub
		GuestDTO dto = new GuestDTO();
		dto.setGuestno(1);
		dto.setWname("강아지");
		dto.setTitle("동물");
		dto.setContent("멍멍귀엽다");
		dto.setPasswd("2222");
		
		if(dao.update(dto)) {
			p("업데이트성공");
		}else {
			p("업데이트실패");
		}
		
	}


	private static void passcheck(GuestDAO dao) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("guestno", 1);
		map.put("passwd", "1234");
		
		if(dao.passCheck(map)) {
			p("올바른비번입니다.");
		}else {
			p("잘못된 비번입니다.");
		}
		
	}


	private static void upviewcnt(GuestDAO dao) {
		// TODO Auto-generated method stub
		int guestno = 1;
		if(dao.upViewcnt(guestno)) {
			p("조회수증가성공");
		}else {
			p("조회수증가실패");
		}
		
	}


	private static void read(GuestDAO dao) {
		// TODO Auto-generated method stub
		GuestDTO dto = new GuestDTO();
		int guestno = 1;
		dto = dao.read(guestno);
		
		p(dto);
	}

	private static void create(GuestDAO dao) {
		// TODO Auto-generated method stub
		GuestDTO dto = new GuestDTO();
		dto.setWname("고양이");
		dto.setTitle("동물");
		dto.setContent("귀엽습니다.");
		dto.setPasswd("1234");
		
		if(dao.create(dto)) {
			p("등록성공입니다.");
		}else {
			p("등록실패입니다.");
		}
		
	}

	private static void list(GuestDAO dao) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("col", "title");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 5);
		
		List<GuestDTO> list = dao.list(map);
		Iterator<GuestDTO> iter = list.iterator();
		
		while(iter.hasNext()) {
			GuestDTO dto = new GuestDTO();
			dto = iter.next();
			p(dto);
			p("--------------------");
		}
		
		
	}

	private static void p(String string) {
		// TODO Auto-generated method stub
		System.out.println(string);
	}

	private static void p(GuestDTO dto) {
		// TODO Auto-generated method stub
		p("번호: "+dto.getGuestno());
		p("이름: "+dto.getWname());
		p("제목: "+dto.getTitle());
		p("내용: "+dto.getContent());
		p("날짜: "+dto.getWdate());
		p("조회수: "+dto.getViewcnt());
	}

}

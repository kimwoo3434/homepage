package notice;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class NoticeTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		NoticeDAO dao = new NoticeDAO();
		list(dao);
		  /*create(dao);*/
			/*read(dao);*/
		/*passCheck(dao);*/
		/*update(dao);*/
		/*delete(dao);*/
		/*total(dao);*/
	}

	private static void total(NoticeDAO dao) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("col", "content");
		map.put("word", "");
		
		int total=dao.total(map);
		p("갯수:"+total);
		
	}

	private static void delete(NoticeDAO dao) {
		// TODO Auto-generated method stub
		if(dao.delete(2)) {
			p("삭제성공");
		}else {
			p("삭제실패");
		}
	}

	private static void update(NoticeDAO dao) {
		// TODO Auto-generated method stub
		NoticeDTO dto = new NoticeDTO();
		dto.setNo(8);
		dto.setTitle("고양이");
		dto.setContent("동물입니다.");
		if(dao.update(dto)) {
			p("수정성공");
		}else {
			p("수정실패");
		}
	}

	private static void passCheck(NoticeDAO dao) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("no", 8);
		map.put("passwd", "1234");
		
		if(dao.passCheck(map)) {
			p("올바른비번");
		}else {
			p("틀린비번");
		}
	}

	private static void read(NoticeDAO dao) {
		// TODO Auto-generated method stub
		NoticeDTO dto = new NoticeDTO();
		dto = dao.read(8);
		p(dto);
	}

	private static void create(NoticeDAO dao) {
		// TODO Auto-generated method stub
		NoticeDTO dto = new NoticeDTO();
		dto.setTitle("개구리");
		dto.setContent("양서류입니다.");
		dto.setPasswd("1234");
		
		if(dao.create(dto)){
			p("성공");
		}else {
			p("실패");
		}
		
		
	}

	

	private static void list(NoticeDAO dao) {
		// TODO Auto-generated method stub
		NoticeDTO dto = new NoticeDTO();
		Map map = new HashMap();
		map.put("col", "id");
		map.put("word", "admin");
		map.put("sno", 1);
		map.put("eno", 5);
		
		List<NoticeDTO> list = dao.list(map);
		Iterator<NoticeDTO> iter = list.iterator();
		
		while(iter.hasNext()) {
			dto = iter.next();
			p(dto);
		}
		
	}

	private static void p(NoticeDTO dto) {
		// TODO Auto-generated method stub
		System.out.println("번호: "+dto.getNo());
		System.out.println("아이디: "+dto.getId());
		System.out.println("제목: "+dto.getTitle());
		System.out.println("날짜: "+dto.getWdate());
		
	}
	
	private static void p(String str) {
		// TODO Auto-generated method stub
		System.out.println(str);
	}

}

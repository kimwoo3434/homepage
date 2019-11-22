package memo;

import java.util.Iterator;
import java.util.List;

public class MemoTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MemoDAO dao = new MemoDAO();
		/*list(dao);*/
		/*read(dao);*/
		/*update(dao);*/
		/*create(dao);*/
		delete(dao);
	}

	private static void delete(MemoDAO dao) {
		// TODO Auto-generated method stub
		int memono = 117;
		if(dao.delete(memono)) {
			p("성공");
		}else {
			p("실패");
		}
		
		
	}

	private static void create(MemoDAO dao) {
		// TODO Auto-generated method stub
		MemoDTO dto = new MemoDTO();
		dto.setTitle("동물");
		dto.setContent("고양이");
		if(dao.create(dto)) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void update(MemoDAO dao) {
		// TODO Auto-generated method stub
		MemoDTO dto = dao.read(112);
		dto.setTitle("메모수정");
		dto.setContent("토익시험 아주 잘봄");
		
		if(dao.update(dto)) {
			p("성공");
		}else {
			p("실패");
		}
		
		
	}

	private static void read(MemoDAO dao) {
		// TODO Auto-generated method stub
		int memono = 1;
		
		MemoDTO dto = dao.read(memono);
		
		p(dto);
	}

	private static void list(MemoDAO dao) {
		// TODO Auto-generated method stub
		List<MemoDTO> list = dao.list();
		
		Iterator<MemoDTO> iter = list.iterator();
		
		while(iter.hasNext()) {
			MemoDTO dto = iter.next();
			
			p(dto);
			p("--------------------");
		}
		
	}

	private static void p(String string) {
		// TODO Auto-generated method stub
		System.out.println(string);
	}

	private static void p(MemoDTO dto) {
		// TODO Auto-generated method stub
		
		p("번호: "+dto.getMemono());
		p("제목: "+dto.getTitle());
		p("내용: "+dto.getContent());
		p("날짜: "+dto.getWdate());
		p("조회수: "+dto.getViewcnt());
	}

}

package oldlego;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class OldLegoTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		OldLegoDAO dao = new OldLegoDAO();
		/*list(dao);*/

	}

	/*private static void list(OldLegoDAO dao) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("sno", 1);
		map.put("eno", 3);
		
		List<OldLegoDTO> list = dao.list(map);
		
		for(int i=0; i<list.size(); i++) {
			OldLegoDTO dto = list.get(i);
			p(dto);
			p("--------------------------");
		}
		
		
	}*/

	private static void p(String string) {
		// TODO Auto-generated method stub
		System.out.println(string);
	}

	private static void p(OldLegoDTO dto) {
		// TODO Auto-generated method stub
		System.out.println("ID: "+dto.getId());
		System.out.println("passwd: "+dto.getPasswd());
		System.out.println("제목: "+dto.getTitle());
		System.out.println("내용: "+dto.getContent());
		System.out.println("등록일: "+dto.getMdate());
		System.out.println("사진: "+dto.getFname());
		
	}

}

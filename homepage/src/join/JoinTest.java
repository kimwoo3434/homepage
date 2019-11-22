package join;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class JoinTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		JoinDAO dao = new JoinDAO();
		/*create(dao);*/
		/*passid(dao);*/
		/*list(dao);*/
		/*total(dao);*/
		read(dao);
 
	}

	private static void read(JoinDAO dao) {
		// TODO Auto-generated method stub
		JoinDTO dto = dao.read("dd");
		p(dto);
		
	}

	private static void total(JoinDAO dao) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("col", "id");
		map.put("word", "d");
		int total = dao.total(map);
		p("전체레코드갯수: "+total);
		
	}

	private static void list(JoinDAO dao) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("col", "id");
		map.put("word", "u");
		map.put("sno", 1);
		map.put("eno", 3);
		
		List<JoinDTO> list = dao.list(map);
		
		for(int i=0; i<list.size(); i++) {
		JoinDTO dto = list.get(i);
		p(dto);
		}
		    
		
		
	}

	private static void p(JoinDTO dto) {
		// TODO Auto-generated method stub
		System.out.println("이름: "+dto.getJname());
		System.out.println("아이디: "+dto.getId());
		System.out.println("우편번호: "+dto.getZipcode());
		System.out.println("주소: "+dto.getAddress1() );
		System.out.println("상세주소: "+dto.getAddress2());
		System.out.println("전화번호: "+dto.getTel());
		System.out.println("사진: "+dto.getFname());
		
	}

	private static void passid(JoinDAO dao) {
		// TODO Auto-generated method stub
		String id = "aaa1";
		if(dao.passid(id)) {
			p("아이디중복");
		}else {
			p("아이디사용가능");
		}
		
	}

	private static void create(JoinDAO dao) {
		// TODO Auto-generated method stub
		JoinDTO dto = new JoinDTO();
		dto.setId("aaa");
		dto.setJname("왕눈이");
		dto.setTel("1111");
		dto.setZipcode("12345");
		dto.setFname("개바라기.jpg");
		dto.setAddress1("서울 종로구");
		dto.setAddress2("삼일빌딩");
		if(dao.create(dto)) {
			p("가입성공");
		}else {
			p("가입실패");
		}
			
		
	}

	private static void p(String string) {
		// TODO Auto-generated method stub
		System.out.println(string);
	}

}

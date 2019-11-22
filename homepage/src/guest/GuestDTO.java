package guest;

public class GuestDTO {
	

	
			private int guestno ;
			private String wname ;
			private String title ;
			private String content; 
			private String passwd;
			private String wdate ;
			private int viewcnt ;
			private int grpno   ;
			private int  indent ;
			private int  ansnum  ;
			
			public GuestDTO() {
				super();
				// TODO Auto-generated constructor stub
			}
			
			public GuestDTO(int guestno, String wname, String title, String content, String passwd, String wdate,
					int viewcnt, int grpno, int indent, int ansnum) {
				super();
				this.guestno = guestno;
				this.wname = wname;
				this.title = title;
				this.content = content;
				this.passwd = passwd;
				this.wdate = wdate;
				this.viewcnt = viewcnt;
				this.grpno = grpno;
				this.indent = indent;
				this.ansnum = ansnum;
			}

			@Override
			public String toString() {
				return "GuestDTO [guestno=" + guestno + ", wname=" + wname + ", title=" + title + ", content=" + content
						+ ", passwd=" + passwd + ", wdate=" + wdate + ", viewcnt=" + viewcnt + ", grpno=" + grpno
						+ ", indent=" + indent + ", ansnum=" + ansnum + "]";
			}

			public int getGuestno() {
				return guestno;
			}

			public void setGuestno(int guestno) {
				this.guestno = guestno;
			}

			public String getWname() {
				return wname;
			}

			public void setWname(String wname) {
				this.wname = wname;
			}

			public String getTitle() {
				return title;
			}

			public void setTitle(String title) {
				this.title = title;
			}

			public String getContent() {
				return content;
			}

			public void setContent(String content) {
				this.content = content;
			}

			public String getPasswd() {
				return passwd;
			}

			public void setPasswd(String passwd) {
				this.passwd = passwd;
			}

			public String getWdate() {
				return wdate;
			}

			public void setWdate(String wdate) {
				this.wdate = wdate;
			}

			public int getViewcnt() {
				return viewcnt;
			}

			public void setViewcnt(int viewcnt) {
				this.viewcnt = viewcnt;
			}

			public int getGrpno() {
				return grpno;
			}

			public void setGrpno(int grpno) {
				this.grpno = grpno;
			}

			public int getIndent() {
				return indent;
			}

			public void setIndent(int indent) {
				this.indent = indent;
			}

			public int getAnsnum() {
				return ansnum;
			}

			public void setAnsnum(int ansnum) {
				this.ansnum = ansnum;
			} 
			
			
			
			
			
}

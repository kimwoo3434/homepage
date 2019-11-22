package oldlego;

public class OldLegoDTO {
	
	
			private String id 	   ;	
			private String passwd 	;
			private String title 	;
			private String content 	;
			private String mdate     ;  
			private String fname      ;
			
			public OldLegoDTO() {
				super();
				// TODO Auto-generated constructor stub
			}

			public OldLegoDTO(String id, String passwd, String title, String content, String mdate, String fname) {
				super();
				this.id = id;
				this.passwd = passwd;
				this.title = title;
				this.content = content;
				this.mdate = mdate;
				this.fname = fname;
			}

			@Override
			public String toString() {
				return "OldLegoDTO [id=" + id + ", passwd=" + passwd + ", title=" + title + ", content=" + content
						+ ", mdate=" + mdate + ", fname=" + fname + "]";
			}

			
			
			
			public String getId() {
				return id;
			}

			public void setId(String id) {
				this.id = id;
			}

			public String getPasswd() {
				return passwd;
			}

			public void setPasswd(String passwd) {
				this.passwd = passwd;
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

			public String getMdate() {
				return mdate;
			}

			public void setMdate(String mdate) {
				this.mdate = mdate;
			}

			public String getFname() {
				return fname;
			}

			public void setFname(String fname) {
				this.fname = fname;
			} 
			
			
			
									


			
	
	

}

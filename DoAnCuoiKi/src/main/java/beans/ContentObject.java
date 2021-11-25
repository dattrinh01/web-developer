package beans;

public class ContentObject {
	private String title;
	private String brief;
	private String content;
	private Integer id;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBrief() {
		return brief;
	}
	public void setBrief(String brief) {
		this.brief = brief;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public ContentObject(String title, String brief, String content, Integer id) {
		this.title = title;
		this.brief = brief;
		this.content = content;
		this.id = id;
	}
	public ContentObject() {
	}
	public ContentObject(String title, String brief, String content) {
		this.title = title;
		this.brief = brief;
		this.content = content;
	}
}

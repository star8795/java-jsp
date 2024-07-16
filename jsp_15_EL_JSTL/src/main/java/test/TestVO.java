package test;

public class TestVO {
	
	private String id;
	private String pass;
	private int age;
	
	// alt + s, r        alt + s , s + s
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	@Override
	public String toString() {
		return "TestVO [id=" + id + ", pass=" + pass + ", age=" + age + "]";
	}
	
}

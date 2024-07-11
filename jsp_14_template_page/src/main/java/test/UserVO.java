package test;

public class UserVO {
	
	private String name;
	private String addr;
	private int age;
	
	// 생성자, getter , setter , toString()
	public UserVO() {
		super();
	}

	public UserVO(String name, String addr, int age) {
		super();
		this.name = name;
		this.addr = addr;
		this.age = age;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	@Override
	public String toString() {
		return "UserVO [name=" + name + ", addr=" + addr + ", age=" + age + "]";
	}

}

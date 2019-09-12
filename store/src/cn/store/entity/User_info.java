package cn.store.entity;


/**   
 *ClassName: User_info <br>
 *Description: 用户实体类 <br>  
 *@author Administrator
 *@date 2019年3月30日 下午8:50:42   
 */  
public class User_info {
    private String uid;//用户id
    private String uname;//用户名
    private String name;//用户昵称
    private String password;//用户密码
    private String gender;//性别
    private String  birthday;//生日
    private String email;//用户
    private String phone;//电话
    private String code;//验证码
    private String satate;//激活状态
	/**   
	*   
	*/  
	public User_info() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**   
	* @param uid
	* @param uname
	* @param name
	* @param password
	* @param gender
	* @param birthday
	* @param email
	* @param phone
	* @param code
	* @param satate  
	*/  
	public User_info(String uid, String uname, String name, String password, String gender, String birthday,
			String email, String phone, String code, String satate) {
		super();
		this.uid = uid;
		this.uname = uname;
		this.name = name;
		this.password = password;
		this.gender = gender;
		this.birthday = birthday;
		this.email = email;
		this.phone = phone;
		this.code = code;
		this.satate = satate;
	}
	/**
	 * @return the uid  
	 */
	public String getUid() {
		return uid;
	}
	/**
	 * @param uid the uid to set  
	 */
	public void setUid(String uid) {
		this.uid = uid;
	}
	/**
	 * @return the uname  
	 */
	public String getUname() {
		return uname;
	}
	/**
	 * @param uname the uname to set  
	 */
	public void setUname(String uname) {
		this.uname = uname;
	}
	/**
	 * @return the name  
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set  
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the password  
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * @param password the password to set  
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	/**
	 * @return the gender  
	 */
	public String getGender() {
		return gender;
	}
	/**
	 * @param gender the gender to set  
	 */
	public void setGender(String gender) {
		this.gender = gender;
	}
	/**
	 * @return the birthday  
	 */
	public String getBirthday() {
		return birthday;
	}
	/**
	 * @param birthday the birthday to set  
	 */
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	/**
	 * @return the email  
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email the email to set  
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * @return the phone  
	 */
	public String getPhone() {
		return phone;
	}
	/**
	 * @param phone the phone to set  
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}
	/**
	 * @return the code  
	 */
	public String getCode() {
		return code;
	}
	/**
	 * @param code the code to set  
	 */
	public void setCode(String code) {
		this.code = code;
	}
	/**
	 * @return the satate  
	 */
	public String getSatate() {
		return satate;
	}
	/**
	 * @param satate the satate to set  
	 */
	public void setSatate(String satate) {
		this.satate = satate;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "User_info [uid=" + uid + ", uname=" + uname + ", name=" + name + ", password=" + password + ", gender="
				+ gender + ", birthday=" + birthday + ", email=" + email + ", phone=" + phone + ", code=" + code
				+ ", satate=" + satate + "]";
	}
	
}

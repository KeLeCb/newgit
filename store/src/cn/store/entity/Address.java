package cn.store.entity;

/**   
 *ClassName: Address <br>
 *Description:收货人的信息 <br>  
 *@author Administrator
 *@date 2019年3月20日 下午2:56:05   
 */  
public class Address {
	private String aid;//信息的id
	private String name;//收货人的姓名
	private String address;//收货地址
	private String phone;//收货人电话
	private String uid;//用户id
	
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public Address(String aid, String name, String address, String phone, String uid) {
		super();
		this.aid = aid;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.uid = uid;
	}
	public Address() {
		super();
		// TODO Auto-generated constructor stub
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Address [aid=" + aid + ", name=" + name + ", address=" + address + ", phone=" + phone + ", uid=" + uid
				+ "]";
	}
	
	
}

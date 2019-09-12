package cn.store.entity;

/**   
 *ClassName: Shoppingcart <br>
 *Description: 购物车实体类  <br>  
 *@author Administrator
 *@date 2019年3月20日 下午3:11:38   
 */  
public class Shoppingcart {
	private String  sid;//购物车id
	private String uid;//用户id
	
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public Shoppingcart(String sid, String uid) {
		super();
		this.sid = sid;
		this.uid = uid;
	}
	public Shoppingcart() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}

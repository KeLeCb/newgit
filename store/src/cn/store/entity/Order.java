package cn.store.entity;

/**   
 *ClassName: Order <br>
 *Description: 订单实体类 <br>  
 *@author Administrator
 *@date 2019年3月20日 下午3:00:45   
 */  
public class Order {
	private String oid;//订单id
	private double money;//订单金额
	private String satate;//订单状态
	private String aid;//订单收货信息
	private String time;//下单时间
	private String uid;//用户的id
	/**   
	*   
	*/  
	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**   
	* @param oid
	* @param money
	* @param satate
	* @param aid
	* @param time
	* @param uid  
	*/  
	public Order(String oid, double money, String satate, String aid, String time, String uid) {
		super();
		this.oid = oid;
		this.money = money;
		this.satate = satate;
		this.aid = aid;
		this.time = time;
		this.uid = uid;
	}
	/**
	 * @return the oid  
	 */
	public String getOid() {
		return oid;
	}
	/**
	 * @param oid the oid to set  
	 */
	public void setOid(String oid) {
		this.oid = oid;
	}
	/**
	 * @return the money  
	 */
	public double getMoney() {
		return money;
	}
	/**
	 * @param money the money to set  
	 */
	public void setMoney(double money) {
		this.money = money;
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
	/**
	 * @return the aid  
	 */
	public String getAid() {
		return aid;
	}
	/**
	 * @param aid the aid to set  
	 */
	public void setAid(String aid) {
		this.aid = aid;
	}
	/**
	 * @return the time  
	 */
	public String getTime() {
		return time;
	}
	/**
	 * @param time the time to set  
	 */
	public void setTime(String time) {
		this.time = time;
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
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Order [oid=" + oid + ", money=" + money + ", satate=" + satate + ", aid=" + aid + ", time=" + time
				+ ", uid=" + uid + "]";
	}
}

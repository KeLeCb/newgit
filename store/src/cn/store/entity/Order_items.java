package cn.store.entity;

/**   
 *ClassName: Order_items <br>
 *Description: 订单项实体类 <br>  
 *@author Administrator
 *@date 2019年3月20日 下午2:59:10   
 */  
public class Order_items {
    private String item_id;//订单项id
    private String pid;//商品id
    private String quantity;//商品数量
    private double money;//商品的金额
    private String oid;//订单的id
    private String cart_id;//购物车的id
	public String getItem_id() {
		return item_id;
	}
	public void setItem_id(String item_id) {
		this.item_id = item_id;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public double getMoney() {
		return money;
	}
	public void setMoney(double money) {
		this.money = money;
	}
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public String getcart_id() {
		return cart_id;
	}
	public void setcart_id(String cart_id) {
		this.cart_id = cart_id;
	}
	public Order_items(String item_id, String pid, String quantity, double money, String oid, String cart_id) {
		super();
		this.item_id = item_id;
		this.pid = pid;
		this.quantity = quantity;
		this.money = money;
		this.oid = oid;
		this.cart_id = cart_id;
	}
	public Order_items() {
		super();
		// TODO Auto-generated constructor stub
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Order_items [item_id=" + item_id + ", pid=" + pid + ", quantity=" + quantity + ", money=" + money
				+ ", oid=" + oid + ", cart_id=" + cart_id + "]";
	}
    
}

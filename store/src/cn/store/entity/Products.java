package cn.store.entity;

import java.util.Date;

/**   
 *ClassName: Products <br>
 *Description: 商品实体类 <br>  
 *@author Administrator
 *@date 2019年3月30日 下午8:50:25   
 */  
public class Products {
	private String pid;//商品id
	private String pname;//商品名称
	private double price;//商品价格
	private String image;//商品图片
	private String description;//商品描述
	private Date time;//商品上架时间
	private String sold_out;//是否下架
	private String sales_volume;//销量
	private String inventory;//库存
	private String cid;//所属分类
	/**   
	*   
	*/  
	public Products() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**   
	* @param pid
	* @param pname
	* @param price
	* @param image
	* @param description
	* @param time
	* @param sold_out
	* @param sales_volume
	* @param inventory
	* @param cid  
	*/  
	public Products(String pid, String pname, double price, String image, String description, Date time,
			String sold_out, String sales_volume, String inventory, String cid) {
		super();
		this.pid = pid;
		this.pname = pname;
		this.price = price;
		this.image = image;
		this.description = description;
		this.time = time;
		this.sold_out = sold_out;
		this.sales_volume = sales_volume;
		this.inventory = inventory;
		this.cid = cid;
	}
	/**
	 * @return the pid  
	 */
	public String getPid() {
		return pid;
	}
	/**
	 * @param pid the pid to set  
	 */
	public void setPid(String pid) {
		this.pid = pid;
	}
	/**
	 * @return the pname  
	 */
	public String getPname() {
		return pname;
	}
	/**
	 * @param pname the pname to set  
	 */
	public void setPname(String pname) {
		this.pname = pname;
	}
	/**
	 * @return the price  
	 */
	public double getPrice() {
		return price;
	}
	/**
	 * @param price the price to set  
	 */
	public void setPrice(double price) {
		this.price = price;
	}
	/**
	 * @return the image  
	 */
	public String getImage() {
		return image;
	}
	/**
	 * @param image the image to set  
	 */
	public void setImage(String image) {
		this.image = image;
	}
	/**
	 * @return the description  
	 */
	public String getDescription() {
		return description;
	}
	/**
	 * @param description the description to set  
	 */
	public void setDescription(String description) {
		this.description = description;
	}
	/**
	 * @return the time  
	 */
	public Date getTime() {
		return time;
	}
	/**
	 * @param time the time to set  
	 */
	public void setTime(Date time) {
		this.time = time;
	}
	/**
	 * @return the sold_out  
	 */
	public String getSold_out() {
		return sold_out;
	}
	/**
	 * @param sold_out the sold_out to set  
	 */
	public void setSold_out(String sold_out) {
		this.sold_out = sold_out;
	}
	/**
	 * @return the sales_volume  
	 */
	public String getSales_volume() {
		return sales_volume;
	}
	/**
	 * @param sales_volume the sales_volume to set  
	 */
	public void setSales_volume(String sales_volume) {
		this.sales_volume = sales_volume;
	}
	/**
	 * @return the inventory  
	 */
	public String getInventory() {
		return inventory;
	}
	/**
	 * @param inventory the inventory to set  
	 */
	public void setInventory(String inventory) {
		this.inventory = inventory;
	}
	/**
	 * @return the cid  
	 */
	public String getCid() {
		return cid;
	}
	/**
	 * @param cid the cid to set  
	 */
	public void setCid(String cid) {
		this.cid = cid;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Products [pid=" + pid + ", pname=" + pname + ", price=" + price + ", image=" + image + ", description="
				+ description + ", time=" + time + ", sold_out=" + sold_out + ", sales_volume=" + sales_volume
				+ ", inventory=" + inventory + ", cid=" + cid + "]";
	}
	
}

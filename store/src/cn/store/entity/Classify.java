package cn.store.entity;

/**   
 *ClassName: Classify <br>
 *Description: 商品分类 <br>  
 *@author Administrator
 *@date 2019年3月20日 下午2:58:05   
 */  
public class Classify {
	private String cid;//分类的id
	private String cname;//分类的名称
	/**   
	* @param cid
	* @param cname  
	*/  
	public Classify(String cid, String cname) {
		super();
		this.cid = cid;
		this.cname = cname;
	}
	/**   
	*   
	*/  
	public Classify() {
		super();
		// TODO Auto-generated constructor stub
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
	/**
	 * @return the cname  
	 */
	public String getCname() {
		return cname;
	}
	/**
	 * @param cname the cname to set  
	 */
	public void setCname(String cname) {
		this.cname = cname;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Classify [cid=" + cid + ", cname=" + cname + "]";
	}
	
	
}

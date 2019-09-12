/**
 * 
 */
package cn.store.util;

import java.util.List;


/**   
 *ClassName: PageBean <br>
 *Description: 分页工具类 <br>  
 *@author Administrator
 *@date 2019年3月20日 下午4:43:54   
 */  
public class PageBean<T> {
	
	private int totalRecold;//总记录数
	private int totalPages;//总页数
	private List<T> data;//该页数据
	private int pageNumber;//当前页码
	private int pageSize;//一页记录数
	/**   
	*   
	*/  
	public PageBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**   
	* @param pageNumber
	* @param pageSize  
	*/  
	public PageBean(int pageNumber, int pageSize) {
		super();
		this.pageNumber = pageNumber;
		this.pageSize = pageSize;
	}
	/**
	 * @return the totalRecold  
	 */
	public int getTotalRecold() {
		return totalRecold;
	}
	/**
	 * @param totalRecold the totalRecold to set  
	 */
	public void setTotalRecold(int totalRecold) {
		this.totalRecold = totalRecold;
	}
	/**
	 * @return the totalPages  
	 */
	public int getTotalPages() {
		return totalPages;
	}
	/**
	 * @param totalPages the totalPages to set  
	 */
	public void setTotalPages() {
		int p=totalRecold/pageSize;
		if (totalRecold%pageSize!=0) {
			p=p+1;
		}
		this.totalPages = p;
	}
	/**
	 * @return the data  
	 */
	public List<T> getData() {
		return data;
	}
	/**
	 * @param data the data to set  
	 */
	public void setData(List<T> data) {
		this.data = data;
	}
	/**
	 * @return the pageNumber  
	 */
	public int getPageNumber() {
		return pageNumber;
	}
	/**
	 * @param pageNumber the pageNumber to set  
	 */
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	/**
	 * @return the pageSize  
	 */
	public int getPageSize() {
		return pageSize;
	}
	/**
	 * @param pageSize the pageSize to set  
	 */
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	// 获得开始位置，即 limit m,n   的m的值
	public int getPageStartIndex() {
		return (pageNumber - 1) * pageSize;
	}

}

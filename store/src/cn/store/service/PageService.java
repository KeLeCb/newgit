/**
 * 
 */
package cn.store.service;

import java.util.List;

import cn.store.dao.imp.ProductsDaoImp;
import cn.store.entity.Products;
import cn.store.util.PageBean;

/**   
 *ClassName: PageService <br>
 *Description: 分页处理 <br>  
 *@author Administrator
 *@date 2019年3月20日 下午5:16:02   
 */

public class PageService {
	private static ProductsDaoImp pDaoImp=new ProductsDaoImp();
	/**   
	 * Title: getProSer <br> 
	 * Description: 获取PageBean<Products> 完善其属性 <br>    
	 *@return: List<Products>      
	 *@return   
	 */  
	public PageBean<Products> getProSer(PageBean<Products> pageBean){
		//调用dao方法获取一页数据
		int m=pageBean.getPageStartIndex();
		int n=pageBean.getPageSize();
		List<Products> list=pDaoImp.getPro(m, n);
		pageBean.setData(list);
		//设置总记录数
		pageBean.setTotalRecold(pDaoImp.queryAllPro().size());
		//设置总页数
		pageBean.setTotalPages();
		return pageBean;
	}
	
	
	
	/**   
	 * Title: getPros <br> 
	 * Description: 多条件查询得到商品<br>    
	 *@return: List<Products>      
	 *@param select
	 *@return   
	 */  
	public PageBean<Products> getPros(String[] select,PageBean<Products> pb){
		PageBean<Products> pageBean=pDaoImp.getPros(select, pb);
		//设置总页数
		pageBean.setTotalPages();
		return pageBean;
	}

}

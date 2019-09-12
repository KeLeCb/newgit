/**
 * 
 */
package cn.store.dao;

import java.sql.SQLException;
import java.util.List;

import cn.store.entity.Products;
import cn.store.util.PageBean;

/**   
 *ClassName: Products <br>
 *Description: 商品dao操作接口 <br>  
 *@author Administrator
 *@date 2019年3月20日 下午4:26:19   
 */

public interface ProductsDao {
	
	/**   
	 * Title: queryAllPro <br> 
	 * Description: 查询全部商品 <br>    
	 *@return: List<Products>      
	 *@return   
	 */  
	public List<Products> queryAllPro();
	
	/**   
	 * Title: getPro <br> 
	 * Description: 获得一页的商品数据 <br>    
	 *@return: List<Products>      
	 *@return   
	 */  
	public List<Products> getPro(int m,int n);

	/**   
	 * Title: queryProById <br> 
	 * Description: 通过id查询单个商品 <br>    
	 *@return: Products      
	 *@param id  查询商品的id
	 *@return   
	 */  
	Products queryProById(String id);

	/**   
	 * Title: getPros <br> 
	 * Description: 根据多条件查询得到商品 <br>    
	 *@return: List<Products>      
	 *@param select
	 *@return   
	 */  
	PageBean<Products> getPros(String[] select,PageBean<Products> pb);

	/**   
	 * Title: addPro <br> 
	 * Description: TODO(添加多个商品) <br>    
	 *@return: int      
	 *@param pro
	 *@return   
	 */  
	int addPro(Products pro);

	/**   
	 * Title: updatePro <br> 
	 * Description: TODO(修改单个商品) <br>    
	 *@return: int      
	 *@param pro
	 *@return   
	 */  
	int updatePro(Products pro);

	/**   
	 * Title: deletePro <br> 
	 * Description: TODO(删除单个商品) <br>    
	 *@return: void      
	 *@param pid   
	 */  
	void deletePro(String pid);

}

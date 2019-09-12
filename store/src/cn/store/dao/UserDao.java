/**
 * 
 */
package cn.store.dao;

import java.util.List;

import cn.store.entity.Address;
import cn.store.entity.Order;
import cn.store.entity.Order_items;
import cn.store.entity.User_info;

/**   
 *ClassName: UserDao <br>
 *Description: 用户dao操作 <br>  
 *@author Administrator
 *@date 2019年3月22日 上午9:23:05   
 */

public interface UserDao {
	
	
	/**   
	 * Title: queryUserByName <br> 
	 * Description: 根据用户昵称查询用户 <br>    
	 *@return: User_info      
	 *@param name
	 *@return   
	 */  
	public User_info queryUserByName(String name);
	
	
	/**   
	 * Title: addToCart <br> 
	 * Description: 添加商品到购物车,即生成订单项类<br>    
	 *@return: void         
	 */  
	public int addToCart(Order_items oItems);
	
	/**   
	 * Title: viewCart <br> 
	 * Description: 查看用户的购物车 <br>    
	 *@return: Order_items      
	 *@param user
	 *@return   
	 */  
	public List<Order_items> viewCart(User_info user);


	/**   
	 * Title: CartDelItem <br> 
	 * Description: 删除购物车里的商品 <br>    
	 *@return: void      
	 *@param item_id   
	 */  
	public void CartDelItem(String item_id);


	/**   
	 * Title: update <br> 
	 * Description: 修改订单项里的数量及钱 <br>    
	 *@return: void      
	 *@param item   
	 */  
	public void updateItem(Order_items item,String oid);


	/**   
	 * Title: addOrder <br> 
	 * Description: 生成订单  <br>    
	 *@return: void      
	 *@param order   
	 */  
	public void addOrder(Order order);

	/**   
	 * Title: viewAddress <br> 
	 * Description: 用户查看收货地址 <br>    
	 *@return: List<Address>      
	 *@return   
	 */  
	public List<Address> viewAddress(String uid);

	
	/**   
	 * Title: addAddress <br> 
	 * Description:用户添加地址<br>    
	 *@return: int      
	 *@param add
	 *@return   
	 */  
	public int addAddress(Address add);


	/**   
	 * Title: buyConfirm <br> 
	 * Description: 确认订单 <br>    
	 *@return: int      
	 *@return   
	 */  
	public List<Order_items> buyConfirm(String oid);


	/**   
	 * Title: addressToOrder <br> 
	 * Description: 订单绑定地址 <br>    
	 *@return: void      
	 *@param oid
	 *@param aid   
	 */  
	public void addressToOrder(String oid, String aid);

}

/**
 * 
 */
package cn.store.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.store.dao.Constant;
import cn.store.dao.ProductsDao;
import cn.store.dao.UserDao;
import cn.store.dao.imp.ProductsDaoImp;
import cn.store.dao.imp.UserDaoImp;
import cn.store.entity.Address;
import cn.store.entity.Order;
import cn.store.entity.Order_items;
import cn.store.entity.Products;
import cn.store.entity.User_info;
import cn.store.util.UUIDUtil;

/**   
 *ClassName: UserSer <br>
 *Description: 用户操作服务 <br>  
 *@author Administrator
 *@date 2019年3月22日 上午10:11:11   
 */

public class UserService {
	private static UserDao uDao=new UserDaoImp();
	/**   
	 * Title: addToCartSer <br> 
	 * Description: TODO(这里用一句话描述这个方法的作用) <br>    
	 *@return: void      
	 *@param pid   添加的商品id
	 *@param quantity   添加的商品的数量
	 *@param uid   添加商品的用户
	 */  
	public boolean addToCartSer(String pid,String quantity,String uid) {
		boolean flag=false;
		List<Map<String, Object>> list=new ProductsDaoImp().proToItem(pid, quantity);
		String price=null;
		double money=0.00;
		Order_items items=new Order_items();
		for (Map<String, Object> m:list) {
			price=m.get("price").toString();
		}
		System.out.println(list);
		do {
			list=new ProductsDaoImp().proToItem(pid, quantity);
			for (Map<String, Object> m:list) {
				price=m.get("price").toString();
			}
		} while (price==null);
		money=Double.parseDouble(price)*Double.parseDouble(quantity);
		items.setMoney(money);
		items.setQuantity(quantity);
		String item_id=UUIDUtil.getId();
		items.setItem_id(item_id);
		String cart_id=uid;
		items.setcart_id(cart_id);
		items.setPid(pid);
		int i=uDao.addToCart(items);
		if (i==1) {
			flag=true;
		}
		return flag;
	}

	/**   
	 * Title: viewCart <br> 
	 * Description: 用户查看购物车 <br>    
	 *@return: void      
	 *@param uid   
	 */  
	public List<Map<String, Object>> viewCart(String uid) {
		List<Map<String, Object>> list=new ArrayList<>();
		User_info user=new User_info();
		user.setUid(uid);
		List<Order_items> items=uDao.viewCart(user);
		System.out.println("items="+items);
		ProductsDaoImp pDao=new ProductsDaoImp();
		List<String> pids=new ArrayList<>();
		System.out.println("pids="+pids);
		for (Order_items i : items) {
			pids.add(i.getPid());
		}
		if(pids.size()==0) {
			return list;
		}
		List<Products> pros=pDao.queryProByIds(pids);
		String image=null;
		System.out.println(pros);
		String pname=null;
		double money=0.0;
		double price=0.0;
		String quantity=null;
		String item_id=null;
		String inventory=null;
		for(Order_items i:items) {
			Products p=new Products();
			Map<String, Object> map=new HashMap<String, Object>();
			for (Products products : pros) {
				if (i.getPid().equals(products.getPid())) {
					p=products;
				}
			}
			System.out.println("pro="+p);
			price= p.getPrice();
			item_id=i.getItem_id();
			image=p.getImage();
			pname=p.getPname();
			money=i.getMoney();
			quantity=i.getQuantity();
			inventory=p.getInventory();
			map.put("item_id", item_id);
			map.put("image", image);
			map.put("pname", pname);
			map.put("price", price);
			map.put("quantity", quantity);
			map.put("money", money);
			map.put("inventory", inventory);
			list.add(map);
		}
		return list;
	}
	

	/**   
	 * Title: CartDelItem <br> 
	 * Description:删除购物车里的商品 <br>    
	 *@return: void      
	 *@param item_id   
	 */  
	public void CartDelItem(String item_id) {
		uDao.CartDelItem(item_id);
	}

	/**   
	 * Title: submitOrder <br> 
	 * Description: 用户提交订单<br>    
	 *@return: void      
	 *@param item   
	 */  
	public Order submitOrder(List<Order_items> list,String uid) {
		//生成该用户的订单
		String oid=UUIDUtil.getId();
		double money=0.00;
		for(int i=0;i<list.size();i++) {
			money+=list.get(i).getMoney();
			uDao.updateItem(list.get(i), oid);
		}
		System.out.println(money);
		String satate=Constant.satate[0];//订单为未付款状态
		Order order=new Order(oid, money, satate, null, null, uid);
		uDao.addOrder(order);
		//把购物车里商品去掉
		for(int i=0;i<list.size();i++) {
			uDao.updateItem(list.get(i), oid);
		}
		return order;
	}
	
	/**   
	 * Title: viewAddress <br> 
	 * Description:用户查看地址 <br>    
	 *@return: List<Address>      
	 *@param uid
	 *@return   
	 */  
	public List<Address> viewAddress(String uid){
		return uDao.viewAddress(uid);
	}
	
	
	
	/**   
	 * Title: addAddress <br> 
	 * Description: 添加收货地址 <br>    
	 *@return: void      
	 *@param address   
	 */  
	public void addAddress(String uid,String name,String phone,String add) {
		Address address=new Address(UUIDUtil.getId(), name, add, phone, uid);
		uDao.addAddress(address);
	}

	/**   
	 * Title: buyConfirm <br> 
	 * Description: 确认订单 <br>    
	 *@return: List<Order_items>      
	 *@param oid
	 *@return   
	 */  
	public List<Map<String, Object>> buyConfirm(String oid) {
		List<Order_items> items=new ArrayList<>();
		do {
			items=uDao.buyConfirm(oid);
		} while (items.size()==0);
		List<Map<String, Object>> list=new ArrayList<>();
		Products products=new Products();
		String image=null;
		String pname=null;
		double price=0.00;
		double money=0.00;
		String num=null;
		List<String> oids=new ArrayList<>();
		for(int i=0;i<items.size();i++) {
			oids.add(items.get(i).getPid());
		}
		List<Products> pro_list=new ArrayList<>();
		if (oids.size()>0) {
			pro_list=new ProductsDaoImp().queryProByIds(oids);
			for(int i=0;i<items.size();i++) {
				Map<String, Object> map=new HashMap<>();
				for (int j = 0; j < pro_list.size(); j++) {
					if (items.get(i).getPid().equals(pro_list.get(j).getPid())) {
						products=pro_list.get(j);
					}
				}
				image=products.getImage();
				pname=products.getPname();
				price=products.getPrice();
				money=items.get(i).getMoney();
				num=items.get(i).getQuantity();
				map.put("image", image);
				map.put("pname", pname);
				map.put("price", price);
				map.put("money", money);
				map.put("quantity", num);
				list.add(map);
			}
		}
		return list;
	}
	

	/**   
	 * Title: addressToOrder <br> 
	 * Description: 给订单绑定地址 <br>    
	 *@return: void      
	 *@param oid
	 *@param aid   
	 */  
	public void addressToOrder(String oid, String aid) {
		uDao.addressToOrder(oid,aid);
		
	}

	/**   
	 * Title: updateSatateToOrder <br> 
	 * Description: 更新订单状态 <br>    
	 *@return: void      
	 *@param oid
	 *@param satate   
	 */  
	public void updateSatateToOrder(String oid, String satate) {
		new UserDaoImp().updateSatateToOrder(oid,satate);
	}
	
}

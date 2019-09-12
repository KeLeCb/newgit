/**
 * 
 */
package cn.store.dao.imp;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.sun.mail.imap.protocol.Item;
import com.sun.org.apache.bcel.internal.generic.NEW;

import cn.store.dao.UserDao;
import cn.store.entity.Address;
import cn.store.entity.Order;
import cn.store.entity.Order_items;
import cn.store.entity.User_info;
import cn.store.util.JdbcUtil;
import cn.store.util.UUIDUtil;

/**   
 *ClassName: UserDaoImp <br>
 *Description: TODO(用户dao操作实现类) <br>  
 *@author Administrator
 *@date 2019年3月22日 上午9:24:34   
 */

public class UserDaoImp implements UserDao {
	private static QueryRunner qr=new QueryRunner();
	private static Connection connection=null;

	/* (non-Javadoc)
	 * @see cn.store.dao.UserDao#addToCart()
	 *添加到购物车即生成订单项表
	 */
	@Override
	public int addToCart(Order_items oItems) {
		String sql="insert into order_items(item_id,pid,quantity,money,cart_id) values(?,?,?,?,?)";
		Object[] params= {oItems.getItem_id(),oItems.getPid(),oItems.getQuantity(),oItems.getMoney(),oItems.getcart_id()};
		connection=JdbcUtil.getConnecion();
		int i=0;
		try {
			i=qr.update(connection, sql, params);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.closeConnection(connection);
		}
		return i;
		
	}

	/* (non-Javadoc)
	 * @see cn.store.dao.UserDao#queryUserById(java.lang.String)
	 * 根据用户昵称查询用户
	 */
	@Override
	public User_info queryUserByName(String name) {
		User_info user=new User_info();
		String sql="select * from user_info where name=?";
		connection=JdbcUtil.getConnecion();
		try {
			user=qr.query(connection, sql, new BeanHandler<User_info>(User_info.class),name);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JdbcUtil.closeConnection(connection);
		}
		return user;
	}
/**
 *
 *
 * @description: 
 * @param List
 * @return: 按分页查询
 * @author: Cb
 * @time: 2019/9/4 17:06
 */    
	public List<User_info> select(int start,int pagesize ) {
		List<User_info> list=new ArrayList<User_info>();
		String sql="select * from user_info limit ?,?";
		connection=JdbcUtil.getConnecion();
		try {
			list=qr.query(connection, sql, new BeanListHandler<User_info>(User_info.class),start,pagesize);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JdbcUtil.closeConnection(connection);
		}
		return list;
	}

	/**
	 *
	 *
	 * @description:
	 * @param List
	 * @return: 查询所有数据
	 * @author: Cb
	 * @time: 2019/9/4 17:06
	 */
	public List<User_info> selectAll() {
		List<User_info> list=new ArrayList<User_info>();
		String sql="select * from user_info ";
		connection=JdbcUtil.getConnecion();
		try {
			list=qr.query(connection, sql, new BeanListHandler<User_info>(User_info.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JdbcUtil.closeConnection(connection);
		}
		return list;
	}
/**
 *
 *
 * @description: 
 * @param null
 * @return:  删除单个用户
 * @author: Cb
 * @time: 2019/9/5 17:43
 */    
	 public void delete(Integer uid){
	 	String sql="delete from user_info where uid=?";
	 	connection=JdbcUtil.getConnecion();
		 try {
			 qr.update(connection,sql,uid);
		 } catch (SQLException e) {
			 e.printStackTrace();
		 }finally {
		 	JdbcUtil.closeConnection(connection
			);
		 }
	 }
	/* (non-Javadoc)
	 * @see cn.store.dao.UserDao#queryUserById(java.lang.String)
	 * 根据用户昵称查询用户
	 */
	public User_info queryUserByUName(String uname) {
		User_info user=new User_info();
		String sql="select * from user_info where uname=?";
		connection=JdbcUtil.getConnecion();
		try {
			user=qr.query(connection, sql, new BeanHandler<User_info>(User_info.class),uname);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JdbcUtil.closeConnection(connection);
		}
		return user;
	}

	/* (non-Javadoc)
	 * @see cn.store.dao.UserDao#viewCart(cn.store.entity.User_info)
	 * 查看用户的购物车
	 */
	@Override
	public List<Order_items> viewCart(User_info user) {
		List<Order_items> list=new ArrayList<Order_items>();
		String uid=user.getUid();
		connection=JdbcUtil.getConnecion();
		String sql="select * from order_items where cart_id=?";
		try {
			list=qr.query(connection, sql, new BeanListHandler<Order_items>(Order_items.class),uid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JdbcUtil.closeConnection(connection);
		}
	 	return list;
	}

	/* (non-Javadoc)
	 * @see cn.store.dao.UserDao#CartDelItem(java.lang.String)
	 * 购物车删除订单项
	 */
	@Override
	public void CartDelItem(String item_id) {
		String sql="delete from order_items where item_id=?";
		connection=JdbcUtil.getConnecion();
		try {
			qr.update(connection, sql, item_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.closeConnection(connection);
		}
	}

	/* (non-Javadoc)
	 * @see cn.store.dao.UserDao#update(cn.store.entity.Order_items)
	 * 提交购物车里的订单时，改变订单项里的cart_id为null
	 */
	@Override
	public void updateItem(Order_items item,String oid) {
		connection=JdbcUtil.getConnecion();
		String sql="update order_items set cart_id=null,money=?,quantity=?,oid=? where item_id=?";
		Object[] param= {item.getMoney(),item.getQuantity(),oid,item.getItem_id()};
		try {
			qr.update(connection, sql, param);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JdbcUtil.closeConnection(connection);
		}
	
	}

	/* (non-Javadoc)
	 * @see cn.store.dao.UserDao#addOrder(cn.store.entity.Order)
	 * 提交购物车里的订单项，生成订单
	 */
	@Override
	public void addOrder(Order order) {
		connection=JdbcUtil.getConnecion();
		String sql="INSERT INTO `order` (oid,uid,time,satate,money) VALUES(?,?,NOW(),?,?) ";
		Object[] param= {order.getOid(),order.getUid(),order.getSatate(),order.getMoney()};
		try {
			qr.update(connection, sql, param);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JdbcUtil.closeConnection(connection);
		}
	}

	/* (non-Javadoc)
	 * @see cn.store.dao.UserDao#viewAddress()
	 * 查看用户收货地址
	 */
	@Override
	public List<Address> viewAddress(String uid) {
		String sql="select * from address where uid=?";
		connection=JdbcUtil.getConnecion();
		List<Address> lists=new ArrayList<Address>();
		try {
			lists=qr.query(connection, sql, new BeanListHandler<Address>(Address.class),uid);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.closeConnection(connection);
		}
		
		return lists;
	}
	
	/* (non-Javadoc)
	 * @see cn.store.dao.UserDao#addAddress(cn.store.entity.Address)
	 * 用户添加收货地址
	 */
	@Override
	public int addAddress(Address add) {
		connection=JdbcUtil.getConnecion();
		String sql="insert into address values(?,?,?,?,?)";
		Object[] params= {add.getAid(),add.getName(),add.getAddress(),add.getPhone(),add.getUid()};
		int i=0;
		try {
			i=qr.update(connection, sql, params);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.closeConnection(connection);
		}
		return i;
	}

	/* (non-Javadoc)
	 * @see cn.store.dao.UserDao#buyConfirm(java.lang.String)
	 * 用户确认订单
	 */
	@Override
	public List<Order_items> buyConfirm(String oid) {
		connection=JdbcUtil.getConnecion();
		String sql="select * from order_items where oid=?";
		List<Order_items> list=new ArrayList<>();
		try {
			list=qr.query(connection, sql, new BeanListHandler<Order_items>(Order_items.class),oid);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.closeConnection(connection);
		}
		return list;
	}
	/**   
	 *@Title: FindUser   
	 *@Description: TODO(用户登录的判定方法)      
	 *@return: User_info      
	 *@param name
	 *@param pwd
	 *@return   
	 */  
	public User_info FindUser(String uname) {
		  String sql="select *from user_info where uname=?";
		  User_info user_info=null;
		  connection=JdbcUtil.getConnecion();
		  try {
			user_info =qr.query(connection, sql, new BeanHandler<User_info>(User_info.class),uname);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JdbcUtil.closeConnection(connection);
		}
		return user_info; 
		
		}
	/**   
	 *@Title: Findpassword   
	 *@Description: TODO(判断用户名和密码是否同时存在)      
	 *@return: User_info      
	 *@param uname
	 *@param pwd
	 *@return   
	 */  
	public User_info Findpassword(String uname, String pwd) {
		String sql="select *from user_info where uname=? and password=?";
		User_info user_info=null;
		connection=JdbcUtil.getConnecion();
		try {
			user_info =qr.query(connection, sql, new BeanHandler<User_info>(User_info.class),uname,pwd);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JdbcUtil.closeConnection(connection);
		}
		return user_info; 
		
	}
	   /**   
	 *@Title: insert   
	 *@Description: TODO(用户注册添加的方法)      
	 *@return: void      
	 *@param uid
	 *@param uname
	 *@param name
	 *@param password
	 *@param gender
	 *@param birthday
	 *@param email   
	 */  
	public static void insert(String  uid,String uname ,String name,String password,String gender,String birthday,String email) {
		 connection=JdbcUtil.getConnecion();
	    	String  sql="insert into user_info (uid,uname,name,password,gender,birthday,email) values(?,?,?,?,?,?,?)";
	    	int rows;
			try {
				rows = qr.update(connection,sql,uid,uname,name,password,gender,birthday,email);
				if (rows>0) {
					System.out.println("插入成功");					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JdbcUtil.closeConnection(connection);
			}
	    }
	 /**   
	 *@Title: selectUname   
	 *@Description: TODO(查询用户名的)      
	 *@return: void      
	 *@param uname   
	 */  
	public static int selectUname(String uname) {
		 connection=JdbcUtil.getConnecion();
		 int i=0;
		String sql="select * from user_info where uname=? ";
		 User_info count=null;
		 try {
			count= qr.query(connection,sql,new BeanHandler<User_info>(User_info.class),uname);
			if (count!=null) {
				i=1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JdbcUtil.closeConnection(connection);
		}
		return i;
	 }
	/**   
	 *@Title: selectEmail   
	 *@Description: TODO(查询邮箱是否存在)      
	 *@return: int      
	 *@param email
	 *@return   
	 */  
	public static int selectEmail(String email) {
		 connection=JdbcUtil.getConnecion();
		int i=0;
		 String sql="select * from user_info where email=? ";
		 User_info count;
		 try {
			count=qr.query(connection,sql,new BeanHandler<User_info>(User_info.class),email);
			if (count != null) {
			 i=1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JdbcUtil.closeConnection(connection);
		}
		return i;
	 }
	/**   
	 *@Title: updateUname   
	 *@Description: TODO(修改密码)      
	 *@return: int      
	 *@param email
	 *@param password
	 *@return   
	 */  
	public static int updateUname(String email,String password) {
		 connection=JdbcUtil.getConnecion();
		String sql="update   user_info set password=? where email=? ";
		 int count = 0;
		 try {
			count= qr.update(connection,sql, password,email);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JdbcUtil.closeConnection(connection);
		}
		return count;
	}

	/* (non-Javadoc)
	 * @see cn.store.dao.UserDao#addressToOrder(java.lang.String, java.lang.String)
	 */
	@Override
	public void addressToOrder(String oid, String aid) {
		connection=JdbcUtil.getConnecion();
		String sql="UPDATE `order` SET aid=? WHERE oid=?";
		try {
			qr.update(connection, sql, aid,oid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JdbcUtil.closeConnection(connection);
		}
	}
	
	
	/**   
	 * Title: updateSatateToOrder <br> 
	 * Description:更新订单状态 <br>    
	 *@return: void      
	 *@param oid
	 *@param satate   
	 */  
	public void updateSatateToOrder(String oid, String satate) {
		connection=JdbcUtil.getConnecion();
		String sql="UPDATE `order` SET satate=? WHERE oid=?";
		try {
			qr.update(connection, sql, satate,oid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JdbcUtil.closeConnection(connection);
		}
	}
}

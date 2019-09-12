/**
 * 
 */
package cn.store.dao.imp;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;


import cn.store.dao.OrderDao;
import cn.store.entity.Order;
import cn.store.util.JdbcUtil;
import cn.store.util.PageBean;

/**   
 * @ClassName:  OrderDaoimp   
 * @Description:TODO(订单项)   
 * @author: 杨文艳
 * @date:   2019年3月24日 下午6:06:08   
 * 注意：本内容仅限于杨文艳内部亲属之间传阅，禁止外泄以及用于其他的商业目 的
 */
public class OrderDaoimp implements OrderDao {	
	private static Connection connection=null;
	private static QueryRunner qr=new QueryRunner();		
	/* (non-Javadoc)
	 *  @see cn.store.dao.OrderDao#page(java.lang.String)
	 *   订单的总页数
	 * */ 
	 
	@Override
	public int page(String uid) {
		connection=JdbcUtil.getConnecion();
		String sql="SELECT * from `order` where uid=?";
		int page=0;
		try {
			page=(qr.query(connection, sql, new BeanListHandler<Order>(Order.class))).size();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return page;
		
	}
	
	
	
	/**   
	 * @Title: viewOrderPage   
	 * @Description: 用户订单分页
	 * @param: @param pageStartIndex
	 * @param: @param pageSize
	 * @param: @return      
	 * @return: List      
	 * @throws   
	 */  
	public PageBean<Map<String, Object>> viewOrderPage(String uid,PageBean<Map<String, Object>> pageBean) {
		connection=JdbcUtil.getConnecion();
		int totalRecord=0;
		String sql="SELECT o.oid,o.money  total,o.satate,o.time,p.pname,p.image,p.price,oi.quantity,oi.money from `order` o ,order_items oi ,products p \r\n" + 
				" where  o.oid=oi.oid   and  oi.pid=p.pid  and uid=?";
		List<Map<String, Object>> list=new ArrayList<>();
		try {
			totalRecord=qr.query(connection, sql,new MapListHandler(),uid).size();	
			pageBean.setTotalRecold(totalRecord);
			String sql2=sql+" order by o.time desc limit ?,?";
			list=qr.query(connection, sql2,new MapListHandler(),uid,pageBean.getPageStartIndex(),pageBean.getPageSize());
			pageBean.setData(list);		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JdbcUtil.closeConnection(connection);
		}
		return pageBean;
	}
	/**   
	 *@Title: selectAll   
	 *@Description: TODO(查询所有订单的方法)      
	 *@return: List      
	 *@return   
	 */  
	public static List<Map<String, Object>> selectAll() {
		connection=JdbcUtil.getConnecion();
		List<Map<String, Object>> list=new ArrayList<Map<String,Object>>();
		String sql="select * from `order` left JOIN address ON  `order`.aid=address.aid";
		try {
			list=qr.query(connection,sql,new MapListHandler());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JdbcUtil.closeConnection(connection);
		}
		return list;
		
	}
	
	/**   
	 * Title: selectOid <br> 
	 * Description: TODO(按id查询订单详情) <br>    
	 *@return: List<Map<String,Object>>      
	 *@param oid
	 *@return   
	 */  
	public static List<Map<String, Object>> selectOid(String oid) {
		connection=JdbcUtil.getConnecion();
		List<Map<String, Object>> list=new ArrayList<Map<String,Object>>();
		String sql="select * from `order` left JOIN address ON  `order`.aid=address.aid where oid=?";
		try {
			list=qr.query(connection,sql,new MapListHandler(),oid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JdbcUtil.closeConnection(connection);
		}
		return list;
		
	}
	/**   
	 *@Title: selectAll   
	 *@Description: TODO(查询所有用户的方法)      
	 *@return: List      
	 *@return   
	 */  
	public static List<Map<String, Object>> selectUser() {
		connection=JdbcUtil.getConnecion();
		List<Map<String, Object>> list=new ArrayList<Map<String,Object>>();
		String sql="select user_info.uid,user_info.name,gender,birthday,email,address.phone,address from user_info left JOIN address ON  user_info.uid=address.uid";
		try {
			list=qr.query(connection,sql,new MapListHandler());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JdbcUtil.closeConnection(connection);
		}
		return list;
		
	}
}

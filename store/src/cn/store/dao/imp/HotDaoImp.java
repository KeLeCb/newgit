package cn.store.dao.imp;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.store.entity.Products;
import cn.store.util.JdbcUtil;

/**   
 *ClassName: HotDaoImp <br>
 *Description: 查询热门商品 <br>  
 *@author Administrator
 *@date 2019年3月30日 下午8:43:10   
 */  
public class HotDaoImp {
	
	private static QueryRunner qr=new QueryRunner();
	private static Connection conn=null;
	
	/**   
	 * Title: query <br> 
	 * Description: TODO(查询热卖物品) <br>    
	 *@return: List<Products>      
	 *@return   
	 */  
	public List<Products> query(){
		List<Products> lists =new ArrayList<Products>();
		conn=JdbcUtil.getConnecion();
		String sql="select * from products order by CAST(sales_volume AS SIGNED) desc limit 3";
		try {
			lists=qr.query(conn, sql, new BeanListHandler<Products>(Products.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JdbcUtil.closeConnection(conn);
		}
		return lists;
	}

}

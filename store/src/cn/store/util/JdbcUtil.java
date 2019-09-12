/**
 * 
 */
package cn.store.util;

import java.sql.Connection;
import java.sql.SQLException;

import com.mchange.v2.c3p0.ComboPooledDataSource;



/**   
 *ClassName: JdbcUtil <br>
 *Description: c3p0连接 <br>  
 *@author Administrator
 *@date 2019年3月20日 上午9:06:38   
 */  
public class JdbcUtil {
	private static ComboPooledDataSource dataSource=null;
	static{  
	    dataSource=new ComboPooledDataSource();  
	} 
	/**   
	 * Title: getConnecion <br> 
	 * Description: 获取连接 <br>    
	 *@return: Connection      
	 *@return   
	 */  
	public static Connection getConnecion() {
		Connection connection=null;
		try {
			connection=dataSource.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}
	
	
	/**   
	 * Title: closeConnection <br> 
	 * Description: 关闭连接<br>    
	 *@return: void      
	 *@param connection   
	 */  
	public static void closeConnection(Connection  connection) {
		try {
			if (connection!=null) {
				connection.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

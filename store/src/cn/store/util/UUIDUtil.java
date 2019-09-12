/**
 * 
 */
package cn.store.util;

import java.util.UUID;

/**   
 *ClassName: UUIDUtil <br>
 *Description: TODO(UUID获取id) <br>  
 *@author Administrator
 *@date 2019��3��4�� ����5:51:16   
 */

public class UUIDUtil {
	
	
	/**   
	 * Title: getId <br> 
	 * Description: 获取id <br>    
	 *@return: String      
	 *@return   
	 */  
	public static String getId() {
		String id=null;
		id=UUID.randomUUID().toString();
		id=id.replace("-", "").toUpperCase();
		return id;
	}

}

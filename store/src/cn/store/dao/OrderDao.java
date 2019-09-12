/**
 * 
 */
package cn.store.dao;

import java.util.List;
import java.util.Map;



import cn.store.entity.Order;
import cn.store.entity.Order_items;
import cn.store.entity.Products;
import cn.store.entity.User_info;
import cn.store.util.PageBean;

/**   
 * @ClassName:  OrderDao   
 * @Description:TODO(订单项)   
 * @author: 杨文艳
 * @date:   2019年3月24日 下午6:05:33   
 * 注意：本内容仅限于杨文艳内部亲属之间传阅，禁止外泄以及用于其他的商业目 的
 */
public interface OrderDao {
/**   
 * @Title: page   
 * @Description: TODO(订单项总页数)   
 * @param: @param uid
 * @param: @return      
 * @return: int      
 * @throws   
 */  
public int page(String uid);
}

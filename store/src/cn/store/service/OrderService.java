/**
 * 
 */
package cn.store.service;

import java.util.List;
import java.util.Map;

import cn.store.dao.imp.OrderDaoimp;
import cn.store.util.PageBean;

/**   
 * @ClassName:  OrderService   
 * @Description:订单service   
 * @author: 杨文艳
 * @date:   2019年3月28日 下午7:46:46   
 * 注意：本内容仅限于杨文艳内部亲属之间传阅，禁止外泄以及用于其他的商业目 的
 */
public class OrderService {

	/**   
	 * @Title: viewOrderPage   
	 * @Description: 用户查询我的订单
	 * @param: @param uid
	 * @param: @param pageBean
	 * @param: @return      
	 * @return: PageBean<>      
	 * @throws   
	 */  
	public PageBean<Map<String, Object>> viewOrderPage(String uid, PageBean<Map<String, Object>> pageBean) {
		OrderDaoimp daoimp=new OrderDaoimp();
		PageBean<Map<String, Object>> pb=daoimp.viewOrderPage(uid, pageBean);
		pb.setTotalPages();
		List<Map<String, Object>> list=pb.getData();
		for(Map<String, Object> map:list) {
			String time1=map.get("time").toString();
			String time=time1.substring(0,time1.length()-2);
			map.put("time", time);
		}
		pb.setData(list);
		return pb;
	}
}

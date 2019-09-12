package cn.store.web.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.fasterxml.jackson.databind.ObjectMapper;

import cn.store.dao.imp.OrderDaoimp;
import cn.store.entity.User_info;
import cn.store.service.OrderService;
import cn.store.util.PageBean;
import cn.store.web.servlet.base.BaseServlet;
/**   
 * @ClassName:  OrderServlet   
 * @Description:TODO(订单servlet)   
 * @author: 杨文艳
 * @date:   2019年3月24日 下午9:42:09   
 * 注意：本内容仅限于杨文艳内部亲属之间传阅，禁止外泄以及用于其他的商业目 的
 */  
@WebServlet("/OrderServlet")
public class OrderServlet extends  BaseServlet{
	private static final long serialVersionUID = 1L;			
	/**   
	 * @Title: viewOrderPage   
	 * @Description: TODO(获取订单)   
	 * @param: @param request
	 * @param: @param response
	 * @param: @return
	 * @param: @throws ServletException
	 * @param: @throws IOException      
	 * @return: String      
	 * @throws   
	 */  
	public String viewOrderPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset=UTF-8");
		//获取session里的用户信息user
		User_info user=(User_info) request.getSession().getAttribute("user_info");
		String uid=user.getUid();
		int page=Integer.parseInt(request.getParameter("pageNumber"));
		int pagesize=Integer.parseInt(request.getParameter("pageSize"));
		OrderService  od=new OrderService();
		PageBean<Map<String, Object>>  pageBean=od.viewOrderPage(uid, new PageBean<>(page, pagesize));
	
		//json
		ObjectMapper mapper=new ObjectMapper();
		String json = mapper.writeValueAsString(pageBean);		
		response.getWriter().println(json);
		
		return null;		
	}
	 
		/**   
		 *@Title: selectAll   
		 *@Description: TODO(查询所有订单)      
		 *@return: void      
		 *@param request
		 *@param response
		 *@throws ServletException
		 *@throws IOException   
		 */  
		public String select(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			List<Map<String, Object>> list=OrderDaoimp.selectAll();
			for(Map<String, Object> map:list) {
				String time1=map.get("time").toString();
			String 	time=time1.substring(0,time1.length()-2);
				map.put("time", time);
			}
			response.setContentType("application/json; charset=utf-8");
			ObjectMapper mapper=new ObjectMapper();
			String json = mapper.writeValueAsString(list);
			response.getWriter().print(json);
			return null;
		}
		/**   
		 *@Title: selectOid   
		 *@Description: TODO(看单个订单详情)      
		 *@return: String      
		 *@param request
		 *@param response
		 *@return
		 *@throws ServletException
		 *@throws IOException   
		 */  
		public String selectOid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			String oid=request.getParameter("oid");
			List<Map<String, Object>> list=OrderDaoimp.selectOid(oid);
			ObjectMapper mapper=new ObjectMapper();
			String json = mapper.writeValueAsString(list);
			response.getWriter().print(json);
			return null;
		}
		/**   
		 *@Title: selectAll   
		 *@Description: TODO(查询所有用户)      
		 *@return: void      
		 *@param request
		 *@param response
		 *@throws ServletException
		 *@throws IOException   
		 */  
		public String selectUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			List<Map<String, Object>> list=OrderDaoimp.selectUser();
			/*for(Map<String, Object> map:list) {
				String time1=map.get("time").toString();
			String 	time=time1.substring(0,time1.length()-2);
				map.put("time", time);
			}*/
			response.setContentType("application/json; charset=utf-8");
			ObjectMapper mapper=new ObjectMapper();
			String json = mapper.writeValueAsString(list);
			response.getWriter().print(json);
			return null;
		}
	
}

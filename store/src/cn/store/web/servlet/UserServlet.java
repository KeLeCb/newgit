package cn.store.web.servlet;

import cn.store.dao.Constant;
import cn.store.dao.imp.UserDaoImp;
import cn.store.entity.Address;
import cn.store.entity.Order;
import cn.store.entity.Order_items;
import cn.store.entity.User_info;
import cn.store.service.UserService;
import cn.store.util.EmailUtil;
import cn.store.util.MD5;
import cn.store.web.servlet.base.BaseServlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.omg.CosNaming.NamingContextExtPackage.StringNameHelper;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	/**   
	 * Title: addToCart <br> 
	 * Description: 添加商品到购物车 <br>    
	 *@return: String      
	 *@param request
	 *@param response
	 *@return
	 *@throws ServletException
	 *@throws IOException   
	 */  
	public String addToCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//要添加到购物车的商品的id
		String pid=request.getParameter("pid");
		//要添加到购物车的商品的数量
		String quantity=request.getParameter("num");
		if (quantity==null) {
			quantity="1";
		}
		//从session中获取用户名，然后获取用户的id作为购物车的id
		User_info user=(User_info) request.getSession().getAttribute("user_info");
		System.out.println("user--"+user);
		System.out.println(request.getContextPath());
		if (user==null) {
			response.getWriter().println("<script>window.location.href=\""+request.getContextPath()+"/user/index.jsp?method=login\";</script>");
			return null;
		} else {
			boolean flag=new UserService().addToCartSer(pid,quantity,user.getUid());
			response.getWriter().println(flag);
			return null;
		}
	}
	
	/**   
	 * Title: viewCart <br> 
	 * Description: 查看我的购物车 <br>    
	 *@return: String      
	 *@param request
	 *@param response
	 *@return
	 *@throws ServletException
	 *@throws IOException   
	 */  
	public String viewCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		//获取当前的用户的id
		User_info user=(User_info) request.getSession().getAttribute("user_info");
		System.out.println(user);
		String uid=user.getUid();
		List<Map<String, Object>> list = new UserService().viewCart(uid);
		//json
		ObjectMapper mapper=new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		response.setContentType("application/json;charset=UTF-8");
		response.getWriter().println(json);
		return null;
	}
	
	
	/**   
	 * Title: CartDelItem <br> 
	 * Description: 购物车删除商品 <br>    
	 *@return: String      
	 *@param request
	 *@param response
	 *@return
	 *@throws ServletException
	 *@throws IOException   
	 */  
	public String CartDelItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String item_id=request.getParameter("item_id");
		new UserService().CartDelItem(item_id);
		return null;
	}
	
	
	/**   
	 * Title: submitOrder <br> 
	 * Description: 用户提交购物车里的订单 <br>    
	 *@return: String      
	 *@param request
	 *@param response
	 *@return
	 *@throws ServletException
	 *@throws IOException   
	 */  
	public String submitOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		User_info user=(User_info) request.getSession().getAttribute("user_info");
		String uid=user.getUid();
		String jsonStr=request.getParameter("list");
		UserService us=new UserService();
		//解析前台传过来的json数组 放到list
		ObjectMapper mapper=new ObjectMapper();
		List<Order_items> list=mapper.readValue(jsonStr, new TypeReference<List<Order_items>>() {});
		Order order=us.submitOrder(list,uid);
		response.getWriter().println(order.getOid());
		return null;
	}
	
	
	
	/**   
	 * Title: viewAddress <br> 
	 * Description: 用户查看收货地址 <br>    
	 *@return: String      
	 *@param request
	 *@param response
	 *@return
	 *@throws ServletException
	 *@throws IOException   
	 */  
	public String viewAddress(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		User_info user=(User_info) request.getSession().getAttribute("user_info");
		String uid=user.getUid();
		List<Address> list=new UserService().viewAddress(uid);
		//json
		ObjectMapper mapper=new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		response.setContentType("application/json;charset=UTF-8");
		response.getWriter().println(json);
		return null;
	}
	
	
	/**   
	 * Title: addAddress <br> 
	 * Description: 用户添加收货地址 <br>    
	 *@return: String      
	 *@param request
	 *@param response
	 *@return
	 *@throws ServletException
	 *@throws IOException   
	 */  
	public String addAddress(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		User_info user=(User_info) request.getSession().getAttribute("user_info");
		String uid=user.getUid();
		String name=request.getParameter("name");
		String phone=request.getParameter("phone");
		String address=request.getParameter("address");
		new UserService().addAddress(uid, name, phone, address);
		viewAddress(request,response);
		return null;
	}
	
	
	
	/**   
	 * Title: buyConfirm <br> 
	 * Description: 确认订单<br>    
	 *@return: String      
	 *@param request
	 *@param response
	 *@return
	 *@throws ServletException
	 *@throws IOException   
	 */  
	public String buyConfirm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String oid=request.getParameter("oid");
		List<Map<String, Object>> list=new UserService().buyConfirm(oid);
		System.out.println(list);
		//json
		ObjectMapper mapper=new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		response.setContentType("application/json;charset=UTF-8");
		response.getWriter().println(json);
		return null;
	}
	
	
	/**   
	 * Title: alipay <br> 
	 * Description: 用户确认订单后提交到支付界面 <br>    
	 *@return: String      
	 *@param request
	 *@param response
	 *@return
	 *@throws ServletException
	 *@throws IOException   
	 */  
	public String alipay(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String oid=request.getParameter("oid");
		String money=request.getParameter("money");
		String name=request.getParameter("name");
		String phone=request.getParameter("phone");
		String address=request.getParameter("address");
		String aid=request.getParameter("aid");
		request.setAttribute("oid", oid);
		request.setAttribute("money",money);
		request.setAttribute("name",name);
		request.setAttribute("phone",phone);
		request.setAttribute("address",address);
		System.out.println(name+phone+address);
		System.out.println(aid);
		new UserService().addressToOrder(oid,aid);
		return "alipay/index.jsp";
	}
	
	 /**   
	 * Title: updateSatate <br> 
	 * Description: 更新支付状态<br>    
	 *@return: void      
	 *@param request
	 *@param response
	 *@throws ServletException
	 *@throws IOException   
	 */  
	public  void updateSatate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String out_trade_no=(String) request.getAttribute("out_trade_no");
		String satate=Constant.satate[1];
		System.out.println(out_trade_no+"---"+satate);
		new UserService().updateSatateToOrder(out_trade_no, satate);
		response.sendRedirect("user/index.jsp");
	}
	
	
	/**   
     *@Title: UserLogin   
     *@Description: TODO(获取用户名是否存在的数据)      
     *@return: void      
     *@param request
     *@param response
     *@throws ServletException
     *@throws IOException   
     */  
    public void UserLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	boolean res=false;
    	User_info user=new User_info();
    	String uname=request.getParameter("username");
		 user=new UserDaoImp().FindUser(uname);
		if (user!=null) {
			res=true;	
		}
		response.getWriter().println(res);
	}
    
    /**   
     *@Title: passwordLogin   
     *@Description: TODO(获取用户名对应的密码数据)      
     *@return: void      
     *@param request
     *@param response
     *@throws ServletException
     *@throws IOException   
     */  
    public void passwordLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean res=false;
		String uname=request.getParameter("username");
		String pwd1=request.getParameter("spassword");
		String pwd=MD5.getMD5(pwd1);
		User_info user=new UserDaoImp().Findpassword(uname, pwd);
		if (user!=null) {
			res=true;
		}	
    	response.getWriter().println(res);
    }
    /**   
     *@Title: cooike   
     *@Description: TODO(登录成功保存到session)      
     *@return: void      
     *@param request
     *@param response
     *@throws ServletException
     *@throws IOException   
     */ 
    public void session(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String name=request.getParameter("name");
    	String uname=request.getParameter("uname");
    	User_info user_info=new UserDaoImp().queryUserByUName(uname);
    	String pwd1=request.getParameter("password");
    	String pwd=MD5.getMD5(pwd1);	
    	request.getSession().setAttribute("user_info", user_info);
    	request.getSession().setAttribute("name", name);
    	request.getSession().setAttribute("uname", uname);
        request.getRequestDispatcher("user_info/header.jsp").forward(request, response);
    }
    
    /**   
     * Title: removesession <br> 
     * Description: 用户退出清除session <br>    
     *@return: void      
     *@param request
     *@param response
     *@throws ServletException
     *@throws IOException   
     */  
    public void removesession(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String name=request.getParameter("name");
    	String uname=request.getParameter("uname");
    	request.getSession().removeAttribute(uname);
    	request.getSession().removeAttribute(name);
    	request.getSession().invalidate();
    }
    /**   
     *@Title: Loginout   
     *@Description: TODO(用户退出)      
     *@return: void      
     *@param request
     *@param response
     *@throws ServletException
     *@throws IOException   
     */  
    public void Loginout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().invalidate();
		response.sendRedirect("user/index.jsp");
	}
    
    /**   
     *@Title: email   
     *@Description: TODO(获取邮箱 验证码 并传回给页面)      
     *@return: void      
     *@param request
     *@param response
     *@throws ServletException
     *@throws IOException   
     */  
    public void email(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");		
		int activeCode=(int) (Math.random()*(999999-100000)+100000);
		 try {
	            //user.getEmail()  ：是注册人的邮件用户名
	            EmailUtil.sendMail(email,activeCode );
	        } catch (MessagingException e) {
	            e.printStackTrace();
	        }
		 response.setCharacterEncoding("UTF-8");  
			response.getWriter().print(activeCode);
	}
  
    /**   
     *@Title: semail   
     *@Description: TODO( 找回密码时获取邮箱 验证码 并传回给页面)      
     *@return: void      
     *@param request
     *@param response
     *@throws ServletException
     *@throws IOException   
     */  
    public void semail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("semail");
		int activeCode=(int) (Math.random()*(999999-100000)+100000);
		 try {
	            //user.getEmail()  ：是注册人的邮件用户名
	            EmailUtil.sendMail(email,activeCode );
	        } catch (MessagingException e) {
	            e.printStackTrace();
	        }
		   	System.out.println(activeCode);
			response.setCharacterEncoding("UTF-8");  
			response.getWriter().print(activeCode);
				
	}
     /**   
     *@Title: uname   
     *@Description: TODO(查询用户名是否存在)      
     *@return: void      
     *@param request
     *@param response
     *@throws ServletException
     *@throws IOException   
     */  
    public  void uname(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 String  res=null;
    	 String uname=request.getParameter("uname");
    	 int count =new UserDaoImp().selectUname(uname);
    	 if (count>0) {
			res="true";
		}else {
			res="false";
		}
    	 response.getWriter().println(res);
	}
    /**   
     *@Title: uemail   
     *@Description: TODO(查询邮箱是否存在)      
     *@return: void      
     *@param request
     *@param response
     *@throws ServletException
     *@throws IOException   
     */  
    public  void uemail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   	 String  res=null;
   	 String uemail=request.getParameter("semail");
   	 int count =new UserDaoImp().selectEmail(uemail);
   	 if (count>0) {
			res="true";
		}else {
			res="false";
		}
   	 response.getWriter().println(res);
	}
    /**   
     *@Title: login   
     *@Description: TODO(用于接收页面传过来的接收数据)      
     *@return: void      
     *@param request
     *@param response
     *@throws ServletException
     *@throws IOException   
     */  
    public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");  
		response.setContentType("application/json; charset=utf-8"); 
		String uname=request.getParameter("uname");
		String  uid= UUID.randomUUID().toString();
		System.out.println(uid);
		String name=request.getParameter("name");
		String pwd=request.getParameter("password");
		String password=MD5.getMD5(pwd);
		String gender=request.getParameter("gender");
		String year=request.getParameter("year");
		String month=request.getParameter("month");
		String day=request.getParameter("day");
		System.out.println("year"+year);
		String birthday=year+"-"+month+"-"+day;
		System.out.println(birthday);
		if ("".equals(year)||"".equals(month)||"".equals(day)) {
			birthday=null;
		}
		System.out.println(birthday);
		String email=request.getParameter("email");
		System.out.println(email);
		UserDaoImp.insert(uid,uname,name, password, gender, birthday, email);
		response.sendRedirect("user/index.jsp");
	}  
    /**   
     *@Title: password   
     *@Description: TODO(修改密码的方法)      
     *@return: void      
     *@param request
     *@param response
     *@throws ServletException
     *@throws IOException   
     */  
    public  void password(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      	 boolean  res=false;
      	 String email=request.getParameter("semail");
      	 String  password1=request.getParameter("opassword");
      	 String password=MD5.getMD5(password1);
      	 int count =new UserDaoImp().updateUname(email, password);
      	 if (count>0) {
   			res=true;
   		}
      	 response.getWriter().println(res);
   	}
	/**
	 * @param request
	 * @param response
	 * @return 查询用户信息 分页
	 * @throws Exception
	 */
	public List<User_info> select(HttpServletRequest request,HttpServletResponse response) throws Exception{
		System.out.println("123");
		String start1=request.getParameter("start")==null?"0":request.getParameter("start");
		String limit=request.getParameter("limit")==null?"0":request.getParameter("limit");
		Integer start=Integer.parseInt(start1);
		Integer  pagesize=Integer.parseInt(limit);
		List<User_info> list=new UserDaoImp().select(start, pagesize);
		List<User_info> list1= new UserDaoImp().selectAll();
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		String json2="{total:"+list1.size()+",rows:"+json+"}";
		response.setContentType("application/json;charset=UTF-8");
		response.getWriter().print(json2);
		return null;
	}

	/**
	 * @param request
	 * @param response
	 * @return  查询所有用户信息
	 * @throws Exception
	 */
	public List<User_info> selectAll(HttpServletRequest request,HttpServletResponse response) throws Exception{
		List<User_info> list1= new UserDaoImp().selectAll();
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list1);
		String json2="{rows:"+json+"}";
		response.setContentType("application/json;charset=UTF-8");
		response.getWriter().print(json2);
		return null;
	}


	/**
	 * @param request
	 * @param response
	 * @return  修改单个用户信息
	 */
	public String update(HttpServletRequest request,HttpServletResponse response){
     String id=request.getParameter("id");
     Integer uid=Integer.parseInt(id);
     String name=request.getParameter("name");
		return  null;
	};
     /**
      *
      *
      * @description: 
      * @param null
      * @return:  删除单个用户信息
      * @author: Cb
      * @time: 2019/9/9 16:09
      */    
	public String delete(HttpServletRequest request,HttpServletResponse response){
      String sid=request.getParameter("id");
		System.out.println(sid+"传值");
      Integer id=Integer.parseInt(sid);
      new UserDaoImp().delete(id);
		return  null;
	};
}	

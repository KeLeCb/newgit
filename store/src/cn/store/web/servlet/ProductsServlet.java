package cn.store.web.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import cn.store.dao.imp.ProductsDaoImp;
import cn.store.entity.Products;
import cn.store.service.PageService;
import cn.store.util.PageBean;
import cn.store.util.UUIDUtil;
import cn.store.web.servlet.base.BaseServlet;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet("/ProductServlet")
public class ProductsServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
       
	/**   
	 * Title: getPro <br> 
	 * Description: 获得全部商品的分页数据<br>    
	 *@return: String      
	 *@param request
	 *@param response
	 *@return
	 *@throws ServletException
	 *@throws IOException   
	 */  
	public String getPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String currentPage=request.getParameter("currentpage");//获取当前页码值
		String pageSize=request.getParameter("pagesize");//获取每一页的记录数
		//获取当前页码为空时，默认第一页数据返回前台
		if(currentPage==null||"".equals(currentPage.trim())) {
			currentPage="1";
		}
		//获取一页记录数为空时，默认记录数为8
		if(pageSize==null||"".equals(pageSize.trim())) {
			pageSize="8";
		}
		int m=Integer.parseInt(currentPage);
		int n=Integer.parseInt(pageSize);
		PageBean<Products> pb=(PageBean<Products>) new PageService().getProSer(new PageBean<>(m, n));
		//写入json
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(pb);
		response.setContentType("application/json;charset=UTF-8");
		response.getWriter().print(json);
		return null;
	}


	
	/**   
	 * Title: getProById <br> 
	 * Description: 通过id查询商品 <br>    
	 *@return: String      
	 *@param request
	 *@param response
	 *@return
	 *@throws ServletException
	 *@throws IOException   
	 */  
	public String getProById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		response.setContentType("application/json;charset=UTF-8");
		String id=request.getParameter("id");
		Products p=new ProductsDaoImp().queryProById(id);
		//json
		ObjectMapper mapper=new ObjectMapper();
		String json = mapper.writeValueAsString(p);
		response.getWriter().println(json);
		return null;
	}
	
	
	/**   
	 * Title: getProById <br> 
	 * Description: 通过所选条件查询商品 <br>    
	 *@return: String      
	 *@param request
	 *@param response
	 *@return
	 *@throws ServletException
	 *@throws IOException   
	 */  
	public String getPros(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String currentPage=request.getParameter("currentpage");//获取当前页码值
		String pageSize=request.getParameter("pagesize");//获取每一页的记录数
		//获取当前页码为空时，默认第一页数据返回前台
		if(currentPage==null||"".equals(currentPage.trim())) {
			currentPage="1";
		}
		//获取一页记录数为空时，默认记录数为8
		if(pageSize==null||"".equals(pageSize.trim())) {
			pageSize="8";
		}
		int m=Integer.parseInt(currentPage);
		int n=Integer.parseInt(pageSize);
		String[] select=request.getParameterValues("select");
		System.out.println(Arrays.toString(select)+"--"+m+"--"+n);
		PageBean<Products> pageBean=(PageBean<Products>) new PageService().getPros(select,new PageBean<Products>(m, n));
		//json
		ObjectMapper mapper=new ObjectMapper();
		String json = mapper.writeValueAsString(pageBean);
		response.setContentType("application/json;charset=UTF-8");
		response.getWriter().println(json);
		return null;
	}
	/**   
	 *@Title: selectproducts   
	 *@Description: TODO("查询所有商品")      
	 *@return: void      
	 *@param request
	 *@param response
	 *@throws ServletException
	 *@throws IOException   
	 */  
	public void selectproducts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Products> lists=new ProductsDaoImp().queryAllPro();
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(lists);
		response.getWriter().println(json);
	}
	


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	/**   
	 *@Title: selectpid   
	 *@Description: TODO(查询单个商品详情)      
	 *@return: void      
	 *@param request
	 *@param response
	 *@throws ServletException
	 *@throws IOException   
	 */  
	public void selectpid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pid=request.getParameter("pid");
		Products pro=new ProductsDaoImp().queryProById(pid);
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(pro);
		response.getWriter().println(json);
	}
	/**   
	 *@Title: selectpid   
	 *@Description: TODO(查询单个商品详情)      
	 *@return: void      
	 *@param request
	 *@param response
	 *@throws ServletException
	 *@throws IOException   
	 */  
	public void selectpid1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pid=request.getParameter("pid");
		Products pro=new ProductsDaoImp().queryProById(pid);
        request.setAttribute("list", pro);
        request.getRequestDispatcher("X-admin/queryproid.jsp").forward(request, response);
	}
	/**   
	 *@Title: add   
	 *@Description: TODO(添加单个商品)      
	 *@return: void      
	 *@param request
	 *@param response
	 *@throws ServletException
	 *@throws IOException   
	 */  
	public void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pid=UUIDUtil.getId();
		String pname=request.getParameter("pname");
		String price1=request.getParameter("price");
		double price=Double.parseDouble(price1);
		/*String image=request.getParameter("image");*/
		String image="X系列_21.png";
		String description=request.getParameter("description");
		String sold_out=request.getParameter("sold_out");
		String sales_volume=request.getParameter("sales_volume");
		String inventory=request.getParameter("inventory");
		String cid=request.getParameter("cid");
		Products pro=new Products(pid, pname, price, image, description, null, sold_out, sales_volume, inventory, cid);
	    int i=new ProductsDaoImp().addPro(pro);
	    if (i>0) {
			response.sendRedirect("X-admin/cate2.jsp");
		}
	}
	/**   
	 *@Title: delete   
	 *@Description: TODO(删除单个商品)      
	 *@return: void      
	 *@param request
	 *@param response
	 *@throws ServletException
	 *@throws IOException   
	 */  
	public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pid= request.getParameter("pid");
		new ProductsDaoImp().deletePro(pid);
		response.sendRedirect("X-admin/cate2.jsp");
	}
	
	/**   
	 *@Title: update   
	 *@Description: TODO(修改单个商品)      
	 *@return: void      
	 *@param request
	 *@param response
	 *@throws ServletException
	 *@throws IOException   
	 */  
	public void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("update");
		String pid=request.getParameter("pid");
		String pname=request.getParameter("pname");
		String price1=request.getParameter("price");
		double price=Double.parseDouble(price1);
		String image=request.getParameter("image");
		String description=request.getParameter("description");
		String time1=request.getParameter("time");
		String time2=time1.substring(0,19);
		System.out.println(time2);
		Date time = null;	
			try {
				 time = new SimpleDateFormat("yyyy-MM-dd HH：mm：ss").parse(time2);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		String sold_out=request.getParameter("sold_out");
		String sales_volume=request.getParameter("sales_volume");
		String inventory=request.getParameter("inventory");
		String cid=request.getParameter("cid");
		Products pro=new Products(pid, pname, price, image, description, time, sold_out, sales_volume, inventory, cid);
	    int i=new ProductsDaoImp().updatePro(pro);
	    if (i>0) {
			response.sendRedirect("X-admin/cate2.jsp");
		}
	}
	
}

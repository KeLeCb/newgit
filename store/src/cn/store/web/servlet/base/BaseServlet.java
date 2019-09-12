package cn.store.web.servlet.base;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BaseServlet
 */
@WebServlet("/base")
public class BaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//1.获取方法的名字
			String mName=request.getParameter("method");
			if (mName==null|| mName.trim().length()==0) {
				mName="index";
			}
			//2反射获得方法
			Method method=this.getClass().getDeclaredMethod(mName, HttpServletRequest.class,HttpServletResponse.class);
		
			//3执行 方法ֵ
			String path=(String) method.invoke(this, request,response);
			
			//4如果方法返回的页面就跳转
			if (path !=null) {
				request.getRequestDispatcher(path).forward(request, response);
			}
		
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		} 
	}

}

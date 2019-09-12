package cn.store.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import cn.store.dao.imp.HotDaoImp;
import cn.store.entity.Products;

/**
 * Servlet implementation class hotServlet
 */
@WebServlet("/hotServlet")
public class hotServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Products> lists=new HotDaoImp().query();
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(lists);
		response.getWriter().println(json);
	}


}

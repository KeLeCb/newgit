/**
 * 
 */
package cn.store.dao.imp;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;

import cn.store.dao.ProductsDao;
import cn.store.entity.Order_items;
import cn.store.entity.Products;
import cn.store.util.JdbcUtil;
import cn.store.util.PageBean;
import cn.store.util.UUIDUtil;

/**
 * ClassName: ProductsImp <br>
 * Description: 商品dao实现类 <br>
 * 
 * @author Administrator
 * @date 2019年3月20日 下午4:28:05
 */
public class ProductsDaoImp implements ProductsDao {
	private static QueryRunner qr = new QueryRunner();
	private static Connection conn = null;

	/*
	 * (non-Javadoc)
	 * 查看全部商品
	 * @see cn.store.dao.Products#queryAllPro()
	 */
	
	@Override
	public List<Products> queryAllPro() {
		List<Products> list = new ArrayList<Products>();
		conn = JdbcUtil.getConnecion();
		String sql = "select * from products";
		try {
			list = qr.query(conn, sql, new BeanListHandler<Products>(Products.class));
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.closeConnection(conn);
		}
		return list;
	}

	/*
	 * (non-Javadoc)
	 * 根据销量查询前3个显示在首页
	 * @see cn.store.dao.ProductsDao#getPro(cn.store.util.PageBean)
	 */
	@Override
	public List<Products> getPro(int m, int n) {
		List<Products> list = new ArrayList<Products>();
		conn = JdbcUtil.getConnecion();
		String sql = "select * from products limit ?,?";
		try {
			list = qr.query(conn, sql, new BeanListHandler<Products>(Products.class), m, n);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.closeConnection(conn);
		}
		return list;
	}
	
	/* (non-Javadoc)
	 * 根据id查询
	 * @see cn.store.dao.ProductsDao#queryProById(int)
	 */
	@Override
	public Products queryProById(String  id)  {
		Products  products=new Products();
		String sql="select * from products where pid=? limit 1";
		try {
			if (conn==null||conn.isClosed()) {
				conn=JdbcUtil.getConnecion();
			}
			products=qr.query(conn, sql, new BeanHandler<Products>(Products.class),id);
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return products;
	}
	
	/**   
	 * Title: proToItem <br> 
	 * Description: 商品生产订单项 <br>    
	 *@return: Order_items      
	 *@param id
	 *@param quantity
	 *@return   
	 */  
	public List<Map<String, Object>> proToItem(String  id,String quantity) {
		List<Map<String, Object>> list=new ArrayList<>();
		try {
			if (conn==null||conn.isClosed()) {
				conn=JdbcUtil.getConnecion();
			}
			String sql="select pid,pname,price from products where pid=? limit 1";
			list= qr.query(conn, sql, new MapListHandler(),id);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return list;
	}
	
	
	
	/**   
	 * Title: queryProByIds <br> 
	 * Description: 查询多个商品 <br>    
	 *@return: List<Products>      
	 *@param id
	 *@return   
	 */  
	public List<Products> queryProByIds(List<String> id) {
		List<Products>  list=new ArrayList<>();
		conn=JdbcUtil.getConnecion();
		String s=null;
		if (id.size()>1) {
			for(int i=0;i<id.size();i++) {
				if(i==0) {
					s="(?,";
				}else if (i==id.size()-1){
					s=s+" ?)";
				}else {
					s=s+" ?,";
				}
			}
		}else {
			s="( ? )";
		}
		String sql="select * from products where pid in "+s;
		System.out.println(sql);
		try {
			String[] param=new String[id.size()];
			for (int i = 0; i < param.length; i++) {
				param[i]=id.get(i);
			}
			list=qr.query(conn, sql, new BeanListHandler<Products>(Products.class),param);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.closeConnection(conn);
		}
		return list;
	}
	
	/*
	 * (non-Javadoc)
	 * 
	 * @see cn.store.dao.ProductsDao#getPros(java.lang.String[])
	 * 商品分页成列
	 */
	@Override
	public PageBean<Products> getPros(String[] select,PageBean<Products> pb) {
		conn = JdbcUtil.getConnecion();
		int m=pb.getPageStartIndex();
		int n=pb.getPageSize();
		int totalRecold=0;
		String cname = select[0];// 系列
		String price3 = select[1];// 价格
		String pname = select[2] + "+";// 运行内存
		List<Products> list = new ArrayList<Products>();
		String sql = "select * from products where 1=1 ";
		// 条件 内存
		if (select[0].equals("全部") && select[1].equals("全部") && !select[2].equals("全部")) {
			sql += "and  pname like ?";
			try {
				totalRecold = qr.query(conn, sql, new BeanListHandler<Products>(Products.class), "%" + pname + "%").size();
				sql+="limit ?,?";
				list=qr.query(conn, sql, new BeanListHandler<Products>(Products.class), "%" + pname + "%",m,n);
				System.out.println(list);
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JdbcUtil.closeConnection(conn);
			}

		}
		// 条件 价格
		if (select[0].equals("全部") && select[2].equals("全部") && !select[1].equals("全部")) {
			sql += "and  price between ? and ?";
			if (!price3.equals("全部")) {
				try {
					if (price3.contains("-")) {
						String[] price4 = price3.split("-");
						double price1 = Double.parseDouble(price4[0]);
						double price2 = Double.parseDouble(price4[1]);
						totalRecold = qr.query(conn, sql, new BeanListHandler<Products>(Products.class), price1, price2).size();
						sql+="limit ?,?";
						list= qr.query(conn, sql, new BeanListHandler<Products>(Products.class), price1, price2,m,n);
						System.out.println(list);
					}else {
						//处理4000以上
						String price1=price3.substring(price3.length()-2);
						double price=Double.parseDouble(price3.split(price1)[0]);
						System.out.println(sql);
						totalRecold = qr.query(conn, sql, new BeanListHandler<Products>(Products.class), price,9999).size();
						sql+=" limit ?,?";
						list= qr.query(conn, sql, new BeanListHandler<Products>(Products.class),price,9999,m,n);
						System.out.println(list);
						
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					JdbcUtil.closeConnection(conn);
				}
			}
		}
		// 条件 系列
		if (select[1].equals("全部") && select[2].equals("全部") && !select[0].equals("全部")) {
			sql +="and cid=(SELECT cid from  classify where cname=?)";
			try {
				totalRecold = qr.query(conn, sql, new BeanListHandler<Products>(Products.class), cname).size();
				sql+="limit ?,?";
				list=qr.query(conn, sql, new BeanListHandler<Products>(Products.class), cname,m,n);
				System.out.println(list);
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JdbcUtil.closeConnection(conn);
			}
		}
		// 系列内存
		if (!select[0].equals("全部") && select[1].equals("全部") && !select[2].equals("全部")) {
			sql += "and  cid=(select cid from  classify where cname=?) and pname like ?";
			try {
				totalRecold = qr.query(conn, sql, new BeanListHandler<Products>(Products.class), cname, "%" + pname + "%").size();
				sql+="limit ?,?";
				list=qr.query(conn, sql, new BeanListHandler<Products>(Products.class), cname, "%" + pname + "%",m,n);
				System.out.println(list);
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JdbcUtil.closeConnection(conn);
			}
		}
		// 系列价格
		if (!select[0].equals("全部") && !select[1].equals("全部") && select[2].equals("全部")) {
			sql += "and  price between ? and ? and  cid=(select cid from  classify where cname=?)";
			if (!price3.equals("全部")) {
				try {
					if (price3.contains("-")) {
						String[] price4 = price3.split("-");
						double price1 = Double.parseDouble(price4[0]);
						double price2 = Double.parseDouble(price4[1]);
						totalRecold = qr.query(conn, sql, new BeanListHandler<Products>(Products.class), price1, price2, cname).size();
						sql+="limit ?,?";
						list=qr.query(conn, sql, new BeanListHandler<Products>(Products.class), price1, price2, cname,m,n);
						System.out.println(list);
					}else {
						//处理4000以上
						String price1=price3.substring(price3.length()-2);
						double price=Double.parseDouble(price3.split(price1)[0]);
						totalRecold = qr.query(conn, sql, new BeanListHandler<Products>(Products.class),price,9999, cname ).size();
						sql+="limit ?,?";
						list= qr.query(conn, sql, new BeanListHandler<Products>(Products.class),price,9999, cname,m,n);
						System.out.println(list);
						
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					JdbcUtil.closeConnection(conn);
				}
			}
		}
		// 系列价格内存
		if (!select[0].equals("全部") && !select[1].equals("全部") && !select[2].equals("全部")) {
			sql += "and  price between ? and ? and  cid=(select cid from  classify where cname=?) and pname like ?";
			if (!price3.equals("全部")) {
				try {
					if (price3.contains("-")) {
						String[] price4 = price3.split("-");
						double price1 = Double.parseDouble(price4[0]);
						double price2 = Double.parseDouble(price4[1]);
						totalRecold = qr.query(conn, sql, new BeanListHandler<Products>(Products.class), price1, price2, cname,
								"%" + pname + "%").size();
						sql+="limit ?,?";
						list=qr.query(conn, sql, new BeanListHandler<Products>(Products.class), price1, price2, cname,
								"%" + pname + "%",m,n);
						System.out.println(list);
					}else {
						//处理4000以上
						String price1=price3.substring(price3.length()-2);
						double price=Double.parseDouble(price3.split(price1)[0]);
						totalRecold = qr.query(conn, sql, new BeanListHandler<Products>(Products.class),price,9999, cname,
								"%" + pname + "%").size();
						sql+="limit ?,?";
						list=qr.query(conn, sql, new BeanListHandler<Products>(Products.class),price,9999, cname,
								"%" + pname + "%",m,n);
						System.out.println(list);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					JdbcUtil.closeConnection(conn);
				}
			}
		}
		// 内存价格
		if (select[0].equals("全部") && !select[1].equals("全部") && !select[2].equals("全部")) {
			sql += "and  price between ? and ? and  pname like ?";
			if (!price3.equals("全部")) {
				try {
					if (price3.contains("-")) {
						String[] price4 = price3.split("-");
						double price1 = Double.parseDouble(price4[0]);
						double price2 = Double.parseDouble(price4[1]);
						totalRecold = qr.query(conn, sql, new BeanListHandler<Products>(Products.class), price1, price2,
								"%" + pname + "%").size();
						sql+="limit ?,?";
						list=qr.query(conn, sql, new BeanListHandler<Products>(Products.class), price1, price2,
								"%" + pname + "%",m,n);
						System.out.println(list);
					}else {
						//处理4000以上
						String price1=price3.substring(price3.length()-2);
						double price=Double.parseDouble(price3.split(price1)[0]);
						totalRecold = qr.query(conn, sql, new BeanListHandler<Products>(Products.class),price,9999,
								"%" + pname + "%").size();
						sql+="limit ?,?";
						list=qr.query(conn, sql, new BeanListHandler<Products>(Products.class),price,9999,
								"%" + pname + "%",m,n);
						System.out.println(list);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					JdbcUtil.closeConnection(conn);
				}
			}
		}
		//设置分页的总记录数
		pb.setTotalRecold(totalRecold);
		//设置当页的数据
		pb.setData(list);
		return pb;
	}
	

	/* (non-Javadoc)
	 * @see cn.store.dao.ProductsDao#deletePro(java.lang.String)
	 * 删除单个商品
	 */
	@Override
	public void deletePro(String pid) {
		String sql="delete from products where pid=?";
		conn=JdbcUtil.getConnecion();
		try {
			qr.update(conn, sql, pid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JdbcUtil.closeConnection(conn);
		}
	}
    
	/* (non-Javadoc)
	 * @see cn.store.dao.ProductsDao#updatePro(cn.store.entity.Products)
	 * 修改商品信息
	 */
	@Override
	public int updatePro(Products pro) {
		int i=0;
		String sql="update products set pname=?,price=?,image=?,description=?,time=?,sold_out=?,sales_volume=?,inventory=?,cid=? where pid=?";
		conn=JdbcUtil.getConnecion();
		try {
			i=qr.update(conn, sql,pro.getPname(),pro.getPrice(),pro.getImage(),pro.getDescription(),pro.getTime(),pro.getSold_out(),pro.getSales_volume(),pro.getInventory(),pro.getCid(),pro.getPid());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
   
	/* (non-Javadoc)
	 * @see cn.store.dao.ProductsDao#addPro(cn.store.entity.Products)
	 * 添加商品
	 */
	@Override
	public int addPro(Products pro) {
		int i=0;
		conn=JdbcUtil.getConnecion();
		String sql="insert into products(pid,pname,price,image,description,time,sold_out,sales_volume,inventory,cid) values(?,?,?,?,?,now(),?,?,?,?)";
		try {
			 i=qr.update(conn, sql,pro.getPid(),pro.getPname(),pro.getPrice(),pro.getImage(),pro.getDescription(),pro.getSold_out(),pro.getSales_volume(),pro.getInventory(),pro.getCid());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
}

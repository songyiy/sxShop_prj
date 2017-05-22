package com.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dao.TCatelogDAO;
import com.dao.TGoodsDAO;
import com.dao.TOrderDAO;
import com.dao.TOrderItemDAO;
import com.model.TGoods;
import com.model.TOrder;
import com.model.TOrderItem;
import com.model.TUser;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Cart;

public class buyAction extends ActionSupport
{
	private Integer id;
	private String bianhao;
	private String xiadanshi;
	private String userName;
	
	private String userRealname;
	private String userTel;
	private String songhuodizhi;
	private String fukuanfangshi;
	
	private int jine;
	private String zhuangtai;
	private Integer userId;
	
	private TGoodsDAO goodsDAO;
	private TOrderDAO orderDAO;
	private TOrderItemDAO orderItemDAO;
	
	private String message;
	private String path;
	
	public String addToCart()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		int goodsId=Integer.parseInt(request.getParameter("goodsId"));
		int quantity=Integer.parseInt(request.getParameter("quantity"));
		
		TGoods goods=goodsDAO.findById(goodsId);
		
		TOrderItem orderItem=new TOrderItem();
		orderItem.setGoods(goods);
		orderItem.setGoodsQuantity(quantity);
		
		Map session= ServletActionContext.getContext().getSession();
		Cart cart = (Cart)session.get("cart");
		cart.addGoods(goodsId, orderItem);
		session.put("cart",cart);
		//this.setMessage("");
		this.setPath("myCart.action");
		return "succeed";
	}
	
	
	
	public String myCart()
	{
		return ActionSupport.SUCCESS;
	}
	
	
	public String orderQueren()
	{
		Map request=(Map)ServletActionContext.getContext().get("request");
		
		return ActionSupport.SUCCESS;
	}
	
	
	public String orderSubmit()
	{
		Map session= ServletActionContext.getContext().getSession();
		Cart cart = (Cart)session.get("cart");
		TUser user=(TUser)session.get("user");
		
		TOrder order=new TOrder();
		
		//order.setId(id);
		order.setBianhao(new SimpleDateFormat("yyyyMMddhhmmss").format(new Date()));
		order.setXiadanshi(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date()));
		order.setUserName(userName);
		
		order.setUserRealname(userRealname);
		order.setUserTel(userTel);
		order.setSonghuodizhi(songhuodizhi);
		order.setFukuanfangshi(fukuanfangshi);
		
		order.setJine(cart.getTotalPrice());
	    order.setZhuangtai("未受理");
	    order.setUserId(user.getUserId());
		
		orderDAO.save(order);
		
		for (Iterator it = cart.getItems().values().iterator(); it.hasNext();)
		{

			TOrderItem orderItem = (TOrderItem) it.next();
			orderItem.setOrderId(order.getId());
			orderItem.setGoodsId(orderItem.getGoods().getGoodsId());
			//goodsDAO.getHibernateTemplate().bulkUpdate("update TGoods set goodsKucun=goodsKucun-"+orderItem.getGoodsQuantity() +" where goodsId="+orderItem.getGoods().getGoodsId());
			orderItemDAO.save(orderItem);
		}
		
		cart.getItems().clear();
		session.put("cart", cart);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("order", order);
		
		return ActionSupport.SUCCESS;
		
	}
	
	
	
	public String myOrder()
	{
		Map session= ServletActionContext.getContext().getSession();
		TUser user=(TUser)session.get("user");
		
		String sql="from TOrder where userId="+user.getUserId();
		List orderList=orderDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("orderList", orderList);
		
		return ActionSupport.SUCCESS;
	}
	
	
	public String orderMana()
	{
		String sql="from TOrder order by xiadanshi desc";
		List orderList=orderDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("orderList", orderList);
		return ActionSupport.SUCCESS;
	}
	
	
	public String orderDel()//用户自己删除订单
	{
		TOrder order=orderDAO.findById(id);
		orderDAO.delete(order);
		
		
		Map session= ServletActionContext.getContext().getSession();
		TUser user=(TUser)session.get("user");
		
		this.setMessage("删除成功");
		this.setPath("myOrder.action?userId="+user.getUserId());
		return "succeed";
	}
	
	public String orderDelByAd()//管理员删除订单
	{
		TOrder order=orderDAO.findById(id);
		orderDAO.delete(order);
		
		String sql="delete from TOrderItem where orderId="+order.getId();
		orderItemDAO.getHibernateTemplate().bulkUpdate(sql);
		
		this.setMessage("删除成功");
		this.setPath("orderMana.action");
		return "succeed";
	}
	
	
	public String orderShouli()
	{
		TOrder order=orderDAO.findById(id);
		order.setZhuangtai("已受理");//已经受理订单
		orderDAO.attachDirty(order);
		this.setMessage("受理订单成功");
		this.setPath("orderMana.action");
		return "succeed";
	}
	
	
	
	public String orderDetail()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		int orderId=Integer.parseInt(request.getParameter("orderId"));
		
		String sql="from TOrderItem where orderId="+orderId;
		List orderItemList=orderItemDAO.getHibernateTemplate().find(sql);
		for(int i=0;i<orderItemList.size();i++)
		{
			TOrderItem orderItem=(TOrderItem)orderItemList.get(i);
			orderItem.setGoods(goodsDAO.findById(orderItem.getGoodsId()));
		}
		request.setAttribute("orderItemList", orderItemList);
		return ActionSupport.SUCCESS;
	}
	
	
	
	/*public String caiwuMana()
	{
		String sql="from TOrder";
		List orderList=orderDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("orderList", orderList);
		return ActionSupport.SUCCESS;
	}
	
	public String caiwuTongji()
	{
		HttpServletRequest request1=ServletActionContext.getRequest();
		String shijian_sta=request1.getParameter("shijian_sta");
		String shijian_end=request1.getParameter("shijian_end");
		
		String sql="from TOrder where orderDate >=? and orderDate<=?";
		Object[] o={shijian_sta,shijian_end};
		List orderList=orderDAO.getHibernateTemplate().find(sql,o);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("orderList", orderList);
		return ActionSupport.SUCCESS;
	}*/
	
	
	
	public String testCart()
	{
		Map session= ServletActionContext.getContext().getSession();
		Cart cart = (Cart)session.get("cart");
		Map items=cart.getItems();
		
		for (Iterator it = items.values().iterator(); it.hasNext();)
		{

			TOrderItem orderItem = (TOrderItem) it.next();
			TGoods goods = orderItem.getGoods();
			System.out.println(goods.getGoodsName()+"：苗圃名称");
			int quantity = orderItem.getGoodsQuantity();
			System.out.println(quantity+"：苗圃数量");
			System.out.println("--------------------------------------------------");
			
		}
		return null;
	}



	public TGoodsDAO getGoodsDAO() {
		return goodsDAO;
	}



	public void setGoodsDAO(TGoodsDAO goodsDAO) {
		this.goodsDAO = goodsDAO;
	}



	public TOrderDAO getOrderDAO() {
		return orderDAO;
	}



	public void setOrderDAO(TOrderDAO orderDAO) {
		this.orderDAO = orderDAO;
	}



	public TOrderItemDAO getOrderItemDAO() {
		return orderItemDAO;
	}



	public void setOrderItemDAO(TOrderItemDAO orderItemDAO) {
		this.orderItemDAO = orderItemDAO;
	}



	public String getMessage() {
		return message;
	}



	public void setMessage(String message) {
		this.message = message;
	}



	public String getPath() {
		return path;
	}



	public Integer getId() {
		return id;
	}



	public void setId(Integer id) {
		this.id = id;
	}



	public String getBianhao() {
		return bianhao;
	}



	public void setBianhao(String bianhao) {
		this.bianhao = bianhao;
	}



	public String getXiadanshi() {
		return xiadanshi;
	}



	public void setXiadanshi(String xiadanshi) {
		this.xiadanshi = xiadanshi;
	}



	public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
	}



	public String getUserRealname() {
		return userRealname;
	}



	public void setUserRealname(String userRealname) {
		this.userRealname = userRealname;
	}



	public String getUserTel() {
		return userTel;
	}



	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}



	public String getSonghuodizhi() {
		return songhuodizhi;
	}



	public void setSonghuodizhi(String songhuodizhi) {
		this.songhuodizhi = songhuodizhi;
	}





	public String getFukuanfangshi() {
		return fukuanfangshi;
	}



	public void setFukuanfangshi(String fukuanfangshi) {
		this.fukuanfangshi = fukuanfangshi;
	}



	public int getJine() {
		return jine;
	}



	public void setJine(int jine) {
		this.jine = jine;
	}



	public String getZhuangtai() {
		return zhuangtai;
	}



	public void setZhuangtai(String zhuangtai) {
		this.zhuangtai = zhuangtai;
	}



	public Integer getUserId() {
		return userId;
	}



	public void setUserId(Integer userId) {
		this.userId = userId;
	}



	public void setPath(String path) {
		this.path = path;
	}
	
}

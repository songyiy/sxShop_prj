package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TXinwenDAO;
import com.model.TXinwen;
import com.opensymphony.xwork2.ActionSupport;

public class xinwenAction extends ActionSupport
{
	private Integer id;
	private String biaoti;
	private String neirong;
	private String fujian;
	
	private String shijian;
	
	private TXinwenDAO xinwenDAO;
	
	
	public String xinwenAdd()
	{
		TXinwen xinwen=new TXinwen();
		
		//xinwen.setId(id);
		xinwen.setBiaoti(biaoti);
		xinwen.setNeirong(neirong);
		xinwen.setFujian((fujian.equals("")?"/img/zanwu.jpg":fujian));
		xinwen.setShijian(shijian);
		
		xinwenDAO.save(xinwen);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "��Ϣ��ӳɹ�");
		
		return "msg";
	}
	
	public String xinwenMana()
	{
		String sql = "from TXinwen";
		List xinwenList=xinwenDAO.getHibernateTemplate().find(sql);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("xinwenList", xinwenList);
		return ActionSupport.SUCCESS;
	}	
	
	
	
	public String xinwenDel()
	{
		TXinwen xinwen=xinwenDAO.findById(id);
		xinwenDAO.delete(xinwen);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "��Ϣɾ���ɹ�");
		return "msg";
	}
	
	public String xinwenAll()
	{
		String sql = "from TXinwen order by shijian desc";
		List xinwenList=xinwenDAO.getHibernateTemplate().find(sql);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("xinwenList", xinwenList);
		return ActionSupport.SUCCESS;
	}	
	
	
	public String xinwenDetailQian()
	{
		TXinwen xinwen=xinwenDAO.findById(id);
		Map request=(Map)ServletActionContext.getContext().get("request");
		
		
		request.put("xinwen", xinwen);
		return ActionSupport.SUCCESS;
	}

	public Integer getId()
	{
		return id;
	}

	public void setId(Integer id)
	{
		this.id = id;
	}


	public String getBiaoti()
	{
		return biaoti;
	}

	public void setBiaoti(String biaoti)
	{
		this.biaoti = biaoti;
	}

	public String getNeirong()
	{
		return neirong;
	}

	public void setNeirong(String neirong)
	{
		this.neirong = neirong;
	}

	public String getFujian() {
		return fujian;
	}

	public void setFujian(String fujian) {
		this.fujian = fujian;
	}

	public String getShijian()
	{
		return shijian;
	}

	public void setShijian(String shijian)
	{
		this.shijian = shijian;
	}

	public TXinwenDAO getXinwenDAO()
	{
		return xinwenDAO;
	}

	public void setXinwenDAO(TXinwenDAO xinwenDAO)
	{
		this.xinwenDAO = xinwenDAO;
	}


}

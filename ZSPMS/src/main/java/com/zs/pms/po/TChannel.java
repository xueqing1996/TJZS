package com.zs.pms.po;

import java.io.Serializable;

public class TChannel implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2017797701798209722L;
	private int id;
	private String cname;
	private int pid;
	private int lev;
	private int isleaf;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getLev() {
		return lev;
	}
	public void setLev(int lev) {
		this.lev = lev;
	}
	public int getIsleaf() {
		return isleaf;
	}
	public void setIsleaf(int isleaf) {
		this.isleaf = isleaf;
	}
	
}

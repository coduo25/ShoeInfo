package net.brand.db;

public class BrandReqDTO {

	private int req_num;
	private String req_brandName;
	private String req_brandURL;
	private String req_status;
	private String req_member;
	
	public int getReq_num() {
		return req_num;
	}
	public void setReq_num(int req_num) {
		this.req_num = req_num;
	}
	public String getReq_brandName() {
		return req_brandName;
	}
	public void setReq_brandName(String req_brandName) {
		this.req_brandName = req_brandName;
	}
	public String getReq_brandURL() {
		return req_brandURL;
	}
	public void setReq_brandURL(String req_brandURL) {
		this.req_brandURL = req_brandURL;
	}
	public String getReq_status() {
		return req_status;
	}
	public void setReq_status(String req_status) {
		this.req_status = req_status;
	}
	public String getReq_member() {
		return req_member;
	}
	public void setReq_member(String req_member) {
		this.req_member = req_member;
	}

}

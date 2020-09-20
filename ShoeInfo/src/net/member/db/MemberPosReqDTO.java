package net.member.db;

import java.sql.Timestamp;

public class MemberPosReqDTO {
	
	private int req_num;
	private String req_email;
	private String req_name;
	private String req_reason;
	private Timestamp req_time;
	
	public int getReq_num() {
		return req_num;
	}
	public void setReq_num(int req_num) {
		this.req_num = req_num;
	}
	public String getReq_email() {
		return req_email;
	}
	public void setReq_email(String req_email) {
		this.req_email = req_email;
	}
	public String getReq_name() {
		return req_name;
	}
	public void setReq_name(String req_name) {
		this.req_name = req_name;
	}
	public String getReq_reason() {
		return req_reason;
	}
	public void setReq_reason(String req_reason) {
		this.req_reason = req_reason;
	}
	public Timestamp getReq_time() {
		return req_time;
	}
	public void setReq_time(Timestamp req_time) {
		this.req_time = req_time;
	}
	
}

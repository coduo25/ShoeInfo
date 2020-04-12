package net.admin.action;

public class ActionForward {

	//페이지 이동시마다 이동정보를 저장 객체
	//(이동할 페이지 주소, 이동할 방식)
	
	private String path; 		//이동할 페이지 주소
	private boolean isRedirect; //이동할 방식
	//true  -> sendRedirect 방식 이동 (편재 페이지 주소도 바뀌고 내용도 바껴야 할때)
	//false -> forward 이동 (현재 페이지 주소는 그대로지만 내용은 바껴야 할때)
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	
	
	
	
}

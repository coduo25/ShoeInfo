package net.member.action;

public class ActionForward {

	//������ �̵��ø��� �̵������� ���� ��ü
	//(�̵��� ������ �ּ�, �̵��� ���)
	
	private String path; 		//�̵��� ������ �ּ�
	private boolean isRedirect; //�̵��� ���
	// true 	-> sendRedirect �̵�
	// false 	-> forward �̵�
	
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

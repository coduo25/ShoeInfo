package net.admin.action;

public class ActionForward {

	//������ �̵��ø��� �̵������� ���� ��ü
	//(�̵��� ������ �ּ�, �̵��� ���)
	
	private String path; 		//�̵��� ������ �ּ�
	private boolean isRedirect; //�̵��� ���
	//true  -> sendRedirect ��� �̵� (���� ������ �ּҵ� �ٲ�� ���뵵 �ٲ��� �Ҷ�)
	//false -> forward �̵� (���� ������ �ּҴ� �״������ ������ �ٲ��� �Ҷ�)
	
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

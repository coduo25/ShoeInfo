package net.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql="";
	
	// ��� ����(Ŀ�ؼ� Ǯ ���)
	private Connection getConnection() throws Exception{
		// Context ��ü�� ����
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/shoeinfo");
		con = ds.getConnection();
		return con;
	}
	
	// �ڿ� ���� 
	public void closeDB(){
		try {
			if(rs !=null) rs.close();
			if(pstmt !=null) pstmt.close();
			if(con !=null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//ȸ�� �߰��ϴ� �Լ�
	public void insertMember(MemberDTO mdto){
		try {
			con = getConnection();
			sql = "insert into shoeinfo_member(id, pass, name, email, phone, entry_comp, reg_date) values(?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mdto.getId());
			pstmt.setString(2, mdto.getPass());
			pstmt.setString(3, mdto.getName());
			pstmt.setString(4, mdto.getEmail());
			pstmt.setString(5, mdto.getPhone());
			pstmt.setString(6, null);
			pstmt.setTimestamp(7, mdto.getReg_date());
			
			pstmt.executeUpdate();
			
			System.out.println("ȸ�� ���� �Ϸ�!");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	
	//���̵� üũ �ϴ� �Լ�
	public int idCheck(String id, String pass){
		int check = -1;
		try {
			con = getConnection();
			sql = "select pass from shoeinfo_member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();			

			if(rs.next()){
               if(pass.equals(rs.getString("pass"))){
            	   check = 1;            	   
               }else{
            	   check=0;
               }
			}else{
				check = -1;
			}
			//System.out.println(" ���̵� üũ �Ϸ� : "+check);			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}	
		return check;
	}
	
	//ȸ�� ���� ���� �߰��ϴ� �Լ�
	public void insertUserDrawInfo(MemberDrawDTO mddto){
		int userDraw_num = 0;
		int userDraw_count = 0;
		try {
			con = getConnection();
			sql = "select Max(userDraw_num) from shoeinfo_memberdrawinfo";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				userDraw_num = rs.getInt(1) + 1;
			}
			sql = "select Max(draw_count) from shoeinfo_memberdrawinfo where member_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mddto.getMember_id());
			rs = pstmt.executeQuery();
			if(rs.next()){
				userDraw_count = rs.getInt(1) + 1;
			}
			sql = "insert into shoeinfo_memberdrawinfo values(?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userDraw_num);
			pstmt.setString(2, mddto.getMember_id());
			pstmt.setString(3, mddto.getModel_stylecode());
			pstmt.setString(4, mddto.getBrand_id());
			pstmt.setInt(5, userDraw_count);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	
	//������� ���� ���� �ҷ����� �Լ�
	public ArrayList<String> searchDrawBrandInfo(String user, String model_stylecode) {
		ArrayList<String> userDrawBrandList = new ArrayList();
		try {
			con = getConnection();
			sql = "select distinct brand_id from shoeinfo_memberdrawinfo where member_id = ? AND model_stylecode = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user);
			pstmt.setString(2, model_stylecode);
			rs = pstmt.executeQuery();
			while(rs.next()){
				userDrawBrandList.add(rs.getString("brand_id"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return userDrawBrandList;
	}
	

	
	
}

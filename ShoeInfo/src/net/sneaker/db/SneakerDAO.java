package net.sneaker.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class SneakerDAO {
	
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
	
	
	//���ο� �Ź����� �߰��ϴ� �Լ�
	public void insertSneaker(SneakerDTO sdto) {
		try {
			con = getConnection();
			sql = "insert into shoeinfo_sneakerlibrary values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sdto.getBrand());
			pstmt.setString(2, sdto.getSub_brand());
			pstmt.setString(3, sdto.getBrand_index());
			pstmt.setString(4, sdto.getImage());
			pstmt.setString(5, sdto.getModel_stylecode());
			pstmt.setString(6, sdto.getModel_name());
			pstmt.setString(7, sdto.getModel_colorway());
			pstmt.setInt(8, sdto.getPrice());
			pstmt.setString(9, sdto.getRelease_date());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	
	//�Ź����� ����Ʈ�� �������� �Լ�(������)
	public ArrayList getSneakerList(String date) {
		ArrayList<SneakerDTO> sneakerList = new ArrayList<SneakerDTO>();
		try {
			con = getConnection();
			sql = "select * from shoeinfo_sneakerlibrary where release_date like ? order by release_date";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, date);
			rs = pstmt.executeQuery();
			while(rs.next()){
				SneakerDTO sdto = new SneakerDTO();
				sdto.setBrand(rs.getString("brand"));
				sdto.setSub_brand(rs.getString("sub_brand"));
				sdto.setBrand_index(rs.getString("brand_index"));
				sdto.setImage(rs.getString("image"));
				sdto.setModel_stylecode(rs.getString("model_stylecode"));
				sdto.setModel_name(rs.getString("model_name"));
				sdto.setModel_colorway(rs.getString("model_colorway"));
				sdto.setPrice(rs.getInt("price"));
				sdto.setRelease_date(rs.getString("release_date"));				
				sneakerList.add(sdto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return sneakerList;
	}
	
	//�Ź� ������ �������� �Լ�
	public SneakerDTO getSneakerDetail(String model_stylecode) {
		SneakerDTO sdto = null;
		try {
			con = getConnection();
			sql = "select * from shoeinfo_sneakerlibrary where model_stylecode = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, model_stylecode);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				//�Ź��� ������
				sdto = new SneakerDTO();
				sdto.setImage(rs.getString("image"));
				sdto.setModel_name(rs.getString("model_name"));
				sdto.setModel_colorway(rs.getString("model_colorway"));
				sdto.setModel_stylecode(rs.getString("model_stylecode"));
				sdto.setPrice(rs.getInt("price"));
				sdto.setRelease_date(rs.getString("release_date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return sdto;
	}


}

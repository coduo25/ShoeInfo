package net.online.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.brand.db.BrandDTO;

public class OnlineDAO {
	
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
	
	//�Ź� �¶��� ���� �����ϴ� �Լ�
	public void insertOnlineInfo(OnlineDTO odto) {
		int online_num = 0;
		try {
			con = getConnection();
			//draw_num ���
			sql = "select max(online_num) from shoeinfo_onlineinfo";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				online_num = rs.getInt(1) + 1;
			}
			sql = "insert into shoeinfo_onlineinfo values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, online_num);
			pstmt.setString(2, odto.getModel_stylecode());
			pstmt.setString(3, odto.getCountry_region());
			pstmt.setString(4, odto.getCountry_name());
			pstmt.setString(5, odto.getBrand_id());
			pstmt.setString(6, odto.getOnline_link());
			pstmt.setString(7, odto.getOnline_start_time());
			pstmt.setString(8, odto.getOnline_end_time());
			pstmt.setString(9, odto.getOnline_result_time());
			pstmt.setString(10, odto.getOnline_method());
			pstmt.setString(11, odto.getDelivery_method());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	
	//���ѹα� �Ź� �¶��� ���� �������� �Լ�(�귣�� ���� + �¶��� ����)
	public Vector getOnlineInfo_kr(String model_stylecode) {
		Vector vec = new Vector();
		
		PreparedStatement pstmt2 = null;
		ResultSet rs2 = null;
		
		PreparedStatement pstmt3 = null;
		ResultSet rs3 = null;
		
		//���ѹα�(kr) �Ź� ���� ���� ����
		//���ѹα�(kr) �귣�� ���� ����
		ArrayList onlineInfoList_kr = new ArrayList();
		ArrayList brandList_kr = new ArrayList();
		
		try {	
			con = getConnection();
			sql = "select * from shoeinfo_onlineinfo where model_stylecode = ? AND country_name = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, model_stylecode);
			pstmt.setString(2, "���ѹα�");
			rs = pstmt.executeQuery();
			while(rs.next()){
				OnlineDTO odto = new OnlineDTO();
				odto.setModel_stylecode(rs.getString("model_stylecode"));
				odto.setCountry_region(rs.getString("country_region"));
				odto.setCountry_name(rs.getString("country_name"));
				odto.setBrand_id(rs.getString("brand_id"));
				odto.setOnline_link(rs.getString("online_link"));
				odto.setOnline_start_time(rs.getString("online_start_time"));
				odto.setOnline_end_time(rs.getString("online_end_time"));
				odto.setOnline_result_time(rs.getString("online_result_time"));
				odto.setOnline_method(rs.getString("online_method"));
				odto.setDelivery_method(rs.getString("delivery_method"));
				onlineInfoList_kr.add(odto);
				
				//�ѱ� �귣�� ���� ��������
				sql = "select * from shoeinfo_brand where brand_id = ?";
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setString(1, odto.getBrand_id());
				rs2 = pstmt2.executeQuery();
				if(rs2.next()){
					//�귣�� ���� DB�� �ش� �귣�尡 ����Ǿ�������
					BrandDTO bdto = new BrandDTO();
					bdto.setCountry_name(rs2.getString("country_name"));
					bdto.setBrand_logo(rs2.getString("brand_logo"));
					bdto.setBrand_name(rs2.getString("brand_name"));
					bdto.setBrand_id(rs2.getString("brand_id"));
					sql="select country_flag from shoeinfo_country where country_name = ?";
					pstmt3 = con.prepareStatement(sql);
					pstmt3.setString(1, bdto.getCountry_name());
					rs3 = pstmt3.executeQuery();
					if(rs3.next()){
						bdto.setCountry_flag(rs3.getString("country_flag"));
					}
					brandList_kr.add(bdto);
				}
			}
			vec.add(onlineInfoList_kr);
			vec.add(brandList_kr);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return vec;
	}
	
	//Asia(���ѹα� ����)���� �Ź� �¶��� ���� �������� �Լ�(�귣�� ���� + ���� ����)
	public Vector getOnlineInfo_asia(String model_stylecode) {
		Vector vec = new Vector();
		
		PreparedStatement pstmt2 = null;
		ResultSet rs2 = null;
		
		PreparedStatement pstmt3 = null;
		ResultSet rs3 = null;
		
		//�ƽþ�-���ѹα� ����(asia) �Ź� �¶��� ���� ����
		//�ƽþ�-���ѹα� ����(asia) �귣�� ���� ����
		ArrayList onlineInfoList_asia = new ArrayList();
		ArrayList brandList_asia = new ArrayList();
		
		try {	
			con = getConnection();
			sql = "select * from shoeinfo_onlineinfo where model_stylecode = ? AND country_region = ? AND NOT country_name = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, model_stylecode);
			pstmt.setString(2, "�ƽþ�");
			pstmt.setString(3, "���ѹα�");
			rs = pstmt.executeQuery();
			while(rs.next()){
				OnlineDTO odto = new OnlineDTO();
				odto.setModel_stylecode(rs.getString("model_stylecode"));
				odto.setCountry_region(rs.getString("country_region"));
				odto.setCountry_name(rs.getString("country_name"));
				odto.setBrand_id(rs.getString("brand_id"));
				odto.setOnline_link(rs.getString("online_link"));
				odto.setOnline_start_time(rs.getString("online_start_time"));
				odto.setOnline_end_time(rs.getString("online_end_time"));
				odto.setOnline_result_time(rs.getString("online_result_time"));
				odto.setOnline_method(rs.getString("online_method"));
				odto.setDelivery_method(rs.getString("delivery_method"));
				onlineInfoList_asia.add(odto);
				
				//�ƽþ� �귣�� ���� ��������
				sql = "select * from shoeinfo_brand where brand_id = ?";
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setString(1, odto.getBrand_id());
				rs2 = pstmt2.executeQuery();
				if(rs2.next()){
					//�귣�� ���� DB�� �ش� �귣�尡 ����Ǿ�������
					BrandDTO bdto = new BrandDTO();
					bdto.setCountry_name(rs2.getString("country_name"));
					bdto.setBrand_logo(rs2.getString("brand_logo"));
					bdto.setBrand_name(rs2.getString("brand_name"));
					bdto.setBrand_id(rs2.getString("brand_id"));
					
					sql="select country_flag from shoeinfo_country where country_name = ?";
					pstmt3 = con.prepareStatement(sql);
					pstmt3.setString(1, bdto.getCountry_name());
					rs3 = pstmt3.executeQuery();
					if(rs3.next()){
						bdto.setCountry_flag(rs3.getString("country_flag"));
					}
					brandList_asia.add(bdto);
				}
			}
			vec.add(onlineInfoList_asia);
			vec.add(brandList_asia);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return vec;
	}
	
	//america ���� �Ź� �¶��� ���� �������� �Լ�(�귣�� ���� + ���� ����)
	public Vector getOnlineInfo_america(String model_stylecode) {
		Vector vec = new Vector();
		
		PreparedStatement pstmt2 = null;
		ResultSet rs2 = null;
		
		PreparedStatement pstmt3 = null;
		ResultSet rs3 = null;
		
		//�Ƹ޸�ī ����(america) �Ź� �¶��� ���� ����
		//�Ƹ޸�ī ����(america) �귣�� ���� ����
		ArrayList onlineInfoList_america = new ArrayList();
		ArrayList brandList_america = new ArrayList();
		
		try {	
			con = getConnection();
			sql = "select * from shoeinfo_onlineinfo where model_stylecode = ? AND country_region = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, model_stylecode);
			pstmt.setString(2, "�Ƹ޸�ī");
			rs = pstmt.executeQuery();
			while(rs.next()){
				OnlineDTO odto = new OnlineDTO();
				odto.setModel_stylecode(rs.getString("model_stylecode"));
				odto.setCountry_region(rs.getString("country_region"));
				odto.setCountry_name(rs.getString("country_name"));
				odto.setBrand_id(rs.getString("brand_id"));
				odto.setOnline_link(rs.getString("online_link"));
				odto.setOnline_start_time(rs.getString("online_start_time"));
				odto.setOnline_end_time(rs.getString("online_end_time"));
				odto.setOnline_result_time(rs.getString("online_result_time"));
				odto.setOnline_method(rs.getString("online_method"));
				odto.setDelivery_method(rs.getString("delivery_method"));
				onlineInfoList_america.add(odto);
				
				//�Ƹ޸�ī �귣�� ���� ��������
				sql = "select * from shoeinfo_brand where brand_id = ?";
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setString(1, odto.getBrand_id());
				rs2 = pstmt2.executeQuery();
				if(rs2.next()){
					//�귣�� ���� DB�� �ش� �귣�尡 ����Ǿ�������
					BrandDTO bdto = new BrandDTO();
					bdto.setCountry_name(rs2.getString("country_name"));
					bdto.setBrand_logo(rs2.getString("brand_logo"));
					bdto.setBrand_name(rs2.getString("brand_name"));
					bdto.setBrand_id(rs2.getString("brand_id"));
					
					sql="select country_flag from shoeinfo_country where country_name = ?";
					pstmt3 = con.prepareStatement(sql);
					pstmt3.setString(1, bdto.getCountry_name());
					rs3 = pstmt3.executeQuery();
					if(rs3.next()){
						bdto.setCountry_flag(rs3.getString("country_flag"));
					}
					brandList_america.add(bdto);
				}
			}
			vec.add(onlineInfoList_america);
			vec.add(brandList_america);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return vec;
	}
	
	//europe ���� �Ź� �¶��� ���� �������� �Լ�(�귣�� ���� + ���� ����)
	public Vector getOnlineInfo_europe(String model_stylecode) {
		Vector vec = new Vector();
		
		PreparedStatement pstmt2 = null;
		ResultSet rs2 = null;
		
		PreparedStatement pstmt3 = null;
		ResultSet rs3 = null;
		
		//���� ����(europe) �Ź� �¶��� ���� ����
		//���� ����(europe) �귣�� ���� ����
		ArrayList onlineInfoList_europe = new ArrayList();
		ArrayList brandList_europe = new ArrayList();
		
		try {	
			con = getConnection();
			sql = "select * from shoeinfo_onlineinfo where model_stylecode = ? AND country_region = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, model_stylecode);
			pstmt.setString(2, "����");
			rs = pstmt.executeQuery();
			while(rs.next()){
				OnlineDTO odto = new OnlineDTO();
				odto.setModel_stylecode(rs.getString("model_stylecode"));
				odto.setCountry_region(rs.getString("country_region"));
				odto.setCountry_name(rs.getString("country_name"));
				odto.setBrand_id(rs.getString("brand_id"));
				odto.setOnline_link(rs.getString("online_link"));
				odto.setOnline_start_time(rs.getString("online_start_time"));
				odto.setOnline_end_time(rs.getString("online_end_time"));
				odto.setOnline_result_time(rs.getString("online_result_time"));
				odto.setOnline_method(rs.getString("online_method"));
				odto.setDelivery_method(rs.getString("delivery_method"));
				onlineInfoList_europe.add(odto);
				
				//�Ƹ޸�ī �귣�� ���� ��������
				sql = "select * from shoeinfo_brand where brand_id = ?";
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setString(1, odto.getBrand_id());
				rs2 = pstmt2.executeQuery();
				if(rs2.next()){
					//�귣�� ���� DB�� �ش� �귣�尡 ����Ǿ�������
					BrandDTO bdto = new BrandDTO();
					bdto.setCountry_name(rs2.getString("country_name"));
					bdto.setBrand_logo(rs2.getString("brand_logo"));
					bdto.setBrand_name(rs2.getString("brand_name"));
					bdto.setBrand_id(rs2.getString("brand_id"));
					
					sql="select country_flag from shoeinfo_country where country_name = ?";
					pstmt3 = con.prepareStatement(sql);
					pstmt3.setString(1, bdto.getCountry_name());
					rs3 = pstmt3.executeQuery();
					if(rs3.next()){
						bdto.setCountry_flag(rs3.getString("country_flag"));
					}
					brandList_europe.add(bdto);
				}
			}
			vec.add(onlineInfoList_europe);
			vec.add(brandList_europe);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return vec;
	}
	
	//��Ÿ ���� �Ź� �¶��� ���� �������� �Լ�(�귣�� ���� + ���� ����)
	public Vector getOnlineInfo_etc(String model_stylecode) {
		Vector vec = new Vector();
		
		PreparedStatement pstmt2 = null;
		ResultSet rs2 = null;
		
		PreparedStatement pstmt3 = null;
		ResultSet rs3 = null;
		
		//��Ÿ ����(etc) �Ź� �¶��� ���� ����
		//��Ÿ ����(etc) �귣�� ���� ����
		ArrayList onlineInfoList_etc = new ArrayList();
		ArrayList brandList_etc = new ArrayList();
		
		try {	
			con = getConnection();
			sql = "select * from shoeinfo_onlineinfo where model_stylecode = ? AND country_region = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, model_stylecode);
			pstmt.setString(2, "��Ÿ");
			rs = pstmt.executeQuery();
			while(rs.next()){
				OnlineDTO odto = new OnlineDTO();
				odto.setModel_stylecode(rs.getString("model_stylecode"));
				odto.setCountry_region(rs.getString("country_region"));
				odto.setCountry_name(rs.getString("country_name"));
				odto.setBrand_id(rs.getString("brand_id"));
				odto.setOnline_link(rs.getString("online_link"));
				odto.setOnline_start_time(rs.getString("online_start_time"));
				odto.setOnline_end_time(rs.getString("online_end_time"));
				odto.setOnline_result_time(rs.getString("online_result_time"));
				odto.setOnline_method(rs.getString("online_method"));
				odto.setDelivery_method(rs.getString("delivery_method"));
				onlineInfoList_etc.add(odto);
				
				//�Ƹ޸�ī �귣�� ���� ��������
				sql = "select * from shoeinfo_brand where brand_id = ?";
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setString(1, odto.getBrand_id());
				rs2 = pstmt2.executeQuery();
				if(rs2.next()){
					//�귣�� ���� DB�� �ش� �귣�尡 ����Ǿ�������
					BrandDTO bdto = new BrandDTO();
					bdto.setCountry_name(rs2.getString("country_name"));
					bdto.setBrand_logo(rs2.getString("brand_logo"));
					bdto.setBrand_name(rs2.getString("brand_name"));
					bdto.setBrand_id(rs2.getString("brand_id"));
					
					sql="select country_flag from shoeinfo_country where country_name = ?";
					pstmt3 = con.prepareStatement(sql);
					pstmt3.setString(1, bdto.getCountry_name());
					rs3 = pstmt3.executeQuery();
					if(rs3.next()){
						bdto.setCountry_flag(rs3.getString("country_flag"));
					}
					brandList_etc.add(bdto);
				}
			}
			vec.add(onlineInfoList_etc);
			vec.add(brandList_etc);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return vec;
	}
	
	
}

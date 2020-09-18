package net.sneaker.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.board.action.Criteria;

public class SneakerDAO {
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql="";
	
	// 디비 연결(커넥션 풀 사용)
	private Connection getConnection() throws Exception{
		// Context 객체를 생성
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/coduo25");
		con = ds.getConnection();
		return con;
	}
	// 자원 해제 
	public void closeDB(){
		try {
			if(rs !=null) rs.close();
			if(pstmt !=null) pstmt.close();
			if(con !=null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//전체 신발 수 구하는 함수
	public int countSneaker(){
		int num = 0;
		try {
			con = getConnection();
			sql = "select num from shoeinfo_sneakerlibrary";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				num += 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return num;
	}
	
	//새로운 신발정보 추가하는 함수
	public void insertSneaker(SneakerDTO sdto) {
		int num = 0;
		try {
			con = getConnection();
			sql = "select Max(num) from shoeinfo_sneakerlibrary";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				num = rs.getInt(1) + 1;
			}
			
			sql = "insert into shoeinfo_sneakerlibrary values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, sdto.getBrand());
			pstmt.setString(3, sdto.getSub_brand());
			pstmt.setString(4, sdto.getBrand_index());
			pstmt.setString(5, sdto.getImage());
			pstmt.setString(6, sdto.getModel_stylecode());
			pstmt.setString(7, sdto.getModel_name());
			pstmt.setString(8, sdto.getModel_colorway());
			pstmt.setInt(9, sdto.getPrice());
			pstmt.setString(10, sdto.getRelease_date());
			pstmt.setString(11, sdto.getRelease_status());
			pstmt.setInt(12, sdto.getViews());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	
	public ArrayList getAllSneakerList() {
		ArrayList<SneakerDTO> sneakerList = new ArrayList<SneakerDTO>();
		try {
			con = getConnection();
			sql = "select * from shoeinfo_sneakerlibrary order by release_date;";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				SneakerDTO sdto = new SneakerDTO();
				sdto.setNum(rs.getInt("num"));
				sdto.setBrand(rs.getString("brand"));
				sdto.setSub_brand(rs.getString("sub_brand"));
				sdto.setBrand_index(rs.getString("brand_index"));
				sdto.setImage(rs.getString("image"));
				sdto.setModel_stylecode(rs.getString("model_stylecode"));
				sdto.setModel_name(rs.getString("model_name"));
				sdto.setModel_colorway(rs.getString("model_colorway"));
				sdto.setPrice(rs.getInt("price"));
				sdto.setRelease_date(rs.getString("release_date"));
				sdto.setRelease_status(rs.getString("release_status"));
				sneakerList.add(sdto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return sneakerList;
	}
	
	//모든 신발 정보 리스트 가져오는 함수
	public ArrayList getAllSneakerList(Criteria cri) {
		ArrayList<SneakerDTO> sneakerList = new ArrayList<SneakerDTO>();
		try {
			con = getConnection();
			sql = "select * from shoeinfo_sneakerlibrary order by release_date desc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cri.getPageStart());
			pstmt.setInt(2, cri.getPerpageNum());
			rs = pstmt.executeQuery();
			while(rs.next()){
				SneakerDTO sdto = new SneakerDTO();
				sdto.setNum(rs.getInt("num"));
				sdto.setBrand(rs.getString("brand"));
				sdto.setSub_brand(rs.getString("sub_brand"));
				sdto.setBrand_index(rs.getString("brand_index"));
				sdto.setImage(rs.getString("image"));
				sdto.setModel_stylecode(rs.getString("model_stylecode"));
				sdto.setModel_name(rs.getString("model_name"));
				sdto.setModel_colorway(rs.getString("model_colorway"));
				sdto.setPrice(rs.getInt("price"));
				sdto.setRelease_date(rs.getString("release_date"));
				sdto.setRelease_status(rs.getString("release_status"));
				sneakerList.add(sdto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return sneakerList;
	}
	
	//신발정보 리스트로 가져오는 함수(월별로)
	public ArrayList getSneakerList(String date, String release_status) {
		ArrayList<SneakerDTO> sneakerList = new ArrayList<SneakerDTO>();
		
		PreparedStatement pstmt2 = null;
		ResultSet rs2 = null;
		
		PreparedStatement pstmt3 = null;
		ResultSet rs3 = null;
		
		PreparedStatement pstmt4 = null;
		ResultSet rs4 = null;
		
		PreparedStatement pstmt5 = null;
		ResultSet rs5 = null;
		
		try {
			con = getConnection();
			sql = "select * from shoeinfo_sneakerlibrary where release_date like ? AND release_status = ? order by release_date, model_name";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, date);
			pstmt.setString(2, release_status);
			rs = pstmt.executeQuery();
			while(rs.next()){
				SneakerDTO sdto = new SneakerDTO();
				sdto.setNum(rs.getInt("num"));
				sdto.setBrand(rs.getString("brand"));
				sdto.setSub_brand(rs.getString("sub_brand"));
				sdto.setBrand_index(rs.getString("brand_index"));
				sdto.setImage(rs.getString("image"));
				sdto.setModel_stylecode(rs.getString("model_stylecode"));
				sdto.setModel_name(rs.getString("model_name"));
				sdto.setModel_colorway(rs.getString("model_colorway"));
				sdto.setPrice(rs.getInt("price"));
				sdto.setRelease_date(rs.getString("release_date"));	
				sdto.setViews(rs.getInt("views"));
				
				//신발 응모링크수 가져오기
				sql = "select count(*) from shoeinfo_onlineinfo where model_stylecode = ? and model_num = ?";
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setString(1, sdto.getModel_stylecode());
				pstmt2.setInt(2, sdto.getNum());
				rs2 = pstmt2.executeQuery();
				if(rs2.next()){
					sdto.setCountLinks(rs2.getInt(1));
				}else {
					sdto.setCountLinks(0);
				}
				
				//신발 온라인정보 최신 등록날짜 가져오기
				sql = "select max(reg_date) from shoeinfo_onlineinfo where model_stylecode = ? and model_num = ?";
				pstmt3 = con.prepareStatement(sql);
				pstmt3.setString(1, sdto.getModel_stylecode());
				pstmt3.setInt(2, sdto.getNum());
				rs3 = pstmt3.executeQuery();
				if(rs3.next()){
					sdto.setReg_date(rs3.getTimestamp(1));
				}
				
				String maxStart = "";
				
				String maxStartDate = "";
				String maxStartTime = "";
				
				String maxEnd = "";
				
				String maxEndDate = "";
				String maxEndTime = "";
				
				//신발 온라인세부정보 끝나는 시간 가져오기
				sql = "select online_start_date, online_start_time from shoeinfo_onlineinfo where model_stylecode = ? and model_num = ? order by online_start_date desc limit 1";
				pstmt4 = con.prepareStatement(sql);
				pstmt4.setString(1, sdto.getModel_stylecode());
				pstmt4.setInt(2, sdto.getNum());
				rs4 = pstmt4.executeQuery();
				if(rs4.next()){
					
					if(rs4.getString("online_start_date").isEmpty() || rs4.getString("online_start_date") == "" ||  rs4.getString("online_start_date") == null){
						maxStartDate = "1234-12-34";
					}else {
						maxStartDate = rs4.getString("online_start_date");
					}
					
					if(rs4.getString("online_start_time").isEmpty() || rs4.getString("online_start_time") == "" ||  rs4.getString("online_start_time") == null){
						maxStartTime = "12:34";
					}else {
						maxStartTime = rs4.getString("online_start_time");
					}
					
					maxStart = maxStartDate + " " + maxStartTime;
					
				}else{
					maxStart = "1234-12-34 12:34";
				}
				
				sql = "select online_end_date, online_end_time from shoeinfo_onlineinfo where model_stylecode = ? and model_num = ? order by online_end_date desc limit 1";
				pstmt5 = con.prepareStatement(sql);
				pstmt5.setString(1, sdto.getModel_stylecode());
				pstmt5.setInt(2, sdto.getNum());
				rs5 = pstmt5.executeQuery();
				if(rs5.next()){
					
					if(rs5.getString("online_end_date").isEmpty() || rs5.getString("online_end_date") == "" ||  rs5.getString("online_end_date") == null){
						maxEndDate = "1234-12-34";
					}else {
						maxEndDate = rs5.getString("online_end_date");
					}
					
					if(rs5.getString("online_end_time").isEmpty() || rs5.getString("online_end_time") == "" ||  rs5.getString("online_end_time") == null){
						maxEndTime = "12:34";
					}else {
						maxEndTime = rs5.getString("online_end_time");
					}
					
					maxEnd = maxEndDate + " " + maxEndTime;
					
				}else {
					maxEnd = "1234-12-34 12:34";
				}
				
				if(maxStart.contains("1234-12-34") && maxStart.contains("12:34") && maxEnd.contains("1234-12-34") && maxEnd.contains("12:34")){
					sdto.setMaxDate("1234-12-34 12:34");
				}
				else if(maxStart.contains("1234-12-34") || maxStart.contains("12:34")){
					sdto.setMaxDate(maxEnd);
				}
				else if(maxEnd.contains("1234-12-34") || maxEnd.contains("12:34")){
					sdto.setMaxDate(maxStart);
				}
				else if(!maxStart.contains("1234-12-34") && !maxStart.contains("12:34") && !maxEnd.contains("1234-12-34") && !maxEnd.contains("12:34")){
					// maxStart 와 maxEnd 비교
					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
					Date startDate = format.parse(maxStart);
					Date endDate = format.parse(maxEnd);
					
					int compare = startDate.compareTo(endDate);
					
					if(compare > 0){
						sdto.setMaxDate(maxStart);
					}
					else if(compare < 0) {
						sdto.setMaxDate(maxEnd);
					}
					else {
						sdto.setMaxDate(maxEnd);
					}
				}	
				
//				System.out.println(maxStart + " " + maxEnd + "   " + sdto.getMaxDate() + " " + sdto.getModel_stylecode());

				sneakerList.add(sdto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return sneakerList;
	}
	
	//조회수 올리는 함수
	public void addViews(int model_num, String model_stylecode) {
		try {
			con = getConnection();
			sql = "update shoeinfo_sneakerlibrary set views = views + 1 where model_stylecode = ? and num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, model_stylecode);
			pstmt.setInt(2, model_num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	
	//신발 상세정보 가져오는 함수
	public SneakerDTO getSneakerDetail(int num, String model_stylecode) {
		SneakerDTO sdto = null;
		try {
			con = getConnection();

			//신발 정보 가져오기
			sql = "select * from shoeinfo_sneakerlibrary where model_stylecode = ? and num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, model_stylecode);
			pstmt.setInt(2, num);
			rs = pstmt.executeQuery();

			if(rs.next()){
				//신발이 있으면
				sdto = new SneakerDTO();
				sdto.setNum(rs.getInt("num"));
				sdto.setBrand(rs.getString("brand"));
				sdto.setSub_brand(rs.getString("sub_brand"));
				sdto.setBrand_index(rs.getString("brand_index"));
				sdto.setImage(rs.getString("image"));
				sdto.setModel_name(rs.getString("model_name"));
				sdto.setModel_colorway(rs.getString("model_colorway"));
				sdto.setModel_stylecode(rs.getString("model_stylecode"));
				sdto.setPrice(rs.getInt("price"));
				sdto.setRelease_date(rs.getString("release_date"));
				sdto.setRelease_status(rs.getString("release_status"));
				sdto.setViews(rs.getInt("views"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return sdto;
	}
	
	//신발 정보 수정하는 함수
	public void updateSneakerInfo(SneakerDTO sdto, String old_model_stylecode) {
		try {
			con = getConnection();
			sql = "update shoeinfo_sneakerlibrary set brand = ?, sub_brand = ?, brand_index = ?, image = ?, model_stylecode = ?, model_name = ?, model_colorway = ?, price = ?, release_date = ? where num = ?";
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
			pstmt.setInt(10, sdto.getNum());
			int check = pstmt.executeUpdate();
			
			if(check > 0) {
				sql = "update shoeinfo_onlineinfo set model_stylecode = ? where model_stylecode = ? and model_num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, sdto.getModel_stylecode());
				pstmt.setString(2, old_model_stylecode);
				pstmt.setInt(3, sdto.getNum());
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	
	//신발 검색할때 사용하는 함수
	public ArrayList<SneakerDTO> searchSneaker(String model_name){
		ArrayList sneakerList = new ArrayList();
		try {
			con = getConnection();
			sql = "select * from shoeinfo_sneakerlibrary where model_name LIKE ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + model_name + "%");
			rs = pstmt.executeQuery();
			while(rs.next()){
				SneakerDTO sdto = new SneakerDTO();
				sdto.setImage(rs.getString("image"));
				sdto.setModel_name(rs.getString("model_name"));
				sdto.setModel_stylecode(rs.getString("model_stylecode"));
				sdto.setPrice(Integer.parseInt(rs.getString("price")));
				sdto.setRelease_date(rs.getString("release_date"));
				sdto.setRelease_status(rs.getString("release_status"));				
				sneakerList.add(sdto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return sneakerList;
	}
	


}
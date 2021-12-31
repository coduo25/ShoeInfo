package net.sneaker.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.board.action.Criteria;
import net.online.db.OnlineDTO;

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
			
			sql = "insert into shoeinfo_sneakerlibrary values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, sdto.getBrand());
			pstmt.setString(3, sdto.getSub_brand());
			pstmt.setString(4, sdto.getBrand_index());
			pstmt.setString(5, sdto.getImage());
			pstmt.setString(6, sdto.getModel_stylecode());
			pstmt.setString(7, sdto.getModel_name());
			pstmt.setString(8, sdto.getModel_name_kr());
			pstmt.setString(9, sdto.getModel_colorway());
			pstmt.setInt(10, sdto.getPrice());
			pstmt.setString(11, sdto.getRelease_date());
			pstmt.setString(12, sdto.getRelease_status());
			pstmt.setInt(13, sdto.getViews());
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
			sql = "select * from shoeinfo_sneakerlibrary where release_date not like '%2020%' order by release_date;";
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
				sdto.setModel_name_kr(rs.getString("model_name_kr"));
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
				sdto.setModel_name_kr(rs.getString("model_name_kr"));
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
	
	//인기순 리스트 가져오는 함수
	public ArrayList getPopularList(){	
		ArrayList<SneakerDTO> sneakerList = new ArrayList<SneakerDTO>();
		PreparedStatement pstmt2 = null;
		ResultSet rs2 = null;
		try {
			con = getConnection();
			sql = "select B.model_stylecode from shoeinfo_memberdrawinfo as B join shoeinfo_sneakerlibrary as A on B.model_stylecode = A.model_stylecode where A.release_date between date_add(now(), interval -1 month) and last_day(now()) group by B.model_stylecode order by count(B.model_stylecode) desc limit 6";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				String model_stylecode = rs.getString("model_stylecode");
				sql = "select * from shoeinfo_sneakerlibrary where model_stylecode = ?";
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setString(1, model_stylecode);
				rs2 = pstmt2.executeQuery();
				while(rs2.next()){
					SneakerDTO sdto = new SneakerDTO();
					sdto.setNum(rs2.getInt("num"));
					sdto.setBrand(rs2.getString("brand"));
					sdto.setSub_brand(rs2.getString("sub_brand"));
					sdto.setBrand_index(rs2.getString("brand_index"));
					sdto.setImage(rs2.getString("image"));
					sdto.setModel_stylecode(rs2.getString("model_stylecode"));
					sdto.setModel_name(rs2.getString("model_name"));
					sdto.setModel_name_kr(rs2.getString("model_name_kr"));
					sdto.setModel_colorway(rs2.getString("model_colorway"));
					sdto.setPrice(rs2.getInt("price"));
					sdto.setRelease_date(rs2.getString("release_date"));
					sdto.setRelease_status(rs2.getString("release_status"));
					sneakerList.add(sdto);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return sneakerList;
	}
	
	//발매 중, 발매예정, 발매완료 리스트 나누는 함수
	public Vector getTotalReleaseList(String date, String date2){
		
		Vector vec = new Vector();
		
		ArrayList<SneakerDTO> releasingSneakerList = new ArrayList<SneakerDTO>();
		ArrayList<SneakerDTO> releaseSneakerList = new ArrayList<SneakerDTO>();
		ArrayList<SneakerDTO> releasedSneakerList = new ArrayList<SneakerDTO>();
		
		ArrayList<Integer> countReleasingBrandList = new ArrayList<Integer>();
		
		PreparedStatement pstmt2 = null;
		ResultSet rs2 = null;
		PreparedStatement pstmt3 = null;
		ResultSet rs3 = null;
		PreparedStatement pstmt4 = null;
		ResultSet rs4 = null;
		
		try {
			con = getConnection();
			sql = "select * from shoeinfo_sneakerlibrary where (release_date like ? or release_date like ?) order by release_date"; 
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, date);
			pstmt.setString(2, date2);
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
				sdto.setModel_name_kr(rs.getString("model_name_kr"));
				sdto.setModel_colorway(rs.getString("model_colorway"));
				sdto.setPrice(rs.getInt("price"));
				sdto.setRelease_date(rs.getString("release_date"));	
				sdto.setViews(rs.getInt("views"));
				
				//스니커 라이브러리에 모든 스니커를 다 가지고와서
				
				String maxStart = "";
				String maxStartDate = "";
				String maxStartTime = "";
				
				String maxEnd = "";
				String maxEndDate = "";
				String maxEndTime = "";
				
				//각 신발의 온라인세부정보 끝나는 시간 가져오기
				
				//온라인세부정보 시작하는 시간
				sql = "select online_start_date, online_start_time from shoeinfo_onlineinfo where model_stylecode = ? and model_num = ? order by online_start_date desc, online_start_time desc limit 1";
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setString(1, sdto.getModel_stylecode());
				pstmt2.setInt(2, sdto.getNum());
				rs2 = pstmt2.executeQuery();
				if(rs2.next()){
					
					if(rs2.getString("online_start_date").isEmpty() || rs2.getString("online_start_date") == "" ||  rs2.getString("online_start_date") == null){
						maxStartDate = "1234-12-34";
					}else {
						maxStartDate = rs2.getString("online_start_date");
					}
					
					if(rs2.getString("online_start_time").isEmpty() || rs2.getString("online_start_time") == "" ||  rs2.getString("online_start_time") == null){
						maxStartTime = "12:34";
					}else {
						maxStartTime = rs2.getString("online_start_time");
					}
					
					maxStart = maxStartDate + " " + maxStartTime;
					
				}else{
					maxStart = "1234-12-34 12:34";
				}
				//온라인 시작하는 시간 : maxStart
				
				//온라인세부정보 끝나는 시간
				sql = "select online_end_date, online_end_time from shoeinfo_onlineinfo where model_stylecode = ? and model_num = ? order by online_end_date desc, online_end_time desc limit 1";
				pstmt3 = con.prepareStatement(sql);
				pstmt3.setString(1, sdto.getModel_stylecode());
				pstmt3.setInt(2, sdto.getNum());
				rs3 = pstmt3.executeQuery();
				if(rs3.next()){
					
					if(rs3.getString("online_end_date").isEmpty() || rs3.getString("online_end_date") == "" ||  rs3.getString("online_end_date") == null){
						maxEndDate = "1234-12-34";
					}else {
						maxEndDate = rs3.getString("online_end_date");
					}
					
					if(rs3.getString("online_end_time").isEmpty() || rs3.getString("online_end_time") == "" ||  rs3.getString("online_end_time") == null){
						maxEndTime = "12:34";
					}else {
						maxEndTime = rs3.getString("online_end_time");
					}
					
					maxEnd = maxEndDate + " " + maxEndTime;
					
				}else {
					maxEnd = "1234-12-34 12:34";
				}
				//온라인 끝나는 시간 : maxEnd
				
				//최종 온라인 시작, 끝나는 시간 sdto 에 넣기
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
				
				//sdto에 저장된 MaxDate와 현재 시간을 비교해서 발매중, 발매예정, 발매완료 각 해당되는 리스트에 담기
				Date maxDate = null;
				Date currentDate = null;

				SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				String nowDayTimeString = f.format(System.currentTimeMillis());
				
				//각 신발들의 Max 응모시간
				maxDate = f.parse(sdto.getMaxDate());
				//현재 시간
				Date nowDayTimeFormat = f.parse(nowDayTimeString);				
				
				//발매예정
				if(sdto.getMaxDate() == "1234-12-34 12:34"){
					releaseSneakerList.add(sdto);
				}
				//발매중
				else if(maxDate.getTime() >= nowDayTimeFormat.getTime()){
					releasingSneakerList.add(sdto);
					
					//발매 중인 신발의 현재 진행중인 브랜드 갯수 구해서 리스트에 넣기
					sql = "SELECT count(brand_id) as brand_id from shoeinfo_onlineinfo where model_stylecode = ? and ( (((online_method like '%선착%') and (CONCAT(online_start_date, ' ', online_start_time, ':00') >= now()))) or (((online_method like '%드로우%') || online_method like '%라플%') and ( ((online_start_date = curdate() or online_end_date = curdate()) and (CONCAT(online_start_date, ' ', online_start_time, ':00') >= now())) or (now() <= CONCAT(online_end_date, ' ', online_end_time, ':00')) ) )) order by GREATEST(concat(online_start_date, ' ', online_start_time), concat(online_end_date, ' ', online_end_time))";
					pstmt4 = con.prepareStatement(sql);
					pstmt4.setString(1, sdto.getModel_stylecode());
					rs4 = pstmt4.executeQuery();
					if(rs4.next()){
						countReleasingBrandList.add(rs4.getInt("brand_id"));
					}
				}
				//발매완료
				else if(maxDate.getTime() < nowDayTimeFormat.getTime()){
					releasedSneakerList.add(sdto);
				}
			}
			vec.add(releaseSneakerList);
			vec.add(releasingSneakerList);
			vec.add(releasedSneakerList);
			vec.add(countReleasingBrandList);
		} catch (Exception e){
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return vec;
	}
	
	//이번주 snkrs 리스트 가져오는 함수
	public Vector getSnkrsWeekList(){
		Vector vec = new Vector();
		
		ArrayList onlineList_snkrs = new ArrayList();
		ArrayList sneakerList_snkrs = new ArrayList();
		
		PreparedStatement pstmt2 = null;
		ResultSet rs2 = null;
		
		try {
			con = getConnection();
			sql = "select * from shoeinfo_onlineinfo where brand_id='대한민국_SNKRS 한국' and (((online_method='선착') and (concat(online_start_date, ' ', online_start_time, ':00') between now() and concat(date_add(now(), interval +1 month), ' 23:59:59'))) or ((online_method = '드로우') and (concat(online_end_date, ' ', online_end_time, ':00') between now() and concat(date_add(now(), interval +1 month), ' 23:59:59')))) order by GREATEST(concat(online_start_date, ' ', online_start_time), concat(online_end_date, ' ', online_end_time))";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				OnlineDTO odto = new OnlineDTO();
				odto.setModel_num(rs.getInt("model_num"));
				odto.setModel_stylecode(rs.getString("model_stylecode"));
				odto.setCountry_region(rs.getString("country_region"));
				odto.setCountry_name(rs.getString("country_name"));
				odto.setBrand_id(rs.getString("brand_id"));
				odto.setOnline_link(rs.getString("online_link"));
				odto.setOnline_start_date(rs.getString("online_start_date"));
				odto.setOnline_start_time(rs.getString("online_start_time"));
				odto.setOnline_end_date(rs.getString("online_end_date"));
				odto.setOnline_end_time(rs.getString("online_end_time"));
				odto.setOnline_method(rs.getString("online_method"));
				odto.setBuy_method(rs.getString("buy_method"));
				odto.setDelivery_method(rs.getString("delivery_method"));
				odto.setOnline_writer(rs.getString("online_writer"));
				odto.setReg_date(rs.getTimestamp("reg_date"));
				onlineList_snkrs.add(odto);
				
				//신발 정보 불러오기
				sql = "select * from shoeinfo_sneakerlibrary where num = ? and model_stylecode = ?";
				pstmt2 = con.prepareStatement(sql);
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setInt(1, odto.getModel_num());
				pstmt2.setString(2, odto.getModel_stylecode());
				rs2 = pstmt2.executeQuery();
				if(rs2.next()){
					SneakerDTO sdto = new SneakerDTO();
					sdto.setImage(rs2.getString("image"));
					sdto.setModel_name_kr(rs2.getString("model_name_kr"));
					sneakerList_snkrs.add(sdto);
				}
			}
			vec.add(onlineList_snkrs);
			vec.add(sneakerList_snkrs);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return vec;
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
				sdto.setModel_name_kr(rs.getString("model_name_kr"));
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
				sql = "select online_start_date, online_start_time from shoeinfo_onlineinfo where model_stylecode = ? and model_num = ? order by online_start_date desc, online_start_time desc limit 1";
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
				
				sql = "select online_end_date, online_end_time from shoeinfo_onlineinfo where model_stylecode = ? and model_num = ? order by online_end_date desc, online_end_time desc limit 1";
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
				sdto.setModel_name_kr(rs.getString("model_name_kr"));
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
			sql = "update shoeinfo_sneakerlibrary set brand = ?, sub_brand = ?, brand_index = ?, image = ?, model_stylecode = ?, model_name = ?, model_name_kr = ?, model_colorway = ?, price = ?, release_date = ? where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sdto.getBrand());
			pstmt.setString(2, sdto.getSub_brand());
			pstmt.setString(3, sdto.getBrand_index());
			pstmt.setString(4, sdto.getImage());
			pstmt.setString(5, sdto.getModel_stylecode());
			pstmt.setString(6, sdto.getModel_name());
			pstmt.setString(7, sdto.getModel_name_kr());
			pstmt.setString(8, sdto.getModel_colorway());
			pstmt.setInt(9, sdto.getPrice());
			pstmt.setString(10, sdto.getRelease_date());
			pstmt.setInt(11, sdto.getNum());
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
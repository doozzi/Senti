package Model;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DAO {

	// 전역변수 선언
	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	ResultSet rs = null;
	String nickname = null;

	// DB연결 메소드
	public void db_conn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String db_url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String db_id = "senti";
			String db_pw = "senti";

			conn = DriverManager.getConnection(db_url, db_id, db_pw);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// DB닫기 메소드
	public void db_close() {
		try {
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 검색기능
	public ArrayList<songinfoDTO> SearchSong(String search) {
		String sql = "select keys, title, singer, albumimg, times from songinfo where title like '%" + search
				+ "%' or singer like '%" + search + "%'";

		ArrayList<songinfoDTO> playList = new ArrayList<songinfoDTO>();
		db_conn();

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {
				String keys = rs.getString(1);
				String title = rs.getString(2);
				String singer = rs.getString(3);
				String albumimg = rs.getString(4);
				String times = rs.getString(5);

				songinfoDTO dto = new songinfoDTO(keys, title, singer, albumimg, times);

				playList.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db_close();
		}

		return playList;

	}

	// 음악 상세
	public ArrayList<songinfoDTO> detail(String key) {
		String sql = "select title, singer, albumimg, times, genre, lyrics, keys from songinfo where keys like '%" + key
				+ "%'";
		ArrayList<songinfoDTO> musicSearchDetail = new ArrayList<songinfoDTO>();

		db_conn();

		System.out.println("DetailDAO");
		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
			rs.next();

			String title = rs.getString(1);
			String singer = rs.getString(2);
			String albumimg = rs.getString(3);
			String release = rs.getString(4);
			String genre = rs.getString(5);
			String lyrics = rs.getString(6);
			String keys = rs.getString(7);

			songinfoDTO dto = new songinfoDTO(title, singer, albumimg, release, genre, lyrics, keys);

			musicSearchDetail.add(dto);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db_close();
		}

		return musicSearchDetail;

	}

	// 음악 최저 음역대
	public String range(String keys) {

		String sql = "select max(compass) from compassinfo, songrange where keys = '"+ keys +"' and songrange.low_range >= frequency";
		
		db_conn();
		String low_range = "";
		System.out.println("songrange");
		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
			rs.next();

			low_range = rs.getString(1);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db_close();
		}

		return low_range;

	}
	
	// 음악 최고 음역대
	public String range2(String keys) {

		String sql = "select max(compass) from compassinfo, songrange where keys = '"+ keys +"' and frequency < songrange.high_range";
		
		db_conn();
		String high_range = "";
		
		System.out.println("songrange");
		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
			rs.next();

			high_range = rs.getString(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db_close();
		}

		return high_range;

	}
	
	// 음악 최고 음역대 숫자
	public double range3(String keys) {

		String sql = "select max(frequency) from compassinfo, songrange where keys = '"+ keys +"' and frequency < songrange.high_range";
		
		double high_frequency = 0;
		
		db_conn();
		System.out.println("frequency");
		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
			rs.next();
			
			high_frequency = rs.getDouble(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db_close();
		}

		return high_frequency;

	}

	// 사용자 Frequency
	public double Frequency(String high) {
		
		String sql = "select frequency from compassinfo where compass like '%"+high+"%'";
		
		db_conn();
		double user_range = 0;
		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
			rs.next();

			user_range = rs.getDouble(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db_close();
		}

		return user_range;

	}
	
	// 최고 음역대<< 다시 확인 해야함
	public ArrayList<songrangeDTO> high_info(String keys) {
		String sql = "select max(compass), max(frequency) from compassinfo, songrange where keys = '"+ keys +"' and frequency < songrange.high_range";
		ArrayList<songrangeDTO> high_info = new ArrayList<songrangeDTO>();

		db_conn();

		System.out.println("DetailDAO");
		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
			rs.next();

			String high_range = rs.getString(1);
			String frequency = rs.getString(2);

			songrangeDTO dto = new songrangeDTO(high_range, frequency);

			high_info.add(dto);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db_close();
		}

		return high_info;

	}
	
	// 플레이리스트 생성
	public int playList(playListDTO dto) {
		try {

			db_conn();

			String sql = "insert into playlist values(?, ?, ?)";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getId());
			psmt.setString(2, "");
			if (dto.getPname() == "") {
				psmt.setString(3, "플레이리스트");
			} else {
				psmt.setString(3, dto.getPname());
			}
			System.out.println("keys : " + dto.getKeys());
			System.out.println("id : " + dto.getId());
			System.out.println("pname : " + dto.getPname());

			cnt = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db_close();
		}
		return cnt;
	}

	// 플레이리스트 출력
	public ArrayList<playListDTO> playListAdd(DTO info) {
		ArrayList<playListDTO> mlist = new ArrayList<playListDTO>();

		try {
			db_conn();

			String sql = "SELECT DISTINCT pname FROM playlist WHERE id=?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, info.getId());

			rs = psmt.executeQuery();

			while (rs.next()) {
				String pname = rs.getString(1);

				playListDTO dto = new playListDTO(pname);

				mlist.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db_close();
		}
		return mlist;
	}

	// 음원추가
	public int listDetail(playListDTO dto2) {
		try {

			db_conn();

			String sql = "insert into playlist values(?, ?, ?)";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto2.getId());
			psmt.setString(2, dto2.getKeys());
			psmt.setString(3, dto2.getPname());
			System.out.println("keys : " + dto2.getKeys());
			System.out.println("id : " + dto2.getId());
			System.out.println("pname2 : " + dto2.getPname());

			cnt = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db_close();
		}
		return cnt;
	}

	// 플레이리스트 상세
	public ArrayList<songinfoDTO> pDetail(String pname, String id) {

		String sql = "select songinfo.keys, title, singer, albumimg, times from songinfo, playlist where pname like '%"
				+ pname + "%' and songinfo.keys = playlist.keys and playlist.id='" + id + "'";

		ArrayList<songinfoDTO> listDetail = new ArrayList<songinfoDTO>();
		db_conn();

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {
				String keys = rs.getString(1);
				String title = rs.getString(2);
				String singer = rs.getString(3);
				String albumimg = rs.getString(4);
				String times = rs.getString(5);

				songinfoDTO dto = new songinfoDTO(keys, title, singer, albumimg, times);

				listDetail.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db_close();
		}

		return listDetail;

	}

	// playList 개별 삭제
	public int delete(String pname) {
		try {
			db_conn();

			String sql = "DELETE FROM playList WHERE pname=?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, pname);

			cnt = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db_close();
		}
		return cnt;
	}

	// playList이름 수정
	public int update(String update_pname, String pname, String id) {
		try {
			db_conn();

			String sql = "UPDATE playList SET pname=? WHERE pname=? and id=?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, update_pname);
			psmt.setString(2, pname);
			psmt.setString(3, id);

			cnt = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db_close();
		}
		return cnt;
	}

	// 음원 개별 삭제
	public int MusicDelete(String keys) {
		try {
			db_conn();

			String sql = "DELETE FROM playList WHERE keys=?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, keys);

			cnt = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db_close();
		}
		return cnt;
	}

}
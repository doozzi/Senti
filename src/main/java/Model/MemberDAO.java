package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MemberDAO {
   
   Connection conn = null;
   PreparedStatement psmt = null;
   ResultSet rs = null;
   int cnt = 0;
   DTO info = null;
   
// DB연결
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
   
// DB종료
   public void db_close() {
      try {
         if(rs != null) rs.close();
         if(psmt != null) psmt.close();
         if(conn != null) conn.close();
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
   
// 회원가입 메소드
   public int join(DTO dto) {
      try {
         db_conn();

         String sql = "insert into userinfo values(?, ?, ?, ?, ?, ?, ?, ?)";

         psmt = conn.prepareStatement(sql);

         psmt.setString(1, dto.getId());
         psmt.setString(2, dto.getPw());
         psmt.setString(3, dto.getNick());
         psmt.setString(4, dto.getGender());
         psmt.setString(5, "");
         psmt.setString(6, "");
         psmt.setString(7, "");
         psmt.setString(8, "");

         cnt = psmt.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         db_close();
      }
      return cnt;
   }
   
// 로그인
   public DTO login(DTO dto) {
      try {
         db_conn();
         
         String sql = "SELECT * FROM userinfo WHERE id=? AND pw=?";
         
         psmt = conn.prepareStatement(sql);
         
         psmt.setString(1, dto.getId());
         psmt.setString(2, dto.getPw());
         
         rs = psmt.executeQuery();
         
         if(rs.next()) {
            String id = rs.getString(1);
            String pw = rs.getString(2);
            String nick = rs.getString(3);
            String gender = rs.getString(4);
            String high = rs.getString(5);
            String low = rs.getString(6);
            String coverpath = rs.getString(7);
            
            info = new DTO(id, pw, nick, gender, high, low, coverpath);
         }
      }
      catch(Exception e) {
         e.printStackTrace();
      }
      finally {
         db_close();
      }
      return info;
   }

// 음역대 정보 입력
   public int update(DTO dto) {
      try {
         db_conn();
         
         String sql = "UPDATE userinfo SET high=?, low=? WHERE nick=?";
         
         psmt = conn.prepareStatement(sql);
         
         psmt.setString(1, dto.getHigh());
         psmt.setString(2, dto.getLow());
         psmt.setString(3, dto.getNick());
         
         cnt = psmt.executeUpdate();
      }
      catch(Exception e) {
         e.printStackTrace();
      }
      finally {
         db_close();
      }
      return cnt;
   }
   
// 회원정보관리
   public ArrayList<DTO> select() {
      ArrayList<DTO> list = new ArrayList<DTO>();
      
      try {
         db_conn();
         
         String sql = "SELECT * FROM userinfo";
         
         psmt = conn.prepareStatement(sql);
         rs = psmt.executeQuery();
         
         while(rs.next()) {
            String email = rs.getString(1);
            String pw = rs.getString(2);
            String tel = rs.getString(3);
            String address = rs.getString(4);
            
            DTO dto = new DTO(email, pw, tel, address);
            list.add(dto);
         }
      }
      catch(Exception e) {
         e.printStackTrace();
      }
      finally {
         db_close();
      }
      return list;
   }
   
// 회원정보 수정
   public int infoUpdate(userDTO dto) {
      try {
         db_conn();
         
         String sql = "UPDATE userinfo SET pw=?, nick=? WHERE id=?";
         
         psmt = conn.prepareStatement(sql);
         
         psmt.setString(1, dto.getPw());
         psmt.setString(2, dto.getNick());
         psmt.setString(3, dto.getId());
         
         cnt = psmt.executeUpdate();
      }
      catch(Exception e) {
         e.printStackTrace();
      }
      finally {
         db_close();
      }
      return cnt;
   }
   
}
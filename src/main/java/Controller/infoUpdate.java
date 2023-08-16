package Controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.DAO;
import Model.DTO;
import Model.MemberDAO;
import Model.songinfoDTO;
import Model.userDTO;

@WebServlet("/infoUpdate")
public class infoUpdate extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      System.out.println("infoUpdate controller");
   
      // 1. post방식 인코딩
      request.setCharacterEncoding("UTF-8");
   
      // 2. 값 받아오기
      String id = request.getParameter("id");
      String pw = request.getParameter("pw");
      String nick = request.getParameter("nick");
      
      System.out.println(id);
      System.out.println(pw);
      System.out.println(nick);
      
      // 받아온 값을 DTO로 묶기
      userDTO dto = new userDTO(id, pw, nick);
      
      // join메소드 호출 -> 실행결과(int)
      MemberDAO dao = new MemberDAO();
      int cnt = dao.infoUpdate(dto);
      
      DTO dto2 = new DTO(id, pw);
      
      DTO info = dao.login(dto2);
      
      HttpSession session = request.getSession();
      
      // SQL문 실행결과에 따라 회원가입 성공실패 여부 확인
      if(cnt>0){
    	 session.setAttribute("info", info);
         System.out.println("회원정보 저장 성공");
         response.sendRedirect("myPage.jsp");
      }else {
         System.out.println("회원정보 저장 실패");
         response.sendRedirect("myPage.jsp");
      }
   
   }

}
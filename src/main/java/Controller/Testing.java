package Controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.Arrays;

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

@WebServlet("/Testing")
public class Testing extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      System.out.println("Testing controller");
   
      // 1. post방식 인코딩
      request.setCharacterEncoding("UTF-8");
   
      // 2. 값 받아오기
      String nick = request.getParameter("nick");
      String high = request.getParameter("highSelect");   
      String low = request.getParameter("lowSelect");   
      String[] genres = request.getParameterValues("genres");
      
      System.out.println(nick);
      System.out.println(high);
      System.out.println(low);

      System.out.println(Arrays.toString(genres));
      
      // 받아온 값을 DTO로 묶기
      DTO dto = new DTO(nick, high, low);
      
      // join메소드 호출 -> 실행결과(int)
      MemberDAO dao = new MemberDAO();
      int cnt = dao.update(dto);
      
      // SQL문 실행결과에 따라 회원가입 성공실패 여부 확인
      if(cnt>0){
    	 //session.setAttribute("info", info);
         System.out.println("음역대 저장 성공");
         response.sendRedirect("vocalTestResult.jsp");
      }else {
         System.out.println("음역대 저장 실패");
         response.sendRedirect("vocalTestIng.jsp");
      }
   
   }

}

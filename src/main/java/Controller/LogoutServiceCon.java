package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LogoutServiceCon")
public class LogoutServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("LogoutServiceCon");
		
		//로그아웃 = 로그인한 session정보 삭제
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("info");
		//session.invalidata();
		
		System.out.println("로그아웃 성공");
		
		response.sendRedirect("Login.jsp");
	}

}

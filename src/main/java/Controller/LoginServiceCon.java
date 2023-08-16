package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import Model.DTO;
import Model.MemberDAO;

@WebServlet("/LoginServiceCon")
public class LoginServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Login Controller");
		
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		System.out.println("id : " + id);
		System.out.println("pw : " + pw);
		
		DTO dto = new DTO(id, pw);
		
		MemberDAO dao = new MemberDAO();
		DTO info = dao.login(dto);
		
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(60*60);
		
		if(info != null) {
			if(info.getHigh() != null) {
			System.out.println("로그인 성공");
			session.setAttribute("info", info);
			response.sendRedirect("playList.jsp");
			} else {
			System.out.println("로그인 성공");
			session.setAttribute("info", info);
			response.sendRedirect("vocalTest.jsp");
			}
		}else {
			System.out.println("로그인 실패");
			session.setAttribute("errMsg", "로그인 정보가 올바르지 않습니다.");
			response.sendRedirect("Login.jsp");
		}
		
	}

}

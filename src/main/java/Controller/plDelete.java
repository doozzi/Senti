package Controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.DAO;
import Model.DTO;
import Model.playListDTO;

@WebServlet("/delete")
public class plDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("playListDelete controller");
		
		// 1. post방식 인코딩
		request.setCharacterEncoding("UTF-8");
	
		// 2. 값 받아오기
		String pname = request.getParameter("pname");
		System.out.println("pname : "+pname);
		
		
		// join메소드 호출 -> 실행결과(int)
		DAO dao = new DAO();
		int cnt = dao.delete(pname);
		
		// SQL문 실행결과에 따라 회원가입 성공실패 여부 확인
		if(cnt>0){
			System.out.println("playList 삭제 성공");
			response.sendRedirect("playList.jsp");
		}else {
			System.out.println("playList 삭제 실패");
			response.sendRedirect("playList.jsp");
		}
	
	}

}

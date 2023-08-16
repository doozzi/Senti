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
import Model.playListDTO;

@WebServlet("/Update")
public class plUpdate extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("UpdateServiceCon");
		
		request.setCharacterEncoding("UTF-8");
		
		String pname = request.getParameter("pname");
		String update_pname = request.getParameter("update_pname");
		String id = request.getParameter("id");
		
		System.out.println("pname : "+pname);
		System.out.println("update_pname : "+update_pname);
		System.out.println("id : "+id);
		
		DAO dao = new DAO();
		int cnt = dao.update(update_pname, pname, id);
		
		if(cnt>0){
			System.out.println("playList 수정 성공");
			response.sendRedirect("playListDetail.jsp?pname="+URLEncoder.encode(update_pname, "utf-8"));
		}else {
			System.out.println("playList 수정 실패");
			response.sendRedirect("playList.jsp");
		}
		
	}

}

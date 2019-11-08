package com.cos.action.comment;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.dao.UserDao;
import com.cos.model.User;

@WebServlet("/api/user")
public class UserRestController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserRestController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain; charset=UTF-8"); // MIME 타입

		String username = request.getParameter("username");
		System.out.println("username : " + username);

		UserDao userDao = new UserDao();
		User user = userDao.findByUsername(username);

		PrintWriter out = response.getWriter();
		if (user == null) {
			out.print("ok");
			out.flush();
		} else {
			out.print("fail");
			out.flush();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

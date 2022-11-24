package com.tpt.controller.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = { "/verifycode" })
public class VerifyController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		req.getRequestDispatcher("/views/web/verify.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");

		HttpSession session = req.getSession();
		String trueCode = (String) session.getAttribute("code");
		
		String currentCode = req.getParameter("currentCode");

		if(trueCode.equals(currentCode)) {
			req.setAttribute("verifysuccess", "Cảm ơn");
			req.getRequestDispatcher("/views/web/verify.jsp").forward(req, resp);
		}
		else {
			req.setAttribute("notverifysuccess", "siu");
			req.getRequestDispatcher("/views/web/verify.jsp").forward(req, resp);
		}

	}
}

package com.tpt.controller.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tpt.model.Taikhoan;
import com.tpt.service.ITaikhoanService;
import com.tpt.service.impl.TaikhoanServiceImpl;
import com.tpt.util.Constant;
import com.tpt.util.SendMail;

@WebServlet(urlPatterns = { "/register" })
public class DangkyController extends HttpServlet {

	ITaikhoanService taikhoanService = new TaikhoanServiceImpl();
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");

		String userMail = req.getParameter("email");
		SendMail sm = new SendMail();
		String code = sm.getRandom();

		boolean test = sm.sendEmail(userMail, code, Constant.subMailVerify, Constant.textMailVerify);
		if (test) {
			HttpSession session = req.getSession();
			session.setAttribute("code", code);
			resp.sendRedirect(req.getContextPath() + "/verifycode");
		}
		else {
			req.setAttribute("errorverify", "Bạn nhập địa chỉ mail không hợp lệ");
			req.getRequestDispatcher("/views/web/login.jsp").forward(req, resp);
		}

	}
}

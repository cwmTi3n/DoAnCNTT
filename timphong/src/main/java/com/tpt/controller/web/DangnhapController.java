package com.tpt.controller.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tpt.model.Taikhoan;
import com.tpt.service.ITaikhoanService;
import com.tpt.service.impl.TaikhoanServiceImpl;

@WebServlet(urlPatterns = { "/login" })
public class DangnhapController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");
		req.getRequestDispatcher("/views/web/login.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");

		ITaikhoanService taikhoanService = new TaikhoanServiceImpl();

		Taikhoan taikhoan = new Taikhoan();
		taikhoan.setTentk(req.getParameter("tentk"));
		taikhoan.setMatkhau(req.getParameter("matkhau"));

		Taikhoan user = taikhoanService.dangNhap(taikhoan);
		if (user == null) {
			req.setAttribute("error", "Sai tên đăng nhập hoặc mật khẩu");
			req.getRequestDispatcher("/views/web/login.jsp").forward(req, resp);
			return;
		}
		else if (user.getQuyen() == 1) {
			resp.sendRedirect(req.getContextPath() + "/admin/list-loaiphong");
			return;
		}
		HttpSession session = req.getSession();
		session.setAttribute("user", user);
		resp.sendRedirect(req.getContextPath() + "/trangchu");
	}
}

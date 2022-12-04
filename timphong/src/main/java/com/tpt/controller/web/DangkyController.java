package com.tpt.controller.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tpt.model.Taikhoan;
import com.tpt.util.Constant;
import com.tpt.util.ConstantFunction;
import com.tpt.util.SendMail;

@WebServlet(urlPatterns = { "/register" })
public class DangkyController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");

		String userMail = req.getParameter("email");
		String code = ConstantFunction.getRandom();

		boolean test = SendMail.sendEmail(userMail, Constant.subMailVerify, Constant.textMailVerify+code);
		if (test && (req.getParameter("matkhauregister").equals(req.getParameter("confirmmatkhauregister")))) {
			Taikhoan taikhoan = new Taikhoan();
			taikhoan.setAnhdaidien("x");
			taikhoan.setTentk(req.getParameter("taikhoanregister"));
			taikhoan.setHo(req.getParameter("ho"));
			taikhoan.setTen(req.getParameter("ten"));
			taikhoan.setSdt(req.getParameter("sdt"));
			taikhoan.setMatkhau(req.getParameter("matkhauregister"));
			taikhoan.setEmail(req.getParameter("email"));
			taikhoan.setQuyen(2);
			
			HttpSession session = req.getSession();
			session.setAttribute("code", code);
			session.setAttribute("taikhoan", taikhoan);
			
			
			resp.sendRedirect(req.getContextPath() + "/verifycode");
		}
		else {
			req.setAttribute("errorverify", "Bạn nhập địa chỉ mail không hợp lệ");
			req.getRequestDispatcher("/views/web/login.jsp").forward(req, resp);
		}

	}
}

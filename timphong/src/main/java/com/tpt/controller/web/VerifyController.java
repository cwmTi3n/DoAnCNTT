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

@WebServlet(urlPatterns = { "/verifycode" })
public class VerifyController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	ITaikhoanService taikhoanService = new TaikhoanServiceImpl();

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
			taikhoanService.insertTaikhoan((Taikhoan)session.getAttribute("taikhoan"));
			req.setAttribute("verifysuccess", "Cảm ơn bạn đã đăng ký tài khoản của chúng tôi.");
			req.getRequestDispatcher("/views/web/verify.jsp").forward(req, resp);
		}
		else {
			req.setAttribute("notverifysuccess", "Bạn nhập sai mã code. Vui lòng kiểm tra lại");
			req.getRequestDispatcher("/views/web/verify.jsp").forward(req, resp);
		}

	}
}

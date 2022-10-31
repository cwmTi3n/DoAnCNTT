package com.tpt.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpt.model.Taikhoan;
import com.tpt.service.ITaikhoanService;
import com.tpt.service.impl.TaikhoanServiceImpl;

@WebServlet(urlPatterns = {"/admin/themtk"})
public class ThemTaikhoan extends HttpServlet
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	ITaikhoanService taikhoanService = new TaikhoanServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		req.getRequestDispatcher("/views/admin/them-taikhoan.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html");
		
		Taikhoan taikhoan = new Taikhoan();
		taikhoan.setTentk(req.getParameter("tentk"));
		taikhoan.setMatkhau(req.getParameter("matkhau"));
		taikhoan.setHo(req.getParameter("ho"));
		taikhoan.setTen(req.getParameter("ten"));
		taikhoan.setQuyen(Integer.parseInt(req.getParameter("quyen")));
		taikhoan.setSdt(req.getParameter("sdt"));
		taikhoan.setEmail(req.getParameter("email"));
		taikhoanService.insertTaikhoan(taikhoan);
		resp.sendRedirect(req.getContextPath() + "/admin/list-taikhoan");
	}
}

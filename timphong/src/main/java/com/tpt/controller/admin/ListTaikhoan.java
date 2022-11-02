package com.tpt.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpt.model.Taikhoan;
import com.tpt.service.ITaikhoanService;
import com.tpt.service.impl.TaikhoanServiceImpl;

@WebServlet(urlPatterns = {"/admin/list-taikhoan"})
public class ListTaikhoan extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		ITaikhoanService taikhoanService = new TaikhoanServiceImpl();
		List<Taikhoan> sellers = taikhoanService.getAllSeller();
		List<Taikhoan> users = taikhoanService.getAllUser();
		req.setAttribute("sellers", sellers);
		req.setAttribute("users", users);
		req.getRequestDispatcher("/views/admin/list-taikhoan.jsp").forward(req, resp);
	}
}

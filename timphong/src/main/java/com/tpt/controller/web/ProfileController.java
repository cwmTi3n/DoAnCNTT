package com.tpt.controller.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tpt.model.Taikhoan;
import com.tpt.service.ITaikhoanService;
import com.tpt.service.impl.TaikhoanServiceImpl;
import com.tpt.util.Constant;
import com.tpt.util.ThemAnh;
@MultipartConfig()
@WebServlet(urlPatterns = {"/trangcanhan"})
public class ProfileController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	ITaikhoanService taikhoanService = new TaikhoanServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("utf-8");
		req.getRequestDispatcher("/views/web/profile.jsp").forward(req, resp);
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		Object ob = session.getAttribute("account");
		Taikhoan taikhoan = (Taikhoan) ob;
		Part part = req.getPart("anhdaidien");
		String realPath = Constant.DIR + "/taikhoan";
		String filename = ThemAnh.ThemAnh(part, realPath, 0);
		
		String ho = req.getParameter("fname");
		String ten = req.getParameter("lname");
		String email = req.getParameter("email");
		String sdt = req.getParameter("sdt");
		
		if(!ho.isEmpty()) taikhoan.setHo(ho);
		if(!ten.isEmpty()) taikhoan.setTen(ten);
		if(!email.isEmpty()) taikhoan.setEmail(email);
		if(!sdt.isEmpty()) taikhoan.setSdt(sdt);
		
		
		taikhoanService.editTaikhoan(taikhoan, filename);
		
		resp.sendRedirect(req.getContextPath() + "/trangcanhan");
	}
}

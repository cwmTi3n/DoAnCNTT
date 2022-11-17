package com.tpt.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpt.model.Loaiphong;
import com.tpt.service.ILoaiphongService;
import com.tpt.service.impl.LoaiphongServiceImpl;

@WebServlet(urlPatterns = {"/admin/them-loaiphong"})
public class ThemLoaiPhong extends HttpServlet
{

	/**
	 * 
	 */
	ILoaiphongService loaiphongService = new LoaiphongServiceImpl();
	
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("utf-8");
		
		req.getRequestDispatcher("/views/admin/them-loaiphong.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		Loaiphong loaiphong = new Loaiphong();
		loaiphong.setTenloai(req.getParameter("tenloai"));
		
		loaiphongService.insertLoaiphong(loaiphong);
		
		resp.sendRedirect(req.getContextPath() + "/admin/list-loaiphong");
	}
}

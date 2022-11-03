package com.tpt.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpt.service.ILoaiphongService;
import com.tpt.service.impl.LoaiphongServiceImpl;

@WebServlet(urlPatterns = {"/admin/xoa-loaiphong"})
public class XoaLoaiphong extends HttpServlet
{

	/**
	 * 
	 */
	ILoaiphongService loaiphongService = new LoaiphongServiceImpl();
	private static final long serialVersionUID = 1L; 
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		resp.setCharacterEncoding("utf-8");
		
		String id_lpString = req.getParameter("id_lp");
		
		int id_lp = Integer.parseInt(id_lpString);
		
		loaiphongService.deleteLoaiphong(id_lp);
		
		resp.sendRedirect(req.getContextPath() + "/admin/list-loaiphong");
	}
}

package com.tpt.controller.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpt.model.Phong;
import com.tpt.model.Tinh;
import com.tpt.model.Loaiphong;
import com.tpt.service.ILoaiphongService;
import com.tpt.service.IPhongService;
import com.tpt.service.ITinhService;
import com.tpt.service.impl.LoaiphongServiceImpl;
import com.tpt.service.impl.PhongServiceImpl;
import com.tpt.service.impl.TinhServiceImpl;

@WebServlet(urlPatterns = {"/listings"})
public class ListtingController extends HttpServlet
{
	
	IPhongService phongService = new PhongServiceImpl();
	ILoaiphongService loaiphongService = new LoaiphongServiceImpl();
	ITinhService tinhService = new TinhServiceImpl();
	
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("utf-8");
		
		List<Loaiphong> loaiphongs= loaiphongService.getAll();
		List<Tinh> tinhs = tinhService.getAll();
		// Hiện ra 9 phòng đầu tiên cho trang chủ
		List<Phong> phongs = phongService.get9Phong();
		req.setAttribute("tinhs", tinhs);
		req.setAttribute("phongs", phongs);
		req.setAttribute("loaiphongs", loaiphongs);
		req.getRequestDispatcher("/views/web/listings.jsp").forward(req, resp);
	}
}


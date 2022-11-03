package com.tpt.controller.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpt.model.Phong;
import com.tpt.service.IPhongService;
import com.tpt.service.impl.PhongServiceImpl;

@WebServlet(urlPatterns = {"/"})
public class TrangchuController extends HttpServlet
{

	/**
	 * Trang chủ của web
	 */
	
	IPhongService phongService = new PhongServiceImpl();
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("utf-8");
		
		// Hiện ra 9 phòng đầu tiên cho trang chủ
		List<Phong> phongs = phongService.get9Phong();
		
		req.setAttribute("phongs", phongs);
		req.getRequestDispatcher("/views/web/index.jsp").forward(req, resp);
	}
}

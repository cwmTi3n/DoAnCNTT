package com.tpt.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpt.model.Loaiphong;
import com.tpt.model.Phong;
import com.tpt.service.ILoaiphongService;
import com.tpt.service.IPhongService;
import com.tpt.service.impl.LoaiphongServiceImpl;
import com.tpt.service.impl.PhongServiceImpl;

@WebServlet(urlPatterns = {"/admin/loaiphong"})
public class LoaiphongController extends HttpServlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	ILoaiphongService loaiphongService = new LoaiphongServiceImpl();
	IPhongService phongService = new PhongServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("utf-8");
		
		String id_lpString = req.getParameter("id_lp");
		int id_lp = Integer.parseInt(id_lpString);
		Loaiphong loaiphong = loaiphongService.getLoaiphong(id_lp);
		List<Phong> phongsLp = phongService.getPhongLoaiphong(id_lp);
		int tongPhong = 1;
		req.setAttribute("lp", loaiphong);
		req.setAttribute("phongs", phongsLp);
		req.setAttribute("tongPhong", tongPhong);
		
		req.getRequestDispatcher("/views/admin/detail-loaiphong.jsp").forward(req, resp);
	}
}

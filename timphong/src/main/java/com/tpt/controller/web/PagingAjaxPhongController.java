package com.tpt.controller.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpt.model.Phong;
import com.tpt.service.IPhongService;
import com.tpt.service.impl.PhongServiceImpl;

@WebServlet(urlPatterns = {"/more"})
public class PagingAjaxPhongController extends HttpServlet
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	IPhongService phongService = new PhongServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html");
		
		String coutString = req.getParameter("exits");
		int cout = Integer.parseInt(coutString);
		List<Phong> phongs = phongService.pagingPhong(cout);
		PrintWriter out = resp.getWriter();
		for(Phong p : phongs)
		{
			out.println();
		}
	}
}

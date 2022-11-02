package com.tpt.controller.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpt.model.Phong;
import com.tpt.service.IPhongService;
import com.tpt.service.impl.PhongServiceImpl;

@WebServlet(urlPatterns = {"/detail-phong"})
public class DetailPhongController extends HttpServlet
{

	/**
	 * 
	 */
	IPhongService phongService = new PhongServiceImpl();
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		String id_pString = req.getParameter("id_p");
		
		int id_p = Integer.parseInt(id_pString);
		
		Phong phong = phongService.getPhong(id_p);
		
		req.setAttribute("phong", phong);
		
		req.getRequestDispatcher("/views/web/phong.jsp").forward(req, resp);
	}
}

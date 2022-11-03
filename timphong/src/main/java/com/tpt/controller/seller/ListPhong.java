package com.tpt.controller.seller;

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

public class ListPhong extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	IPhongService phongService = new PhongServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		String id_tk = req.getParameter("id_tk");
		List<Phong> phongs = phongService.getPhongSeller(Integer.parseInt(id_tk));
		req.setAttribute("phongs", phongs);
		req.getRequestDispatcher("").forward(req, resp);
	}
}

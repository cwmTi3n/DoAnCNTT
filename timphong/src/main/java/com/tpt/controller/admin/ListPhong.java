package com.tpt.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpt.model.Phong;
import com.tpt.model.Tinh;
import com.tpt.service.IPhongService;
import com.tpt.service.ITinhService;
import com.tpt.service.impl.PhongServiceImpl;
import com.tpt.service.impl.TinhServiceImpl;

@WebServlet(urlPatterns = "/admin/list-phong")
public class ListPhong extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	IPhongService phongService = new PhongServiceImpl();
	ITinhService tinhService = new TinhServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		List<Tinh> tinhs = tinhService.getAll();
		List<Phong> phongs = phongService.getAll();
		
		req.setAttribute("tinhs", tinhs);
		req.setAttribute("phongs", phongs);
		req.getRequestDispatcher("/views/seller/quanlyphong.jsp").forward(req, resp);
	}
}

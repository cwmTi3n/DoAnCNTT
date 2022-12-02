package com.tpt.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpt.model.Loaiphong;
import com.tpt.model.Phong;
import com.tpt.service.IDanhgiaService;
import com.tpt.service.IDathenService;
import com.tpt.service.ILoaiphongService;
import com.tpt.service.IPhongService;
import com.tpt.service.ITaikhoanService;
import com.tpt.service.impl.DanhgiaServiceImpl;
import com.tpt.service.impl.DathenServiceImpl;
import com.tpt.service.impl.LoaiphongServiceImpl;
import com.tpt.service.impl.PhongServiceImpl;
import com.tpt.service.impl.TaikhoanServiceImpl;

@MultipartConfig()
@WebServlet(urlPatterns = {"/admin/statistics"})
public class Statistics extends HttpServlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	ILoaiphongService loaiphongService = new LoaiphongServiceImpl();
	IPhongService phongService = new PhongServiceImpl();
	ITaikhoanService taikhoanService = new TaikhoanServiceImpl();
	IDathenService dathenService = new DathenServiceImpl();
	IDanhgiaService danhgiaService = new DanhgiaServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("utf-8");
		
		
		req.getRequestDispatcher("/views/admin/index-admin.jsp").forward(req, resp);
	}
}

package com.tpt.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpt.service.ITaikhoanService;
import com.tpt.service.impl.TaikhoanServiceImpl;

@WebServlet(urlPatterns = {"/admin/xoa-taikhoan"})
public class XoaTaikhoan extends HttpServlet
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	ITaikhoanService taikhoanService = new TaikhoanServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		String id_tkString = req.getParameter("id_tk");
		int id_tk;
		if(id_tkString != null)
		{
			id_tk = Integer.parseInt(id_tkString);
			System.out.println(taikhoanService.deleteTaikhoan(id_tk));
		}
		resp.sendRedirect(req.getContextPath() + "/admin/list-taikhoan");
	}
}

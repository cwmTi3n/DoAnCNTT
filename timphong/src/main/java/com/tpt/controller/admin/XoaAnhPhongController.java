package com.tpt.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpt.service.IHinhanhService;
import com.tpt.service.impl.HinhanhServiceImpl;

@WebServlet(urlPatterns = {"/admin/xoa-anh-phong"})
public class XoaAnhPhongController extends HttpServlet
{

	/**
	 * 
	 */
	IHinhanhService hinhanhService = new HinhanhServiceImpl();
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("utf-8");
		
		String id_pString = req.getParameter("id_p");
		String hinhanh = req.getParameter("hinhanh");
		hinhanhService.deleteHinhanh(hinhanh);
		resp.sendRedirect(req.getContextPath() + "/admin/phong?id_p=" + id_pString);
		
	}
}

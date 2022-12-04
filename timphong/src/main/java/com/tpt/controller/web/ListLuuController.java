package com.tpt.controller.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tpt.model.Dathen;
import com.tpt.model.Taikhoan;
import com.tpt.service.IDathenService;
import com.tpt.service.impl.DathenServiceImpl;

@WebServlet(urlPatterns = {"/favorites", "/favorites/luu", "/favorites/xoa"})
public class ListLuuController extends HttpServlet
{

	/**
	 * 
	 */
	IDathenService dathenService = new DathenServiceImpl();
	private static final long serialVersionUID = 1L;
	// trangthai {0}: luu, {1}: dang cho xac nha, {2}: duoc xac nhan, {3} bi huy
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("utf-8");
		String url = req.getRequestURI().toString();
		 if(url.contains("xoa"))
		{
			xoaDathen(req, resp);
		}
		else 
		{		
			taiTrang(req, resp);
			req.getRequestDispatcher("/views/web/dsLuu.jsp").forward(req, resp);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		String url = req.getRequestURI().toString();
		if (url.contains("luu"))
		{
			luuDathen(req, resp);
		}
	}
	
	protected void taiTrang(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		// trangthai {0}: luu, {1}: dang cho xac nha, {2}: duoc xac nhan, {3} bi huy
		HttpSession session = req.getSession();
		Object object = session.getAttribute("account");
		Taikhoan taikhoan = (Taikhoan)object;
		int id_tk = taikhoan.getId_tk();/*Integer.parseInt(id_tkString);*/
		List<Dathen> dhLuu = dathenService.findByTrangthai(id_tk, 0);
		req.setAttribute("dhLuu", dhLuu);
	}
	
	protected void luuDathen(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		HttpSession session = req.getSession();
		Object object = session.getAttribute("account");
		Taikhoan taikhoan = (Taikhoan)object;
		int id_tk = taikhoan.getId_tk();
		String id_pString = req.getParameter("id_p");
		int id_p = Integer.parseInt(id_pString);
		Dathen dathen = new Dathen();
		dathen.setId_tk(id_tk);
		dathen.setId_p(id_p);
		dathen.setTrangthai(0);
		dathenService.insertDathen(dathen);
	}
	
	protected void xoaDathen(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		HttpSession session = req.getSession();
		Object object = session.getAttribute("account");
		Taikhoan taikhoan = (Taikhoan)object;
		int id_tk = taikhoan.getId_tk();
		String id_pString = req.getParameter("id_p");
		int id_p = Integer.parseInt(id_pString);
		dathenService.deleteDathen(id_tk, id_p);
		resp.sendRedirect(req.getContextPath() + "/favorites?id_tk=");
	}
	
}

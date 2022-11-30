package com.tpt.controller.web;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tpt.dao.IDanhgiaDao;
import com.tpt.dao.impl.DanhgiaDaoImpl;
import com.tpt.model.Danhgia;
import com.tpt.model.Taikhoan;
import com.tpt.service.IDanhgiaService;
import com.tpt.service.impl.DanhgiaServiceImpl;

@WebServlet(urlPatterns = {"/danhgia"})
public class DanhgiaController extends HttpServlet
{

	/**
	 * 
	 */
	IDanhgiaService danhgiaService = new DanhgiaServiceImpl();
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("utf-8");
		
		String id_pString = req.getParameter("id_p");
		int id_p = 0;
		if(id_pString != null)
		{
			id_p = Integer.parseInt(id_pString);
		}
		req.setAttribute("id_p", id_pString);
		req.getRequestDispatcher("/views/web/formDanhgia.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		Object object = session.getAttribute("account");
		Taikhoan taikhoan = (Taikhoan)object;
		int sosao = Integer.parseInt(req.getParameter("sosao"));
		String noidung = req.getParameter("noidung");
		int id_p = Integer.parseInt(req.getParameter("id_p"));
		Danhgia danhgia = new Danhgia();
		danhgia.setId_p(id_p);
		danhgia.setSosao(sosao);
		Date date = new Date(System.currentTimeMillis());
		danhgia.setNgay(date);
		danhgia.setId_tk(taikhoan.getId_tk());
		danhgia.setNoidung(noidung);
		danhgiaService.insertDanhgia(danhgia);
		resp.sendRedirect(req.getContextPath() + "/listdathen?hanhdong=2");
	}
	
	
}

package com.tpt.controller.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpt.model.Danhgia;
import com.tpt.model.Phong;
import com.tpt.service.IDanhgiaService;
import com.tpt.service.IPhongService;
import com.tpt.service.impl.DanhgiaServiceImpl;
import com.tpt.service.impl.PhongServiceImpl;

@WebServlet(urlPatterns = {"/detail-phong"})
public class DetailPhongController extends HttpServlet
{
	
//	Hiển thị chi tiết phòng
	
	IPhongService phongService = new PhongServiceImpl();
	IDanhgiaService danhgiaService = new DanhgiaServiceImpl();
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		String id_pString = req.getParameter("id_p");
		int id_p = Integer.parseInt(id_pString);
		List<Danhgia> danhgias = danhgiaService.findById_p(id_p);
		Phong phong = phongService.getPhong(id_p);
		req.setAttribute("danhgias", danhgias);
		req.setAttribute("phong", phong);
		req.getRequestDispatcher("/views/web/phong.jsp").forward(req, resp);
	}
}

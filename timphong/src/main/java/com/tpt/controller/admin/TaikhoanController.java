package com.tpt.controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.tpt.model.Phong;
import com.tpt.model.Taikhoan;
import com.tpt.service.IPhongService;
import com.tpt.service.ITaikhoanService;
import com.tpt.service.impl.PhongServiceImpl;
import com.tpt.service.impl.TaikhoanServiceImpl;
import com.tpt.util.Constant;
import com.tpt.util.ThemAnh;
@MultipartConfig()
@WebServlet(urlPatterns = {"/admin/taikhoan"})
public class TaikhoanController extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	ITaikhoanService taikhoanService = new TaikhoanServiceImpl();
	IPhongService phongService = new PhongServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");

		String id_tkString = req.getParameter("id_tk");
		int id_tk;
		Taikhoan taikhoan = null;
		List<Phong> phongSeller = new ArrayList<Phong>();
		if (id_tkString!=null)
		{
			id_tk = Integer.parseInt(id_tkString);			
			taikhoan = taikhoanService.getTaikhoan(id_tk);
			phongSeller = phongService.getPhongSeller(id_tk);
		}
		int tongPhong = phongSeller.size();
		req.setAttribute("tongPhong", tongPhong);
		req.setAttribute("user", taikhoan);
		req.setAttribute("phongcts", phongSeller);
		req.getRequestDispatcher("/views/admin/detail-taikhoan.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		Part part = req.getPart("anhdaidien");
		String realPath = Constant.DIR + "/taikhoan";
		String filename = ThemAnh.ThemAnh(part, realPath, 0);
		Taikhoan taikhoan = new Taikhoan();
		String id_tkString = req.getParameter("id_tk");
		int id_tk;
		if(id_tkString != null)
		{
			id_tk = Integer.parseInt(id_tkString);
			taikhoan.setId_tk(id_tk);
		}
		taikhoan.setTentk(req.getParameter("tentk"));
		taikhoan.setMatkhau(req.getParameter("matkhau"));
		taikhoan.setQuyen(Integer.parseInt(req.getParameter("quyen")));
		taikhoan.setEmail(req.getParameter("email"));
		taikhoan.setSdt(req.getParameter("sdt"));
		taikhoan.setHo(req.getParameter("ho"));
		taikhoan.setTen(req.getParameter("ten"));
		taikhoan.setAnhdaidien(filename);
		taikhoanService.editTaikhoan(taikhoan);
		
		resp.sendRedirect(req.getContextPath() + "/admin/taikhoan?id_tk=" + id_tkString);
	}
}

package com.tpt.controller.admin;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tpt.model.Dathen;
import com.tpt.model.Phong;
import com.tpt.model.Taikhoan;
import com.tpt.service.IDathenService;
import com.tpt.service.IPhongService;
import com.tpt.service.ITaikhoanService;
import com.tpt.service.impl.DathenServiceImpl;
import com.tpt.service.impl.PhongServiceImpl;
import com.tpt.service.impl.TaikhoanServiceImpl;

@WebServlet(urlPatterns =
{ "/admin/ql-dathen", "/admin/ql-dathen/xoa" })
public class qlDhController extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	IDathenService dathenService = new DathenServiceImpl();
	IPhongService phongService = new PhongServiceImpl();
	ITaikhoanService taikhoanService = new TaikhoanServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		String url = req.getRequestURL().toString();
		if(url.contains("xoa"))
		{
			xoaDh(req, resp);
		}
		else 
		{
			taitrang(req, resp);
			req.getRequestDispatcher("/views/admin/quanlydathen.jsp").forward(req, resp);
		}
	}

	protected void taitrang(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		// trangthai {0}: luu, {1}: dang cho xac nha, {2}: duoc xac nhan, {3} bi huy
		String hdString = req.getParameter("hanhdong");
		int trangthai;
		if (hdString == null)
		{
			trangthai = 1;
		} else
		{
			trangthai = Integer.parseInt(hdString);
		}
		List<Dathen> dhChoxn = dathenService.findAll(trangthai); // Cho xac nhan
		req.setAttribute("dhChoxn", dhChoxn);
		req.setAttribute("hanhdong", trangthai);

	}

	protected void xoaDh(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		String id_tkString = req.getParameter("id_tk");
		int id_tk = Integer.parseInt(id_tkString);
		String id_pString = req.getParameter("id_p");
		int id_p = Integer.parseInt(id_pString);
		dathenService.deleteDathen(id_tk, id_p);
		resp.sendRedirect(req.getContextPath() + "/admin/ql-dathen");
	}

}

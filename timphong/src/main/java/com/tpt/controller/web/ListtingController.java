package com.tpt.controller.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpt.model.Phong;
import com.tpt.model.Tinh;
import com.tpt.model.Loaiphong;
import com.tpt.service.ILoaiphongService;
import com.tpt.service.IPhongService;
import com.tpt.service.ITinhService;
import com.tpt.service.impl.LoaiphongServiceImpl;
import com.tpt.service.impl.PhongServiceImpl;
import com.tpt.service.impl.TinhServiceImpl;
import com.tpt.util.Constant;

@WebServlet(urlPatterns = {"/listings"})
public class ListtingController extends HttpServlet
{
	
	IPhongService phongService = new PhongServiceImpl();
	ILoaiphongService loaiphongService = new LoaiphongServiceImpl();
	ITinhService tinhService = new TinhServiceImpl();
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("utf-8");
		String thutuReq = req.getParameter("thutu");
		int tt = 0;
		if(thutuReq != null)
		{
			tt= Integer.parseInt(thutuReq);
		}
		String keyword = req.getParameter("keyword");
		if(keyword == null)
		{
			keyword = "";
		}
		List<Loaiphong> loaiphongs= loaiphongService.getAll();
		List<Tinh> tinhs = tinhService.getAll();
		// Hiện ra 9 phòng đầu tiên cho trang chủ
//		List<Phong> phongs = ConstantFunction.get9Phong(phongService.searchPhong(keyword));
		List<Phong> phongs = phongService.searchPhong(keyword, Constant.thutu[tt]);
		req.setAttribute("tinhs", tinhs);
		req.setAttribute("phongs", phongs);
		req.setAttribute("loaiphongs", loaiphongs);
		req.getRequestDispatcher("/views/web/listings.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		resp.setCharacterEncoding("utf-8");
		String thutuReq = req.getParameter("thutu");
		int tt = 0;
		if(thutuReq != null)
		{
			tt = Integer.parseInt(thutuReq);
		}
		String keyword = req.getParameter("key");
		String[] locString= new String[Constant.BoLoc];
		int[] loc = new int[Constant.BoLoc];
		locString[0] = req.getParameter("loaiphong");
		locString[1] = req.getParameter("tinh");
		locString[2] = req.getParameter("huyen");
		locString[3] = req.getParameter("xa");
		locString[4] = req.getParameter("songuoi");
		for(int i = 0; i < Constant.BoLoc; i++)
		{
			if(locString[i] != null)
			{
				loc[i] = Integer.parseInt(locString[i]);
			}
		}
//		List<Phong> searchPhong = phongService.searchPhong(keyword);
//		List<Phong> phongs = ConstantFunction.get9Phong(ConstantFunction.locPhong(searchPhong, loc));
		List<Phong> phongs = phongService.locPhong(keyword, loc, Constant.thutu[tt]);
		PrintWriter out = resp.getWriter();
		for(Phong p : phongs)
		{
			out.println("						<div class=\"phong col-md-6 col-lg-4 mb-5 mb-lg-5 \">\r\n"
					+ "							<div class=\"ftco-media-1\">\r\n"
					+ "								<div class=\"ftco-media-1-inner\">\r\n"
					+ "									<a href=\"/timphong/detail-phong?id_p=" + p.getId_p() + "\"\r\n"
					+ "										class=\"d-inline-block mb-4\"> <img\r\n"
					+ "										src=\"/timphong/hinhanh?fname=" + p.getAnhchinh() + "\"\r\n"
					+ "										alt=\"Image\" class=\"img-fluid\">\r\n"
					+ "									</a>\r\n"
					+ "									<div class=\"ftco-media-details\">\r\n"
					+ "										<h3>" + p.getTen() + "</h3>\r\n"
					+ "										<p>" + p.getMota() + "</p>\r\n"
					+ " <p>Đang có " + p.getQuantam() + " người quan tâm đến phòng này</p> "
					+ "										<p>" + p.getXa().getTenxa() + ",\r\n"
					+ "											" + p.getXa().getHuyen().getTenhuyen() + ",\r\n"
					+ "											" + p.getXa().getHuyen().getTinh().getTentinh() + "</p>\r\n"
					+ "										<strong>$" + p.getGia() + "</strong>\r\n"
					+ "									</div>\r\n"
					+ "								</div>\r\n"
					+ "							</div>\r\n"
					+ "						</div>");
		}
	}
	
}


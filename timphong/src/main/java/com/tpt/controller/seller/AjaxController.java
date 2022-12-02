package com.tpt.controller.seller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tpt.model.Phong;
import com.tpt.model.Taikhoan;
import com.tpt.service.IPhongService;
import com.tpt.service.impl.PhongServiceImpl;
import com.tpt.util.Constant;

@WebServlet(urlPatterns = {"/loc", "/search", "/xemthem"})
public class AjaxController extends HttpServlet
{

	/**
	 * 
	 */
	IPhongService phongService = new PhongServiceImpl();
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		resp.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		Object object = session.getAttribute("account");
		Taikhoan taikhoan = (Taikhoan)object;
		int id_tk = 0;
		if(taikhoan != null)
		{
			if(taikhoan.getQuyen() == 3)
			{
				id_tk = taikhoan.getId_tk();
			}
		}
		String url = req.getRequestURI().toString();
		if(url.contains("xemthem"))
		{
			More(id_tk, req, resp);
		}
		else 
		{
			LocOrSearch(id_tk, req, resp);
		}
	}
	
	protected void LocOrSearch(int id_tk, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
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
		List<Phong> phongs = phongService.locPhong(keyword, loc, Constant.thutu[tt], id_tk);
		PrintWriter out = resp.getWriter();
		for (Phong p : phongs) {
			out.println("											<tr class=\"phong\">\r\n"
					+ "												<td><a\r\n"
					+ "													href=\"/timphong/seller/ql-phong/select?id_p=" + p.getId_p()+ "\"/>\r\n"
					+ "													<img height=\"120\" width=\"160\"\r\n"
					+ "														src=\"/timphong/hinhanh?fname=" + p.getAnhchinh() + "\" />\r\n"
					+ "												</a></td>\r\n"
					+ "												<td>" + p.getTen() + "</td>\r\n"
					+ "												<td>"+ p.getGia() + "</td>\r\n"
					+ "												<td>"+ p.getChieudai() + "*" + p.getChieurong() + "</td>\r\n"
					+ "												<td></td>\r\n"
					+ "												<td></td>\r\n"
					+ "											</tr>");
		}
	}
	
	protected void More(int id_tk, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		String thutuReq = req.getParameter("thutu");
		int tt = 0;
		if(thutuReq != null)
		{
			tt = Integer.parseInt(thutuReq);
		}
		String coutString = req.getParameter("exits");
		String keyword = req.getParameter("key");
		if(keyword == null)
		{
			keyword = "";
		}
		int cout = Integer.parseInt(coutString);
		String[] locString= new String[Constant.BoLoc];
		int[] loc = new int[Constant.BoLoc];
		locString[0] = req.getParameter("loaiphong");
		locString[1] = req.getParameter("tinh");
		locString[2] = req.getParameter("huyen");
		locString[3] = req.getParameter("xa");
		locString[4] = req.getParameter("thutu");
		for(int i = 0; i < Constant.BoLoc; i++)
		{
//			if(locString[i] != null)
//			{
//				loc[i] = Integer.parseInt(locString[i]);
//			}
//			else 
//			{
//				loc[i] = 0;
//			}
			System.out.println("Oke:" + locString[i]);
		}
//		List<Phong> phongs = phongService.pagingPhong(cout, keyword, loc, Constant.thutu[tt], id_tk);
//		PrintWriter out = resp.getWriter();
//		for (Phong p : phongs) {
//			out.println("											<tr class=\"phong\">\r\n"
//					+ "												<td><a\r\n"
//					+ "													href=\"/timphong/seller/ql-phong/select?id_p=" + p.getId_p()+ "\"/>\">\r\n"
//					+ "													<img height=\"120\" width=\"160\"\r\n"
//					+ "														src=\"/timphong/hinhanh?fname=" + p.getAnhchinh() + "\" />\r\n"
//					+ "												</a></td>\r\n"
//					+ "												<td>" + p.getTen() + "</td>\r\n"
//					+ "												<td>"+ p.getGia() + "</td>\r\n"
//					+ "												<td>"+ p.getChieudai() + "*" + p.getChieurong() + "</td>\r\n"
//					+ "												<td></td>\r\n"
//					+ "												<td></td>\r\n"
//					+ "											</tr>");
//		}
	}
}

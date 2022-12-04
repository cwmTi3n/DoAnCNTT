package com.tpt.controller.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.annotations.Check;

import com.tpt.model.Dathen;
import com.tpt.model.Phong;
import com.tpt.model.Taikhoan;
import com.tpt.service.IDathenService;
import com.tpt.service.IPhongService;
import com.tpt.service.ITaikhoanService;
import com.tpt.service.impl.DathenServiceImpl;
import com.tpt.service.impl.PhongServiceImpl;
import com.tpt.service.impl.TaikhoanServiceImpl;
import com.tpt.util.Constant;
import com.tpt.util.ConstantFunction;
import com.tpt.util.SendMail;

@WebServlet(urlPatterns = {"/dathen", "/dathen/dat"})
public class DathenController extends HttpServlet
{

	/**
	 * 
	 */
	IPhongService phongService = new PhongServiceImpl();
	ITaikhoanService taikhoanService = new TaikhoanServiceImpl();
	IDathenService dathenService = new DathenServiceImpl();
	private static final long serialVersionUID = 1L;
	// trangthai {0}: luu, {1}: dang cho xac nha, {2}: duoc xac nhan, {3} bi huy
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("utf-8");
		taiTrang(req, resp);
		req.getRequestDispatcher("/views/web/formDathen.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("utf-8");
		String url = req.getRequestURI().toString();
		if(url.contains("dat"))
		{
			dhPhong(req, resp);
		}
		resp.sendRedirect(req.getContextPath() + "/listdathen");
	}
	
	protected void taiTrang(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		// trangthai {0}: luu, {1}: dang cho xac nha, {2}: duoc xac nhan, {3} bi huy
		HttpSession session = req.getSession();
		Object object = session.getAttribute("account");
		Taikhoan taikhoan = (Taikhoan)object;
		String id_pString = req.getParameter("id_p");
		int id_p = Integer.parseInt(id_pString);
		String id_dhString = req.getParameter("id_dh");
		int id_dh = 0;
		if(id_dhString != null)
		{
			id_dh = Integer.parseInt(id_dhString);
		}
		Dathen dathen = dathenService.findDathen(id_dh,taikhoan.getId_tk(), id_p);
		req.setAttribute("dathen", dathen);
		Phong phong = phongService.getPhong(id_p);
		req.setAttribute("phong", phong);
	}
	
	protected void dhPhong(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		HttpSession session = req.getSession();
		Object object = session.getAttribute("account");
		Taikhoan taikhoan = (Taikhoan)object;
		String id_pString = req.getParameter("id_p");
		int id_p = Integer.parseInt(id_pString);
		String ngayString = req.getParameter("ngay");
		String gioString = req.getParameter("gio") + ":00:00"; 
		int id_tk = taikhoan.getId_tk(); //dùng session để lấy
		Dathen dathen = new Dathen();
		dathen.setId_p(id_p);
		dathen.setId_tk(id_tk);
		dathen.setTrangthai(1);
		Date date = Date.valueOf(ngayString);
		Time time = Time.valueOf(gioString);
		dathen.setGio(time);
		dathen.setNgay(date);
		String id_dhString = req.getParameter("id_dh");
		int id_dh = Integer.parseInt(id_dhString);
		Dathen check = dathenService.findDathen(id_dh, id_tk, id_p);
		boolean kt = false;
		if(check != null)
		{
			dathen.setId_dh(id_dh);
			kt = dathenService.editDathen(dathen);
		}
		else 
		{
			kt = dathenService.insertDathen(dathen);
		}
		if(kt)
		{
			Phong phong = phongService.getPhong(id_p);
			String textSeller = ConstantFunction.textDathenSeller(phong, dathen);
			SendMail.sendEmail(phong.getTaikhoan().getEmail(), Constant.subMailSellerdh, textSeller);
		}
	}
}

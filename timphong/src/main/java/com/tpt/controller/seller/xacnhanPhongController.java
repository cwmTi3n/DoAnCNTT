package com.tpt.controller.seller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.If;

import com.tpt.model.Dathen;
import com.tpt.model.Taikhoan;
import com.tpt.service.IDathenService;
import com.tpt.service.impl.DathenServiceImpl;
import com.tpt.util.Constant;
import com.tpt.util.ConstantFunction;
import com.tpt.util.SendMail;

@WebServlet(urlPatterns = {"/xacnhan-p", "/xacnhan-p/huy", "/xacnhan-p/dongy"})
public class xacnhanPhongController extends HttpServlet
{

	/**
	 * 
	 */
	IDathenService dathenService = new DathenServiceImpl();
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		String url = req.getRequestURI().toString();
		if(url.contains("huy"))
		{
			xacnhanOrhuy(req, resp, 3);
			resp.sendRedirect(req.getContextPath() + "/xacnhan-p");
		}
		else if(url.contains("dongy"))
		{
			xacnhanOrhuy(req, resp, 2);
			resp.sendRedirect(req.getContextPath() + "/xacnhan-p");
		}
		else {
			taiTrang(req, resp);
			req.getRequestDispatcher("/views/seller/xacnhanPhong.jsp").forward(req, resp);
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	
	protected void taiTrang(HttpServletRequest req, HttpServletResponse resq) throws ServletException, IOException
	{
		HttpSession session = req.getSession();
		Object object = session.getAttribute("account");
		Taikhoan taikhoan = (Taikhoan)object;
		String hdString = req.getParameter("hanhdong");
		int id_tk = taikhoan.getId_tk();
		int trangthai = 1;
		if(hdString != null)
		{
			trangthai = Integer.parseInt(hdString);
		}
		List<Dathen> dhChoxn = dathenService.findBySeller(id_tk, trangthai); //Cho xac nhan
		List<Dathen> dhLuu = dathenService.findBySeller(id_tk, trangthai);
		req.setAttribute("dhChoxn", dhChoxn);
		req.setAttribute("dhLuu", dhLuu);
		req.setAttribute("hanhdong", trangthai);
	}
	
	protected void xacnhanOrhuy(HttpServletRequest req, HttpServletResponse resq, int trangthai) throws ServletException, IOException
	{
		String id_tkString = req.getParameter("id_tk");
		String id_pString = req.getParameter("id_p");
		String id_dhString = req.getParameter("id_dh");
		int id_tk = 0, id_p = 0, id_dh = 0;
		if(id_tkString != null)
		{
			id_tk = Integer.parseInt(id_tkString);
		}
		if(id_pString != null)
		{
			id_p = Integer.parseInt(id_pString);
		}
		if(id_dhString != null)
		{
			id_dh = Integer.parseInt(id_dhString);
		}
		Dathen dathen = dathenService.findDathen(id_dh, id_tk, id_p);
		if(dathen != null)
		{		
			dathen.setTrangthai(trangthai);
			if(dathenService.editDathen(dathen))
			{
				String text = ConstantFunction.textDathenUser(dathen);
				SendMail.sendEmail(dathen.getNguoidat().getEmail(), Constant.subMailUserdh, text);
			}
		}
	}	
}

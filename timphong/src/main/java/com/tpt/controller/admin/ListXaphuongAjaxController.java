package com.tpt.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpt.model.Xa;
import com.tpt.service.IXaService;
import com.tpt.service.impl.XaphuongServiceImpl;

@WebServlet(urlPatterns = {"/listxa"})
public class ListXaphuongAjaxController extends HttpServlet {
	
	
	private static final long serialVersionUID = 1L;
	IXaService xaphuongService = new XaphuongServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		
		resp.setCharacterEncoding("utf-8");
		
		String id_xa = req.getParameter("exits");
		int id_x = Integer.parseInt(id_xa);
		List<Xa> xas = xaphuongService.getByQuanhuyen(id_x);
	
		
		PrintWriter out = resp.getWriter();
		for(Xa x : xas)
		{
			out.println("<option value=" + x.getMaxa() + " > " + x.getTenxa() + "</option>\n");
		}
	}
}

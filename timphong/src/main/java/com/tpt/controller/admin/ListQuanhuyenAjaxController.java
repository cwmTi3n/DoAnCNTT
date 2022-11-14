package com.tpt.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpt.model.Huyen;
import com.tpt.service.IQuanhuyenService;
import com.tpt.service.impl.QuanhuyenServiceImpl;

@WebServlet(urlPatterns = { "/listhuyen" })
public class ListQuanhuyenAjaxController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	IQuanhuyenService quanhuyenService = new QuanhuyenServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setCharacterEncoding("utf-8");

		String id_tinh = req.getParameter("exits");
		int id_t = Integer.parseInt(id_tinh);
		System.out.println(id_t);
		List<Huyen> huyens = quanhuyenService.getByTinh(id_t);
		System.out.println("Số huyện: " + huyens.size());
		PrintWriter out = resp.getWriter();
		for (Huyen h : huyens) {
			out.println("<option value=" + h.getMahuyen() + " > " + h.getTenhuyen() + "</option>\n");
		}
	}
}

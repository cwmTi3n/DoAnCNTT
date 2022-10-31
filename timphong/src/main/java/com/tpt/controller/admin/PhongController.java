package com.tpt.controller.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.tpt.model.Phong;
import com.tpt.service.IPhongService;
import com.tpt.service.impl.PhongServiceImpl;
import com.tpt.util.Constant;

@WebServlet(urlPatterns = {"/admin/phong"})
@MultipartConfig()
public class PhongController extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	IPhongService phongService = new PhongServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html");
		String id_tk  = req.getParameter("id_tk");
		String id_p =req.getParameter("id_p");
		Phong phong = phongService.getPhong(Integer.parseInt(id_p));
		req.setAttribute("phong", phong);
		req.setAttribute("id_tk", id_tk);
		req.getRequestDispatcher("/views/admin/detail-phong.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html");
		String filename=null;
		Part part = req.getPart("hinhanh");
		String newFilename = part.getSubmittedFileName();
		if(!newFilename.isEmpty())
		{
			try
			{
				String realPath = Constant.DIR + "/phong";
				String realFileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
				int index = realFileName.lastIndexOf(".");
				String ext = realFileName.substring(index+1);
				filename = System.currentTimeMillis() + "." + ext;
				if(!Files.exists(Paths.get(realPath)))
				{
					Files.createDirectories(Paths.get(realPath));
				}
				part.write(realPath + "/" + filename);
			} catch (Exception e)
			{
				// TODO: handle exception
			}
		}
		Phong phong = new Phong();
		phong.setId_p(Integer.parseInt(req.getParameter("id_p")));
		phong.setTen(req.getParameter("ten"));
		phong.setTrangthai(true);
		phong.setHinhanh(filename);
		phong.setChieudai(Float.parseFloat(req.getParameter("chieudai")));
		phong.setChieurong(Float.parseFloat(req.getParameter("chieurong")));
		phong.setGia(Integer.parseInt(req.getParameter("gia")));
		phong.setYeuthich(Integer.parseInt(req.getParameter("yeuthich")));
		phong.setDcchitiet(req.getParameter("dcchitiet"));
		phong.setMota(req.getParameter("mota"));
		phong.setId_lp(Integer.parseInt(req.getParameter("id_lp")));
		String id_tk = req.getParameter("id_tk");
		phong.setId_tk(Integer.parseInt(id_tk));
		phongService.editPhong(phong);
		resp.sendRedirect(req.getContextPath() + "/admin/taikhoan?id_tk=" + id_tk);
		
	}
}

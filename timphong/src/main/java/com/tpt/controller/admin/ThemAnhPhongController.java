package com.tpt.controller.admin;

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

import com.tpt.model.Hinhanh;
import com.tpt.service.IHinhanhService;
import com.tpt.service.impl.HinhanhServiceImpl;
import com.tpt.util.Constant;

@MultipartConfig()
@WebServlet(urlPatterns = {"/admin/them-anh-phong"})
public class ThemAnhPhongController extends HttpServlet
{

	/**
	 * 
	 */
	IHinhanhService hinhanhService = new HinhanhServiceImpl();
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("utf-8");
		
		String id_p = req.getParameter("id_p");
		req.setAttribute("id_p", id_p);
		
		req.getRequestDispatcher("/views/admin/them-anhphong.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		Part part = req.getPart("hinhanh");

			String filename = null;
			String newFilename = part.getSubmittedFileName();
			String realPath = Constant.DIR + "/phong";
			if(newFilename != null)
			{
				try
				{					
					String realFileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
					int index = realFileName.lastIndexOf(".");
					String ext = realFileName.substring(index+1);
					Long time = System.currentTimeMillis();
					filename = time.toString() + "." + ext;
					if(!Files.exists(Paths.get(realPath)))
					{
						Files.createDirectories(Paths.get(realPath));
					}
				} catch (Exception e)
				{
					System.out.println(e.getMessage());
				}
			}
			Hinhanh hinhanh = new Hinhanh();
			String id_pString = req.getParameter("id_p");
			hinhanh.setId_p(Integer.parseInt(id_pString));
			hinhanh.setHinhanh(filename);
			if(hinhanhService.insertHinhanh(hinhanh))
			{
				part.write(realPath + "/" + filename);
			}
			resp.sendRedirect(req.getContextPath() + "/admin/phong?id_p=" + id_pString);
			
	}
}

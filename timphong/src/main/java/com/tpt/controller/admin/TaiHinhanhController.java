package com.tpt.controller.admin;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.IOUtils;

import com.tpt.util.Constant;

@WebServlet(urlPatterns = {"/hinhanh"})
public class TaiHinhanhController extends HttpServlet
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		String fileName = req.getParameter("fname");
		File file = new File(Constant.DIR + "/phong/" + fileName);
		resp.setContentType("image/jpeg");
		if (file.exists())
		{
			FileInputStream fileInputStream = new FileInputStream(file);
			IOUtils.copy(fileInputStream, resp.getOutputStream());
			fileInputStream.close();
		}
	}
}	

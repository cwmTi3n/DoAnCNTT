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
import com.tpt.service.IPhongService;
import com.tpt.service.impl.PhongServiceImpl;
import com.tpt.util.ConstantFunction;

@WebServlet(urlPatterns = { "/more" })
public class PagingAjaxPhongController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	IPhongService phongService = new PhongServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");

		String coutString = req.getParameter("exits");
		String keyword = req.getParameter("key");
		if(keyword == null)
		{
			keyword = "";
		}
		int cout = Integer.parseInt(coutString);
		String[] locString= new String[4];
		int[] loc = new int[4];
		locString[0] = req.getParameter("loaiphong");
		locString[1] = req.getParameter("tinh");
		System.out.println("oke " + locString[1]);
		locString[2] = req.getParameter("huyen");
		locString[3] = req.getParameter("xa");
		for(int i = 0; i < 4; i++)
		{
			if(locString[i] != null)
			{
				loc[i] = Integer.parseInt(locString[i]);
			}
		}
		List<Phong> phongs = ConstantFunction.locPhong(phongService.pagingPhong(cout, keyword), loc);
		PrintWriter out = resp.getWriter();
		for (Phong p : phongs) {
			out.println("        <div class=\"phong col-md-6 col-lg-4 mb-5 mb-lg-5 \">\r\n"
					+ "              <div class=\"ftco-media-1\">\r\n"
					+ "                  <div class=\"ftco-media-1-inner\">\r\n"
					+ "                    <a href=\"/timphong/detail-phong?id_p=" + p.getId_p()
					+ "\" class=\"d-inline-block mb-4\"><img src=\"/timphong/hinhanh?fname=" + p.getAnhchinh()
					+ "\" alt=\"Free website template by Free-Template.co\" class=\"img-fluid\"></a>\r\n"
					+ "                    <div class=\"ftco-media-details\">\r\n" + "                      <h3>"
					+ p.getTen() + "</h3>\r\n" + "                      <p>" + p.getMota() + "</p>\r\n" + "<p> "
					+ p.getXa().getTenxa() + ", " + p.getXa().getHuyen().getTenhuyen() + ", "
					+ p.getXa().getHuyen().getTinh().getTentinh() + "</p>\r\n" + "                      <strong>$"
					+ p.getGia() + "</strong>\r\n" + "                    </div>\r\n" + "      \r\n"
					+ "                  </div> \r\n" + "                </div>\r\n" + "          </div>");
		}
	}
}

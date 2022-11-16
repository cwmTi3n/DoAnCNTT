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
		int cout = Integer.parseInt(coutString);
		List<Phong> phongs = phongService.pagingPhong(cout);
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

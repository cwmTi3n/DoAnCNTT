package com.tpt.controller.seller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tpt.model.Loaiphong;
import com.tpt.model.Phong;
import com.tpt.model.Taikhoan;
import com.tpt.model.Tinh;
import com.tpt.service.IHinhanhService;
import com.tpt.service.ILoaiphongService;
import com.tpt.service.IPhongService;
import com.tpt.service.ITinhService;
import com.tpt.service.impl.HinhanhServiceImpl;
import com.tpt.service.impl.LoaiphongServiceImpl;
import com.tpt.service.impl.PhongServiceImpl;
import com.tpt.service.impl.TinhServiceImpl;
import com.tpt.util.Constant;
import com.tpt.util.ThemAnh;

@MultipartConfig()
@WebServlet(urlPatterns = {"/seller/ql-phong/xoa-anh-phong", "/seller/ql-phong", "/seller/ql-phong/select", "/seller/ql-phong/insert", "/seller/ql-phong/delete", "/seller/ql-phong/reset", "/seller/ql-phong/update"})
public class crudPhongController extends HttpServlet
{

	/**
	 * 
	 */
	IHinhanhService hinhanhService = new HinhanhServiceImpl();
	ITinhService tinhService = new TinhServiceImpl();
	IPhongService phongService = new PhongServiceImpl();
	ILoaiphongService loaiphongService = new LoaiphongServiceImpl();
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("utf-8");
		
		String url = req.getRequestURL().toString();
		if(url.contains("select"))
		{
			getPhong(req, resp);
		}
		else if(url.contains("xoa-anh-p"))
		{
			deleteAnhPhong(req, resp);
			getPhong(req, resp);
		}
		findPhongSeller(req, resp);
		req.getRequestDispatcher("/views/seller/quanlyphong.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("utf-8");
		String url = req.getRequestURL().toString();
		if(url.contains("insert"))
		{
			insert(req, resp);
		}
		else if(url.contains("delete"))
		{
			delete(req, resp);
		}
		else if(url.contains("update"))
		{
			update(req, resp);
		}
		resp.sendRedirect(req.getContextPath() + "/seller/ql-phong");
	}
	protected void findPhongSeller(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		HttpSession session = req.getSession();
		Object object = session.getAttribute("account");
		Taikhoan taikhoan = (Taikhoan)object;
		int id_tk = taikhoan.getId_tk();
		List<Phong> phongs = phongService.getPhongSeller(id_tk); //Khi có đăng nhập thì chỉnh lại id_tk
		List<Loaiphong> loaiphongs = loaiphongService.getAll();
		List<Tinh> tinhs = tinhService.getAll();
		req.setAttribute("tinhs", tinhs);
		req.setAttribute("loaiphongs", loaiphongs);
		req.setAttribute("phongs", phongs);
	}
	
	protected void getPhong(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		int id_p = Integer.parseInt(req.getParameter("id_p"));
		Phong phong = phongService.getPhong(id_p);
		req.setAttribute("phong", phong);
	}
	
	protected void insert(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		int temp = 0;
		String realPath = Constant.DIR + "/phong";
		String hinhanhs[] = new String[Constant.SoHinh];
		for(Part part : req.getParts())
		{
			String newFilename = part.getSubmittedFileName();
			if(newFilename != null)
			{
				hinhanhs[temp++] = ThemAnh.ThemAnh(part, realPath, temp);
			}
//			String filename = null;
//			String newFilename = part.getSubmittedFileName();
//			if(newFilename != null)
//			{
//				try
//				{
//					//String realPath = Constant.DIR + "/phong";					
//					String realFileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
//					int index = realFileName.lastIndexOf(".");
//					String ext = realFileName.substring(index+1);
//					Long time = System.currentTimeMillis() + temp;
//					filename = time.toString() + "." + ext;
//					if(!Files.exists(Paths.get(realPath)))
//					{
//						Files.createDirectories(Paths.get(realPath));
//					}
//					if(ext.length() != 0)
//					{
//						part.write(realPath + "/" + filename);
//					}
//					hinhanhs[temp++] = filename;
//				} catch (Exception e)
//				{
//					System.out.println(e.getMessage());
//				}
//			}
			
		}
		
		Phong phong = new Phong();
		phong.setTen(req.getParameter("ten"));
		phong.setAnhchinh(hinhanhs[0]);
		phong.setTrangthai(1);
		phong.setChieudai(Float.parseFloat(req.getParameter("chieudai")));
		phong.setChieurong(Float.parseFloat(req.getParameter("chieurong")));
		phong.setGia(Integer.parseInt(req.getParameter("gia")));
		phong.setYeuthich(0);
		phong.setDcchitiet(req.getParameter("dcchitiet"));
		phong.setMota(req.getParameter("mota"));
		phong.setId_lp(Integer.parseInt(req.getParameter("id_lp")));
		System.out.println("Ma xa: " + req.getParameter("xa"));
		phong.setMaxa(Integer.parseInt(req.getParameter("xa")));
		String id_tk = req.getParameter("id_tk");
		phong.setId_tk(1);
		phongService.insertPhong(phong, hinhanhs);
	}
	
	protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		String id_pString = req.getParameter("id_p");
		int id_p;
		if(id_pString != null)
		{
			id_p = Integer.parseInt(id_pString);
			phongService.deletePhong(id_p);
		}
	}
	protected void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		int temp = 0;
		String hinhanhs[] = new String[Constant.SoHinh];
		String realPath = Constant.DIR + "/phong";
		for(Part part : req.getParts())
		{
			String newFilename = part.getSubmittedFileName();
			if(newFilename != null)
			{
				hinhanhs[temp++] = ThemAnh.ThemAnh(part, realPath, temp);
			}
//			String filename = null;
//			String newFilename = part.getSubmittedFileName();
//			if(newFilename != null)
//			{
//				try
//				{
//					String realPath = Constant.DIR + "/phong";					
//					String realFileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
//					int index = realFileName.lastIndexOf(".");
//					String ext = realFileName.substring(index+1);
//					Long time = System.currentTimeMillis() + temp;
//					filename = time.toString() + "." + ext;
//					if(!Files.exists(Paths.get(realPath)))
//					{
//						Files.createDirectories(Paths.get(realPath));
//					}
//					if(ext.length() != 0)
//					{
//						part.write(realPath + "/" + filename);
//					}
//					hinhanhs[temp++] = filename;
//				} catch (Exception e)
//				{
//					System.out.println("ERR");
//				}
//			}

		}

		Phong phong = new Phong();
		phong.setId_p(Integer.parseInt(req.getParameter("id_p")));
		phong.setTen(req.getParameter("ten"));
		phong.setChieudai(Float.parseFloat(req.getParameter("chieudai")));
		phong.setChieurong(Float.parseFloat(req.getParameter("chieurong")));
		phong.setGia(Integer.parseInt(req.getParameter("gia")));
		phong.setDcchitiet(req.getParameter("dcchitiet"));
		phong.setMota(req.getParameter("mota"));
		phong.setId_lp(Integer.parseInt(req.getParameter("id_lp")));
		String id_xaString = req.getParameter("xa");
		int id_x = 0;
		if(id_xaString != null)
		{
			id_x = Integer.parseInt(id_xaString);
		}
		phong.setMaxa(id_x);
		System.out.println(phongService.editPhong(phong, hinhanhs, false));//false là seller edit
		System.out.println(phong.getId_p());
	}
	
	protected void deleteAnhPhong(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("utf-8");
		String id_pString = req.getParameter("id_p");
		String hinhanh = req.getParameter("hinhanh");
		hinhanhService.deleteHinhanh(hinhanh);
	}
}

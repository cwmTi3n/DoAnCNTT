package com.tpt.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tpt.model.Phong;
import com.tpt.model.Taikhoan;
import com.tpt.service.IPhongService;
import com.tpt.service.impl.PhongServiceImpl;

@WebFilter(urlPatterns = {"/seller/*"})
public class checkSellerFilter implements Filter
{
	IPhongService phongService = new PhongServiceImpl();
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException
	{
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String url = req.getRequestURI().toString();
		HttpSession session = req.getSession();
		Object object = session.getAttribute("account");
		Taikhoan taikhoan = (Taikhoan)object;
		if(taikhoan == null)
		{
			resp.sendRedirect(req.getContextPath() + "/trangchu");
		}
		else if(taikhoan.getQuyen() == 3)
		{
			if(url.contains("update") || url.contains("delete") || url.contains("select"))
			{
				actionPhongFilter(taikhoan, req, resp, request, response, chain);
			}
			else 
			{
				chain.doFilter(request, response);
			}
		}
		else 
		{
			resp.sendRedirect(req.getContextPath() + "/trangchu");
		}
	}
	
	public void actionPhongFilter(Taikhoan taikhoan, HttpServletRequest req, HttpServletResponse resp, ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException
	{
		String id_pString = req.getParameter("id_p");
		int id_p = 0;
		if(id_pString!=null)
		{
			id_p = Integer.parseInt(id_pString);
		}
		Phong phong = phongService.getPhong(id_p);
		if(phong == null)
		{
			resp.sendRedirect(req.getContextPath() + "/seller/ql-phong");
		}
		else if(phong.getId_tk() == taikhoan.getId_tk())
		{
			chain.doFilter(request, response);
		}
		else 
		{
			resp.sendRedirect(req.getContextPath() + "/seller/ql-phong");
		}
	}

}

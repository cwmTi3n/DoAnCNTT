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

import com.tpt.model.Taikhoan;

@WebFilter(urlPatterns = {"/dathen", "/trangcuatui", "/listdathen"})
public class checkUserFilter implements Filter
{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException
	{
		HttpServletRequest req  = (HttpServletRequest)request;
		HttpServletResponse resp  = (HttpServletResponse)response;
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		Object object = session.getAttribute("account");
		Taikhoan taikhoan = (Taikhoan)object;
		if(taikhoan == null)
		{
			resp.sendRedirect(req.getContextPath() + "/trangchu");
		}
		else
		{
			chain.doFilter(req, response);
		}
		
	}

}

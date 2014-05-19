package com.mkyong.customer.controller;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.filter.OncePerRequestFilter;

public class CharacterEncodingFilter extends OncePerRequestFilter {

	private String encoding = "UTF-8";
	private boolean forceEncoding = true;

	public void setEncoding(String encoding) {
		// this.encoding = encoding;
	}

	public void setForceEncoding(boolean forceEncoding) {
		this.forceEncoding = forceEncoding;
	}

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {

//		 System.out.println("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb\n"+request.getCharacterEncoding());

		if ((this.encoding != null) && ((this.forceEncoding) || (request.getCharacterEncoding() == null))) {
			request.setCharacterEncoding(this.encoding);
			
//			request.setCharacterEncoding("ISO-8859-1");
			
			if (this.forceEncoding) {
				response.setCharacterEncoding(this.encoding);
			}
		}
		filterChain.doFilter(request, response);
	}

}
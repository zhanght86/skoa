package com.thinkgem.jeesite.restful.filter;

import org.apache.shiro.web.servlet.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * 对拦截到的/api/**路径的请求,包裹自定义的MyHttpServletRequestWrapper,
 * 使得后期springmvc可以多次调用request.getInputStream()
 */
public class MyHttpServletWrapperFilter extends OncePerRequestFilter {

    @Override
    protected void doFilterInternal(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws ServletException, IOException {
        MyHttpServletRequestWrapper myHttpServletRequestWrapper=new MyHttpServletRequestWrapper((HttpServletRequest) servletRequest);
        super.doFilter(myHttpServletRequestWrapper,servletResponse,filterChain);
    }
}

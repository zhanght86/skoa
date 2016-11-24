package com.thinkgem.jeesite.restful.filter;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ReadListener;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import java.io.*;

/**
 * 应用场景:ajax请求调用springmvc提供的方法,参数中使用了@RequestBody,
 * 意味着客户端使用json字符串来传递数据的,要求客户端http headers中,指明Content-Type:application/json,
 * springmvc会通过request.getInputStream读取流中的http body内容;
 * <p>
 * 然而,shiro 在与springmvc集成后,shiro内部会调用request.getInputStream,而流操作只能读取一次,
 * 这样导致springmvc后期使用@RequestBody,无法再次读取http body中的内容;
 * 为了使用@RequestBody注解,需要对HttpServletRequestWrapper进行包装,使得springmvc后期可以多次调用到request.getInputStream
 */
public class MyHttpServletRequestWrapper extends HttpServletRequestWrapper {
	private Logger logger = LoggerFactory.getLogger(MyHttpServletRequestWrapper.class);

	private byte[] body;

	public MyHttpServletRequestWrapper(HttpServletRequest request) {
		super(request);
		try {
			body = IOUtils.toByteArray(request.getInputStream());
		} catch (IOException ex) {
			body = new byte[0];
		}
	}

	@Override
	public BufferedReader getReader() throws IOException {
		return new BufferedReader(new InputStreamReader(getInputStream()));
	}

	@Override
	public ServletInputStream getInputStream() throws IOException {
		return new ServletInputStream() {
			@Override
			public boolean isFinished() {
				return true;
			}

			@Override
			public boolean isReady() {
				return true;
			}

			@Override
			public void setReadListener(ReadListener readListener) {

			}

			ByteArrayInputStream bais = new ByteArrayInputStream(body);

			@Override
			public int read() throws IOException {
				return bais.read();
			}
		};
	}

	public String getBody() {
		StringBuilder stringBuilder = new StringBuilder();
		BufferedReader bufferedReader = null;

		try {
			InputStream inputStream = getInputStream();

			if (inputStream != null) {
				bufferedReader = new BufferedReader(new InputStreamReader(inputStream));

				char[] charBuffer = new char[128];
				int bytesRead = -1;

				while ((bytesRead = bufferedReader.read(charBuffer)) > 0) {
					stringBuilder.append(charBuffer, 0, bytesRead);
				}
			} else {
				stringBuilder.append("");
			}
		} catch (IOException ex) {
			logger.error("Error reading the request body...");
		} finally {
			if (bufferedReader != null) {
				try {
					bufferedReader.close();
				} catch (IOException ex) {
					logger.error("Error closing bufferedReader...");
				}
			}
		}

		return stringBuilder.toString();
	}

}
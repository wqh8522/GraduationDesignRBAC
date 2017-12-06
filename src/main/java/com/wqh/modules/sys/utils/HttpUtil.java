package com.wqh.modules.sys.utils;

import org.apache.http.HttpEntity;
import org.apache.http.HttpStatus;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

/**
 * 获取Http请求内容
 *
 * @author wanqh
 */
public class HttpUtil {
	/**
	 * <p>
	 * get方式获取请求内容
	 * </p>
	 * 
	 * @param url
	 *            访问链接地址
	 * @return 数据请求内容byte[]形式
	 * @throws Exception
	 */
	public static byte[] get4Byte(String url) throws Exception {
		byte[] content = null;
		CloseableHttpClient httpclient = HttpClients.createDefault();
		HttpGet httpget = new HttpGet(url);
		CloseableHttpResponse response = httpclient.execute(httpget);
		try {
			int statusCode = response.getStatusLine().getStatusCode();
			if (statusCode == HttpStatus.SC_OK) {
				HttpEntity entity = response.getEntity();
				content = EntityUtils.toByteArray(entity);
			}
		} finally {
			response.close();
		}
		return content;
	}
}

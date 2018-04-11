package com.wqh.modules.sys.utils;

import java.io.*;

import org.springframework.web.multipart.MultipartFile;

import com.wqh.common.utils.UUIDUtil;
import com.wqh.modules.sys.entity.TAttachs;

import javax.servlet.http.HttpServletRequest;

/**
 * 附件保存工具类
 */
public class AttachUtil {
	
	/**
	 * 附件保存工具类
	 * @param file
	 * @return 返回附件表对象
	 * @throws Exception
	 */
	public static TAttachs save(MultipartFile file) throws Exception {
		TAttachs attach = new TAttachs();
		
		String path = Thread.currentThread().getContextClassLoader().getResource("").toString();
		path = path.substring(path.indexOf("/") + 1);
		path += "attachs" + File.separator;
		
		File outFolder = new File(path);
		if(!outFolder.exists()){
			outFolder.mkdirs();
		}
		String fileName = file.getOriginalFilename();
		String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
		String savePath =  path + UUIDUtil.randomUUID() + "." + ext;
		
		byte[] bs = new byte[1024];
        int len;

        InputStream inputStream = file.getInputStream();
        OutputStream os = null;
        File tempFile = new File(path);
        if (!tempFile.exists()) {
            tempFile.mkdirs();
        }
        os = new FileOutputStream(savePath);
        // 开始读取
        while ((len = inputStream.read(bs)) != -1) {
            os.write(bs, 0, len);
        }
        
        attach.setFileType(ext);
        attach.setFileName(fileName);
        attach.setFilePath(savePath);
        return attach;
	}

	/**
	 * 保存公开文件
	 * @param file			上传文件
	 * @param savepath	保存路径，如 /asset/newscover
	 * @param request		request请求
	 * @return	文件保存路径
	 */
	public static String openSave(MultipartFile file, String savepath, HttpServletRequest request, String format) throws IOException {
		String path = request.getRealPath("/");
		// 读取保存文件
		String savePath = savepath;
		File outFolder = new File(path+savePath);
		if(!outFolder.exists()){
			outFolder.mkdirs();
		}
		savePath +=  UUIDUtil.randomUUID() + "." +format;

		byte[] bs = new byte[1024];
		int len;

		InputStream inputStream = file.getInputStream();
		OutputStream os = null;
		File tempFile = new File(path);
		if (!tempFile.exists()) {
			tempFile.mkdirs();
		}
		os = new FileOutputStream(path + savePath);
		// 开始读取
		while ((len = inputStream.read(bs)) != -1) {
			os.write(bs, 0, len);
		}
		return savePath;
	}

	/**
	 * 保存公开文件(指定文件名/a.png)
	 * @param
	 * @return
	 */
	public static String openSave(MultipartFile file, String savepath, String fileNewName, HttpServletRequest request) throws IOException {
		String path = request.getRealPath("/");
		// 读取保存文件
		String savePath = savepath;
		File outFolder = new File(path+savePath);
		if(!outFolder.exists()){
			outFolder.mkdirs();
		}
		String originName = file.getOriginalFilename();
		String format = "";
		if(originName.lastIndexOf(".") == -1) {
			format = file.getContentType().split("/")[1];
		} else {
			format = originName.substring(originName.lastIndexOf("."));
		}

		savePath +=  fileNewName;

		byte[] bs = new byte[1024];
		int len;

		InputStream inputStream = file.getInputStream();
		OutputStream os = null;
		File tempFile = new File(path);
		if (!tempFile.exists()) {
			tempFile.mkdirs();
		}
		os = new FileOutputStream(path + savePath);
		// 开始读取
		while ((len = inputStream.read(bs)) != -1) {
			os.write(bs, 0, len);
		}
		return savePath;
	}
	
}

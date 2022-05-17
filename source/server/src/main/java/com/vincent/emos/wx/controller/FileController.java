package com.vincent.emos.wx.controller;

import lombok.extern.slf4j.Slf4j;

import com.github.tobato.fastdfs.domain.fdfs.StorePath;
import com.github.tobato.fastdfs.service.FastFileStorageClient;
import com.vincent.emos.wx.common.util.R;

import io.swagger.annotations.Api;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import com.github.tobato.fastdfs.domain.proto.storage.DownloadCallback;

/** 通用文件上传下载fastdfs相关接口 */
@RestController
@RequestMapping("/file")
@Slf4j
@Api("通用文件上传下载模块web接口")
public class FileController {

	@Autowired
	private FastFileStorageClient storageClient;

	@Value("${fdfs.path}")
	private String				  fdfsPath;

	/** 通用文件上传接口
	 * 
	 * @param file
	 *        前端传递过来的文件
	 * @return
	 * @throws IOException */
	@PostMapping("/common/upload")
	public R commonUpload(@RequestParam MultipartFile file) throws IOException {
		long size = file.getSize();
		String fileExtName = StringUtils.substringAfterLast(file.getOriginalFilename(), ".");
		String url = StringUtils.EMPTY;
		StorePath storePath = storageClient.uploadFile(file.getInputStream(), size, fileExtName, null);
		if (null != storePath) {
			url = fdfsPath + storePath.getFullPath();
		}
		return R.ok("校验成功").put("fullPath", url);
	}

	@RequestMapping(value = "/download", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public void download(String fullPath, HttpServletResponse response) {
		log.info("文件下载download开始，fileId:{}", fullPath);
		// 根据文件的唯一标识码获取文件
		// File uploadFile = new File(fileUploadPath + fileUUID);
		/*
		 * Files file = this.fileMapper.selectById(fileId); if (null == file) { throw new BusinessException("文件不存在" + fileId); }
		 */
		// http://106.13.6.212:8888/group1/M00/00/00/wKgABGJruxaARh8KAAAdGOcemSk658.png
		String url = StringUtils.substringAfter(fullPath, fdfsPath);
		String fileName = StringUtils.substringAfterLast(url, "/");
		// 待下载文件名
		response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
		response.setContentType("application/octet-stream");
		response.setCharacterEncoding("utf-8");
		String group = StringUtils.substringBefore(url, "/");
		String path = StringUtils.substringAfter(url, "/");
		InputStream ins = storageClient.downloadFile(group, path, new DownloadCallback<InputStream>() {

			@Override
			public InputStream recv(InputStream ins) throws IOException {
				// 将此ins返回给上面的ins
				return ins;
			}
		});

		BufferedInputStream in = null;
		BufferedOutputStream out = null;
		byte[] buff = new byte[1024];
		int length = 0;
		try {
			in = new BufferedInputStream(ins);
			out = new BufferedOutputStream(response.getOutputStream());
			while ((length = in.read(buff)) != -1) {
				out.write(buff, 0, length);
			}

		}
		catch (IOException e) {
			e.printStackTrace();
		}
		finally {
			if (out != null) {
				try {
					out.flush();
					out.close();
				}
				catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (in != null) {
				try {
					in.close();
				}
				catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

}

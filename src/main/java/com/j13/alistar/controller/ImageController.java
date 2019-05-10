package com.j13.alistar.controller;

import com.alibaba.fastjson.JSON;
import com.j13.alistar.net.ImageServerManager;
import com.j13.alistar.vos.ImgVO;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Enumeration;
import java.util.List;

@Controller
@RequestMapping("/image")
public class ImageController {

    @Autowired
    ImageServerManager imageServerManager;

    @RequestMapping("/upload")
    @ResponseBody
    public String upload(HttpServletRequest request, HttpServletResponse response) throws Exception {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setHeaderEncoding("UTF-8");
        ImgVO imgVO = null;
        List<FileItem> list = upload.parseRequest(request);
        for (FileItem item : list) {
            if (!item.isFormField()) {
                imgVO = imageServerManager.upload(item);
            }
        }
        return JSON.toJSONString(imgVO);
    }


}

package com.j13.alistar.net;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.j13.alistar.core.config.PropertiesConfiguration;
import com.j13.alistar.util.InternetUtil;
import com.j13.alistar.vos.BarVO;
import com.j13.alistar.vos.ImgVO;
import com.j13.poppy.util.BeanUtils;
import com.j13.ryze.api.resp.AdminBarDetailResp;
import com.j13.ryze.api.resp.AdminBarListResp;
import com.j13.ryze.api.resp.ImgUploadResp;
import org.apache.commons.fileupload.FileItem;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class ImageServerManager extends BaseServerManager {

    private static Logger LOG = LoggerFactory.getLogger(ImageServerManager.class);

    public ImgVO upload(FileItem fileItem) throws Exception {
        String path = PropertiesConfiguration.getInstance().getStringValue("img.tmp.path");
        File tmpFile = new File(path, fileItem.getName());
        fileItem.write(tmpFile);
        LOG.info("write tmp file . path={}", tmpFile.getAbsolutePath());
        Map<String, Object> params = Maps.newHashMap();
        params.put("act", "img.upload");
        params.put("type", 2);
        String url = getServerUrl();
        String rawResponse = InternetUtil.post(url, params, "file", tmpFile);
        tryParseError(rawResponse);

        ImgUploadResp resp = JSON.parseObject(rawResponse, ImgUploadResp.class);

        ImgVO imgVO = new ImgVO();
        BeanUtils.copyProperties(imgVO, resp);
        return imgVO;

    }
}

package com.j13.alistar.net;

import com.alibaba.fastjson.JSON;
import com.j13.alistar.core.AdminConstants;
import com.j13.alistar.core.config.PropertiesConfiguration;
import com.j13.poppy.ErrorResponse;

import java.text.SimpleDateFormat;

public class BaseServerManager {

    protected static int SIZE_PER_PAGE = 500;
    protected static int DEFAULT_PAGE_NUM = 0;
    protected SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");


    protected String getServerUrl() {
        return PropertiesConfiguration.getInstance().getStringValue(AdminConstants.GAREN_SERVER_URL_KEY);
    }


    /**
     * 尝试解析exception，如果有错误的话把错误抛出
     *
     * @param rawResponse
     * @return
     */
    protected void tryParseError(String rawResponse) throws RemoteServerException {
        ErrorResponse r = JSON.parseObject(rawResponse, ErrorResponse.class);
        if (r.getCode() != 0) {
            throw new RemoteServerException(r.getCode());
        }

    }
}

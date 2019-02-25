package com.j13.alistar.net;

import com.j13.alistar.core.AdminConstants;
import com.j13.alistar.core.config.PropertiesConfiguration;

import java.text.SimpleDateFormat;

public class BaseServerManager {

    protected static int SIZE_PER_PAGE = 500;
    protected static int DEFAULT_PAGE_NUM = 0;
    protected SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");


    protected String getServerUrl() {
        return PropertiesConfiguration.getInstance().getStringValue(AdminConstants.GAREN_SERVER_URL_KEY);
    }
}

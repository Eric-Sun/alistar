package com.j13.evelynn.net;

import com.j13.evelynn.core.AdminConstants;
import com.j13.evelynn.core.config.PropertiesConfiguration;

public class BaseServerManager {

    protected static int SIZE_PER_PAGE = 10;
    protected static int DEFAULT_PAGE_NUM = 0;

    protected String getServerUrl() {
        return PropertiesConfiguration.getInstance().getStringValue(AdminConstants.GAREN_SERVER_URL_KEY);
    }
}

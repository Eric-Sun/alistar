package com.j13.alistar.util;

import com.j13.alistar.core.AdminConstants;
import com.j13.alistar.core.config.PropertiesConfiguration;

public class ImgUtil {

    public static String getImgFullUrl(String fileName) {
        String prefix = PropertiesConfiguration.getInstance().getStringValue(AdminConstants.IMG_URL_PREFIX);
        return prefix + fileName;

    }
}

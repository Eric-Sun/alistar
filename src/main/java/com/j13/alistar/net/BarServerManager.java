package com.j13.alistar.net;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.j13.alistar.util.InternetUtil;
import com.j13.alistar.vos.BarVO;
import com.j13.poppy.core.CommonResultResp;
import com.j13.poppy.util.BeanUtils;
import com.j13.ryze.api.resp.*;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class BarServerManager extends BaseServerManager {


    public List<BarVO> barList(int pageNum) {
        Map<String, Object> params = Maps.newHashMap();
        params.put("act", "admin.bar.list");
        params.put("size", SIZE_PER_PAGE);
        params.put("pageNum", pageNum);
        String url = getServerUrl();
        String rawResponse = InternetUtil.post(url, params);
        AdminBarListResp resp = JSON.parseObject(rawResponse, AdminBarListResp.class);

        List<BarVO> list = Lists.newLinkedList();
        for (AdminBarDetailResp r : resp.getData()) {
            BarVO a = new BarVO();
            BeanUtils.copyProperties(a, r);
            a.setCreatetime(sdf.format(new Date(r.getCreatetime())));
            list.add(a);
        }
        return list;
    }


    public int createBar(String barName, int userId) {
        Map<String, Object> params = Maps.newHashMap();
        params.put("act", "admin.bar.add");
        params.put("name", barName);
        params.put("userId", userId);
        String url = getServerUrl();
        String rawResponse = InternetUtil.post(url, params);
        AdminBarAddResp resp = JSON.parseObject(rawResponse, AdminBarAddResp.class);
        return resp.getBarId();
    }


    public CommonResultResp delete(int barId) {
        Map<String, Object> params = Maps.newHashMap();
        params.put("act", "admin.bar.delete");
        params.put("barId", barId);
        String url = getServerUrl();
        String rawResponse = InternetUtil.post(url, params);
        return JSON.parseObject(rawResponse, CommonResultResp.class);
    }
}

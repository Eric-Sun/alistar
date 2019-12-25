package com.j13.alistar.net;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.j13.alistar.util.InternetUtil;
import com.j13.alistar.vos.BarVO;
import com.j13.alistar.vos.StarPostVO;
import com.j13.poppy.core.CommonResultResp;
import com.j13.poppy.util.BeanUtils;
import com.j13.ryze.api.resp.*;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class StarPostServerManager extends BaseServerManager {

    public int add(int postId, int value) throws RemoteServerException {

        Map<String, Object> params = Maps.newHashMap();
        params.put("act", "admin.starPost.add");
        params.put("postId", postId);
        params.put("value", value);
        String url = getServerUrl();
        String rawResponse = InternetUtil.post(url, params);
        tryParseError(rawResponse);
        AdminStarPostAddResp resp = JSON.parseObject(rawResponse, AdminStarPostAddResp.class);
        return resp.getId();
    }


    public CommonResultResp delete(int id) throws RemoteServerException {
        Map<String, Object> params = Maps.newHashMap();
        params.put("act", "admin.starPost.delete");
        params.put("id", id);
        String url = getServerUrl();
        String rawResponse = InternetUtil.post(url, params);
        tryParseError(rawResponse);
        CommonResultResp resp = JSON.parseObject(rawResponse, CommonResultResp.class);
        return resp;
    }


    public List<StarPostVO> list() throws RemoteServerException {
        List<StarPostVO> list = Lists.newLinkedList();
        Map<String, Object> params = Maps.newHashMap();
        params.put("act", "admin.starPost.list");
        String url = getServerUrl();
        String rawResponse = InternetUtil.post(url, params);
        tryParseError(rawResponse);
        AdminStarPostListResp resp = JSON.parseObject(rawResponse, AdminStarPostListResp.class);
        for (AdminStarPostDetailResp detailResp : resp.getData()) {
            StarPostVO vo = new StarPostVO();
            BeanUtils.copyProperties(vo, detailResp);
            list.add(vo);
        }
        return list;
    }
}

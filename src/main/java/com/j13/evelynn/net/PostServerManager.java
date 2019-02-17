package com.j13.evelynn.net;


import com.alibaba.fastjson.JSON;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.j13.evelynn.util.InternetUtil;
import com.j13.evelynn.vos.BarVO;
import com.j13.evelynn.vos.PostVO;
import com.j13.poppy.util.BeanUtils;
import com.j13.ryze.api.resp.AdminBarAddResp;
import com.j13.ryze.api.resp.AdminBarDetailResp;
import com.j13.ryze.api.resp.AdminPostDetailResp;
import com.j13.ryze.api.resp.AdminPostListResp;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class PostServerManager extends BaseServerManager {

    public Map<String, Object> list(int barId) {
        Map<String, Object> params = Maps.newHashMap();
        params.put("act", "admin.post.list");
        params.put("barId", barId);
        params.put("size", SIZE_PER_PAGE);
        params.put("pageNum", 0);
        String url = getServerUrl();
        String rawResponse = InternetUtil.post(url, params);
        AdminPostListResp resp = JSON.parseObject(rawResponse, AdminPostListResp.class);
        List<PostVO> list = Lists.newLinkedList();
        for (AdminPostDetailResp r : resp.getList()) {
            PostVO a = new PostVO();
            BeanUtils.copyProperties(a, r);
            a.setCreatetime(sdf.format(new Date(r.getCreatetime())));
            list.add(a);
        }
        Map<String, Object> data = Maps.newHashMap();
        data.put("list", list);
        data.put("barName", resp.getBarName());
        return data;
    }

}

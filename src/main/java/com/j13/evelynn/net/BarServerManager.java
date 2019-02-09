package com.j13.evelynn.net;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.j13.evelynn.security.model.Authority;
import com.j13.evelynn.util.InternetUtil;
import com.j13.evelynn.vos.BarVO;
import com.j13.poppy.util.BeanUtils;
import com.j13.ryze.api.resp.AccountGetAuthorityByNameResp;
import com.j13.ryze.api.resp.AuthorityGetResp;
import com.j13.ryze.api.resp.BarDetailResp;
import com.j13.ryze.api.resp.BarListResp;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class BarServerManager extends BaseServerManager {

    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

    public List<BarVO> barList(int pageNum) {
        Map<String, Object> params = Maps.newHashMap();
        params.put("act", "bar.list");
        params.put("size", SIZE_PER_PAGE);
        params.put("pageNum", pageNum);
        String url = getServerUrl();
        String rawResponse = InternetUtil.post(url, params);
        BarListResp resp = JSON.parseObject(rawResponse, BarListResp.class);

        List<BarVO> list = Lists.newLinkedList();
        for (BarDetailResp r : resp.getData()) {
            BarVO a = new BarVO();
            BeanUtils.copyProperties(a, r);
            a.setCreatetime(sdf.format(new Date(r.getCreatetime())));
            list.add(a);
        }
        return list;
    }
}

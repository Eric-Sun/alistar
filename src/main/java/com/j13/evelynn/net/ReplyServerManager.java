package com.j13.evelynn.net;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.j13.evelynn.util.InternetUtil;
import com.j13.evelynn.vos.BarVO;
import com.j13.evelynn.vos.ReplyVO;
import com.j13.poppy.util.BeanUtils;
import com.j13.ryze.api.resp.AdminBarDetailResp;
import com.j13.ryze.api.resp.AdminBarListResp;
import com.j13.ryze.api.resp.AdminReplyDetailResp;
import com.j13.ryze.api.resp.AdminReplyListResp;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class ReplyServerManager extends BaseServerManager {


    public List<ReplyVO> list(int postId) {
        Map<String, Object> params = Maps.newHashMap();
        params.put("act", "admin.reply.list");
        params.put("postId", postId);
        params.put("size", SIZE_PER_PAGE);
        params.put("pageNum", 0);
        String url = getServerUrl();
        String rawResponse = InternetUtil.post(url, params);
        AdminReplyListResp resp = JSON.parseObject(rawResponse, AdminReplyListResp.class);

        List<ReplyVO> list = Lists.newLinkedList();
        for (AdminReplyDetailResp r : resp.getData()) {
            ReplyVO a = new ReplyVO();
            BeanUtils.copyProperties(a, r);
            a.setCreatetime(sdf.format(new Date(r.getCreatetime())));
            list.add(a);
        }
        return list;
    }

}

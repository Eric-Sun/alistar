package com.j13.alistar.net;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.j13.alistar.util.InternetUtil;
import com.j13.alistar.vos.ReplyVO;
import com.j13.poppy.util.BeanUtils;
import com.j13.ryze.api.resp.AdminReplyDetailResp;
import com.j13.ryze.api.resp.AdminReplyListResp;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class AuditServerManager extends BaseServerManager {

    public List<ReplyVO> replyList(int barId) throws RemoteServerException {
        Map<String, Object> params = Maps.newHashMap();
        params.put("act", "admin.audit.reply.list");
        params.put("barId", barId);
        params.put("size", SIZE_PER_PAGE);
        params.put("pageNum", 0);
        String url = getServerUrl();
        String rawResponse = InternetUtil.post(url, params);
        tryParseError(rawResponse);
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

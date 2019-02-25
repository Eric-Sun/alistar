package com.j13.alistar.net;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.j13.alistar.util.InternetUtil;
import com.j13.alistar.vos.ReplyVO;
import com.j13.poppy.core.CommonResultResp;
import com.j13.poppy.util.BeanUtils;
import com.j13.ryze.api.resp.*;
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

    public AdminReplyDetailResp get(int replyId) {
        Map<String, Object> params = Maps.newHashMap();
        params.put("act", "admin.reply.detail");
        params.put("replyId", replyId);
        String url = getServerUrl();
        String rawResponse = InternetUtil.post(url, params);
        AdminReplyDetailResp resp = JSON.parseObject(rawResponse, AdminReplyDetailResp.class);
        return resp;
    }

    public Object create(int barId, int postId, int userId, String content) {
        Map<String, Object> params = Maps.newHashMap();
        params.put("act", "admin.reply.add");
        params.put("postId", postId);
        params.put("userId", userId);
        params.put("content", content);
        params.put("barId", barId);
        String url = getServerUrl();
        String rawResponse = InternetUtil.post(url, params);
        AdminReplyAddResp resp = JSON.parseObject(rawResponse, AdminReplyAddResp.class);
        return resp.getReplyId();
    }

    public CommonResultResp delete(int replyId,int postId) {
        Map<String, Object> params = Maps.newHashMap();
        params.put("act", "admin.reply.delete");
        params.put("replyId", replyId);
        params.put("postId", postId);
        String url = getServerUrl();
        String rawResponse = InternetUtil.post(url, params);
        CommonResultResp resp = JSON.parseObject(rawResponse, CommonResultResp.class);
        return resp;
    }

    public Object update(int replyId, int userId, int content) {
        Map<String, Object> params = Maps.newHashMap();
        params.put("act", "admin.reply.updateContent");
        params.put("replyId", replyId);
        params.put("userId", userId);
        params.put("content", content);
        String url = getServerUrl();
        String rawResponse = InternetUtil.post(url, params);
        CommonResultResp resp = JSON.parseObject(rawResponse, CommonResultResp.class);
        return resp;
    }
}

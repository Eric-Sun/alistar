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
//            if (r.getReplyList().size() != 0) {
//                for (AdminReplyDetailResp r2 : r.getReplyList()) {
//                    ReplyVO a2 = new ReplyVO();
//                    BeanUtils.copyProperties(a2, r2);
//                    a2.setCreatetime(sdf.format(new Date(r2.getCreatetime())));
//                    a.getReplyList().add(a2);
//                    if (r2.getReplyList().size() != 0) {
//                        for (AdminReplyDetailResp r3 : r2.getReplyList()) {
//                            ReplyVO a3 = new ReplyVO();
//                            BeanUtils.copyProperties(a3, r3);
//                            a3.setCreatetime(sdf.format(new Date(r3.getCreatetime())));
//                            a2.getReplyList().add(a3);
//                        }
//                    }
//                }
//            }
        }

        return list;
    }

    public ReplyVO get(int replyId) {
        Map<String, Object> params = Maps.newHashMap();
        params.put("act", "admin.reply.detail");
        params.put("replyId", replyId);
        String url = getServerUrl();
        String rawResponse = InternetUtil.post(url, params);
        AdminReplyDetailResp resp = JSON.parseObject(rawResponse, AdminReplyDetailResp.class);
        ReplyVO reply = new ReplyVO();
        BeanUtils.copyProperties(reply, resp);
        reply.setCreatetime(sdf.format(new Date(resp.getCreatetime())));
        return reply;
    }

    public Object create(int barId, int postId, int userId, String content, int anonymous, int lastReplyId) {
        Map<String, Object> params = Maps.newHashMap();
        params.put("act", "admin.reply.add");
        params.put("postId", postId);
        params.put("userId", userId);
        params.put("content", content);
        params.put("anonymous", anonymous);
        params.put("barId", barId);
        params.put("lastReplyId", lastReplyId);
        String url = getServerUrl();
        String rawResponse = InternetUtil.post(url, params);
        AdminReplyAddResp resp = JSON.parseObject(rawResponse, AdminReplyAddResp.class);
        return resp.getReplyId();
    }

    public CommonResultResp delete(int replyId, int postId) {
        Map<String, Object> params = Maps.newHashMap();
        params.put("act", "admin.reply.delete");
        params.put("replyId", replyId);
        params.put("postId", postId);
        String url = getServerUrl();
        String rawResponse = InternetUtil.post(url, params);
        CommonResultResp resp = JSON.parseObject(rawResponse, CommonResultResp.class);
        return resp;
    }

    public Object update(int replyId, int userId, String content, int anonymous) {
        Map<String, Object> params = Maps.newHashMap();
        params.put("act", "admin.reply.update");
        params.put("replyId", replyId);
        params.put("userId", userId);
        params.put("content", content);
        params.put("anonymous", anonymous);
        String url = getServerUrl();
        String rawResponse = InternetUtil.post(url, params);
        CommonResultResp resp = JSON.parseObject(rawResponse, CommonResultResp.class);
        return resp;
    }
}

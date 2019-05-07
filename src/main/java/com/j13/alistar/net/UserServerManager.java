package com.j13.alistar.net;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.j13.alistar.util.InternetUtil;
import com.j13.alistar.vos.BarVO;
import com.j13.alistar.vos.UserVO;
import com.j13.poppy.core.CommonResultResp;
import com.j13.poppy.util.BeanUtils;
import com.j13.ryze.api.resp.AdminBarDetailResp;
import com.j13.ryze.api.resp.AdminBarListResp;
import com.j13.ryze.api.resp.AdminUserDetailResp;
import com.j13.ryze.api.resp.AdminUserListResp;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class UserServerManager extends BaseServerManager {


    public List<UserVO> list(int pageNum) throws RemoteServerException {
        Map<String, Object> params = Maps.newHashMap();
        params.put("act", "admin.user.list");
        params.put("size", SIZE_PER_PAGE);
        params.put("pageNum", pageNum);
        String url = getServerUrl();
        String rawResponse = InternetUtil.post(url, params);
        tryParseError(rawResponse);
        AdminUserListResp resp = JSON.parseObject(rawResponse, AdminUserListResp.class);
        List<UserVO> list = Lists.newLinkedList();
        for (AdminUserDetailResp r : resp.getList()) {
            UserVO a = new UserVO();
            BeanUtils.copyProperties(a, r);
            a.setCreatetime(sdf.format(new Date(r.getCreatetime())));
            list.add(a);
        }
        return list;
    }


    public List<UserVO> search(String text, int pageNum) throws RemoteServerException {
        Map<String, Object> params = Maps.newHashMap();
        params.put("act", "admin.user.search");
        params.put("text", text);
        params.put("size", SIZE_PER_PAGE);
        params.put("pageNum", pageNum);
        String url = getServerUrl();
        String rawResponse = InternetUtil.post(url, params);
        tryParseError(rawResponse);
        AdminUserListResp resp = JSON.parseObject(rawResponse, AdminUserListResp.class);
        List<UserVO> list = Lists.newLinkedList();
        for (AdminUserDetailResp r : resp.getList()) {
            UserVO a = new UserVO();
            BeanUtils.copyProperties(a, r);
            a.setCreatetime(sdf.format(new Date(r.getCreatetime())));
            list.add(a);
        }
        return list;
    }

    public void lock(int lockUserId, int lockReasonType, String lockReason, long unlockTime) throws RemoteServerException {
        Map<String, Object> params = Maps.newHashMap();
        params.put("act", "admin.user.lock");
        params.put("lockUserId",lockUserId);
        params.put("lockReasonType",lockReasonType);
        params.put("lockReason",lockReason);
        params.put("unlockTime",unlockTime);
        String url = getServerUrl();
        String rawResponse = InternetUtil.post(url, params);
        tryParseError(rawResponse);
        CommonResultResp resp = JSON.parseObject(rawResponse, CommonResultResp.class);
    }

    public void unlock(int unlockUserId, String unlockReason) throws RemoteServerException {
        Map<String, Object> params = Maps.newHashMap();
        params.put("act", "admin.user.unlock");
        params.put("unlockUserId",unlockUserId);
        params.put("unlockReason",unlockReason);
        String url = getServerUrl();
        String rawResponse = InternetUtil.post(url, params);
        tryParseError(rawResponse);
        CommonResultResp resp = JSON.parseObject(rawResponse, CommonResultResp.class);
    }
}

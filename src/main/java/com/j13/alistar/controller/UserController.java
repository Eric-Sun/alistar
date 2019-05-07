package com.j13.alistar.controller;

import com.alibaba.fastjson.JSON;
import com.j13.alistar.net.RemoteServerErrorResponse;
import com.j13.alistar.net.RemoteServerException;
import com.j13.alistar.net.UserServerManager;
import com.j13.alistar.vos.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {


    @Autowired
    UserServerManager userServerManager;

    @RequestMapping("/list")
    public String list(HttpServletRequest request, Map<String, Object> model) {
        return "/user/list";
    }

    @RequestMapping("/getUserList")
    @ResponseBody
    public String getUserList(@RequestParam(name = "pageNum") int pageNum) {
        List<UserVO> list = null;
        try {
            list = userServerManager.list(pageNum);
        } catch (RemoteServerException e) {
            return JSON.toJSONString(new RemoteServerErrorResponse(e.getCode()));
        }
        return JSON.toJSONString(list);
    }


    @RequestMapping("/searchUser")
    @ResponseBody
    public String searchUser(@RequestParam(name = "text") String text,
                             @RequestParam(name = "pageNum") int pageNum) {
        List<UserVO> list = null;
        try {
            list = userServerManager.search(text, pageNum);
        } catch (RemoteServerException e) {
            return JSON.toJSONString(new RemoteServerErrorResponse(e.getCode()));
        }
        return JSON.toJSONString(list);
    }


    @RequestMapping("lock")
    @ResponseBody
    public String lock(@RequestParam(name = "lockUserId") int lockUserId,
                       @RequestParam(name = "lockReasonType") int lockReasonType,
                       @RequestParam(name = "lockReason") String lockReason,
                       @RequestParam(name = "unlockTime") long unlockTime) {
        try {
            userServerManager.lock(lockUserId, lockReasonType, lockReason, unlockTime);
        } catch (RemoteServerException e) {
            return JSON.toJSONString(new RemoteServerErrorResponse(e.getCode()));
        }
        return "{}";
    }

    @RequestMapping("unlock")
    @ResponseBody
    public String unlock(@RequestParam(name = "unlockUserId") int unlockUserId,
                         @RequestParam(name = "unlockReason") String unlockReason) {
        try {
            userServerManager.unlock(unlockUserId, unlockReason);
        } catch (RemoteServerException e) {
            return JSON.toJSONString(new RemoteServerErrorResponse(e.getCode()));
        }
        return "{}";
    }

}

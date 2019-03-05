package com.j13.alistar.controller;

import com.alibaba.fastjson.JSON;
import com.j13.alistar.net.ReplyServerManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/reply")
public class ReplyController {
    @Autowired
    ReplyServerManager replyServerManager;

    @RequestMapping("/detail")
    public String detail() {
        return "/reply/detail";
    }

    @RequestMapping("/getReplyList")
    @ResponseBody
    public String getReplyList(@RequestParam(name = "postId") int postId) {
        return JSON.toJSONString(replyServerManager.list(postId));
    }

    @RequestMapping("/getReply")
    @ResponseBody
    public String getReply(@RequestParam(name = "replyId") int replyId) {
        return JSON.toJSONString(replyServerManager.get(replyId));
    }

    @RequestMapping("/create")
    @ResponseBody
    public String create(@RequestParam(name = "userId") int userId,
                         @RequestParam(name = "content") String content,
                         @RequestParam(name = "postId") int postId,
                         @RequestParam(name = "barId") int barId,
                         @RequestParam(name = "anonymous") int anonymous,
                         @RequestParam(name = "lastReplyId") int lastReplyId) {
        return JSON.toJSONString(replyServerManager.create(barId, postId, userId, content, anonymous, lastReplyId));
    }

    @RequestMapping("/delete")
    @ResponseBody
    public String delete(@RequestParam(name = "replyId") int replyId,
                         @RequestParam(name = "postId") int postId) {
        return JSON.toJSONString(replyServerManager.delete(replyId, postId));

    }

    @RequestMapping("/update")
    @ResponseBody
    public String update(@RequestParam(name = "replyId") int replyId,
                         @RequestParam(name = "userId") int userId,
                         @RequestParam(name = "content") String content,
                         @RequestParam(name = "anonymous") int anonymous) {
        return JSON.toJSONString(replyServerManager.update(replyId, userId, content, anonymous));
    }

}

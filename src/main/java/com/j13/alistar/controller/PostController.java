package com.j13.alistar.controller;

import com.alibaba.fastjson.JSON;
import com.j13.alistar.net.PostServerManager;
import com.j13.alistar.net.ReplyServerManager;
import com.j13.alistar.vos.PostVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@RequestMapping("/post")
public class PostController {

    @Autowired
    PostServerManager postServerManager;
    @Autowired
    ReplyServerManager replyServerManager;


    @RequestMapping("/list")
    public String list(HttpServletRequest request, @RequestParam(name = "barId") int barId, Map<String, Object> model) {

        return "/post/list";
    }

    @RequestMapping("/getPostList")
    @ResponseBody
    public String getPostList(@RequestParam(name = "barId") int barId) {
        Map<String, Object> data = postServerManager.list(barId);
        return JSON.toJSONString(data);
    }

    @RequestMapping("/create")
    @ResponseBody
    public String create(@RequestParam(name = "userId") int userId,
                         @RequestParam(name = "content") String content,
                         @RequestParam(name = "barId") String barId,
                         @RequestParam(name = "title") String title,
                         @RequestParam(name = "anonymous") int anonymous,
                         @RequestParam(name = "anonymous") int type,
                         Map<String, Object> model) {
        return JSON.toJSONString(postServerManager.create(barId, userId, title, content, anonymous,type));

    }

    @RequestMapping("/delete")
    @ResponseBody
    public String delete(@RequestParam(name = "postId") int postId,
                         @RequestParam(name = "barId") int barId) {
        return JSON.toJSONString(postServerManager.delete(postId, barId));
    }

    @RequestMapping("/preUpdate")
    public String preUpdate(@RequestParam(name = "postId") int postId,
                            @RequestParam(name = "barId") int barId,
                            Map<String, Object> model) {

        PostVO vo = postServerManager.detail(postId);
        model.put("post", vo);
        model.put("barId", barId);
        return "/post/update";
    }

    @RequestMapping("/update")
    @ResponseBody
    public String update(
            @RequestParam(name = "postId") int postId,
            @RequestParam(name = "content") String content,
            @RequestParam(name = "title") String title,
            @RequestParam(name = "anonymous") int anonymous,
            @RequestParam(name = "type") int type) {
        postServerManager.update(postId, content, title,anonymous,type);
        return "{}";
    }


    @RequestMapping("/detail")
    public String detail() {
        return "/post/detail";
    }

    @RequestMapping("/getDetail")
    @ResponseBody
    public String getDetail(@RequestParam(name = "postId") int postId) {
        PostVO post = postServerManager.detail(postId);
        return JSON.toJSONString(post);
    }


    @RequestMapping("/online")
    @ResponseBody
    public String online(@RequestParam(name = "postId") int postId) {
        return JSON.toJSONString(postServerManager.online(postId));
    }

    @RequestMapping("/offline")
    @ResponseBody
    public String offline(@RequestParam(name = "postId") int postId) {
        return JSON.toJSONString(postServerManager.offline(postId));
    }

    @RequestMapping("/queryTitle")
    @ResponseBody
    public String queryTitle(@RequestParam(name = "barId") int barId,
                             @RequestParam(name = "name") int name) {
        return JSON.toJSONString(postServerManager.queryTitle(barId, name));
    }

    @RequestMapping("/queryUserId")
    @ResponseBody
    public String queryUserId(@RequestParam(name = "barId") int barId,
                              @RequestParam(name = "userId") int userId) {
        return JSON.toJSONString(postServerManager.queryUserId(barId, userId));
    }

}

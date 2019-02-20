package com.j13.evelynn.controller;

import com.alibaba.fastjson.JSON;
import com.j13.evelynn.net.PostServerManager;
import com.j13.evelynn.net.ReplyServerManager;
import com.j13.evelynn.vos.PostVO;
import com.j13.evelynn.vos.ReplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
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
                         Map<String, Object> model) {
        return JSON.toJSONString(postServerManager.create(barId, userId, content));

    }

    @RequestMapping("/delete")
    @ResponseBody
    public String delete(@RequestParam(name = "postId") int postId) {
        return JSON.toJSONString(postServerManager.delete(postId));
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
            @RequestParam(name = "content") String content) {
        postServerManager.update(postId, content);
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


}

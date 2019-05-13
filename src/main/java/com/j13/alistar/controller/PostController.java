package com.j13.alistar.controller;

import com.alibaba.fastjson.JSON;
import com.j13.alistar.net.PostServerManager;
import com.j13.alistar.net.RemoteServerErrorResponse;
import com.j13.alistar.net.RemoteServerException;
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
        Map<String, Object> data = null;
        try {
            data = postServerManager.list(barId);
        } catch (RemoteServerException e) {
            return JSON.toJSONString(new RemoteServerErrorResponse(e.getCode()));
        }
        return JSON.toJSONString(data);
    }

    @RequestMapping("/create")
    @ResponseBody
    public String create(@RequestParam(name = "userId") int userId,
                         @RequestParam(name = "content") String content,
                         @RequestParam(name = "barId") String barId,
                         @RequestParam(name = "title") String title,
                         @RequestParam(name = "anonymous") int anonymous,
                         @RequestParam(name = "type") int type,
                         @RequestParam(name = "imgList") String imgList,
                         Map<String, Object> model) {
        try {
            return JSON.toJSONString(postServerManager.create(barId, userId, title, content, anonymous, type, imgList));
        } catch (RemoteServerException e) {
            return JSON.toJSONString(new RemoteServerErrorResponse(e.getCode()));
        }

    }

    @RequestMapping("/delete")
    @ResponseBody
    public String delete(@RequestParam(name = "postId") int postId,
                         @RequestParam(name = "barId") int barId) {
        try {
            return JSON.toJSONString(postServerManager.delete(postId, barId));
        } catch (RemoteServerException e) {
            return JSON.toJSONString(new RemoteServerErrorResponse(e.getCode()));
        }
    }

    @RequestMapping("/preUpdate")
    public String preUpdate(@RequestParam(name = "postId") int postId,
                            @RequestParam(name = "barId") int barId,
                            Map<String, Object> model) {

        PostVO vo = null;
        try {
            vo = postServerManager.detail(postId);
        } catch (RemoteServerException e) {
            return JSON.toJSONString(new RemoteServerErrorResponse(e.getCode()));
        }
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
            @RequestParam(name = "type") int type,
            @RequestParam(name="imgList") String imgList) {
        try {
            postServerManager.update(postId, content, title, anonymous, type,imgList);
        } catch (RemoteServerException e) {
            return JSON.toJSONString(new RemoteServerErrorResponse(e.getCode()));
        }
        return "{}";
    }


    @RequestMapping("/detail")
    public String detail() {
        return "/post/detail";
    }

    @RequestMapping("/getDetail")
    @ResponseBody
    public String getDetail(@RequestParam(name = "postId") int postId) {
        PostVO post = null;
        try {
            post = postServerManager.detail(postId);
        } catch (RemoteServerException e) {
            return JSON.toJSONString(new RemoteServerErrorResponse(e.getCode()));
        }
        return JSON.toJSONString(post);
    }


    @RequestMapping("/online")
    @ResponseBody
    public String online(@RequestParam(name = "postId") int postId) {
        try {
            return JSON.toJSONString(postServerManager.online(postId));
        } catch (RemoteServerException e) {
            return JSON.toJSONString(new RemoteServerErrorResponse(e.getCode()));
        }
    }

    @RequestMapping("/offline")
    @ResponseBody
    public String offline(@RequestParam(name = "postId") int postId) {
        try {
            return JSON.toJSONString(postServerManager.offline(postId));
        } catch (RemoteServerException e) {
            return JSON.toJSONString(new RemoteServerErrorResponse(e.getCode()));
        }
    }

    @RequestMapping("/queryTitle")
    @ResponseBody
    public String queryTitle(@RequestParam(name = "barId") int barId,
                             @RequestParam(name = "name") int name) {
        try {
            return JSON.toJSONString(postServerManager.queryTitle(barId, name));
        } catch (RemoteServerException e) {
            return JSON.toJSONString(new RemoteServerErrorResponse(e.getCode()));
        }
    }

    @RequestMapping("/queryUserId")
    @ResponseBody
    public String queryUserId(@RequestParam(name = "barId") int barId,
                              @RequestParam(name = "userId") int userId) {
        try {
            return JSON.toJSONString(postServerManager.queryUserId(barId, userId));
        } catch (RemoteServerException e) {
            return JSON.toJSONString(new RemoteServerErrorResponse(e.getCode()));
        }
    }

}

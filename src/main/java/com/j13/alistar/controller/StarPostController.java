package com.j13.alistar.controller;

import com.alibaba.fastjson.JSON;
import com.j13.alistar.net.RemoteServerErrorResponse;
import com.j13.alistar.net.RemoteServerException;
import com.j13.alistar.net.StarPostServerManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@RequestMapping("/starPost")
public class StarPostController {

    @Autowired
    StarPostServerManager starPostServerManager;

    @RequestMapping("/list")
    public String list(HttpServletRequest request, Map<String, Object> model) {
        return "/starPost/list";
    }


    @RequestMapping("/getStarPostList")
    @ResponseBody
    public String getPostList() {
        try {
            return JSON.toJSONString(starPostServerManager.list());
        } catch (RemoteServerException e) {
            return JSON.toJSONString(new RemoteServerErrorResponse(e.getCode()));
        }
    }


    @RequestMapping("/add")
    @ResponseBody
    public String add(@RequestParam(name = "postId") int postId,
                      @RequestParam(name = "value") int value,
                      Map<String, Object> model) {
        try {
            return JSON.toJSONString(starPostServerManager.add(postId, value));
        } catch (RemoteServerException e) {
            return JSON.toJSONString(new RemoteServerErrorResponse(e.getCode()));
        }
    }


    @RequestMapping("/delete")
    @ResponseBody
    public String delete(@RequestParam(name = "id") int id,
                      Map<String, Object> model) {
        try {
            return JSON.toJSONString(starPostServerManager.delete(id));
        } catch (RemoteServerException e) {
            return JSON.toJSONString(new RemoteServerErrorResponse(e.getCode()));
        }
    }

}

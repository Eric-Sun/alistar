package com.j13.alistar.controller;

import com.alibaba.fastjson.JSON;
import com.j13.alistar.net.BarServerManager;
import com.j13.alistar.net.RemoteServerErrorResponse;
import com.j13.alistar.net.RemoteServerException;
import com.j13.alistar.vos.BarVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/bar")
public class BarController {


    @Autowired
    BarServerManager barServerManager;


    @RequestMapping("/list")
    public String list(HttpServletRequest request, Map<String, Object> model) {
        return "/bar/list";
    }

    @RequestMapping("/getBarList")
    @ResponseBody
    public String getBarList() {
        int pageNum = 0;
        List<BarVO> barList = null;
        try {
            barList = barServerManager.barList(pageNum);
        } catch (RemoteServerException e) {
            return JSON.toJSONString(new RemoteServerErrorResponse(e.getCode()));
        }
        return JSON.toJSONString(barList);
    }

    @RequestMapping("/preCreate")
    public String preCreate(HttpServletRequest request, Map<String, Object> model) {
        return "bar/create";
    }

    @RequestMapping("/create")
    @ResponseBody
    public String create(HttpServletRequest request,
                         @RequestParam(name = "name") String name,
                         @RequestParam(name = "userId") Integer userId) {
        try {
            return JSON.toJSONString(barServerManager.createBar(name, userId));
        } catch (RemoteServerException e) {
            return JSON.toJSONString(new RemoteServerErrorResponse(e.getCode()));

        }
    }

    @RequestMapping("/delete")
    @ResponseBody
    public String delete(@RequestParam(name = "barId") Integer barId) {
        try {
            return JSON.toJSONString(barServerManager.delete(barId));
        } catch (RemoteServerException e) {
            return JSON.toJSONString(new RemoteServerErrorResponse(e.getCode()));
        }
    }


}

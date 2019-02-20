package com.j13.evelynn.controller;

import com.alibaba.fastjson.JSON;
import com.j13.evelynn.net.BarServerManager;
import com.j13.evelynn.security.model.Account;
import com.j13.evelynn.vos.BarVO;
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
        List<BarVO> barList = barServerManager.barList(pageNum);
        return JSON.toJSONString(barList);
    }

    @RequestMapping("/preCreate")
    public String preCreate(HttpServletRequest request, Map<String, Object> model) {
        return "bar/create";
    }

    @RequestMapping("/create")
    public String create(HttpServletRequest request,
                         @RequestParam(name = "name") String name,
                         @RequestParam(name = "userId") Integer userId) {
        barServerManager.createBar(name, userId);
        return "forward:/bar/list";
    }

    @RequestMapping("/delete")
    @ResponseBody
    public String delete(@RequestParam(name = "barId") Integer barId) {
        return JSON.toJSONString(barServerManager.delete(barId));
    }


}

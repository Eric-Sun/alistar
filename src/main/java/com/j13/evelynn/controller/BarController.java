package com.j13.evelynn.controller;

import com.j13.evelynn.net.BarServerManager;
import com.j13.evelynn.security.model.Account;
import com.j13.evelynn.vos.BarVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/bar")
public class BarController {


    @Autowired
    BarServerManager barServerManager;


    @RequestMapping("/list")
    public String userList(HttpServletRequest request, Map<String, Object> model) {
        int pageNum = 0;
        if (model.get("pageNum") != null) {
            pageNum = (Integer) model.get("pageNum");
        }

        List<BarVO> barList = barServerManager.barList(pageNum);
        model.put("data", barList);
        return "/bar/list";
    }


}

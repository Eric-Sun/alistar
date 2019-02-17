package com.j13.evelynn.controller;

import com.j13.evelynn.net.PostServerManager;
import com.j13.evelynn.vos.PostVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/post")
public class PostController {

    @Autowired
    PostServerManager postServerManager;


    @RequestMapping("/list")
    public String list(HttpServletRequest request, @RequestParam(name = "barId") int barId, Map<String, Object> model) {

        Map<String, Object> data = postServerManager.list(barId);
        model.put("data", data.get("list"));
        model.put("barName", data.get("barName"));
        return "/post/list";
    }

    @RequestMapping("/preCreate")
    public String list() {
        return "/post/create";
    }
}

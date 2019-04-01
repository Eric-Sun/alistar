package com.j13.alistar.controller;

import com.alibaba.fastjson.JSON;
import com.j13.alistar.net.AuditServerManager;
import com.j13.alistar.net.RemoteServerErrorResponse;
import com.j13.alistar.net.RemoteServerException;
import com.j13.alistar.vos.BarVO;
import com.j13.alistar.vos.ReplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/audit")
public class AuditController {


    @Autowired
    AuditServerManager auditServerManager;


    @RequestMapping("/replyList")
    public String list(HttpServletRequest request, Map<String, Object> model) {
        return "/audit/replyList";
    }


    @RequestMapping("/getReplyList")
    @ResponseBody
    public String getReplyList(@RequestParam(name="barId") int barId) {
        int pageNum = 0;
        List<ReplyVO> list = null;
        try {
            list = auditServerManager.replyList(barId);
        } catch (RemoteServerException e) {
            return JSON.toJSONString(new RemoteServerErrorResponse(e.getCode()));
        }
        return JSON.toJSONString(list);
    }


}

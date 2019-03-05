package com.j13.alistar.vos;

import com.google.common.collect.Lists;

import java.util.List;

public class ReplyVO {
    private int replyId;
    private int userId;
    private String userName;
    private String content;
    private String createtime;
    private int anonymous;
    private int lastReplyId;
    private int postId;
    private int barId;
    private List<ReplyVO> replyList = Lists.newLinkedList();

    public int getBarId() {
        return barId;
    }

    public void setBarId(int barId) {
        this.barId = barId;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public int getLastReplyId() {
        return lastReplyId;
    }

    public void setLastReplyId(int lastReplyId) {
        this.lastReplyId = lastReplyId;
    }

    public List<ReplyVO> getReplyList() {
        return replyList;
    }

    public void setReplyList(List<ReplyVO> replyList) {
        this.replyList = replyList;
    }

    public int getAnonymous() {
        return anonymous;
    }

    public void setAnonymous(int anonymous) {
        this.anonymous = anonymous;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public int getReplyId() {
        return replyId;
    }

    public void setReplyId(int replyId) {
        this.replyId = replyId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}

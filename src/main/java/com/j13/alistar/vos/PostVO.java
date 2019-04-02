package com.j13.alistar.vos;

import com.google.common.collect.Lists;

import java.util.List;

public class PostVO {
    private int postId;
    private int barId;
    private String content;
    private String createtime;
    private int userId;
    private String userName;
    private String updatetime;
    private String shortContent;
    private boolean showLongContent = false;
    private String title;
    private int status;
    private int anonymous;
    private int type;
    private List<LevelInfoVO> levelInfo = Lists.newLinkedList();

    public List<LevelInfoVO> getLevelInfo() {
        return levelInfo;
    }

    public void setLevelInfo(List<LevelInfoVO> levelInfo) {
        this.levelInfo = levelInfo;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getAnonymous() {
        return anonymous;
    }

    public void setAnonymous(int anonymous) {
        this.anonymous = anonymous;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public boolean isShowLongContent() {
        return showLongContent;
    }

    public void setShowLongContent(boolean showLongContent) {
        this.showLongContent = showLongContent;
    }

    public String getShortContent() {
        return shortContent;
    }

    public void setShortContent(String shortContent) {
        this.shortContent = shortContent;
    }

    public String getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(String updatetime) {
        this.updatetime = updatetime;
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

    public int getBarId() {
        return barId;
    }

    public void setBarId(int barId) {
        this.barId = barId;
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

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }
}

package com.j13.alistar.net;

/**
 * 用于给前端用户返回异常错误码的json对象
 */
public class RemoteServerErrorResponse {

    private int errCode;

    public RemoteServerErrorResponse(int errCode) {
        this.errCode = errCode;
    }

    public int getErrCode() {
        return errCode;
    }

    public void setErrCode(int errCode) {
        this.errCode = errCode;
    }
}

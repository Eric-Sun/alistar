package com.j13.alistar.net;

/**
 * 用于包装服务端返回的异常错误码，从而暴露给前端用户
 */
public class RemoteServerException extends Exception{
    private int code;

    public RemoteServerException(int code) {
        this.code = code;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }
}

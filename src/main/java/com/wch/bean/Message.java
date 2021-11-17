package com.wch.bean;

import java.util.HashMap;
import java.util.Map;

/**
 * @author wch
 * @version jdk 1.8
 * @date 2021/8/6 11:06
 * @Description 通用的返回类
 */
public class Message {
    //状态码
    private int code;
    //提示信息
    private String message;
    //用户要返回给浏览器的数据
    private Map<String,Object> map=new HashMap<>();

    public static Message successMessage(){
        Message message=new Message();
        message.setCode(200);
        message.setMessage("处理成功！");
        return message;
    }

    public static Message failedMessage(){
        Message message=new Message();
        message.setCode(400);
        message.setMessage("处理失败！");
        return message;
    }
    //添加数据
    public Message add(String key,Object value){
        this.getMap().put(key, value);
        return this;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Map<String, Object> getMap() {
        return map;
    }

    public void setMap(Map<String, Object> map) {
        this.map = map;
    }
}

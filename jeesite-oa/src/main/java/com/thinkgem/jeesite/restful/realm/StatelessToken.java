package com.thinkgem.jeesite.restful.realm;

import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.restful.codec.HmacSHA256Utils;
import org.apache.shiro.authc.AuthenticationToken;

import java.util.Map;

public class StatelessToken implements AuthenticationToken {

    private String username;
    private String timestamp;
    private String nonce;
    private Map<String, ?> params;
    private String clientDigest;
    private String requestBody;

    /*public StatelessToken(String username, Map<String, ?> params, String clientDigest) {
        this.username = username;
        this.params = params;
        this.clientDigest = clientDigest;
    }*/

    public StatelessToken() {
    }

    public StatelessToken(String username, String timestamp, String nonce, Map<String, ?> params, String clientDigest, String requestBody) {
        this.username = username;
        this.timestamp = timestamp;
        this.nonce = nonce;
        this.params = params;
        this.clientDigest = clientDigest;
        this.requestBody = requestBody;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public  Map<String, ?> getParams() {
        return params;
    }

    public void setParams( Map<String, ?> params) {
        this.params = params;
    }

    public String getClientDigest() {
        return clientDigest;
    }

    public void setClientDigest(String clientDigest) {
        this.clientDigest = clientDigest;
    }

    public String getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(String timestamp) {
        this.timestamp = timestamp;
    }

    public String getNonce() {
        return nonce;
    }

    public void setNonce(String nonce) {
        this.nonce = nonce;
    }

    public String getRequestBody() {
        return requestBody;
    }

    public void setRequestBody(String requestBody) {
        this.requestBody = requestBody;
    }

    @Override
    public Object getPrincipal() {
       return username;
    }

    @Override
    public Object getCredentials() {
        return clientDigest;
    }

	/**
     * 判断是否为application/json请求,若是,则直接对传递的json字符串摘要算法
     * @return
     */
    public String gernerateServerDigest(String appKey){
        String key=this.nonce+appKey+this.timestamp;
        return StringUtils.isBlank(this.requestBody) ? HmacSHA256Utils.digest(key, this.params):HmacSHA256Utils.digest(key, this.requestBody);
    }
}

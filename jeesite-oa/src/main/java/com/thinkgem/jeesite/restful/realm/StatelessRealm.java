package com.thinkgem.jeesite.restful.realm;

import com.thinkgem.jeesite.restful.codec.HmacSHA256Utils;
import com.thinkgem.jeesite.restful.modules.client.entity.HmacClient;
import com.thinkgem.jeesite.restful.modules.client.service.HmacClientService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Collection;

import static com.thinkgem.jeesite.common.persistence.BaseEntity.DEL_FLAG_NORMAL;

public class StatelessRealm extends AuthorizingRealm {
    @Autowired
    private HmacClientService hmacClientService;

    @Override
    public boolean supports(AuthenticationToken token) {
        //仅支持StatelessToken类型的Token
        return token instanceof StatelessToken;
    }
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {

        //String username = (String) principals.getPrimaryPrincipal();
        //String username = (String)getAvailablePrincipal(principals);

        Object primary = null;
        if(!CollectionUtils.isEmpty(principals)) {
            //根据当前realm找到用户名
            Collection thisPrincipals = principals.fromRealm(this.getName());
            if(!CollectionUtils.isEmpty(thisPrincipals)) {
                primary = thisPrincipals.iterator().next();
                //根据用户名查找角色，请根据需求实现 ;本需求简单,不扩展角色权限功能
                String username= (String) primary;
                SimpleAuthorizationInfo authorizationInfo =  new SimpleAuthorizationInfo();
                authorizationInfo.addRole("admin");
                return authorizationInfo;
            }
        }
        return null;
    }
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        StatelessToken statelessToken = (StatelessToken) token;
        String appId = statelessToken.getUsername();

        HmacClient hmacClient=hmacClientService.getByAppId(appId);
        if(null==hmacClient)
            throw new UnknownAccountException();//没有找到账号

        if(!DEL_FLAG_NORMAL.equals(hmacClient.getDelFlag()))
            throw new DisabledAccountException(); //帐号被删除禁用

        String appKey = hmacClient.getClientSecret();//该密钥只有客户端与服务器端知道,其他第三方是不知道的.
        //在服务器端生成客户端参数消息摘要
        String serverDigest = HmacSHA256Utils.digest(appKey, statelessToken.getParams());

        //然后进行客户端消息摘要和服务器端消息摘要的匹配
        return new SimpleAuthenticationInfo(
                appId,
                serverDigest,
                getName());
    }

    @Override
    public String getName() {
        return "statelessRealm";
    }
}

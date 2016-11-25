package com.thinkgem.jeesite.aop;

import com.thinkgem.jeesite.common.utils.Collections3;
import com.thinkgem.jeesite.modules.oa.entity.OaNotify;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.websocket.SystemWebSocketHandler;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 在发布通知通告的时候,对该通知通告进行aop,使得websocket来发布该条通告给在线的相关用户;
 * 如果直接在OaNotifyService.save(oaNotify)中,来调用websocket,因为由事务一致性原因,总是得不到最新的未通知数;
 */
@Component
@Aspect
public class WebsocketOaNotifyMessageAspect {
    private static Logger logger = LoggerFactory.getLogger(WebsocketOaNotifyMessageAspect.class);

    @Autowired
    private SystemWebSocketHandler systemWebSocketHandler;

    /**
     * 匹配切入点 OaNotifyService
     */
    @Pointcut(value = "target(com.thinkgem.jeesite.modules.oa.service.OaNotifyService)")
    private void oaNotifyServicePointcut() {
    }

    @Pointcut(value = "(execution(* save(*)))")
    private void saveOaNotifyPointcut() {
    }

    @Around(value = "oaNotifyServicePointcut() && saveOaNotifyPointcut()")
    public Object saveOaNotifyAdvice(ProceedingJoinPoint pjp) throws Throwable {
        Object arg = pjp.getArgs().length >= 1 ? pjp.getArgs()[0] : null;
        Object result = null;
        try {
            result = pjp.proceed();
            OaNotify oaNotify = (OaNotify) arg;
            //websocket推送给在线用户 未阅读的消息数(该通知必须是发布状态status=1,必须存在接收人);
            if (oaNotify!=null&&"1".equals(oaNotify.getStatus()) && !Collections3.isEmpty(oaNotify.getOaNotifyRecordList())) {
                List<User> userList=Collections3.extractToList(oaNotify.getOaNotifyRecordList(),"user");
                systemWebSocketHandler.sendOaNotifyCountMessageToUser(userList);
            }
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("saveOaNotifyAdvice()", e);
        }
        return result;
    }
}

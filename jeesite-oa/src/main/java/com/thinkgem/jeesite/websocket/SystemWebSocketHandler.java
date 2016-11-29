package com.thinkgem.jeesite.websocket;

import com.google.common.collect.Sets;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.oa.entity.OaNotify;
import com.thinkgem.jeesite.modules.oa.service.OaNotifyService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.*;

import java.io.IOException;
import java.util.List;
import java.util.Set;

@Component
public class SystemWebSocketHandler implements WebSocketHandler {

    private static final Logger logger = LoggerFactory.getLogger(SystemWebSocketHandler.class);

    @Autowired
    private OaNotifyService oaNotifyService;

    //用户建立连接后的session,支持同一个用户在不同客户端建立websocket
    private static final Set<WebSocketSession> sessions;

    static {
        sessions = Sets.newConcurrentHashSet();
    }
    public SystemWebSocketHandler() {
    }

    /**
     * 连接成功时候，会触发页面上onopen方法
     * @param session
     * @throws Exception
     */
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        logger.debug("connect to the websocket success......");
        //users.add(session);
        User user = (User) session.getAttributes().get(Constants.WEBSOCKET_USER);

        if(user!= null&& !StringUtils.isBlank(user.getId())){
            sessions.add(session);
            //查询未读消息
            OaNotify oaNotify=new OaNotify();
            oaNotify.setSelf(true);
            oaNotify.setReadFlag("0");
            oaNotify.setCurrentUser(user);
            Long count=oaNotifyService.findCount(oaNotify);
            session.sendMessage(new TextMessage(count + ""));
        }
    }

    //每当客户端发送信息过来，都会由这个函数接收并处理。
    @Override
    public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {

        //sendMessageToUsers();
    }

    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
        if(session.isOpen()){
            session.close();
        }
        logger.debug("websocket connection closed......");
        sessions.remove(session);
    }

    /**
     * 关闭连接时触发
     * @param session
     * @param closeStatus
     * @throws Exception
     */
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
        logger.debug("websocket connection closed......");
        sessions.remove(session);
    }

    @Override
    public boolean supportsPartialMessages() {
        return false;
    }

    /**
     * 给所有在线用户发送消息
     *
     * @param message
     */
    public void sendMessageToUsers(TextMessage message) {
        for (WebSocketSession user: sessions) {
            try {
                if (user.isOpen()) {
                    user.sendMessage(message);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 给某个在线用户发送消息
     *
     * @param userId
     * @param message
     */
    public void sendMessageToUser(String userId, TextMessage message) {
        for (WebSocketSession user: sessions) {
            if (((User)user.getAttributes().get(Constants.WEBSOCKET_USER)).getId().equals(userId)) {
                try {
                    if (user.isOpen()) {
                        user.sendMessage(message);
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
                break;
            }
        }
    }

    /**
     * 对传入的users集合进行遍历,当是在线用户,就推送给他当前未读的消息数
     * @param users
     */
    public void sendOaNotifyCountMessageToUser(List<User> users) {
        OaNotify oaNotify=new OaNotify();
        for(User user: users){
            for (WebSocketSession session : sessions) {
                if (((User)session.getAttributes().get(Constants.WEBSOCKET_USER)).getId().equals(user.getId())) {
                    try {
                        if (session.isOpen()) {
                            oaNotify.setSelf(true);
                            oaNotify.setReadFlag("0");
                            oaNotify.setCurrentUser(user);
                            Long count=oaNotifyService.findCount(oaNotify);
                            session.sendMessage(new TextMessage(count + ""));
                        }
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        }


    }
}
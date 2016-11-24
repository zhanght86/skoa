package com.thinkgem.jeesite.websocket;

import com.google.common.collect.Maps;
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
import java.util.Map;

@Component
public class SystemWebSocketHandler implements WebSocketHandler {

    private static final Logger logger = LoggerFactory.getLogger(SystemWebSocketHandler.class);

    @Autowired
    private OaNotifyService oaNotifyService;

    //这个会出现性能问题，最好用Map来存储，key用userid
    //private static final ArrayList<WebSocketSession> userMap;
    private static final Map<String,WebSocketSession> userMap;

    static {
        userMap = Maps.newConcurrentMap();
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
        //userMap.add(session);
        User user = (User) session.getAttributes().get(Constants.WEBSOCKET_USER);

        if(user!= null&& !StringUtils.isBlank(user.getId())){
            userMap.put(user.getId(),session);
            //查询未读消息
            OaNotify oaNotify=new OaNotify();
            oaNotify.setSelf(true);
            oaNotify.setReadFlag("0");
            oaNotify.setCurrentUser(user);
            Long count=oaNotifyService.findCount(oaNotify);
            session.sendMessage(new TextMessage(count + ""));
        }
    }

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
        userMap.remove(session);
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
        userMap.remove(session);
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
        for (Map.Entry<String,WebSocketSession> entry: userMap.entrySet()) {
            try {
                if (entry.getValue().isOpen()) {
                    entry.getValue().sendMessage(message);
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
        for (Map.Entry<String,WebSocketSession> entry: userMap.entrySet()) {
            if (entry.getKey().equals(userId)) {
                try {
                    if (entry.getValue().isOpen()) {
                        entry.getValue().sendMessage(message);
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
        for(User user:users){
            for (Map.Entry<String,WebSocketSession> entry: userMap.entrySet()) {
                if (entry.getKey().equals(user.getId())) {
                    try {
                        if (entry.getValue().isOpen()) {
                            oaNotify.setSelf(true);
                            oaNotify.setReadFlag("0");
                            oaNotify.setCurrentUser(user);
                            Long count=oaNotifyService.findCount(oaNotify);
                            entry.getValue().sendMessage(new TextMessage(count + ""));
                        }
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        }


    }
}
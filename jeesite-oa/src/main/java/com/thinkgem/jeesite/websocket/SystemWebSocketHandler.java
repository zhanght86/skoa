package com.thinkgem.jeesite.websocket;

import com.thinkgem.jeesite.modules.oa.entity.OaNotify;
import com.thinkgem.jeesite.modules.oa.service.OaNotifyService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.*;

import java.io.IOException;
import java.util.ArrayList;

public class SystemWebSocketHandler implements WebSocketHandler {

    private static final Logger logger = LoggerFactory.getLogger(SystemWebSocketHandler.class);

    //这个会出现性能问题，最好用Map来存储，key用userid
    private static final ArrayList<WebSocketSession> users;

    static {
        users = new ArrayList<>();
    }
    public SystemWebSocketHandler() {
    }

    @Autowired
    private OaNotifyService oaNotifyService;

	/**
     * 连接成功时候，会触发页面上onopen方法
     * @param session
     * @throws Exception
     */
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        logger.debug("connect to the websocket success......");
        users.add(session);
        User user = (User) session.getAttributes().get(Constants.WEBSOCKET_USER);
        if(user!= null){
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
        users.remove(session);
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
        users.remove(session);
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
        for (WebSocketSession user : users) {
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
     * 给某个用户发送消息
     *
     * @param userName
     * @param message
     */
    public void sendMessageToUser(String userName, TextMessage message) {
        for (WebSocketSession user : users) {
            if (user.getAttributes().get(Constants.WEBSOCKET_USER).equals(userName)) {
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
}
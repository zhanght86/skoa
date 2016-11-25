package com.thinkgem.jeesite.websocket;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Configuration
@EnableWebMvc
@EnableWebSocket
public class WebSocketConfig extends WebMvcConfigurerAdapter implements WebSocketConfigurer {
    /**
     * 管理基础路径
     */
    @Value("${adminPath}")
    protected String adminPath;
    /**
     * 链接websocket的路径
     */
    @Value("${oa.notify.websocketHttpBasePath}")
    protected String websocketHttpBasePath;

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        //nginx Spring WebSocket中403错误解决;需要设置setAllowedOrigins(websocketHttpBasePath)
        registry.addHandler(systemWebSocketHandler(),adminPath+"/webSocketServer").addInterceptors(new WebSocketHandshakeInterceptor()).setAllowedOrigins(websocketHttpBasePath);

        registry.addHandler(systemWebSocketHandler(), adminPath+"/sockjs/webSocketServer").addInterceptors(new WebSocketHandshakeInterceptor()).setAllowedOrigins(websocketHttpBasePath)
                .withSockJS();
    }

    @Bean
    public WebSocketHandler systemWebSocketHandler(){
        return new SystemWebSocketHandler();
    }

}
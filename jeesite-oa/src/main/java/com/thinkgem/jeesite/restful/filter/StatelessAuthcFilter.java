package com.thinkgem.jeesite.restful.filter;

import com.google.common.base.Preconditions;
import com.thinkgem.jeesite.common.json.JsonResultModel;
import com.thinkgem.jeesite.common.json.ResponseJsonUtil;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.restful.Constants;
import com.thinkgem.jeesite.restful.realm.StatelessToken;
import org.apache.shiro.web.filter.AccessControlFilter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class StatelessAuthcFilter extends AccessControlFilter {

    @Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {
        return false;
    }

    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
        //1、客户端生成的消息摘要
        String clientDigest = request.getParameter(Constants.PARAM_DIGEST);
        //2、客户端传入的用户身份
        String username = request.getParameter(Constants.PARAM_APPID);
        //3. 客户端传入的时间戳;为了调试方便,暂时注释
        //String strTimeStamp=request.getParameter(Constants.PARAM_TIMESTAMP);
        //3.1 使用时间戳前提是必须保证客户端与服务器时间同步;使用nonce增加难度
        String nonce = request.getParameter(Constants.PARAM_NONCE);

        try {
            Preconditions.checkArgument(!StringUtils.isBlank(clientDigest), "参数"+Constants.PARAM_DIGEST+"为空或者null");
            Preconditions.checkArgument(!StringUtils.isBlank(username), "参数"+Constants.PARAM_APPID+"为空或者null");
            //为了调试方便,暂时注释
            //Preconditions.checkArgument(!StringUtils.isBlank(strTimeStamp), "参数"+Constants.PARAM_TIMESTAMP+"为空或者null");
            Preconditions.checkArgument(!StringUtils.isBlank(nonce), "参数"+Constants.PARAM_NONCE+"为空或者null");

            //4、客户端请求的参数列表
            Map<String, String[]> params = new HashMap<String, String[]>(request.getParameterMap());
            params.remove(Constants.PARAM_DIGEST);

            //5、生成无状态Token
            StatelessToken token = new StatelessToken(username, params, clientDigest);

            //6、委托给Realm进行登录
            getSubject(request, response).login(token);

            //7.判断客户端传递的时间与当前时间差,大于5秒不允许调用;为了调试方便,暂时注释
            /*Long timestamp= Long.parseLong(strTimeStamp);
            if(Math.abs(DateUtils.getTimeStamps()/1000-timestamp)>5){
                onResponseFail(response,"method invoke timeout");
                return false;
            }*/
        } catch (NumberFormatException e){
            e.printStackTrace();
            onResponseFail(response,"参数"+Constants.PARAM_TIMESTAMP+"为时间戳");
            return false;
        } catch (IllegalArgumentException e){
            e.printStackTrace();
            onResponseFail(response,e.getMessage());
            return false;
        } /*catch (UnknownAccountException e){
            e.printStackTrace();
            onResponseFail(response,e.getMessage());
            return false;
        } catch (DisabledAccountException e){
            e.printStackTrace();
            onResponseFail(response,e.getMessage());
            return false;
        } catch (AuthenticationException e){
            e.printStackTrace();
            onResponseFail(response,"login error");
            return false;
        } */catch (Exception e) {
            e.printStackTrace();
            onResponseFail(response,"login error");//6、登录失败
            return false;
        }
        return true;
    }

    //反馈异常信息给调用端
    private void onResponseFail(ServletResponse response,String message) throws IOException {
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        httpResponse.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        JsonResultModel jsonResultModel=new JsonResultModel();
        jsonResultModel.setMessage(message);
        jsonResultModel.setStateError();

        ResponseJsonUtil.renderString(httpResponse,jsonResultModel);
    }


}

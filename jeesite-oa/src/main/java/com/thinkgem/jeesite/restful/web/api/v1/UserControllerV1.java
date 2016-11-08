package com.thinkgem.jeesite.restful.web.api.v1;

import com.google.common.base.Preconditions;
import com.thinkgem.jeesite.common.json.JsonResultModel;
import com.thinkgem.jeesite.modules.project.entity.ProjectInfo;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.restful.web.api.BaseController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/api",headers="api-version=v1")
public class UserControllerV1 extends BaseController {

    @RequestMapping("/hello")
    public JsonResultModel hello(ProjectInfo projectInfo, String[] param1, String param2) {
        try {
            Preconditions.checkNotNull(param1,"参数param1不能为空");
            Preconditions.checkNotNull(param2,"参数param2不能为空");
            jsonResultModel.setStateSuccess();
            jsonResultModel.setData(new User("1","evan"));
            System.out.println(projectInfo);
        }catch (Exception e){
            e.printStackTrace();
            logger.error("参数校验失败：", e);
            jsonResultModel.setMessage(e.getMessage());
            jsonResultModel.setStateError();
        }
        return jsonResultModel;
    }
}

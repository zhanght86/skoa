package com.thinkgem.jeesite.restful.web.api.v1;

import com.google.common.base.Preconditions;
import com.thinkgem.jeesite.common.json.JsonResultModel;
import com.thinkgem.jeesite.modules.project.entity.ProjectInfo;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.restful.web.api.BaseController;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponse;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/api",headers="api-version=v1")
@Api(value = "User控制器")
public class UserControllerV1 extends BaseController {

    // @ApiIgnore //使用这个注解忽略这个接口
    @ApiOperation(value = "根据ProjectInfo projectInfo, String[] param1, String param2进行hello方法调用", httpMethod = "POST", produces = "application/json")
    @ApiResponse(code = 200, message = "success", response = JsonResultModel.class)
    @RequestMapping(value = "/hello",method = RequestMethod.POST)
    public JsonResultModel hello(@ApiParam(name = "projectInfo", value = "某个项目", required = true) ProjectInfo projectInfo, @ApiParam(name = "param1", value = "字符数组", required = true) String[] param1, @ApiParam(name = "param2", value = "字符串", required = true) String param2) {
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
